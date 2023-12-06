Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7ACC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:26:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.42460.1701890765152563703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqihPSmH;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so1568331fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 11:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701890763; x=1702495563; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2eKihByimeLe9XIdDXy9GdGvRJMOBtF4z8Ah9m6i7QU=;
        b=ZqihPSmH+E/ARxBcl87hVui83DlI2RLeMNJy2zobyP4erkZRIsIUanpMS5uXzq4jge
         7O08Q9QpJicdrslUQPsMjS/AWsU6duAd7kZlJJ+oImpSi9r1pSxUVIRJjvoekhX86ysl
         o8cxu2Si3seoIGCZLGKKbfyPpC7dZShYavE82j9LZ4QzB9BoY8Giwk5QU8dQVP+vNs3e
         0zRnysW+BFkT8NKIVx9A5tLwZ3MkEyLl0E+a14EDIRxEH8dAr6ADF5c4vAmCrKCl7klf
         GVuqp6r/EvLKP8IRvktFYA6TQj2MFykZnR6w3gZqvKP+KHoGmqdmpie5+25nQ8oNCOdX
         LvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701890763; x=1702495563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eKihByimeLe9XIdDXy9GdGvRJMOBtF4z8Ah9m6i7QU=;
        b=qDgW8KXrWWhvFtTlPBVzcBZHlbw3J3kBkL1gNSKeQwjMw6yI0cU5ZZzOkv3qLX+9c0
         0BHGRzNPaCkxv3r6vnWMTw+k0B6ezdpMIRv+X3k/Ydfe+xByWFXMBRErS6llA7uTN/OT
         DKC5xezymy84cLdi9EEEgiaraNiOXggPZ+ubQXZT/hGpwMhhyhsaQwVW6H7w0MXcVIzb
         RrLzuHU9psObDVCQb2GMzgUlzJYkdoiY6j3LJzY0FSJc5U+0REfQWFwKPuZsliYqoqRp
         OdEHWjJk8MrYVqEfOHCnhYvEcsjwpKT3gtITv63drun8gokMpVrnUoWnIPU7X3KltNkQ
         qI6Q==
X-Gm-Message-State: AOJu0Yw3OlrfvRi37TBjgiquM+aif4r6eA9HEMYeeMkmlqusju3VIDpK
	TSyzHB9N0aXQVANWO35PBqe/t+NPqM+9I+YespA=
X-Google-Smtp-Source: AGHT+IHaHv5vnSSgPGGwu2pYEOXihbO1NjmxRKhNr4IiVIl2VT3D44pT8J3rxX/nkgBwNwH5UZbAyRNTtCQ7yEm7afc=
X-Received: by 2002:a2e:9ec4:0:b0:2ca:dec:b61a with SMTP id
 h4-20020a2e9ec4000000b002ca0decb61amr656334ljk.73.1701890763010; Wed, 06 Dec
 2023 11:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20231206192207.2838077-1-pkj@axis.com> <20231206192207.2838077-9-pkj@axis.com>
 <CANNYZj9OBN=911raynt6_47+kbyWBh_TH_JhZjBc==oq8G-VXQ@mail.gmail.com>
In-Reply-To: <CANNYZj9OBN=911raynt6_47+kbyWBh_TH_JhZjBc==oq8G-VXQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Dec 2023 20:25:51 +0100
Message-ID: <CANNYZj8ZoyW5F9oZ7x-=pmBo4eL28DAzuD7jpUJegCY=bRN+-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/9] devtool: upgrade: Update all existing
 checksums for the SRC_URI
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191918

I mean, what possible reason there could be to keep them? None as far
as I can see.

Alex

On Wed, 6 Dec 2023 at 20:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> We've been relying on this to actually remove md5sums on version
> updates, so please do not regress that.
>
> Alex
>
> On Wed, 6 Dec 2023 at 20:22, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > Rather than only updating the sha256sum and removing the md5sum, update
> > all existing checksums. If the only existing checksum is md5sum, then
> > replace it with the default expected checksums.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  .../devtool/devtool-upgrade-test3_1.5.3.bb    | 16 ++++++
> >  .../devtool-upgrade-test3_1.5.3.bb.upgraded   | 15 ++++++
> >  .../devtool/devtool-upgrade-test4_1.5.3.bb    | 22 ++++++++
> >  .../devtool-upgrade-test4_1.5.3.bb.upgraded   | 19 +++++++
> >  meta/lib/oeqa/selftest/cases/devtool.py       | 48 +++++++++++++++++
> >  scripts/lib/devtool/upgrade.py                | 51 ++++++++++---------
> >  6 files changed, 148 insertions(+), 23 deletions(-)
> >  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
> >  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
> >  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
> >  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
> >
> > diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
> > new file mode 100644
> > index 0000000000..69c0d351ec
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
> > +LICENSE = "Artistic-2.0"
> > +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
> > +
> > +SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> > +UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
> > +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> > +
> > +SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
> > +
> > +S = "${WORKDIR}/pv-${PV}"
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +inherit autotools
> > +
> > diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
> > new file mode 100644
> > index 0000000000..3ce7e85e10
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.upgraded
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
> > +LICENSE = "Artistic-2.0"
> > +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
> > +
> > +SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07fd82c3"
> > +SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> > +UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
> > +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> > +
> > +S = "${WORKDIR}/pv-${PV}"
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +inherit autotools
> > +
> > diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
> > new file mode 100644
> > index 0000000000..9abf80e6ed
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
> > +LICENSE = "Artistic-2.0"
> > +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
> > +
> > +SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> > +UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
> > +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> > +
> > +SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
> > +SRC_URI[sha1sum] = "63a0801350e812541c7f8e9ad74e0d6b629d0b39"
> > +SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756e81fbc"
> > +SRC_URI[sha384sum] = "5fff6390465ff23dbf573fcf39dfad3aed2f92074a35e6c02abe58b7678858d90fa6572ff4cb56df8b3e217c739cdbe3"
> > +SRC_URI[sha512sum] = "32efe7071a363f547afc74e96774f711795edda1d2702823a347d0f9953e859b7d8c45b3e63e18ffb9e0d5ed5910be652d7d727c8676e81b6cb3aed0b13aec00"
> > +
> > +PR = "r5"
> > +
> > +S = "${WORKDIR}/pv-${PV}"
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +inherit autotools
> > +
> > diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
> > new file mode 100644
> > index 0000000000..cd2a0842f4
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.upgraded
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "Pipe viewer test recipe for devtool upgrade test"
> > +LICENSE = "Artistic-2.0"
> > +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
> > +
> > +SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz"
> > +UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
> > +RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
> > +
> > +SRC_URI[sha1sum] = "395ce62f4f3e035b86c77038f04b96c5aa233595"
> > +SRC_URI[sha256sum] = "9dd45391806b0ed215abee4c5ac1597d018c386fe9c1f5afd2f6bc3b07fd82c3"
> > +SRC_URI[sha384sum] = "218c8d2d097aeba5310be759bc20573f18ffa0b11701eac6dd2e7e14ddf13c6e0e094ca7ca026eaa05ef92a056402e36"
> > +SRC_URI[sha512sum] = "1cf9d7376fceefcd594d0a8b591afc8e11ce89f7210d10ad74438974ecebe9cc5d9ec4db9cc79e0566bfd2b0278c0cc263c07547803e7536432cd1ffd32d8a45"
> > +
> > +S = "${WORKDIR}/pv-${PV}"
> > +
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> > +inherit autotools
> > +
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> > index e01ab01869..4e65484d81 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -1883,6 +1883,54 @@ class DevtoolUpgradeTests(DevtoolBase):
> >          self.assertNotIn(recipe, result.output)
> >          self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after resetting')
> >
> > +    def test_devtool_upgrade_drop_md5sum(self):
> > +        # Check preconditions
> > +        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> > +        self.track_for_cleanup(self.workspacedir)
> > +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> > +        # For the moment, we are using a real recipe.
> > +        recipe = 'devtool-upgrade-test3'
> > +        version = '1.6.0'
> > +        oldrecipefile = get_bb_var('FILE', recipe)
> > +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> > +        self.track_for_cleanup(tempdir)
> > +        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
> > +        # we are downgrading instead of upgrading.
> > +        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
> > +        # Check new recipe file is present
> > +        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, '%s_%s.bb' % (recipe, version))
> > +        self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
> > +        # Check recipe got changed as expected
> > +        with open(oldrecipefile + '.upgraded', 'r') as f:
> > +            desiredlines = f.readlines()
> > +        with open(newrecipefile, 'r') as f:
> > +            newlines = f.readlines()
> > +        self.assertEqual(desiredlines, newlines)
> > +
> > +    def test_devtool_upgrade_all_checksums(self):
> > +        # Check preconditions
> > +        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
> > +        self.track_for_cleanup(self.workspacedir)
> > +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> > +        # For the moment, we are using a real recipe.
> > +        recipe = 'devtool-upgrade-test4'
> > +        version = '1.6.0'
> > +        oldrecipefile = get_bb_var('FILE', recipe)
> > +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> > +        self.track_for_cleanup(tempdir)
> > +        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
> > +        # we are downgrading instead of upgrading.
> > +        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
> > +        # Check new recipe file is present
> > +        newrecipefile = os.path.join(self.workspacedir, 'recipes', recipe, '%s_%s.bb' % (recipe, version))
> > +        self.assertExists(newrecipefile, 'Recipe file should exist after upgrade')
> > +        # Check recipe got changed as expected
> > +        with open(oldrecipefile + '.upgraded', 'r') as f:
> > +            desiredlines = f.readlines()
> > +        with open(newrecipefile, 'r') as f:
> > +            newlines = f.readlines()
> > +        self.assertEqual(desiredlines, newlines)
> > +
> >      def test_devtool_layer_plugins(self):
> >          """Test that devtool can use plugins from other layers.
> >
> > diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> > index 10827a762b..a98370bc10 100644
> > --- a/scripts/lib/devtool/upgrade.py
> > +++ b/scripts/lib/devtool/upgrade.py
> > @@ -192,8 +192,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
> >          __run('git submodule foreach \'git tag -f devtool-base-new\'')
> >          (stdout, _) = __run('git submodule --quiet foreach \'echo $sm_path\'')
> >          paths += [os.path.join(srctree, p) for p in stdout.splitlines()]
> > -        md5 = None
> > -        sha256 = None
> > +        checksums = {}
> >          _, _, _, _, _, params = bb.fetch2.decodeurl(uri)
> >          srcsubdir_rel = params.get('destsuffix', 'git')
> >          if not srcbranch:
> > @@ -226,9 +225,6 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
> >          if ftmpdir and keep_temp:
> >              logger.info('Fetch temp directory is %s' % ftmpdir)
> >
> > -        md5 = checksums['md5sum']
> > -        sha256 = checksums['sha256sum']
> > -
> >          tmpsrctree = _get_srctree(tmpdir)
> >          srctree = os.path.abspath(srctree)
> >          srcsubdir_rel = os.path.relpath(tmpsrctree, tmpdir)
> > @@ -297,7 +293,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
> >              if tmpdir != tmpsrctree:
> >                  shutil.rmtree(tmpdir)
> >
> > -    return (revs, md5, sha256, srcbranch, srcsubdir_rel)
> > +    return (revs, checksums, srcbranch, srcsubdir_rel)
> >
> >  def _add_license_diff_to_recipe(path, diff):
> >      notice_text = """# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> > @@ -318,7 +314,7 @@ def _add_license_diff_to_recipe(path, diff):
> >          f.write("\n#\n\n".encode())
> >          f.write(orig_content)
> >
> > -def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree, keep_failure):
> > +def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree, keep_failure):
> >      """Creates the new recipe under workspace"""
> >
> >      bpn = rd.getVar('BPN')
> > @@ -390,30 +386,39 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
> >                  addnames.append(params['name'])
> >      # Find what's been set in the original recipe
> >      oldnames = []
> > +    oldsums = []
> >      noname = False
> >      for varflag in rd.getVarFlags('SRC_URI'):
> > -        if varflag.endswith(('.md5sum', '.sha256sum')):
> > -            name = varflag.rsplit('.', 1)[0]
> > -            if name not in oldnames:
> > -                oldnames.append(name)
> > -        elif varflag in ['md5sum', 'sha256sum']:
> > -            noname = True
> > +        for checksum in checksums:
> > +            if varflag.endswith('.' + checksum):
> > +                name = varflag.rsplit('.', 1)[0]
> > +                if name not in oldnames:
> > +                    oldnames.append(name)
> > +                oldsums.append(checksum)
> > +            elif varflag == checksum:
> > +                noname = True
> > +                oldsums.append(checksum)
> >      # Even if SRC_URI has named entries it doesn't have to actually use the name
> >      if noname and addnames and addnames[0] not in oldnames:
> >          addnames = []
> >      # Drop any old names (the name actually might include ${PV})
> >      for name in oldnames:
> >          if name not in newnames:
> > -            newvalues['SRC_URI[%s.md5sum]' % name] = None
> > -            newvalues['SRC_URI[%s.sha256sum]' % name] = None
> > +            for checksum in oldsums:
> > +                newvalues['SRC_URI[%s.%s]' % (name, checksum)] = None
> >
> > -    if sha256:
> > -        if addnames:
> > -            nameprefix = '%s.' % addnames[0]
> > -        else:
> > -            nameprefix = ''
> > +    nameprefix = '%s.' % addnames[0] if addnames else ''
> > +
> > +    # md5sum is deprecated, remove any traces of it. If it was the only old
> > +    # checksum, then replace it with the default checksums.
> > +    if 'md5sum' in oldsums:
> >          newvalues['SRC_URI[%smd5sum]' % nameprefix] = None
> > -        newvalues['SRC_URI[%ssha256sum]' % nameprefix] = sha256
> > +        oldsums.remove('md5sum')
> > +        if not oldsums:
> > +            oldsums = ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIST]
> > +
> > +    for checksum in oldsums:
> > +        newvalues['SRC_URI[%s%s]' % (nameprefix, checksum)] = checksums[checksum]
> >
> >      if srcsubdir_new != srcsubdir_old:
> >          s_subdir_old = os.path.relpath(os.path.abspath(rd.getVar('S')), rd.getVar('WORKDIR'))
> > @@ -571,12 +576,12 @@ def upgrade(args, config, basepath, workspace):
> >              rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
> >              old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
> >              logger.info('Extracting upgraded version source...')
> > -            rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
> > +            rev2, checksums, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
> >                                                      args.srcrev, args.srcbranch, args.branch, args.keep_temp,
> >                                                      tinfoil, rd)
> >              new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
> >              license_diff = _generate_license_diff(old_licenses, new_licenses)
> > -            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
> > +            rf, copied = _create_new_recipe(args.version, checksums, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
> >          except (bb.process.CmdError, DevtoolError) as e:
> >              recipedir = os.path.join(config.workspace_path, 'recipes', rd.getVar('BPN'))
> >              _upgrade_error(e, recipedir, srctree, args.keep_failure)
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191913): https://lists.openembedded.org/g/openembedded-core/message/191913
> > Mute This Topic: https://lists.openembedded.org/mt/103019944/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

