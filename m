Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F5110854B2
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 22:06:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18930.1773526003036996904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 15:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqOeu5/U;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so4275350e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 15:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773526001; cv=none;
        d=google.com; s=arc-20240605;
        b=O1V+95L7Y5FX9hooThfo9XYfqApa7z6KtArQzRIvbeB0TEERdNDJvgDrbc1z0usG3T
         mlz2HMm3cplz8lrRg5KgQu3hDW3dmjewY0aRsLpHSS/hKu5tMBC3YRQF2MgDQ54bh7jq
         5huNuQrmMcDLuQ8PxV8xwsVae8rY1blxxIhM/spy+Sl0vznPYySiRDMeetTLo2e3A7EM
         ifEikjFGGOC65b9HkiK7tCKlq+wyRkDLQLY5Qbc5O4Ni21dOAip+J6b4UWq4QjpqURJO
         +hXMNUDUkbL8GSR/BKK+SN5aKeZE1HhVBTcRkwPN37bSDdcJnSh+JyALplHStXfZiSbI
         Iocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BT9tJtg3icqyRr/VjamEi+qMK4RSXKfs8OLVJbjqd/o=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=WGDVj0O4EfwivaFA9JJcwAl3WN4UXBbw3v1ScsxmtpVeLYzmh+9aFCvCp0Xwfh1nb8
         aRqwR3awI+8mGbSsKSrAUECS17evVGR2EWHKDi76x4x0FWSUquq808iRoK2Z3COpTM/N
         jY00uYBgG2q6ktsk6lzCZzn1qdSzYuR5Q40DI2ODrdqEhtTPcKrHNoqCWZh4NMSJkmoS
         ocfNJq4pKkKb0S/eyZ9/VwStqvDU9XwOJFRrQrMeydipIRVGM3l6cB5r9T2sIWu+hqDm
         XuWCg/s6f7wNuH0Do0ZuzBGTOuitHu/ANMJIZCmjr+MjA5TsccJ7geEI33SuWlClmxgd
         VV0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773526001; x=1774130801; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BT9tJtg3icqyRr/VjamEi+qMK4RSXKfs8OLVJbjqd/o=;
        b=iqOeu5/UdaahHpKBu/qJgpO/TsNpJfFmbK/fuK9Z9IAlg5P09SYWKB4GdujgbLEtLQ
         W/3hwQizkd/vXhXfwBpru50nM+jUAXEvEhDXW8hUGymZ1K7EQthqVziLiXioxosSoM+E
         Iqp+aIHVxCiE08Cr9HODgY519rU64aqxaPpq7t0ALn+Q5FmBbw1OiNxcDnlNGG+b4IYl
         M0G4K5/CeASHe7HdbUgUS4WZZLaOCrBJqIBo2kQFyILeFQMPjtAXqO0cSyoMyXSV292a
         7lnT3FwKkxrunnfHZmXYNo6vmMik5WvT4qdvhClRbW+5qVETRK36E1DgT2CD6iH8YZuK
         p3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773526001; x=1774130801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT9tJtg3icqyRr/VjamEi+qMK4RSXKfs8OLVJbjqd/o=;
        b=J+MVq1Wsc4O2FCEJKfaqP3nb8gdcrvsHh855+dreDr8Q7e3cyZ8OCfoaoFG5mrI6Po
         FwTtVswHSV7CCMaBl8127R4mhkK65z9UpkPNjtuYs/6hcINRHZ1Ob7Sg/xoqmUmr8SoX
         Qg6wxMwVsHotFI+Ig5AtE7vb2DsbUSS09zbe7IzZPXEeH+3m8ts3w/ENmB+I4ZewUHPV
         ieyD8qk5FcTZyPBRXf1HYN8Neb0KPB+3/z9fwsJ9vekQA2apHq7jNNoUyQlZtzZkTxPH
         IZx+HDtaln2TngsGnV8xBvL6QuQ0E0R6dHLCxHG24IUtF/xaw5yRIaEvR18GsIk3Z+8g
         nMjg==
X-Gm-Message-State: AOJu0YyP0d8dim8/A50+QrBjwOMITer+H7a5TxBKUo6zVpXZdBhYJXqm
	CKlmwPhvy8ptr/MajSsoEo6BaUuy7qIdBeoWxMVvfuO9UXnKUWJNrhllgqmQVRRszPeU74QHGwP
	eIIJQVoWDw7qs2CLihiUt+jjg8ZlrFpw=
X-Gm-Gg: ATEYQzwyfBflKgTE3Te4Yh7SmxlW3eNffCeMBnoaqbvmwNM0MSwId9vmQVqyK/VbXqf
	NXSpoBsPCtTJ6XcDMOLQlSaT5qnZAM8ZjFroyJc79yadl8CnXXAxuJMjGTFrwHMBHhTlx5GeX7o
	hlimEeyelwkACCONJuBVjRAd95AlrG4BSblYn4P2DYTUUaMj9wZFqu/To+bV2hu3492jdDQVgqg
	LjZy495JMsE1OC3q22Iqqh09Ke1Ner8tRYRLjNLJndZg051L4VIm+Qcv7S6+O5BsGe570ukdc7e
	19dsPo9X4rk2uQOl1TMLzQxj1TKn4kIxJs8sxJWn
X-Received: by 2002:ac2:455b:0:b0:5a1:538e:fb26 with SMTP id
 2adb3069b0e04-5a162af0f17mr2057788e87.11.1773526000728; Sat, 14 Mar 2026
 15:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260222232400.2475952-2-t.f.g.geelen@gmail.com> <5acbeaf191e87bbce57caaa56e27434f30a32fa9.camel@pbarker.dev>
In-Reply-To: <5acbeaf191e87bbce57caaa56e27434f30a32fa9.camel@pbarker.dev>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Sat, 14 Mar 2026 23:06:30 +0100
X-Gm-Features: AaiRm52qQMxAJW2gwRmdt11qUXrUkeDQkw2ORV_uMgOn8_tXQEXpsYn4DLR_2Js
Message-ID: <CAJo0Az6DUEPYQH3N27BJSS-SJ0NGTUO-NbGq0aK0Vq5CNnRdaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: Add test-image plugin for testing
 packages via devtool via images.
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000045fe4e064d0333d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 22:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233101

--00000000000045fe4e064d0333d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I processed the comments and sent a new version of this patch (V3). I look
forward to seeing your feedback.

Regards

Tom

On Thu, Mar 5, 2026 at 3:29=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrote=
:

> On Mon, 2026-02-23 at 00:24 +0100, Tom Geelen via lists.openembedded.org
> wrote:
> > Based of a feature of AUH this is a plugin to run a testimage directly
> with packages installed that you are working on via devtool.
> >
> > Inputs would be a:
> > - target image
> > - target packages
> >
> > The tool will take care to make sure it also installs the minimal
> necessary dependencies to be able to run ptest on the target image.
> > Logs will be captured and stored in the devtool workspace for easy
> access.
> >
> > An oe-selftest is added to test the plugin.
> >
> > Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/devtool.py |  61 +++++++++++
> >  scripts/lib/devtool/test_image.py       | 130 ++++++++++++++++++++++++
> >  2 files changed, 191 insertions(+)
> >  create mode 100644 scripts/lib/devtool/test_image.py
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> > index d1209dd94e..c27934a3ca 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -1932,6 +1932,67 @@ class DevtoolBuildImageTests(DevtoolBase):
> >          if reqpkgs:
> >              self.fail('The following packages were not present in the
> image as expected: %s' % ', '.join(reqpkgs))
> >
> > +
> > +class DevtoolTestImageTests(DevtoolBase):
> > +
> > +    @OETestTag("runqemu")
> > +    def test_devtool_test_image(self):
> > +        """Test devtool test-image plugin."""
> > +
> > +        machine =3D get_bb_var('MACHINE')
> > +        if not machine or not machine.startswith('qemu'):
> > +            self.skipTest('This test only works with qemu machines')
> > +
> > +        self.assertTrue(not os.path.exists(self.workspacedir),
> > +                        'This test cannot be run with a workspace
> directory under the build directory')
> > +
> > +        image =3D 'oe-selftest-image'
> > +        recipe =3D 'python3-atomicwrites'
>
> I'm not sure that this is the best image recipe to use. Why not build
> core-image-ptest-<packagename>?
>
> > +
> > +        # Ensure selected test package is ptest-capable.
> > +        ptest_path =3D get_bb_var('PTEST_PATH', recipe)
> > +        self.assertTrue(ptest_path,
> > +                'Selected package %s does not appear to inherit ptest'
> % recipe)
> > +
> > +        self.track_for_cleanup(self.workspacedir)
> > +        # self.add_command_to_tearDown('bitbake -c clean %s' % image)
> > +        self.add_command_to_tearDown('bitbake-layers remove-layer
> */workspace')
> > +
> > +        # Ensure we're starting from a clean state
> > +        bitbake('%s -c clean' % image)
> > +
> > +        result =3D runCmd('devtool test-image %s -p %s' % (image,
> recipe), ignore_status=3DTrue)
> > +        if result.status !=3D 0 and 'runqemu - ERROR - Unknown path ar=
g'
> in result.output:
> > +            self.skipTest('runqemu in this environment does not accept
> testimage rootfs path args')
> > +        self.assertEqual(result.status, 0,
> > +                         'devtool test-image failed unexpectedly:\n%s'
> % result.output)
> > +
> > +        # Check that requested package and its ptest package were
> installed
> > +        deploy_dir_image =3D get_bb_var('DEPLOY_DIR_IMAGE')
> > +        self.assertTrue(deploy_dir_image, 'Unable to get
> DEPLOY_DIR_IMAGE')
> > +
> > +        manifests =3D sorted(glob.glob(os.path.join(deploy_dir_image,
> '%s*.manifest' % image)))
> > +        self.assertTrue(manifests, 'Image manifest not found for %s in
> %s' % (image, deploy_dir_image))
> > +        manifest =3D manifests[-1]
> > +        self.assertExists(manifest, 'Image manifest not found: %s' %
> manifest)
> > +
> > +        pkgs =3D set()
> > +        with open(manifest, 'r') as f:
> > +            for line in f:
> > +                splitval =3D line.split()
> > +                if splitval:
> > +                    pkgs.add(splitval[0])
> > +
> > +        self.assertIn(recipe, pkgs)
> > +        self.assertIn(recipe + '-ptest', pkgs)
> > +
> > +        match =3D re.search(r'Logs are in (\S+)', result.output)
> > +        if match:
> > +            logdir =3D match.group(1)
> > +        else:
> > +            logdir =3D os.path.join(self.workspacedir, 'testimage-logs=
')
> > +        self.assertTrue(os.path.isdir(logdir), 'Expected logs director=
y
> not found: %s' % logdir)
> > +
>
> This test case took 10+ hours to run on the autobuilder [1]. Any ideas
> why it's so slow?
>
> [1]:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3280
>
> > +def test_image(args, config, basepath, workspace):
> > +    """Entry point for the devtool 'test-image' subcommand."""
> > +
> > +    if not args.imagename:
> > +        raise DevtoolError('Image recipe to test must be specified')
> > +    if not args.package:
> > +        raise DevtoolError('Package(s) to install must be specified vi=
a
> -p/--package')
> > +
> > +    package_names =3D [p.strip() for p in args.package.split(',') if
> p.strip()]
> > +    if not package_names:
> > +        raise DevtoolError('No valid package name(s) provided')
> > +
> > +    install_pkgs =3D package_names
> > +
> > +    logdir =3D os.path.join(config.workspace_path, 'testimage-logs')
> > +    try:
> > +        os.makedirs(logdir, exist_ok=3DTrue)
> > +    except Exception as exc:
> > +        raise DevtoolError(f'Failed to create test logs directory
> {logdir}: {exc}')
> > +
> > +    pkg_append =3D ' '.join(sorted(set(install_pkgs)))
> > +    extra_append =3D [
> > +        f'TEST_LOG_DIR =3D "{logdir}"',
> > +        # Ensure runtime test framework is enabled even if image/distr=
o
> omitted it
> > +        'IMAGE_CLASSES +=3D " testimage"',
> > +        # Ensure the testimage task has the correct IMAGE_FEATURES set
> in case the TEST_TARGET is qemu
> > +        'IMAGE_FEATURES +=3D "allow-empty-password empty-root-password
> allow-root-login"',
> > +        'TEST_SUITES =3D " ping ssh ptest"',
> > +        'TEST_RUNQEMUPARAMS +=3D "slirp"',
>
> This should not be set by default as different users may have different
> needs. We need to rely on users setting the runqemuparams that the need
> in local.conf/site.conf.
>
> > +        # Ensure image artifacts are built before do_testimage reads
> them.
> > +        'do_testimage[depends] +=3D " ${PN}:do_image_complete
> virtual/kernel:do_deploy"',
>
> The do_testimage task should already have appropriate dependencies.
>
> > +        # Ensure rootfs link naming is runqemu-compatible for image
> names that
> > +        # otherwise end with '-image' (without a trailing '-').
> > +        'IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"',
> > +        # Ensure a qemu-supported rootfs type is built/selected
> > +        'IMAGE_FSTYPES:append =3D " ext4"',
> > +        'QB_DEFAULT_FSTYPE =3D "ext4"',
>
> Why do we need to force ext4 here?
>
> > +        # Enable ptests and include available -ptest packages for
> installed content
> > +        'DISTRO_FEATURES:append =3D " ptest"',
> > +        'IMAGE_FEATURES +=3D " ptest-pkgs"',
> > +        'IMAGE_INSTALL:append =3D " ptest-runner dropbear"',
>
> We shouldn't assume dropbear here. If an ssh server is needed, using
> "sshd" here should do the job and allow openssh or dropbear to be
> chosen.
>
> > +        # Ensure requested packages (and -ptest where available) are
> installed
> > +        f'IMAGE_INSTALL:append =3D " {pkg_append}"',
> > +    ]
>
> The extra_append argument to build_image_task is written to a bbappend
> file for the image recipe, so it can't set global configuration like
> DISTRO_FEATURES.
>
> Best regards,
>
> --
> Paul Barker
>
>

--00000000000045fe4e064d0333d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div><br></div><div>I processed the comments and s=
ent a new version of this patch (V3). I look forward to seeing your feedbac=
k.</div><div><br></div><div>Regards</div><div><br></div><div>Tom</div></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Mar 5, 2026 at 3:29=E2=80=AFPM Paul Barker &lt;<a =
href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2026-02-23 at 00:2=
4 +0100, Tom Geelen via <a href=3D"http://lists.openembedded.org" rel=3D"no=
referrer" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; Based of a feature of AUH this is a plugin to run a testimage directly=
 with packages installed that you are working on via devtool.<br>
&gt; <br>
&gt; Inputs would be a:<br>
&gt; - target image<br>
&gt; - target packages<br>
&gt; <br>
&gt; The tool will take care to make sure it also installs the minimal nece=
ssary dependencies to be able to run ptest on the target image.<br>
&gt; Logs will be captured and stored in the devtool workspace for easy acc=
ess.<br>
&gt; <br>
&gt; An oe-selftest is added to test the plugin.<br>
&gt; <br>
&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/devtool.py |=C2=A0 61 +++++++++++<b=
r>
&gt;=C2=A0 scripts/lib/devtool/test_image.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13=
0 ++++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 191 insertions(+)<br>
&gt;=C2=A0 create mode 100644 scripts/lib/devtool/test_image.py<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/s=
elftest/cases/devtool.py<br>
&gt; index d1209dd94e..c27934a3ca 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; @@ -1932,6 +1932,67 @@ class DevtoolBuildImageTests(DevtoolBase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if reqpkgs:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&#39;The fol=
lowing packages were not present in the image as expected: %s&#39; % &#39;,=
 &#39;.join(reqpkgs))<br>
&gt;=C2=A0 <br>
&gt; +<br>
&gt; +class DevtoolTestImageTests(DevtoolBase):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @OETestTag(&quot;runqemu&quot;)<br>
&gt; +=C2=A0 =C2=A0 def test_devtool_test_image(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test devtool test-image=
 plugin.&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 machine =3D get_bb_var(&#39;MACHINE&#39;)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not machine or not machine.startswith(=
&#39;qemu&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;This tes=
t only works with qemu machines&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(not os.path.exists(self.w=
orkspacedir),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;This test cannot be run with a workspace directory unde=
r the build directory&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &#39;oe-selftest-image&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe =3D &#39;python3-atomicwrites&#39;=
<br>
<br>
I&#39;m not sure that this is the best image recipe to use. Why not build<b=
r>
core-image-ptest-&lt;packagename&gt;?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure selected test package is ptest-c=
apable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptest_path =3D get_bb_var(&#39;PTEST_PATH=
&#39;, recipe)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(ptest_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Selected=
 package %s does not appear to inherit ptest&#39; % recipe)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.workspacedir)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # self.add_command_to_tearDown(&#39;bitba=
ke -c clean %s&#39; % image)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_command_to_tearDown(&#39;bitbake=
-layers remove-layer */workspace&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure we&#39;re starting from a clean =
state<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;%s -c clean&#39; % image)<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;devtool test-image=
 %s -p %s&#39; % (image, recipe), ignore_status=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if result.status !=3D 0 and &#39;runqemu =
- ERROR - Unknown path arg&#39; in result.output:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;runqemu =
in this environment does not accept testimage rootfs path args&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(result.status, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;devtool test-image failed unexpectedly:\n%s&#39; =
% result.output)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that requested package and its pt=
est package were installed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir_image =3D get_bb_var(&#39;DEPL=
OY_DIR_IMAGE&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(deploy_dir_image, &#39;Un=
able to get DEPLOY_DIR_IMAGE&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifests =3D sorted(glob.glob(os.path.jo=
in(deploy_dir_image, &#39;%s*.manifest&#39; % image)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(manifests, &#39;Image man=
ifest not found for %s in %s&#39; % (image, deploy_dir_image))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest =3D manifests[-1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(manifest, &#39;Image ma=
nifest not found: %s&#39; % manifest)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs =3D set()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(manifest, &#39;r&#39;) as f:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitval =3D =
line.split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if splitval:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pkgs.add(splitval[0])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(recipe, pkgs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(recipe + &#39;-ptest&#39;, =
pkgs)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.search(r&#39;Logs are in (\S=
+)&#39;, result.output)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logdir =3D match.group(1)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logdir =3D os.path.join(sel=
f.workspacedir, &#39;testimage-logs&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.isdir(logdir), &#=
39;Expected logs directory not found: %s&#39; % logdir)<br>
&gt; +<br>
<br>
This test case took 10+ hours to run on the autobuilder [1]. Any ideas<br>
why it&#39;s so slow?<br>
<br>
[1]: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35=
/builds/3280" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/#/builders/35/builds/3280</a><br>
<br>
&gt; +def test_image(args, config, basepath, workspace):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Entry point for the devtool &#39;test=
-image&#39; subcommand.&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not args.imagename:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;Image recipe to t=
est must be specified&#39;)<br>
&gt; +=C2=A0 =C2=A0 if not args.package:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;Package(s) to ins=
tall must be specified via -p/--package&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 package_names =3D [p.strip() for p in args.package.spli=
t(&#39;,&#39;) if p.strip()]<br>
&gt; +=C2=A0 =C2=A0 if not package_names:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;No valid package =
name(s) provided&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 install_pkgs =3D package_names<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 logdir =3D os.path.join(config.workspace_path, &#39;tes=
timage-logs&#39;)<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(logdir, exist_ok=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 except Exception as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(f&#39;Failed to create=
 test logs directory {logdir}: {exc}&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pkg_append =3D &#39; &#39;.join(sorted(set(install_pkgs=
)))<br>
&gt; +=C2=A0 =C2=A0 extra_append =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f&#39;TEST_LOG_DIR =3D &quot;{logdir}&quo=
t;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure runtime test framework is enable=
d even if image/distro omitted it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_CLASSES +=3D &quot; testimage&=
quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure the testimage task has the corre=
ct IMAGE_FEATURES set in case the TEST_TARGET is qemu<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_FEATURES +=3D &quot;allow-empt=
y-password empty-root-password allow-root-login&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TEST_SUITES =3D &quot; ping ssh ptes=
t&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TEST_RUNQEMUPARAMS +=3D &quot;slirp&=
quot;&#39;,<br>
<br>
This should not be set by default as different users may have different<br>
needs. We need to rely on users setting the runqemuparams that the need<br>
in local.conf/site.conf.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure image artifacts are built before=
 do_testimage reads them.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;do_testimage[depends] +=3D &quot; ${=
PN}:do_image_complete virtual/kernel:do_deploy&quot;&#39;,<br>
<br>
The do_testimage task should already have appropriate dependencies.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure rootfs link naming is runqemu-co=
mpatible for image names that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # otherwise end with &#39;-image&#39; (wi=
thout a trailing &#39;-&#39;).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_LINK_NAME =3D &quot;${IMAGE_BA=
SENAME}-${MACHINE}&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure a qemu-supported rootfs type is =
built/selected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_FSTYPES:append =3D &quot; ext4=
&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;QB_DEFAULT_FSTYPE =3D &quot;ext4&quo=
t;&#39;,<br>
<br>
Why do we need to force ext4 here?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Enable ptests and include available -pt=
est packages for installed content<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;DISTRO_FEATURES:append =3D &quot; pt=
est&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_FEATURES +=3D &quot; ptest-pkg=
s&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_INSTALL:append =3D &quot; ptes=
t-runner dropbear&quot;&#39;,<br>
<br>
We shouldn&#39;t assume dropbear here. If an ssh server is needed, using<br=
>
&quot;sshd&quot; here should do the job and allow openssh or dropbear to be=
<br>
chosen.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure requested packages (and -ptest w=
here available) are installed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f&#39;IMAGE_INSTALL:append =3D &quot; {pk=
g_append}&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 ]<br>
<br>
The extra_append argument to build_image_task is written to a bbappend<br>
file for the image recipe, so it can&#39;t set global configuration like<br=
>
DISTRO_FEATURES.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div>

--00000000000045fe4e064d0333d1--

