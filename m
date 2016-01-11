Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60B0F7317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:05:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so27615604wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TEmetPevtnK1xPmAgpeLYjamNeyXVS7B9+skMa90CPk=;
	b=kh6pabkQPPaai8bnDqDEzz9gSEusk9kNQOUIcWb2E2XP91I9JeRmZOB9SR5jwja6ck
	iycW/eppZVU2NyVxC7ddJVhCHwTEXjVBsyElLxu6VIEIfxEtb0UeRMVNb5dry0ufPaks
	Fx22edQc+H//bBvveWdy8mIXpdzX5WyZ1wVMyAP3NnxsOUVdPlnwCbZ82OO2fBfLyqGi
	Wq/j023kU6pJTZS7igzgHCsow9Rg2LlTE6f8lkC7y74Kd1KyUYAnKKwGrMwa6Hi6IAIa
	/xgohT+6gPFZBcrArVfZkmEbvme1IsiJYhEEz/F1W0IYrmEIxr/GVCQpg6CRqW2RnjZj
	RCgQ==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr136774040wjc.3.1452539100750;
	Mon, 11 Jan 2016 11:05:00 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 11:05:00 -0800 (PST)
In-Reply-To: <1452357775.7598.159.camel@linuxfoundation.org>
References: <1452357775.7598.159.camel@linuxfoundation.org>
Date: Mon, 11 Jan 2016 11:05:00 -0800
Message-ID: <CAJ86T=WraHEDTL7v7dSCYr4Dwj0xrmu_rLQWTNbotNWCrytOFg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Switch from tgz to tar.xz for sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 19:05:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 9, 2016 at 8:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> xz compresses with a better compression ratio than gz with similar speed
> for compression and decompression.

When you measured compression speed to be similar, was that with
parallel compression? If so, with how many CPU cores?

A quick test of plain single threaded "tar -cz" -vs- "tar -cJ" on my
laptop seems to indicate that xz is _significantly_ slower:

$ time tar -czf /tmp/jjj.tgz
tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git

 real    0m4.708s
 user    0m4.682s
 sys    0m0.477s

$ time tar -cJf /tmp/jjj.tar.xz
tmp/work/cortexa15hf-neon-rdk-linux-gnueabi/glibc/2.22-r0/git

 real    0m56.491s
 user    0m56.489s
 sys    0m0.744s


> It therefore makes sense to switch
> to it for the sstate objects.
>
> As an example, the gcc-cross populate_sysroot object goes from
> 79,509,871 to 53,031,752 bytes which is a significant improvement.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 4153e58..734303c 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -537,7 +537,7 @@ python buildhistory_get_extra_sdkinfo() {
>          filesizes = {}
>          for root, _, files in os.walk('${SDK_OUTPUT}/${SDKPATH}/sstate-cache'):
>              for fn in files:
> -                if fn.endswith('.tgz'):
> +                if fn.endswith('.tar.xz'):
>                      fsize = int(math.ceil(float(os.path.getsize(os.path.join(root, fn))) / 1024))
>                      task = fn.rsplit(':', 1)[1].split('_', 1)[1].split('.')[0]
>                      origtotal = tasksizes.get(task, 0)
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index 3a65c07..4ff5e9e 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -189,7 +189,7 @@ python copy_buildsystem () {
>      # We don't need sstate do_package files
>      for root, dirs, files in os.walk(sstate_out):
>          for name in files:
> -            if name.endswith("_package.tgz"):
> +            if name.endswith("_package.tar.xz"):
>                  f = os.path.join(root, name)
>                  os.remove(f)
>  }
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 9bef212..d9adf01 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -294,8 +294,8 @@ def sstate_installpkg(ss, d):
>          oe.path.remove(dir)
>
>      sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
> -    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['task'] + ".tgz"
> -    sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['task'] + ".tgz"
> +    sstatefetch = d.getVar('SSTATE_PKGNAME', True) + '_' + ss['task'] + ".tar.xz"
> +    sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['task'] + ".tar.xz"
>
>      if not os.path.exists(sstatepkg):
>          pstaging_fetch(sstatefetch, sstatepkg, d)
> @@ -372,7 +372,7 @@ python sstate_hardcode_path_unpack () {
>  def sstate_clean_cachefile(ss, d):
>      import oe.path
>
> -    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['task'] + ".tgz*"
> +    sstatepkgfile = d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['task'] + ".tar.xz*"
>      bb.note("Removing %s" % sstatepkgfile)
>      oe.path.remove(sstatepkgfile)
>
> @@ -555,7 +555,7 @@ def sstate_package(ss, d):
>      tmpdir = d.getVar('TMPDIR', True)
>
>      sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
> -    sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + ".tgz"
> +    sstatepkg = d.getVar('SSTATE_PKG', True) + '_'+ ss['task'] + ".tar.xz"
>      bb.utils.remove(sstatebuild, recurse=True)
>      bb.utils.mkdirhier(sstatebuild)
>      bb.utils.mkdirhier(os.path.dirname(sstatepkg))
> @@ -677,14 +677,14 @@ sstate_create_package () {
>         # Need to handle empty directories
>         if [ "$(ls -A)" ]; then
>                 set +e
> -               tar -czf $TFILE *
> +               tar -cJf $TFILE *
>                 ret=$?
>                 if [ $ret -ne 0 ] && [ $ret -ne 1 ]; then
>                         exit 1
>                 fi
>                 set -e
>         else
> -               tar -cz --file=$TFILE --files-from=/dev/null
> +               tar -cJ --file=$TFILE --files-from=/dev/null
>         fi
>         chmod 0664 $TFILE
>         mv -f $TFILE ${SSTATE_PKG}
> @@ -703,7 +703,7 @@ sstate_create_package () {
>  # Will be run from within SSTATE_INSTDIR.
>  #
>  sstate_unpack_package () {
> -       tar -xmvzf ${SSTATE_PKG}
> +       tar -xmvJf ${SSTATE_PKG}
>         # Use "! -w ||" to return true for read only files
>         [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>         [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
> @@ -716,7 +716,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
>
>      ret = []
>      missed = []
> -    extension = ".tgz"
> +    extension = ".tar.xz"
>      if siginfo:
>          extension = extension + ".siginfo"
>
> @@ -821,11 +821,11 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
>          evdata = {'missed': [], 'found': []};
>          for task in missed:
>              spec, extrapath, tname = getpathcomponents(task, d)
> -            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
> +            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tar.xz")
>              evdata['missed'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
>          for task in ret:
>              spec, extrapath, tname = getpathcomponents(task, d)
> -            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tgz")
> +            sstatefile = d.expand(extrapath + generate_sstatefn(spec, sq_hash[task], d) + "_" + tname + ".tar.xz")
>              evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
>          bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
>
> @@ -914,7 +914,7 @@ python sstate_eventhandler() {
>      d = e.data
>      # When we write an sstate package we rewrite the SSTATE_PKG
>      spkg = d.getVar('SSTATE_PKG', True)
> -    if not spkg.endswith(".tgz"):
> +    if not spkg.endswith(".tar.xz"):
>          taskname = d.getVar("BB_RUNTASK", True)[3:]
>          spec = d.getVar('SSTATE_PKGSPEC', True)
>          swspec = d.getVar('SSTATE_SWSPEC', True)
> @@ -922,7 +922,7 @@ python sstate_eventhandler() {
>              d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
>              d.setVar("SSTATE_EXTRAPATH", "")
>          sstatepkg = d.getVar('SSTATE_PKG', True)
> -        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tgz" ".siginfo", d)
> +        bb.siggen.dump_this_task(sstatepkg + '_' + taskname + ".tar.xz" ".siginfo", d)
>  }
>
>  SSTATE_PRUNE_OBSOLETEWORKDIR = "1"
> diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
> index c33662b..4d545ad 100644
> --- a/meta/lib/oeqa/selftest/signing.py
> +++ b/meta/lib/oeqa/selftest/signing.py
> @@ -111,13 +111,13 @@ class Signing(oeSelfTest):
>          bitbake('-c cleansstate %s' % test_recipe)
>          bitbake(test_recipe)
>
> -        recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
> -        recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
> +        recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tar.xz.sig')
> +        recipe_txz = glob.glob(sstatedir + '/*/*:ed:*_package.tar.xz')
>
>          self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
> -        self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
> +        self.assertEqual(len(recipe_txz), 1, 'Failed to find .tar.xz file.')
>
> -        ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
> +        ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_txz[0]))
>          # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
>          # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
>          self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
> diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
> index 512cb4f..73e5132 100644
> --- a/meta/lib/oeqa/selftest/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/sstatetests.py
> @@ -55,15 +55,15 @@ class SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>
>          bitbake(targets)
> -        tgz_created = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
> -        self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s" % ', '.join(map(str, targets)))
> +        txz_created = self.search_sstate('|'.join(map(str, [s + '.*?\.tar.xz$' for s in targets])), distro_specific, distro_nonspecific)
> +        self.assertTrue(txz_created, msg="Could not find sstate .tar.xz files for: %s" % ', '.join(map(str, targets)))
>
>          siginfo_created = self.search_sstate('|'.join(map(str, [s + '.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
>          self.assertTrue(siginfo_created, msg="Could not find sstate .siginfo files for: %s" % ', '.join(map(str, targets)))
>
>          bitbake(['-ccleansstate'] + targets)
> -        tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
> -        self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s" % ', '.join(map(str, targets)))
> +        txz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tar.xz$' for s in targets])), distro_specific, distro_nonspecific)
> +        self.assertTrue(not txz_removed, msg="do_cleansstate didn't remove .tar.xz sstate files for: %s" % ', '.join(map(str, targets)))
>
>      @testcase(977)
>      def test_cleansstate_task_distro_specific_nonspecific(self):
> @@ -87,8 +87,8 @@ class SStateTests(SStateBase):
>          bitbake(['-ccleansstate'] + targets)
>
>          bitbake(targets)
> -        self.assertTrue(self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True) == [], msg="Found distro non-specific sstate for: %s" % ', '.join(map(str, targets)))
> -        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
> +        self.assertTrue(self.search_sstate('|'.join(map(str, [s + '.*?\.tar.xz$' for s in targets])), distro_specific=False, distro_nonspecific=True) == [], msg="Found distro non-specific sstate for: %s" % ', '.join(map(str, targets)))
> +        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + '.*?\.tar.xz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
>          self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
>
>          self.track_for_cleanup(self.distro_specific_sstate + "_old")
> @@ -97,7 +97,7 @@ class SStateTests(SStateBase):
>
>          bitbake(['-cclean'] + targets)
>          bitbake(targets)
> -        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
> +        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + '.*?\.tar.xz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
>          self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
>
>          not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
> @@ -146,18 +146,18 @@ class SStateTests(SStateBase):
>              if not sstate_arch in sstate_archs_list:
>                  sstate_archs_list.append(sstate_arch)
>              if target_config[idx] == target_config[-1]:
> -                target_sstate_before_build = self.search_sstate(target + '.*?\.tgz$')
> +                target_sstate_before_build = self.search_sstate(target + '.*?\.tar.xz$')
>              bitbake("-cclean %s" % target)
>              result = bitbake(target, ignore_status=True)
>              if target_config[idx] == target_config[-1]:
> -                target_sstate_after_build = self.search_sstate(target + '.*?\.tgz$')
> +                target_sstate_after_build = self.search_sstate(target + '.*?\.tar.xz$')
>                  expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
>              self.remove_config(global_config[idx])
>              self.remove_recipeinc(target, target_config[idx])
>              self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
>
>          runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
> -        actual_remaining_sstate = [x for x in self.search_sstate(target + '.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
> +        actual_remaining_sstate = [x for x in self.search_sstate(target + '.*?\.tar.xz$') if not any(pattern in x for pattern in ignore_patterns)]
>
>          actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
>          self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

