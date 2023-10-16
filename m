Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46451C41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 15:54:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.130434.1697471682569474766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 08:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=LTxIdheu;
 spf=pass (domain: smile.fr, ip: 209.85.218.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9bda758748eso473038766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697471681; x=1698076481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l61DQb1/94wAk+GqVHvilxLAv+I1dF0VkF1zF9LxLqY=;
        b=LTxIdheuTyYFbqLWx0vtzDlJvN9eXd4o1KGjc0D/XnHHWcldXBM1IBs6hUd4r2Ki+B
         l+gDktP+vSLI0yUxKvFbllSWThX9B25b2xKytyWYJq6IdYYxl47tZMhHK7i04Vo3VHnO
         kUVEKSbAGh356wVX21dX4/+Fu4GXRjPZyRAVnuJVhgnNalDyBloA+eN1F18prTc/jfFh
         X8ZlKCDMET4WyZqgS6cIdr2NOcFanz3vjm+sDUBoG4LaBxlj7l1WhCovDF/4lCsbzgeb
         AEmPNBUr3q5cyDABpJtUHrxC7zrlCCfrmhX4YJCRnzIZGzjhgtaQ71EZzM/VSUweF3Ef
         YerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471681; x=1698076481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l61DQb1/94wAk+GqVHvilxLAv+I1dF0VkF1zF9LxLqY=;
        b=mGZh3/Q62M9VlSq1vhcKIsRFXCiIIZ1odyYE1XrTKSlNtJBYitA/MSPUpUOpDWH9ZU
         brcoVuuqXoxvjTQT6Z48WoeIACiXRlD7S2NG0bSReWVpGzLi7jtrKgBvacYmhZrelhU2
         hfSG/rtVjsYiYyd21uNEhJfy4YD8s5bSWG1mY6TuAD+GcxIT0ilT4PSN3sKVneSUaJax
         LCnU8poiXuhrIeaa3UN71lfdywHW2tUdz4po9vXBRPGWfU9kc6XafgobLfF3XZcpzdNi
         J50+isN5lJRonHtD3y/qVufzXVPuVbr3qI+7dLg15viiBjQdNtA8ve3k0LYevw5E0vRG
         2PvQ==
X-Gm-Message-State: AOJu0Yz48XHB7Zhyh7qGXE9+mTToeWdrgnTlZE1YqxN2xoAQnkGLMVC1
	Iqr9L6oZMokxt9gOfMaWOz/o9boTNUrcvAVzfs+Rl7zDrHV9Mk5W8Cc=
X-Google-Smtp-Source: AGHT+IFqDBMpSbhqw+UZUNQyQkivC9zRHST2L0L0TujmWdTeFdvD+CGSterClvJOj/HQ/qPbcD5dIms66QECf+CWAV0=
X-Received: by 2002:a17:907:7703:b0:9b9:f46f:8921 with SMTP id
 kw3-20020a170907770300b009b9f46f8921mr22464529ejc.11.1697471680974; Mon, 16
 Oct 2023 08:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <d64b3cd3-6b42-4e5a-b98d-a990d9bb2e66@amd.com> <CAMSfU+5rQrtqUy+a=86wCOuQYP-SOO0Nie6VTR=fHJRv7vvH8w@mail.gmail.com>
 <c50c0bcd-ff11-ddc8-0b94-7d33627c6330@kernel.crashing.org>
In-Reply-To: <c50c0bcd-ff11-ddc8-0b94-7d33627c6330@kernel.crashing.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Mon, 16 Oct 2023 17:54:14 +0200
Message-ID: <CAMSfU+66KWnHPxOUv_-69WPnT2Y0KGqgWD_fwXWOxDbVTK=Abg@mail.gmail.com>
Subject: Re: [OE-core] Recent failures on master depmodwrapper-cross
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 15:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189303

Le lun. 16 oct. 2023 =C3=A0 17:37, Mark Hatle
<mark.hatle@kernel.crashing.org> a =C3=A9crit :
> On 10/16/23 7:17=E2=80=AFAM, Yoann Congal wrote:
> > Hi Mark,
> >
> > Le lun. 16 oct. 2023 =C3=A0 02:40, Mark Hatle via lists.openembedded.or=
g
> > <mark.hatle=3Damd.com@lists.openembedded.org> a =C3=A9crit :
> >> Running a number of builds recently, a small number of them failed.  N=
ote we ran about 20 builds and only 3 failed like this, the others complete=
d.  I'm wondering if maybe there is a race condition with the new code?
> >
> > FYI, RP did point me to this thread (that I did miss sorry) and I
> > (co-author of the "new code") will send two patches to prevent the
> > error the happen again.
> > RP's hypothesis is that this is linked to S=3DWORKDIR recipes. Did all
> > your crashed build happened on "depmodwrapper-cross" (Which is
> > S=3DWORKDIR) ?
>
> Yes, they all failed on depmodwrapper-cross.

Realy looks like the S=3DWORKDIR case !

> Happy to test changes for you.

Thanks!

I've sent patches here  :
[PATCH 1/2] insane: skip unimplemented-ptest on S=3DWORKDIR recipes
https://lists.openembedded.org/g/openembedded-core/message/189301
[PATCH 2/2] insane: unimplemented-ptest: ignore source file errors
https://lists.openembedded.org/g/openembedded-core/message/189302

I've tested that the depmodwrapper-cross recipe is now skipped for the
unimplemented-ptest check.

Regards,

> --Mark
>
> > Thanks!
> >
> >> Error:
> >>
> >> ERROR: depmodwrapper-cross-1.0-r0 do_patch: Error executing a python f=
unction in exec_func_python() autogenerated:
> >>
> >> The stack trace of python calls that resulted in this exception/failur=
e was:
> >> File: 'exec_func_python() autogenerated', lineno: 2, function: <module=
>
> >> 0001:
> >> *** 0002:do_qa_patch(d)
> >> 0003:
> >> File: '/scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline=
-8_ZynqMpDrFull/sources/poky/meta/classes-global/insane.bbclass', lineno: 1=
379, function: do_qa_patch
> >> 1375:    elif os.path.exists(os.path.join(srcdir, "t")) and any(filena=
me.endswith('.t') for filename in os.listdir(os.path.join(srcdir, 't'))):
> >> 1376:        oe.qa.handle_error("unimplemented-ptest", "%s: perl Test:=
: based tests detected" % d.getVar('PN'), d)
> >> 1377:
> >> 1378:    # Detect pytest-based tests
> >> *** 1379:    elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:impor=
t\s*pytest|from\s*pytest)'):
> >> 1380:        oe.qa.handle_error("unimplemented-ptest", "%s: pytest-bas=
ed tests detected" % d.getVar('PN'), d)
> >> 1381:
> >> 1382:    # Detect meson-based tests
> >> 1383:    elif os.path.exists(os.path.join(srcdir, "meson.build")) and =
match_line_in_files(srcdir, "**/meson.build", r'\s*test\s*\('):
> >> File: '/scratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline=
-8_ZynqMpDrFull/sources/poky/meta/classes-global/insane.bbclass', lineno: 1=
357, function: match_line_in_files
> >> 1353:    #############################################################=
##############
> >> 1354:    def match_line_in_files(toplevel, filename_glob, line_regex):
> >> 1355:        import pathlib
> >> 1356:        toppath =3D pathlib.Path(toplevel)
> >> *** 1357:        for entry in toppath.glob(filename_glob):
> >> 1358:            try:
> >> 1359:                with open(entry, 'r', encoding=3D'utf-8', errors=
=3D'ignore') as f:
> >> 1360:                    for line in f.readlines():
> >> 1361:                        if re.match(line_regex, line):
> >> File: '/usr/lib/python3.10/pathlib.py', lineno: 1034, function: glob
> >> 1030:        drv, root, pattern_parts =3D self._flavour.parse_parts((p=
attern,))
> >> 1031:        if drv or root:
> >> 1032:            raise NotImplementedError("Non-relative patterns are =
unsupported")
> >> 1033:        selector =3D _make_selector(tuple(pattern_parts), self._f=
lavour)
> >> *** 1034:        for p in selector.select_from(self):
> >> 1035:            yield p
> >> 1036:
> >> 1037:    def rglob(self, pattern):
> >> 1038:        """Recursively yield all existing files (of any kind, inc=
luding
> >> File: '/usr/lib/python3.10/pathlib.py', lineno: 493, function: _select=
_from
> >> 0489:            yielded =3D set()
> >> 0490:            try:
> >> 0491:                successor_select =3D self.successor._select_from
> >> 0492:                for starting_point in self._iterate_directories(p=
arent_path, is_dir, scandir):
> >> *** 0493:                    for p in successor_select(starting_point,=
 is_dir, exists, scandir):
> >> 0494:                        if p not in yielded:
> >> 0495:                            yield p
> >> 0496:                            yielded.add(p)
> >> 0497:            finally:
> >> File: '/usr/lib/python3.10/pathlib.py', lineno: 440, function: _select=
_from
> >> 0436:        _Selector.__init__(self, child_parts, flavour)
> >> 0437:
> >> 0438:    def _select_from(self, parent_path, is_dir, exists, scandir):
> >> 0439:        try:
> >> *** 0440:            with scandir(parent_path) as scandir_it:
> >> 0441:                entries =3D list(scandir_it)
> >> 0442:            for entry in entries:
> >> 0443:                if self.dironly:
> >> 0444:                    try:
> >> Exception: FileNotFoundError: [Errno 2] No such file or directory: '/s=
cratch/jenkins-BUILDS-eSDK-dev_eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFul=
l/build/tmp/work/zynqmp_generic-xilinx-linux/depmodwrapper-cross/1.0/sstate=
-build-create_spdx'
> >>
> >> ERROR: Logfile of failure stored in: /scratch/jenkins-BUILDS-eSDK-dev_=
eSDK-eSDK-master-next-pipeline-8_ZynqMpDrFull/build/tmp/work/zynqmp_generic=
-xilinx-linux/depmodwrapper-cross/1.0/temp/log.do_patch.1966488
> >>
> >>
> >>
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189299): https://lists.openembedded.org/g/openembedde=
d-core/message/189299
> Mute This Topic: https://lists.openembedded.org/mt/101987519/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Yoann Congal
Smile ECS - Tech expert

