Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259ABCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:17:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29866.1792397819252094943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dN7mf5hd;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so15756285e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 01:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397817; cv=none;
        d=google.com; s=arc-20260327;
        b=ab5w7yXNEPvsO1aghE0HOXZWIlITWBhc/9xFCWMv1BsGphcDe0ZCNd3IUVBYNIafVg
         WPXhgtgeHFMQ2O+R593lRhZko5h8+UtqaEpnbYSfbo+y1Xn3a+V3TxFKwsMX1HFkmnoH
         PKOH8FluicRbAM0rIYpUkzPBpQnXgW+bUXWNqPsCzzaEJQXCxHisjirdu+W6xKdkN0e8
         IG84FHDQgrXg7rV7JF72DFqp03IXfiVCtz9Ph585GYRS8Oo7xJZ4VIFVoKKscyrzg8UB
         UqHQHdB2HTyTMNDNFrSptweah58oEiEFjX3yarPe1F0Z/8invEiH/Od5qk7pz3gy2l5w
         IqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=35GiKh7eWZ0ZXOUh1JqqSV/LNR/9on9XnPjKgW5Yink=;
        fh=rua3p/THl0XItmWabGx/jYk0MpEfrFWZNSLqpEJMrHo=;
        b=MFZJ8T7n0qOqzype8V22GkgezXtjS8Q7cIUTY7MJfk2w/epSE3I5gCfgxm+QUP4K5c
         hoBWFnQCnM/G/5JPFRPpFHdP1yhVwqpFes3Ia1ImaqpISVp6LR7Tz7qNBX7RdHOPmZbQ
         gIOQFudQFagXHbMHgfcgV3f8xQXruL8itru7AwXNmRbhIpwMG32x5+952LmH+DUzmi/7
         QEhxLxYgA8UQmCKQ8SldlLHuQvV2X/XZ7jqaB6VEnIRQV6NrRFGwDHXVnLiAEvndIdgt
         w3O0Zl1433K5Gi7BRT9dZo/xO2wz3Mdqxgr6h/OEyFTJKCEpe03m0M5lnWI3NFbmQeFx
         1zMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792397817; x=1793002617; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35GiKh7eWZ0ZXOUh1JqqSV/LNR/9on9XnPjKgW5Yink=;
        b=dN7mf5hdU/7X1iCZsaFyGh61YwhikGIyZRZe/2xwE09BwPAhFv04husxMdZIEXxFso
         V1qxnVfqWlFaOa+S421djM7on0INh4ByHelvicVV91YdmW+MiRrJZQANC1/O6XB0uNk0
         E+OEuNAA6HIKjJ4bMmOQXn4HVjGO983jkbor8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397817; x=1793002617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=35GiKh7eWZ0ZXOUh1JqqSV/LNR/9on9XnPjKgW5Yink=;
        b=kiFrCqqXA7h8XUzjbhq2KLFLB8zIQtS59LER+BsvZjhotOspR3vh8ZIAqRcWLTsiyk
         95Cv2sB432FY+rWXCj68XJ02Nriq/SbrCumXvuF5Lj4MEPvqEe95+yiyoklOzZHnE+dO
         QQWMxsdjV46nEy/TpNUVn2gUmnfAlNBQAAovkhLYlxeWXZrCHT8Kxmn5TnbuMwekqRhy
         Xks6QfDe7Xs5fzafV03TW+ZnKfHjwYqY6hgE7aBKM4yJAaW+JiMdPL4yPdENZjfm/GsL
         OEJqQYEJGD/5/oiLlbJ7baF9tGNHCwKrfbFbwbIC+fC5G8zdkR0vu/E31se0yXBXb7tb
         PEIw==
X-Gm-Message-State: AFq9FYLwPCvX9NZ7YojUdXxXbkuXy1LtLEnWii3DeTlta7sZjHsA7M6d
	xv2fsuVhmGOY0j1MYMd0AgrDvbPWVfn+Nk1YoyokPIiSWTK2LxBmwCQD5hPLtNGoM1+9oEZ2mBM
	LSmF+XfyZNv5EHO+bhavNbfnFefHFKrODZJSC7TkIzA==
X-Gm-Gg: AYBFou1vt2yraUza6/hikUPJRe+fV3CafDyVMRHPB5mFK0Y8bW8I6aIBdmX6ZEZ4eAS
	lceytzkD0T3SYdr1nW8qhchm68hH6Sh0ZxJl+2kgaAp69YCROPKnKUCbENBuPr7V2k4Rf7nD2zp
	BMYiTMu2RxIp92xwkRQU8XxmJ16SjVeVj8VpDUo8M+hd0sBBJ4JT1CVMbDM9Zh/hbKRiEMT64iI
	snCt+UZztn2RYjEZUfqIJDaJeQecnlG0mpZqW5h0bKpXLyXigZAGeBkDNjT2JHxITrUkDUYgxp/
	zQvG5i2i9ISby2K6aLTIQaFxeFccjqSzHbvguE2naoJs+pa1n6yr+zNVhnvcKwpZdFUEhxfTQBl
	qgD3loNSu0BfG
X-Received: by 2002:a05:600c:540f:b0:4a1:97c6:d2e8 with SMTP id
 5b1f17b1804b1-4a1d7633b35mr147401155e9.32.1792397817053; Mon, 19 Oct 2026
 01:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
 <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr> <2cc2f09f-9f7b-4014-bb02-1d1eff6d9647@embetrix.com>
In-Reply-To: <2cc2f09f-9f7b-4014-bb02-1d1eff6d9647@embetrix.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 19 Oct 2026 10:16:30 +0200
X-Gm-Features: AclHuK8MDv2rIg5VnpvjUM0HPhFvJ1LoIBZlAT1BkTnb9jd_O4OECxAg9luRYH4
Message-ID: <CAMSfU+6JRV-m2c8zNRCD48N_-TUm7uQsk87XFrC++Ue1e_HFaA@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] minicom: fix baud rate setting with
 glibc 2.42 and newer
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e99f0065e2d2352"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248139

--0000000000002e99f0065e2d2352
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 19 oct. 2026 =C3=A0 10:04, Ayoub Zaki <ayoub.zaki@embetrix.com> a =
=C3=A9crit :

> Hi Yoann,
>
>
> On 10/19/26 08:43, Yoann Congal wrote:
> > On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via
> lists.openembedded.org wrote:
> >> Backport the upstream baud rate fix to minicom 2.10 in wrynose.
> >>
> >> glibc 2.42 added support for arbitrary termios baud rates on Linux and
> >> changed the Bxxx speed constants from bitmasks to integer baud rates.
> >> The macros combine these values directly with c_cflag, resulting in
> >> incorrect baud rates and garbled UART output. Use the libc functions
> >> instead.
> >>
> >> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
> >> ---
> >>   ...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++++++++++++++++=
++
> >>   meta/recipes-extended/minicom/minicom_2.10.bb |  4 +-
> >>   2 files changed, 44 insertions(+), 1 deletion(-)
> >>   create mode 100644
> meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-sp=
eed-macros-for-glibc.patch
> >
> > Hello,
> >
> > I think this patch is breaking tests:
> > * oe-selftest-armhost ubuntu2404-vk-arm1 wrynose completed at 2026-10-1=
9
> 03:27:48+00:00
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5117
> > * oe-selftest-debian ubuntu2604-vk-3 wrynose completed at 2026-10-19
> 01:47:03+00:00
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5086
> > * oe-selftest-fedora opensuse156-vk-1 wrynose completed at 2026-10-19
> 01:47:59+00:00
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4898
> >
> > | 2026-10-18 23:09:29,596 - oe-selftest - INFO -
> devtool.DevtoolUpdateTests.test_devtool_update_recipe
> (subunit.RemotedTestCase)
> > | 2026-10-18 23:09:29,597 - oe-selftest - INFO -  ... FAIL
> > |
> > | Stderr:
> > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1224754/con=
f/local.conf
> > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
> > | 2026-10-18 23:09:29,599 - oe-selftest - INFO - 0: 6/66 96/678 (58.37s=
)
> (0 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe)
> > | 2026-10-18 23:09:29,599 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
> > |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/devtool.py",
> line 1215, in test_devtool_update_recipe
> > |     result =3D runCmd('git add minicom', cwd=3Dos.path.dirname(recipe=
file))
> > |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/utils/commands.py",
> line 214, in runCmd
> > |     raise AssertionError("Command '%s' returned non-zero exit status
> %d:\n%s" % (command, result.status, exc_output))
> > | AssertionError: Command 'git add minicom' returned non-zero exit
> status 128:
> > | fatal: pathspec 'minicom' did not match any files
> > |
> > | 2026-10-18 23:09:37,115 - oe-selftest - INFO -
> devtool.DevtoolUpdateTests.test_devtool_update_recipe_append
> (subunit.RemotedTestCase)
> > | 2026-10-18 23:09:37,115 - oe-selftest - INFO -  ... FAIL
> > |
> > | Stderr:
> > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
> selftest.inc" in
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1224754/con=
f/local.conf
> > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
> bblayers.inc" in bblayers.conf
> > | 2026-10-18 23:09:37,116 - oe-selftest - INFO - 0: 7/66 97/678 (7.52s)
> (2 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)
> > | 2026-10-18 23:09:37,116 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
> > |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/devtool.py",
> line 1305, in test_devtool_update_recipe_append
> > |     self._check_repo_status(os.path.dirname(recipefile), [])
> > |     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File
> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/devtool.py",
> line 138, in _check_repo_status
> > |     self.fail('Unexpected modified file in line: %s' % line)
> > |     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > |   File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
> > |     raise self.failureException(msg)
> > | AssertionError: Unexpected modified file in line: ??
> meta/recipes-extended/minicom/files/0001-Change-the-README.patch
> >
> >
> > Can you look into this please?
>
>
>
> Thanks for reporting this:
> The patch exposes a hardcoded minicom/ directory assumption in the
> devtool selftests:
> https://github.com/openembedded/openembedded-core/blob/master/meta/lib/
> oeqa/selftest/cases/devtool.py#L1360
> <https://github.com/openembedded/openembedded-core/blob/master/meta/lib/o=
eqa/selftest/cases/devtool.py#L1360>
> .
>
> devtool puts generated patches in the existing files/ directory but the
> tests stage and clean up minicom/ causing both failures.
>
> Could we fix those selftest assumptions separately?
>

Yes, the test must be updated to match the modified recipe. Can you send a
v2 as a series, with the test fix included?

Thanks!


>
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards
>
> --
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Stra=C3=9Fe 2/1
> D-71634 Ludwigsburg
>
> Email    : ayoub.zaki@embetrix.com
> Homepage : https://embetrix.com
> VAT No.  : DE313902634
>
>

--=20
Yoann Congal
Smile ECS

--0000000000002e99f0065e2d2352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 19=
 oct. 2026 =C3=A0=C2=A010:04, Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@e=
mbetrix.com">ayoub.zaki@embetrix.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
<br>
On 10/19/26 08:43, Yoann Congal wrote:<br>
&gt; On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt;&gt; Backport the upstream baud rate fix to minicom 2.10 in wrynose.<br=
>
&gt;&gt;<br>
&gt;&gt; glibc 2.42 added support for arbitrary termios baud rates on Linux=
 and<br>
&gt;&gt; changed the Bxxx speed constants from bitmasks to integer baud rat=
es.<br>
&gt;&gt; The macros combine these values directly with c_cflag, resulting i=
n<br>
&gt;&gt; incorrect baud rates and garbled UART output. Use the libc functio=
ns<br>
&gt;&gt; instead.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ayoub Zaki &lt;<a href=3D"mailto:ayoub.zaki@embetri=
x.com" target=3D"_blank">ayoub.zaki@embetrix.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++=
++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-extended/minicom/<a href=3D"http://minico=
m_2.10.bb" rel=3D"noreferrer" target=3D"_blank">minicom_2.10.bb</a> |=C2=A0=
 4 +-<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 44 insertions(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/minicom/files=
/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; I think this patch is breaking tests:<br>
&gt; * oe-selftest-armhost ubuntu2404-vk-arm1 wrynose completed at 2026-10-=
19 03:27:48+00:00<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/23/builds/5117" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5117</a><br>
&gt; * oe-selftest-debian ubuntu2604-vk-3 wrynose completed at 2026-10-19 0=
1:47:03+00:00<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/35/builds/5086" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5086</a><br>
&gt; * oe-selftest-fedora opensuse156-vk-1 wrynose completed at 2026-10-19 =
01:47:59+00:00<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/48/builds/4898" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4898</a><br>
&gt; <br>
&gt; | 2026-10-18 23:09:29,596 - oe-selftest - INFO - devtool.DevtoolUpdate=
Tests.test_devtool_update_recipe (subunit.RemotedTestCase)<br>
&gt; | 2026-10-18 23:09:29,597 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
&gt; |<br>
&gt; | Stderr:<br>
&gt; | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: &quot;include=
 selftest.inc&quot; in /srv/pokybuild/yocto-worker/oe-selftest-debian/build=
/build-st-1224754/conf/local.conf<br>
&gt; | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: &quot;include=
 bblayers.inc&quot; in bblayers.conf<br>
&gt; | 2026-10-18 23:09:29,599 - oe-selftest - INFO - 0: 6/66 96/678 (58.37=
s) (0 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe)<br>
&gt; | 2026-10-18 23:09:29,599 - oe-selftest - INFO - testtools.testresult.=
real._StringException: Traceback (most recent call last):<br>
&gt; |=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&qu=
ot;, line 1215, in test_devtool_update_recipe<br>
&gt; |=C2=A0 =C2=A0 =C2=A0result =3D runCmd(&#39;git add minicom&#39;, cwd=
=3Dos.path.dirname(recipefile))<br>
&gt; |=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/layers/openembedded-core/meta/lib/oeqa/utils/commands.py&quot;, lin=
e 214, in runCmd<br>
&gt; |=C2=A0 =C2=A0 =C2=A0raise AssertionError(&quot;Command &#39;%s&#39; r=
eturned non-zero exit status %d:\n%s&quot; % (command, result.status, exc_o=
utput))<br>
&gt; | AssertionError: Command &#39;git add minicom&#39; returned non-zero =
exit status 128:<br>
&gt; | fatal: pathspec &#39;minicom&#39; did not match any files<br>
&gt; |<br>
&gt; | 2026-10-18 23:09:37,115 - oe-selftest - INFO - devtool.DevtoolUpdate=
Tests.test_devtool_update_recipe_append (subunit.RemotedTestCase)<br>
&gt; | 2026-10-18 23:09:37,115 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
&gt; |<br>
&gt; | Stderr:<br>
&gt; | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: &quot;include=
 selftest.inc&quot; in /srv/pokybuild/yocto-worker/oe-selftest-debian/build=
/build-st-1224754/conf/local.conf<br>
&gt; | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: &quot;include=
 bblayers.inc&quot; in bblayers.conf<br>
&gt; | 2026-10-18 23:09:37,116 - oe-selftest - INFO - 0: 7/66 97/678 (7.52s=
) (2 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)=
<br>
&gt; | 2026-10-18 23:09:37,116 - oe-selftest - INFO - testtools.testresult.=
real._StringException: Traceback (most recent call last):<br>
&gt; |=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&qu=
ot;, line 1305, in test_devtool_update_recipe_append<br>
&gt; |=C2=A0 =C2=A0 =C2=A0self._check_repo_status(os.path.dirname(recipefil=
e), [])<br>
&gt; |=C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^<br>
&gt; |=C2=A0 =C2=A0File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py&qu=
ot;, line 138, in _check_repo_status<br>
&gt; |=C2=A0 =C2=A0 =C2=A0self.fail(&#39;Unexpected modified file in line: =
%s&#39; % line)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^<br>
&gt; |=C2=A0 =C2=A0File &quot;/usr/lib/python3.14/unittest/case.py&quot;, l=
ine 750, in fail<br>
&gt; |=C2=A0 =C2=A0 =C2=A0raise self.failureException(msg)<br>
&gt; | AssertionError: Unexpected modified file in line: ?? meta/recipes-ex=
tended/minicom/files/0001-Change-the-README.patch<br>
&gt; <br>
&gt; <br>
&gt; Can you look into this please?<br>
<br>
<br>
<br>
Thanks for reporting this:<br>
The patch exposes a hardcoded minicom/ directory assumption in the <br>
devtool selftests:<br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/lib/oeqa/selftest/cases/devtool.py#L1360" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openembedded/openembedded-core/blob/master/meta/l=
ib/<br>
oeqa/selftest/cases/devtool.py#L1360</a>.<br>
<br>
devtool puts generated patches in the existing files/ directory but the <br=
>
tests stage and clean up minicom/ causing both failures.<br>
<br>
Could we fix those selftest assumptions separately?<br></blockquote><div><b=
r></div><div>Yes, the test must be updated to match the modified recipe. Ca=
n you send a v2 as a series, with the test fix included?</div><div><br></di=
v><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards<br>
<br>
-- <br>
Ayoub Zaki<br>
Embedded Systems Consultant<br>
<br>
Vaihinger Stra=C3=9Fe 2/1<br>
D-71634 Ludwigsburg<br>
<br>
Email=C2=A0 =C2=A0 : <a href=3D"mailto:ayoub.zaki@embetrix.com" target=3D"_=
blank">ayoub.zaki@embetrix.com</a><br>
Homepage : <a href=3D"https://embetrix.com" rel=3D"noreferrer" target=3D"_b=
lank">https://embetrix.com</a><br>
VAT No.=C2=A0 : DE313902634<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000002e99f0065e2d2352--

