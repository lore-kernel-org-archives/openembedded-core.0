Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9987177649
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:09:51 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n21so109361191qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yl4SRXoOhBVmgaSbgaiiTBeoQPEmot84vFLlJ9bBWN0=;
	b=fpotfIAqAimAZhNYr6iTCbWiF5SklSxTYwCT31qn2FH/oQANJ2OzZUrpHHKGd7dlKq
	v/uxysje2gJxOT7xYrbIbtdG3+DiqR4smD7Blc2yVQTxU6PHarvt1xqacm8vcdIECB5+
	nEwd2eNEH78MC2gYWFvHdwgWkIKBgQfD8q7SjtZMGAgVQI0QLqr1tYpPY+MvXq9TEyn9
	k1K+/wLlm2hFWdQzdgTYlGftHcyOBW8Hpn9Ydkl1srUXegbSVDNNych3mTWrVqGu1vae
	r8IyJ9ZxJwWiOjZC0UIjmryKmYlNKeANpUBOjHQ9K171xHkE81NtkArIFkv2WpKhaswo
	EvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yl4SRXoOhBVmgaSbgaiiTBeoQPEmot84vFLlJ9bBWN0=;
	b=QdTVIlMynIsGEC1DficFRk/EIO+vsxvtmLJYjts7kKmgNPX9UmEXue0KhEy3Q4lipk
	mvW/2S/lN6NiBINblg68ixX6emrSZ9JvpWnCR8oacKAfUMXjt6DFlusYKj4Imtc2x37S
	StDydgdnW6qwFykV7fGtin6U803vKB6EFSHmSShqT4u2LaIJkd21qnK/CvnHJ/ihISDp
	Sop1zi+uMt3keSB9MlRFgzXCfKGcc/TUKUZFV5QkFA+sY1aeblo4mhu73lM7oynZnWMH
	pOmjI2eG5XI1IF230o67MQI9IIkPEaFZDFo93d9PYDmsJlJj0pX/zHI8uYjjl8Dkmnj+
	dgYA==
X-Gm-Message-State: AIkVDXLeg6nEGqzr4E8lEw6N59pFwo9iuHgmJB0N6RZnnRkHpWSS9woJITruuXzB0v8lQ9jQypZJJwtPwKGOhFRT
X-Received: by 10.55.75.17 with SMTP id y17mr9966593qka.26.1482415792655; Thu,
	22 Dec 2016 06:09:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 22 Dec 2016 06:09:32 -0800 (PST)
In-Reply-To: <20161222102320.15247-1-freesilicon@gmail.com>
References: <20161220095122.11831-1-freesilicon@gmail.com>
	<20161222102320.15247-1-freesilicon@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Dec 2016 14:09:32 +0000
Message-ID: <CAJTo0LY5hHkOfQuzSO-W6TjDFPXY5N=J0x5DKoCT1Rn2ZU+4TA@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] rootfs: Modify RPM installation
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
X-List-Received-Date: Thu, 22 Dec 2016 14:09:51 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8bb309905443fd248

--001a114a88c8bb309905443fd248
Content-Type: text/plain; charset=UTF-8

Small problem: we always build rpm-native as we need it for some tools, but
rpmlibdir is only defined in package_rpm.bbclass which doesn't have to be
inherited.

This leads to just --with-path-database= being passed to configure.  What's
the behaviour of RPM when this happens? What does it default to?  If it's
going to be safe (ie a sane default is used), please update the commit
message to explain this.

Ross

On 22 December 2016 at 10:23, David Vincent <freesilicon@gmail.com> wrote:

> When using a custom RPM data directory instead of the default dir
> '/var/lib/rpm', the final image did not contain any of the database
> files in the expected location. This commit takes into account the
> 'rpmlibdir' variable set into 'rootfs_rpm.bbclass'.
>
> Changes since v4:
>     - Remove boolean in d.getVar() calls.
>
> Changes since v5:
>     - Also modify rpm recipe to build the database in the correct
>       location and avoid errors during rootfs creation.
>
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/lib/oe/package_manager.py          | 23 +++++++++++++----------
>  meta/lib/oe/rootfs.py                   |  3 ++-
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb |  2 ++
>  3 files changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.
> py
> index e557473999..3f2878c394 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -356,7 +356,8 @@ class RpmPkgsList(PkgsList):
>          super(RpmPkgsList, self).__init__(d, rootfs_dir)
>
>          self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> -        self.image_rpmlib = os.path.join(self.rootfs_dir, 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir')
> +        self.image_rpmlib = os.path.join(self.rootfs_dir,
> self.rpm_libdir[1:])
>
>          self.ml_prefix_list, self.ml_os_list = \
>              RpmIndexer(d, rootfs_dir).get_ml_prefix_and_os_list(arch_var,
> os_var)
> @@ -416,7 +417,7 @@ class RpmPkgsList(PkgsList):
>
>      def list_pkgs(self):
>          cmd = [self.rpm_cmd, '--root', self.rootfs_dir]
> -        cmd.extend(['-D', '_dbpath /var/lib/rpm'])
> +        cmd.extend(['-D', '_dbpath', self.rpm_libdir])
>          cmd.extend(['-qa', '--qf', '[%{NAME} %{ARCH} %{VERSION}
> %{PACKAGEORIGIN}\n]'])
>
>          try:
> @@ -683,7 +684,8 @@ class RpmPM(PackageManager):
>          self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
>                                                 self.task_name)
>          self.saved_rpmlib = self.d.expand('${T}/saved/%s' %
> self.task_name)
> -        self.image_rpmlib = os.path.join(self.target_rootfs,
> 'var/lib/rpm')
> +        self.rpm_libdir = self.d.getVar('rpmlibdir')
> +        self.image_rpmlib = os.path.join(self.target_rootfs,
> self.rpm_libdir[1:])
>
>          if not os.path.exists(self.d.expand('${T}/saved')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved'))
> @@ -954,7 +956,7 @@ class RpmPM(PackageManager):
>              open(db_config_dir, 'w+').write(DB_CONFIG_CONTENT)
>
>          # Create database so that smart doesn't complain (lazy init)
> -        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath',
> '/var/lib/rpm', '-qa']
> +        cmd = [self.rpm_cmd, '--root', self.target_rootfs, '--dbpath',
> self.rpm_libdir, '-qa']
>          try:
>              subprocess.check_output(cmd, stderr=subprocess.STDOUT)
>          except subprocess.CalledProcessError as e:
> @@ -963,20 +965,19 @@ class RpmPM(PackageManager):
>          # Import GPG key to RPM database of the target system
>          if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
>              pubkey_path = self.d.getVar('RPM_GPG_PUBKEY')
> -            cmd = [self.rpm_cmd, '--root', self.target_rootfs,
> '--dbpath', '/var/lib/rpm', '--import', pubkey_path]
> +            cmd = [self.rpm_cmd, '--root', self.target_rootfs,
> '--dbpath', self.rpm_libdir, '--import', pubkey_path]
>              try:
>                  subprocess.check_output(cmd, stderr=subprocess.STDOUT)
>              except subprocess.CalledProcessError as e:
>                  bb.fatal("Import GPG key failed. Command '%s' "
>                          "returned %d:\n%s" % (' '.join(cmd),
> e.returncode, e.output.decode("utf-8")))
>
> -
>          # Configure smart
>          bb.note("configuring Smart settings")
>          bb.utils.remove(os.path.join(self.target_rootfs,
> 'var/lib/smart'),
>                          True)
>          self._invoke_smart(['config', '--set', 'rpm-root=%s' %
> self.target_rootfs])
> -        self._invoke_smart(['config', '--set', 'rpm-dbpath=/var/lib/rpm'])
> +        self._invoke_smart(['config', '--set', 'rpm-dbpath=%s' %
> self.rpm_libdir])
>          self._invoke_smart(['config', '--set', 'rpm-extra-macros._var=%s'
> %
>                             self.d.getVar('localstatedir')])
>          cmd = ["config", "--set", "rpm-extra-macros._tmppath=/%s/tmp" %
> self.install_dir_name]
> @@ -1236,7 +1237,7 @@ class RpmPM(PackageManager):
>
>          if not with_dependencies:
>              cmd = [self.rpm_cmd] + ["-e", "--nodeps", "--root=%s" %
> -                    self.target_rootfs, "--dbpath=/var/lib/rpm",
> +                    self.target_rootfs, "--dbpath=%s" % self.rpm_libdir,
>                      "--define='_cross_scriptlet_wrapper %s'" %
>                      self.scriptlet_wrapper,
>                      "--define='_tmppath /%s/tmp'" %
> self.install_dir_name] + pkgs
> @@ -1384,7 +1385,8 @@ class RpmPM(PackageManager):
>          saved_dir = self.target_rootfs + self.d.expand('${sysconfdir}/rpm-postinsts/')
> + new_pkg
>
>          cmd = self.rpm_cmd + ' -q --scripts --root ' + self.target_rootfs
> -        cmd += ' --dbpath=/var/lib/rpm ' + new_pkg
> +        cmd += ' --dbpath=%s ' %  self.rpm_libdir
> +        cmd += new_pkg
>          cmd += ' | sed -n -e "/^postinstall scriptlet (using .*):$/,/^.*
> scriptlet (using .*):$/ {/.*/p}"'
>          cmd += ' | sed -e "/postinstall scriptlet (using \(.*\)):$/d"'
>          cmd += ' -e "/^.* scriptlet (using .*):$/d" > %s' % saved_dir
> @@ -1416,7 +1418,8 @@ class RpmPM(PackageManager):
>      '''
>      def unlock_rpm_db(self):
>          # Remove rpm db lock files
> -        rpm_db_locks = glob.glob('%s/var/lib/rpm/__db.*' %
> self.target_rootfs)
> +        rpm_db_locks = glob.glob('%s%s/__db.*' % (self.target_rootfs,
> +            self.rpm_libdir))
>          for f in rpm_db_locks:
>              bb.utils.remove(f, True)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index d9a473006a..6eb05feb6c 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -429,6 +429,7 @@ class RpmRootfs(Rootfs):
>
>      def _create(self):
>          pkgs_to_install = self.manifest.parse_initial_manifest()
> +        rpm_libdir = self.d.getVar('rpmlibdir')
>          rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS')
>          rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS')
>
> @@ -476,7 +477,7 @@ class RpmRootfs(Rootfs):
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>
> -        self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm',
> '/var/lib/smart'])
> +        self._setup_dbg_rootfs(['/etc/rpm', rpm_libdir,
> '/var/lib/smart'])
>
>          execute_pre_post_process(self.d, rpm_post_process_cmds)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> index 3df4d1ff1d..12181d89b1 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -342,6 +342,7 @@ EXTRA_OECONF += "--verbose \
>                 --enable-build-warnings \
>                 --enable-build-debug \
>                 --enable-maintainer-mode \
> +               --with-path-database=${rpmlibdir} \
>                 --with-path-macros=${rpm_macros} \
>                 --with-path-lib=${libdir}/rpm \
>                 --with-bugreport=http://bugzilla.yoctoproject.org \
> @@ -384,6 +385,7 @@ FILES_${PN} =  "${bindir}/rpm \
>                 ${localstatedir}/lib/wdj \
>                 ${bindir}/rpm.real \
>                 ${bindir}/rpmconstant.real \
> +               ${rpmlibdir} \
>                 "
>
>  FILES_${PN}-common = "${bindir}/rpm2cpio \
> --
> 2.11.0
>
>

--001a114a88c8bb309905443fd248
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Small problem: we always build rpm-native as we need it fo=
r some tools, but rpmlibdir is only defined in package_rpm.bbclass which do=
esn&#39;t have to be inherited.<div><br></div><div>This leads to just=C2=A0=
--with-path-database=3D being passed to configure.=C2=A0 What&#39;s the beh=
aviour of RPM when this happens? What does it default to?=C2=A0 If it&#39;s=
 going to be safe (ie a sane default is used), please update the commit mes=
sage to explain this.</div><div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 December 2016 at 10:2=
3, David Vincent <span dir=3D"ltr">&lt;<a href=3D"mailto:freesilicon@gmail.=
com" target=3D"_blank">freesilicon@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D"">When using a custom RPM data dir=
ectory instead of the default dir<br>
&#39;/var/lib/rpm&#39;, the final image did not contain any of the database=
<br>
files in the expected location. This commit takes into account the<br>
&#39;rpmlibdir&#39; variable set into &#39;rootfs_rpm.bbclass&#39;.<br>
<br>
Changes since v4:<br>
=C2=A0 =C2=A0 - Remove boolean in d.getVar() calls.<br>
<br>
</span>Changes since v5:<br>
=C2=A0 =C2=A0 - Also modify rpm recipe to build the database in the correct=
<br>
=C2=A0 =C2=A0 =C2=A0 location and avoid errors during rootfs creation.<br>
<span class=3D""><br>
Signed-off-by: David Vincent &lt;<a href=3D"mailto:freesilicon@gmail.com">f=
reesilicon@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23=
 +++++++++++++----------<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
</span>=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_<wbr>5.4.16.bb</a> |=C2=A0 2 ++<br>
=C2=A03 files changed, 17 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager.<wbr>py b/meta/lib/oe/package_mana=
ger.<wbr>py<br>
index e557473999..3f2878c394 100644<br>
<div><div class=3D"h5">--- a/meta/lib/oe/package_manager.<wbr>py<br>
+++ b/meta/lib/oe/package_manager.<wbr>py<br>
@@ -356,7 +356,8 @@ class RpmPkgsList(PkgsList):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(RpmPkgsList, self).__init__(d, root=
fs_dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.rpm_cmd =3D bb.utils.which(os.getenv=
(&#39;<wbr>PATH&#39;), &quot;rpm&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.rootfs=
_dir, &#39;var/lib/rpm&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir =3D self.d.getVar(&#39;rpmlibd=
ir&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.rootfs=
_dir, self.rpm_libdir[1:])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ml_prefix_list, self.ml_os_list =3D =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RpmIndexer(d, rootfs_dir).g=
et_ml_prefix_and_<wbr>os_list(arch_var, os_var)<br>
@@ -416,7 +417,7 @@ class RpmPkgsList(PkgsList):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def list_pkgs(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [self.rpm_cmd, &#39;--root&#39;, =
self.rootfs_dir]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.extend([&#39;-D&#39;, &#39;_dbpath /var/li=
b/rpm&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.extend([&#39;-D&#39;, &#39;_dbpath&#39;, s=
elf.rpm_libdir])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd.extend([&#39;-qa&#39;, &#39;--qf&#39;=
, &#39;[%{NAME} %{ARCH} %{VERSION} %{PACKAGEORIGIN}\n]&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
@@ -683,7 +684,8 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.solution_manifest =3D self.d.expand(=
&#39;${T}/saved/%s_<wbr>solution&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.saved_rpmlib =3D self.d.expand(&#39;=
${T}/saved/%s&#39; % self.task_name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.target=
_<wbr>rootfs, &#39;var/lib/rpm&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir =3D self.d.getVar(&#39;rpmlibd=
ir&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.image_rpmlib =3D os.path.join(self.target=
_<wbr>rootfs, self.rpm_libdir[1:])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
<wbr>${T}/saved&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(self.d.<=
wbr>expand(&#39;${T}/saved&#39;))<br>
@@ -954,7 +956,7 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open(db_config_dir, &#39;w+=
&#39;).write(DB_CONFIG_CONTENT)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create database so that smart doesn&#39=
;t complain (lazy init)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--root&#39;, self.=
target_rootfs, &#39;--dbpath&#39;, &#39;/var/lib/rpm&#39;, &#39;-qa&#39;]<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--root&#39;, self.=
target_rootfs, &#39;--dbpath&#39;, self.rpm_libdir, &#39;-qa&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd=
, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e=
:<br>
@@ -963,20 +965,19 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Import GPG key to RPM database of the t=
arget system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.d.getVar(&#39;RPM_SIGN_<wbr>PACKA=
GES&#39;) =3D=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pubkey_path =3D self.d.getV=
ar(&#39;RPM_GPG_PUBKEY&#39;<wbr>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--ro=
ot&#39;, self.target_rootfs, &#39;--dbpath&#39;, &#39;/var/lib/rpm&#39;, &#=
39;--import&#39;, pubkey_path]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D [self.rpm_cmd, &#39;--ro=
ot&#39;, self.target_rootfs, &#39;--dbpath&#39;, self.rpm_libdir, &#39;--im=
port&#39;, pubkey_path]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.ch=
eck_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledPro=
cessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quo=
t;Import GPG key failed. Command &#39;%s&#39; &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;returned %d:\n%s&quot; % (&#39; &#39;.join(cmd), e.r=
eturncode, e.output.decode(&quot;utf-8&quot;)))<br>
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Configure smart<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;configuring Smart settings&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(os.path.join(<wbr>self.ta=
rget_rootfs, &#39;var/lib/smart&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0True)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_smart([&#39;config&#39;, &#3=
9;--set&#39;, &#39;rpm-root=3D%s&#39; % self.target_rootfs])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._invoke_smart([&#39;config&#39;, &#39;--s=
et&#39;, &#39;rpm-dbpath=3D/var/lib/rpm&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._invoke_smart([&#39;config&#39;, &#39;--s=
et&#39;, &#39;rpm-dbpath=3D%s&#39; % self.rpm_libdir])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_smart([&#39;config&#39;, &#3=
9;--set&#39;, &#39;rpm-extra-macros._var=3D%s&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.d.getVar(&#39;localstatedir&#39;)<wbr>])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [&quot;config&quot;, &quot;--set&=
quot;, &quot;rpm-extra-macros._tmppath=3D/%<wbr>s/tmp&quot; % self.install_=
dir_name]<br>
@@ -1236,7 +1237,7 @@ class RpmPM(PackageManager):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not with_dependencies:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [self.rpm_cmd] + [&=
quot;-e&quot;, &quot;--nodeps&quot;, &quot;--root=3D%s&quot; %<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.target_rootfs, &quot;--dbpath=3D/var/lib/rpm&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.target_rootfs, &quot;--dbpath=3D%s&quot; % self.rpm_libdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;--define=3D&#39;_cross_scriptlet_<wbr>wrapper %s&#39;&quot; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.scriptlet_wrapper,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;--define=3D&#39;_tmppath /%s/tmp&#39;&quot; % self.install_dir_nam=
e] + pkgs<br>
@@ -1384,7 +1385,8 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_dir =3D self.target_rootfs + self.d=
.expand(&#39;${sysconfdir}/<wbr>rpm-postinsts/&#39;) + new_pkg<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D self.rpm_cmd + &#39; -q --scripts=
 --root &#39; + self.target_rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &#39; --dbpath=3D/var/lib/rpm &#39; +=
 new_pkg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &#39; --dbpath=3D%s &#39; %=C2=A0 sel=
f.rpm_libdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D new_pkg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; | sed -n -e &quot;/^postin=
stall scriptlet (using .*):$/,/^.* scriptlet (using .*):$/ {/.*/p}&quot;&#3=
9;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; | sed -e &quot;/postinstal=
l scriptlet (using \(.*\)):$/d&quot;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &#39; -e &quot;/^.* scriptlet (u=
sing .*):$/d&quot; &gt; %s&#39; % saved_dir<br>
@@ -1416,7 +1418,8 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0def unlock_rpm_db(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove rpm db lock files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_db_locks =3D glob.glob(&#39;%s/var/lib/rpm=
/__<wbr>db.*&#39; % self.target_rootfs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_db_locks =3D glob.glob(&#39;%s%s/__db.*&#3=
9; % (self.target_rootfs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.rpm_libdir))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in rpm_db_locks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(f, True)<br=
>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
</div></div>index d9a473006a..6eb05feb6c 100644<br>
<span class=3D"">--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -429,6 +429,7 @@ class RpmRootfs(Rootfs):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _create(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs_to_install =3D self.manifest.parse_i=
nitial_<wbr>manifest()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpm_libdir =3D self.d.getVar(&#39;rpmlibdir&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpm_pre_process_cmds =3D self.d.getVar(&#=
39;RPM_PREPROCESS_<wbr>COMMANDS&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rpm_post_process_cmds =3D self.d.getVar(&=
#39;RPM_<wbr>POSTPROCESS_COMMANDS&#39;)<br>
<br>
@@ -476,7 +477,7 @@ class RpmRootfs(Rootfs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.progress_reporter:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progress_reporter.next=
_<wbr>stage()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39=
;, &#39;/var/lib/rpm&#39;, &#39;/var/lib/smart&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._setup_dbg_rootfs([&#39;/etc/<wbr>rpm&#39=
;, rpm_libdir, &#39;/var/lib/smart&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execute_pre_post_process(self.<wbr>d, rpm=
_post_process_cmds)<br>
<br>
</span>diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.=
bb" rel=3D"noreferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a> b/meta/reci=
pes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"noreferrer" target=
=3D"_blank">rp<wbr>m_5.4.16.bb</a><br>
index 3df4d1ff1d..12181d89b1 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">rp<wbr>m_5.4.16.bb</a><br>
@@ -342,6 +342,7 @@ EXTRA_OECONF +=3D &quot;--verbose \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-build-warn=
ings \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-build-debu=
g \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-maintainer=
-mode \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-path-databas=
e=3D${<wbr>rpmlibdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-path-macros=
=3D${rpm_<wbr>macros} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-path-lib=3D$=
{libdir}/rpm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-bugreport=3D=
<a href=3D"http://bugzilla.yoctoproject.org" rel=3D"noreferrer" target=3D"_=
blank">http://<wbr>bugzilla.yoctoproject.org</a> \<br>
@@ -384,6 +385,7 @@ FILES_${PN} =3D=C2=A0 &quot;${bindir}/rpm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${localstatedir}/li=
b/wdj \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/rpm.real =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/rpmconsta=
nt.real \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rpmlibdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0FILES_${PN}-common =3D &quot;${bindir}/rpm2cpio \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>

--001a114a88c8bb309905443fd248--
