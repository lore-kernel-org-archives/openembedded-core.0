Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6ADCCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28716.1792392197089082524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZJYWQiNr;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so21513925e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 23:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792392195; x=1792996995; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jc9iGiPGF1i9ty/q1LPSScLR7ixbg2oAGgiiz8dG/U8=;
        b=ZJYWQiNr113upoWX2duHqjGqpCTLqMmDMQ2mHVfLiKxxdIjqV7hT1gC5baWfn8lDXp
         PhZtg4Fb+X3n/cyst5YGgxfOCe1dMblD2fPL6/Y+VXykHr5BPyJJyKBrukAG0GDVrWtp
         mTqUfWg/9d4ebUfhbU4HlWr2NQyttrbczr/9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392195; x=1792996995;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jc9iGiPGF1i9ty/q1LPSScLR7ixbg2oAGgiiz8dG/U8=;
        b=KpCpXegiDQUyKmpPy1AC6KlKSAPdLFwg3uLvnoxhbqRZrjE1q+vsoM3jaqbPVaIWYm
         D4MdwPIKXEtTshq/G35DnAmzHvrUHiJp8iA//BL0PdEIBJqXSK6p5p84snkK831uzI4F
         i5Yb28mLLgFJYyvXwTUax5UCzDBpny9bHkvQAfkWJffoJzManYSStnZv05Ln3VfIcqkA
         swShFilWhzyAXTPrvIRG0sZvywx9QYpHWWTp6zA66np6N1L5otPOh5j936ImvPpZe9gA
         jZ9I6HTx3XQ7G8i9GTtsVjxSvnLmlRkpmWASlv0afYx2Jb7TOBO5obTS7wUemgv9/2Ny
         FT/A==
X-Forwarded-Encrypted: i=1; AKwUvBxSGUNcVLcdqfPsmJzaJq0RNJztn+zMFBK81ca818o/jiOYsudw7gOAxEPtIOOUaYsRi12+yowfkH1K3/9W2phHzg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKYmRxiTjONwV3ytN52o31kXrbCa/Ap/uBTOhOnZrky/PcSA/Q6
	gC6HH/pf7JRGMui6uh+xcRND1wKqaN5vAEzgeuA2HkB0JnJ8Fq3sVmiM7RIG1PncTTaTOaMbRk6
	kG7nsclo=
X-Gm-Gg: AYBFou1p2pcddkn6I1rGPEf0zyP1D00J/jcRuLIrEO2OJCy3/yf8muJ0KROHEzPqkTT
	Onos4mHrBK0pCvGCEJc8KZ9SuvsE+S0VTpi5FknKJPPMrfrmVtFcTiwrQFAMy5Og2vtsL88MXzr
	v+Uv6eLZ0yvLhFHmMiWGJTqSjwK43Anqapk6EG2Xv+PizwhGsp1hOfW19aw3sgESozYbzkKLJ8F
	o6ZLJ51DDmUkaiBhQwOnXD8Y1yZzC/q3P0U+paKcN7fUbp7okd0sJ74mQrPW0OTOiTuaU67msTY
	GshWpU4jpDAE4MJu8h53KUuYvOfErIfHyEcRYasylzAVvzuuP2aveYO78lUu2ykn64cylKW54CM
	fbCevwLZZHTvwgLEeXazFpBVdPDVRSb+fBLHZdAk2zgnb+WPrEKB4kOWOkS/qcj1rpmfe8Exd4f
	8geB7WkDllHLS7VDM2T3JJ3pub8EcwkMHjbwke9mW2sMmvJk3kya8IBNvGu44+y4MKmpOglRTTT
	IygepTFMlII/vvARE41fkPNk8GSp7xlHiTcMDhplcKtrORLxrMrJueOjmwKSA==
X-Received: by 2002:a05:600c:3513:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1d7608002mr143548885e9.14.1792392195210;
        Sun, 18 Oct 2026 23:43:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm66902045e9.2.2026.10.18.23.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:43:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 08:43:14 +0200
Message-Id: <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] minicom: fix baud rate setting with
 glibc 2.42 and newer
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ayoub.zaki@embetrix.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
In-Reply-To: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248131

On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via lists.openembedded.org =
wrote:
> Backport the upstream baud rate fix to minicom 2.10 in wrynose.
>
> glibc 2.42 added support for arbitrary termios baud rates on Linux and
> changed the Bxxx speed constants from bitmasks to integer baud rates.
> The macros combine these values directly with c_cflag, resulting in
> incorrect baud rates and garbled UART output. Use the libc functions
> instead.
>
> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> ---
>  ...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++++++++++++++++++
>  meta/recipes-extended/minicom/minicom_2.10.bb |  4 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/minicom/files/0001-src-sysdep.h=
-remove-cfset-i-o-speed-macros-for-glibc.patch

Hello,

I think this patch is breaking tests:
* oe-selftest-armhost ubuntu2404-vk-arm1 wrynose completed at 2026-10-19 03=
:27:48+00:00
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5117
* oe-selftest-debian ubuntu2604-vk-3 wrynose completed at 2026-10-19 01:47:=
03+00:00
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5086
* oe-selftest-fedora opensuse156-vk-1 wrynose completed at 2026-10-19 01:47=
:59+00:00
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4898

| 2026-10-18 23:09:29,596 - oe-selftest - INFO - devtool.DevtoolUpdateTests=
.test_devtool_update_recipe (subunit.RemotedTestCase)
| 2026-10-18 23:09:29,597 - oe-selftest - INFO -  ... FAIL
|=20
| Stderr:
| 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-12247=
54/conf/local.conf
| 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
| 2026-10-18 23:09:29,599 - oe-selftest - INFO - 0: 6/66 96/678 (58.37s) (0=
 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe)
| 2026-10-18 23:09:29,599 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1215, in test_d=
evtool_update_recipe
|     result =3D runCmd('git add minicom', cwd=3Dos.path.dirname(recipefile=
))
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
|     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
| AssertionError: Command 'git add minicom' returned non-zero exit status 1=
28:
| fatal: pathspec 'minicom' did not match any files
|=20
| 2026-10-18 23:09:37,115 - oe-selftest - INFO - devtool.DevtoolUpdateTests=
.test_devtool_update_recipe_append (subunit.RemotedTestCase)
| 2026-10-18 23:09:37,115 - oe-selftest - INFO -  ... FAIL
|=20
| Stderr:
| 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-12247=
54/conf/local.conf
| 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
| 2026-10-18 23:09:37,116 - oe-selftest - INFO - 0: 7/66 97/678 (7.52s) (2 =
failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)
| 2026-10-18 23:09:37,116 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1305, in test_d=
evtool_update_recipe_append
|     self._check_repo_status(os.path.dirname(recipefile), [])
|     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/opene=
mbedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 138, in _check_=
repo_status
|     self.fail('Unexpected modified file in line: %s' % line)
|     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
|     raise self.failureException(msg)
| AssertionError: Unexpected modified file in line: ?? meta/recipes-extende=
d/minicom/files/0001-Change-the-README.patch


Can you look into this please?

Thanks!
--=20
Yoann Congal
Smile ECS


