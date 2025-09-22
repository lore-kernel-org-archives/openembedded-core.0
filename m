Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3A3CAC5B2
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.46698.1758529683900218983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJN9YtpW;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: nmjain23@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30ccea8f43cso3801546fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758529683; x=1759134483; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3COkUsMnjhS4cn2ixy3E8a9g0WMgFOzGjmphTdizNOY=;
        b=SJN9YtpW+U+Owr8Q4rlNQGg5L3yrebCiDuXghQCrOQMkoE2bRstYc6a2cB8eI5mf2F
         JcdA3ddssFyheMXcbnLBOmgjwcrD9+xxwEpizLN17ERaWIrpPvbawwIExYrfWh2v/TIH
         x5GMEya4Yd/uy7Jz4r0wdTsurLL3mEWTinuVKNBsDBhKvl3bz9nXhsel4SFIxIdsJKWS
         J/QYbUThjcpsx0/Z+XQFMu+JYJe/GZDnV35RT19lAH+ASSasznWwOl9z28QwIAbETGk9
         eMlMjGSpRfdSIt5Xs307/9ijtkPTCwDaPYLi1Gksiv/j/RXbv3pOYYb39pDHsh7cta+r
         Tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529683; x=1759134483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3COkUsMnjhS4cn2ixy3E8a9g0WMgFOzGjmphTdizNOY=;
        b=Ut/J4VaNP9AR1WQSIpWOEI+6qAodt6t4OGgzJCGnAx/1xab50h8igTJKgdhennXQ15
         L3SJHN9zDGTyE/bW6cs1FqWgB78MAeK2tVQ+U4ZT2NCps+ut1tgTJ6ZePGz35cEKShNE
         Bf13JgA6c3SbFNAogxmRMr51jA9Xb8z7eFtPEewetAi/eatKUVa5cNj3rhpYopmbyLVl
         oj46W50ti75IN4eW3NK++7p9raG9xkr44+ae6RWzPvg0G7qdagFu8hUCy0Nb8tk8cNrl
         pnLTiXDUtxbzv7ZNJAdfvmGN8fQ3jT1gxCE3l2rO6XFEJc0sxDoGrQhiAZvXOp1NoMMY
         1MRw==
X-Gm-Message-State: AOJu0YzM+ZgiWDqgbgNXZlEMtjtkKwIE0R5JybPzO09zxdeIZAOKIlQA
	UBk2BEJ22XaQd0Bx93aPIF8udu7a1rYMiGy5xcvTAd+84xlErlByiimRfVGciLpEFl1yXwBnAdY
	s9bn8MGw1sJFXtp8SmyCyL1Ukslj1bNrxdw==
X-Gm-Gg: ASbGnctsIQf0jHDt5Iu5Cy+pBhhaMksbUyKGUobXQsG+bvISBrQEL/+8+TnnWaGWqOX
	wIk/037JR9uA6SprKDg8da+oaeN+viNttO/UiTlsd9CLfW9Gy0ayF64xMunmfz5T13gViAZ9zLa
	FHSdo5NeV5DpoSQmHgR8Wi6QwuVCufzIZxYDgcV6CxsK9hJC/V3HOJykUzvvmdBolEFZWpaJ+At
	GZYZbhadKrY4oSVExsMoBfB
X-Google-Smtp-Source: AGHT+IFn5uU4Ni0ZLJVjPGQeYVUyCpl9cVG73GGg9+ff+HJGr3EcH4q3b0ATqsvAP7oAeXpv/e1JVX1L+JM8vI+0liU=
X-Received: by 2002:a05:620a:4085:b0:848:af6f:cb94 with SMTP id
 af79cd13be357-848af6fcbfdmr267965985a.43.1758529377752; Mon, 22 Sep 2025
 01:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250919120527.1517036-1-namanj1@kpit.com> <DCYH88L0WFBM.21MZNVP7CEWW6@bootlin.com>
In-Reply-To: <DCYH88L0WFBM.21MZNVP7CEWW6@bootlin.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Mon, 22 Sep 2025 13:52:29 +0530
X-Gm-Features: AS18NWC9SrCLf4xRRZS0H2khNOEXp2sg-KwXwjg0ClARRiy6Zyu_iSY1fvPuLo0
Message-ID: <CALCkg5YDY1dh=zy9apSX7b-M-a3Nm09zaubxgf_Gbm-EZjFd+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libmd: add ptest for 'libmd'
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Virendra.Thakur@kpit.com
Content-Type: multipart/alternative; boundary="000000000000e36b69063f5f865b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223845

--000000000000e36b69063f5f865b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,
Thanks for the information. It seems the patch is working for us in master
and scarthgap branch. Can you please suggest the steps to reproduce this
error in our build so that we can provide the fix for it.

Thanks,
Naman Jain

On Sun, 21 Sept, 2025, 5:58=E2=80=AFpm Mathieu Dubois-Briand, <
mathieu.dubois-briand@bootlin.com> wrote:

> On Fri Sep 19, 2025 at 2:05 PM CEST, Naman Jain via lists.openembedded.or=
g
> wrote:
> > Adapt the compile 'test' phony target from Makefile and deploy as
> > ptest for libmd.
> > It takes less than 30seconds for ptest completion
> >
> > Signed-off-by: Naman Jain <namanj1@kpit.com>
> > ---
>
> Hi Naman,
>
> Thanks for your patch.
>
> It looks like we have a QA issue with it:
>
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/sha1 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/rmd160 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/md5 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/md4 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/md2 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/libmd/ptest/test/sha2 in package lib32-libmd-ptest contains
> reference to TMPDIR [buildpaths]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue:
> /usr/lib/libmd/ptest/test/sha2 contained in package lib32-libmd-ptest
> requires /bin/bash, but no providers found in RDEPENDS:lib32-libmd-ptest?
> [file-rdeps]
> ERROR: lib32-libmd-1.1.0-r0 do_package_qa: Fatal QA errors were found,
> failing task.
> ERROR: Logfile of failure stored in:
> /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokyml=
lib32-linux/lib32-libmd/1.1.0/temp/log.do_package_qa.1674361
> NOTE: recipe lib32-libmd-1.1.0-r0: task do_package_qa: Failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2419
>
> Can you fix it, please?
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

--000000000000e36b69063f5f865b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Mathieu,<div dir=3D"auto">Thanks for the informat=
ion. It seems the patch is working for us in master and scarthgap branch. C=
an you please suggest the steps to reproduce this error in our build so tha=
t we can provide the fix for it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Naman Jain=C2=A0</div></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, 21 Sept, 2025, 5:58=E2=80=AFpm Mathieu Dubois-Brian=
d, &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois-=
briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Fri Sep 19, 2025 at 2:05 PM CEST, Naman Jain via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
&gt; Adapt the compile &#39;test&#39; phony target from Makefile and deploy=
 as<br>
&gt; ptest for libmd.<br>
&gt; It takes less than 30seconds for ptest completion<br>
&gt;<br>
&gt; Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" targ=
et=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Naman,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like we have a QA issue with it:<br>
<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/sha1 in package lib32-libmd-ptest contains reference to TMPDIR [bu=
ildpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/rmd160 in package lib32-libmd-ptest contains reference to TMPDIR [=
buildpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md5 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md4 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md2 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/sha2 in package lib32-libmd-ptest contains reference to TMPDIR [bu=
ildpaths]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: /usr/lib/libmd/ptest/t=
est/sha2 contained in package lib32-libmd-ptest requires /bin/bash, but no =
providers found in RDEPENDS:lib32-libmd-ptest? [file-rdeps]<br>
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.<br>
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemux86-wo=
rld/build/build/tmp/work/x86-pokymllib32-linux/lib32-libmd/1.1.0/temp/log.d=
o_package_qa.1674361<br>
NOTE: recipe lib32-libmd-1.1.0-r0: task do_package_qa: Failed<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/2419" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/59/builds/2419</a><br>
<br>
Can you fix it, please?<br>
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

--000000000000e36b69063f5f865b--

