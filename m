Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363CBCCD1A4
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 21:45:11 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.27034.1760888817403370009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 08:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlzXPlZW;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: dani.barra25@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-93e7c7c3d0bso234309339f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760888816; x=1761493616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xyW3QnoY31Tm+chhX+/OJZjP3cMTLIXYDIhf9ki0epo=;
        b=HlzXPlZWkTp+EE5+5AN2SvFVfsHwgx0zkD2u6GamSZdFN/BjHFQnwkNSeXhOP3jLjF
         moNZ7ZsFpq3E8UqAmfB3LZAhw5NaZoil3D4fiTJvdERc5IGMdhMEJ+DRgW/6Re+BT/Ia
         ap+yeYV+ptw2pnC4yQOiWRZqA9SHufF7Yi/l07DGc1gQQFC5bAxXloUbzF7nIaSzk+pO
         t+VXwEgu+2foqGyrbEv+b9HHabnkIx5hO1HMExTgApbBhp7KmemzZFixH6EDjW0nLFon
         syoMOqOjbX2DgBwyUO8Cjjjfjxq8IKucv97QSXSq292+3wtzquVHEC6YmNs6QmDJqjQ8
         nx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760888816; x=1761493616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyW3QnoY31Tm+chhX+/OJZjP3cMTLIXYDIhf9ki0epo=;
        b=YtCQ9m3W6E/Jl1fpFq0rz7UvVgkjL5/bq2o8+Mhh6YWeot8fxlJZIrbl0s5Uxj6cKL
         WGrVrqR6ISg48ipff+T4xZFQpbGGhzIIbnChNY7fyFEYetbmk8biQmV+9vycnmm5ZYej
         FVgR3TyyvtsYIwSc3dYGkoQ7kSg0qHJvkQDBL70E+d43AWvwS8F7k9s4gcJA2p0GvIcx
         WikPcAiZ0rUi+MH/2igvF0a4VpflRu223XzzDjSki35/0UtZRNnf0n9P9uB4RV15Zt6v
         F1OoHSIAPi12E2SxjXVRRFtPg62Y17N4jI9BIqtnIStzNmQkdIFhKkXzxAQMhxLTwGej
         YMKw==
X-Gm-Message-State: AOJu0Ywy4i0EjZZWhlAZvphbApx5tio1jrjHBqdwv07M2ewGSquset4I
	6b+AkfMVVy7uJ0DNxECm9fjbRGAlHyO9uC92W2jA61kpk4EeykV38mH2Y6RJIJ+c6V+9oqJNDB9
	H88wzQ/5oaM/AkdKqIS7GPfXMgsVZgQXg/w==
X-Gm-Gg: ASbGnctqxTz5Esqm85VRpCDgv8jQH/GWwMIIAabmgLWoPxAT1cv2r55FYtFpv3OOIzh
	Y3sZFJHnZeD6iW0wwL5BV/hQnL8K5Gx0uFErwijAgNJYCZTUH0pLapLi9wB9wNIblUBmGfMWtSY
	gG+vvwL0RvkdGGBZsbqmD4ap9XoOoDeTJ076RMwvuJ2iyCco9RbDunCAE0mv9GD8LgSyTwSvM68
	P9nMDQZYQH2eJIq+VM56iklrkQaO89T5WEujdRzBiAhqxtmyxgBdgF/l+0A2T3SJE/ocEM=
X-Google-Smtp-Source: AGHT+IHiYrf9dfo/HRu+myIdjjxZVDgRuWza0gXZ8qBD29e6ycJJAM8UhR/6W3lwHZ1ho7/+iGf+8cYw28DeLd05CtE=
X-Received: by 2002:a05:6102:390a:b0:534:24ad:358a with SMTP id
 ada2fe7eead31-5d7dd56c4b8mr3197562137.6.1760888490956; Sun, 19 Oct 2025
 08:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com> <20251017111210.501333-1-dani.barra25@gmail.com>
 <20251017111210.501333-2-dani.barra25@gmail.com> <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com>
In-Reply-To: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com>
From: Daniel Andrade <dani.barra25@gmail.com>
Date: Sun, 19 Oct 2025 16:41:18 +0100
X-Gm-Features: AS18NWD5T2xvXrTpjXzUwn_NGwgtatB62mL_SYo0kF3-LZCe9bbxcdSejvt2Ml4
Message-ID: <CA+-=zY05G58ViyNUTKxb=_SpNK8vK0We-jUVKJobk9-pRKhNZA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fstab: Fix xattrs not being maintained on fstab file when using wic fstab update funtionalities
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe19c5064184cc9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 21:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225088

--000000000000fe19c5064184cc9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I did not notice that it was failing other tests. It seemed like the error
was caused due to a lock file. To fix it, before issuing the repair of the
database, I first shutdown any open connection using -S. Doing this I saw
that the 3 tests passed and fstab was correctly labeled.
The other thing I noticed was the different timestamps, but as I said a
while ago, it was caused due to using SOURCE_DATE_EPOCH,

REPRODUCIBLE_TIMESTAMP_ROOTFS, and SOURCE_DATE_EPOCH_FALLBACK. This should
also be reviewed since it might compromise build repeatability.

In any case, it was not the topic of the patch, I just wanted to state this
in case someone checked the contents of the produced image.

Best Regards,
Daniel

A domingo, 19/10/2025, 11:02, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> escreveu:

> On Fri Oct 17, 2025 at 1:04 PM CEST, dani.barra25 wrote:
> > From: Daniel Andrade <dani.barra25@gmail.com>
> >
> > The wic fstab generation capability was removing the xattrs of the
> /etc/fstab, possibly rendering the produced image unusable in some case
> (e.g.: SELinux enforced on a read-only rootfs).
> > The file appears as unlabeled no matter the fstype chosen.
> > To bypass this, some late procedures done on ext* and msdos fstype have
> been removed and all the fstab logic was passed to rootfs.py.
> > On this one, the idea is to still use the install command, but in this
> case, executed outside the pseudo environment. After the file as
> sucessfully been place, the idea was to check again for inconsistencies
> > in the database (now the fstab inode is different) and force it to
> rebuild with the correct inode, ensure fstab inode is correctly set on al=
l
> the tables, including the xattrs one.
> >
> > Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
> > ---
>
> Hi Daniel,
>
> Thanks for the new version. It looks like this one is now breaking
> wic.Wic.test_exclude_path and wic.Wic.test_include_path tests:
>
> 2025-10-19 07:55:18,010 - oe-selftest - INFO - wic.Wic.test_exclude_path
> (subunit.RemotedTestCase)
> 2025-10-19 07:55:18,011 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError: Command 'wic create temp.wks -e core-image-minimal -o
> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/wic=
-tmp'
> returned non-zero exit status 1:
> ...
> ERROR: _exec_cmd: export
> PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133=
304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/sbin:=
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/tmp/w=
ork/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/sbin:/srv/=
pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/tmp/work/x=
86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bin:/srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-3133304/tmp/work/x86-64-=
v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux=
:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/tmp/=
work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/bin:/srv/poky=
build/yocto-worker/oe-selftest-debian/build/build-st-3133304/tmp/hosttools:=
$PATH;export
> PSEUDO_PREFIX=3D/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-nat=
ive/usr;export
> PSEUDO_LOCALSTATEDIR=3D/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-3133304/wic-tmp/tmp.wic.dhlnwwia/pseudo1;export
> PSEUDO_PASSWD=3D/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-3133304/wic-tmp/tmp.wic.dhlnwwia/rootfs1;export
> PSEUDO_NOSYMLINKEXP=3D1;/srv/pokybuild/yocto-worker/oe-selftest-debian/bu=
ild/build-st-3133304/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/p=
seudo
> -B  returned '1' instead of 0
> output: PRAGMA journal_mode =3D OFF;: database is locked
> PRAGMA synchronous =3D OFF;: database is locked
> Failed: database is locked
> Error getting 'logs.db' database.
> PRAGMA journal_mode =3D OFF;: database is locked
> PRAGMA synchronous =3D OFF;: database is locked
> Failed: database is locked
> Error getting 'files.db' database.
> error during load from disk: database is locked
> pdb_files: database error.
> Couldn't start file list, can't scan.
> db cleanup for server shutdown, 07:55:17.956
> memory-to-file backup complete, 07:55:17.956.
> db cleanup finished, 07:55:17.956
> considering table files
> considering table xattrs
> considering table migrations
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2574
>
> Can you have a look at these errors?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000fe19c5064184cc9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Mathieu,<div dir=3D"auto"><br></div><div dir=3D"auto">=
I did not notice that it was failing other tests. It seemed like the error =
was caused due to a lock file. To fix it, before issuing the repair of the<=
/div><div dir=3D"auto">database, I first shutdown any open connection using=
 -S. Doing this I saw that the 3 tests passed and fstab was correctly label=
ed.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div dir=3D"auto">The other thin=
g I noticed was the different timestamps, but as I said a while ago, it was=
 caused due to using SOURCE_DATE_EPOCH,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div di=
r=3D"auto">REPRODUCIBLE_TIMESTAMP_ROOTFS, and SOURCE_DATE_EPOCH_FALLBACK. T=
his should also be reviewed since it might compromise build repeatability.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">In any case, it was not =
the topic of the patch, I just wanted to state this in case someone checked=
 the contents of the produced image.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Best Regards,</div><div dir=3D"auto">Daniel</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">A domingo, 19/10/2025, 11:02, Mathieu Dubois-Briand &lt;<a href=3D=
"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.co=
m</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri Oct 17, =
2025 at 1:04 PM CEST, dani.barra25 wrote:<br>
&gt; From: Daniel Andrade &lt;<a href=3D"mailto:dani.barra25@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">dani.barra25@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The wic fstab generation capability was removing the xattrs of the /et=
c/fstab, possibly rendering the produced image unusable in some case (e.g.:=
 SELinux enforced on a read-only rootfs).<br>
&gt; The file appears as unlabeled no matter the fstype chosen.<br>
&gt; To bypass this, some late procedures done on ext* and msdos fstype hav=
e been removed and all the fstab logic was passed to rootfs.py.<br>
&gt; On this one, the idea is to still use the install command, but in this=
 case, executed outside the pseudo environment. After the file as sucessful=
ly been place, the idea was to check again for inconsistencies<br>
&gt; in the database (now the fstab inode is different) and force it to reb=
uild with the correct inode, ensure fstab inode is correctly set on all the=
 tables, including the xattrs one.<br>
&gt;<br>
&gt; Signed-off-by: Daniel Andrade &lt;<a href=3D"mailto:dani.barra25@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">dani.barra25@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
<br>
Hi Daniel,<br>
<br>
Thanks for the new version. It looks like this one is now breaking<br>
wic.Wic.test_exclude_path and wic.Wic.test_include_path tests:<br>
<br>
2025-10-19 07:55:18,010 - oe-selftest - INFO - wic.Wic.test_exclude_path (s=
ubunit.RemotedTestCase)<br>
2025-10-19 07:55:18,011 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
...<br>
AssertionError: Command &#39;wic create temp.wks -e core-image-minimal -o /=
srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/wic-tm=
p&#39; returned non-zero exit status 1:<br>
...<br>
ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/reci=
pe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build=
/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroo=
t-native/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-nat=
ive/usr/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3=
133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/us=
r/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/oe-selftest-debian/buil=
d/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysro=
ot-native/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st=
-3133304/tmp/hosttools:$PATH;export PSEUDO_PREFIX=3D/srv/pokybuild/yocto-wo=
rker/oe-selftest-debian/build/build-st-3133304/tmp/work/x86-64-v3-poky-linu=
x/wic-tools/1.0/recipe-sysroot-native/usr;export PSEUDO_LOCALSTATEDIR=3D/sr=
v/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/wic-tmp/=
tmp.wic.dhlnwwia/pseudo1;export PSEUDO_PASSWD=3D/srv/pokybuild/yocto-worker=
/oe-selftest-debian/build/build-st-3133304/wic-tmp/tmp.wic.dhlnwwia/rootfs1=
;export PSEUDO_NOSYMLINKEXP=3D1;/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-3133304/tmp/sysroots-components/x86_64/pseudo-native/usr=
/bin/pseudo=C2=A0 -B=C2=A0 returned &#39;1&#39; instead of 0<br>
output: PRAGMA journal_mode =3D OFF;: database is locked<br>
PRAGMA synchronous =3D OFF;: database is locked<br>
Failed: database is locked<br>
Error getting &#39;logs.db&#39; database.<br>
PRAGMA journal_mode =3D OFF;: database is locked<br>
PRAGMA synchronous =3D OFF;: database is locked<br>
Failed: database is locked<br>
Error getting &#39;files.db&#39; database.<br>
error during load from disk: database is locked<br>
pdb_files: database error.<br>
Couldn&#39;t start file list, can&#39;t scan.<br>
db cleanup for server shutdown, 07:55:17.956<br>
memory-to-file backup complete, 07:55:17.956.<br>
db cleanup finished, 07:55:17.956<br>
considering table files<br>
considering table xattrs<br>
considering table migrations<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2574" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/35/builds/2574</a><br>
<br>
Can you have a look at these errors?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000fe19c5064184cc9e--

