Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E105DCA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:51 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.48576.1758536229851203394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 03:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWoY5ENI;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: nmjain23@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b5e88d9994so47922071cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758536229; x=1759141029; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QypvFb+mDKoygKCCT/NYfYo1tJ7QirsmvOyaJgrRNmg=;
        b=bWoY5ENIRe6g7wN3/5SYRLnPWiqfO2FPjaVhOw9FU8NCaoJK9zV16YR2dHm9gZDPr+
         yTNdl0XuLggqMpDk/Ac+uy8vhIHUWl5id4/mM8OKAACwliUnzZ6dYqE+G/QSuG8bkhGD
         Sj9i30OQBkqGb6d6F2F456IirYj1k5px7r/CKlBJzRBkd5Fx7Chmf9f8quKrysCx/rP9
         bdQRQ7S+gysjbFyrkUKJ4bDaRgcTJmIsP0vsGQJh16eOFYuOrPRb5tUSDii8egQ7PbLe
         Yn3boiByTpxVlcshfVBlqDn+vQk9DBOZiBTQ+LoQ/s3eh9b66wMM8g+LxmdWOI0kpMxU
         moqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758536229; x=1759141029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QypvFb+mDKoygKCCT/NYfYo1tJ7QirsmvOyaJgrRNmg=;
        b=GtZBO3jAM7hovmdFDdPyI70jQaNWq1SuitFSq47BnFeA7zMiyR1p3lK4e1z0U840aJ
         Brt2yApQDBuN56d8lD/bEGpEfN/le6V90SlmDJ6/Ia/LapE82DVhErsrzsoWBpbmQuPH
         //uJ2V9YB/Y9RauawGgOrB27qQ/jFprzi7p0DzFtANAXw3MA/jj6zTU76PjdHBIZHpGu
         u9Cg+0yyQIM7w5KKeqME7EjRFLi/URRjr4UAmhh9mehuDk8ESDyeFWnehopP+7kVcw3H
         9fdw5Vq1gGevbL1ACanzVwWU6gZ6DKZMkAVebA1pkekgQxwhNwLbZ4l+xv7xRtq/aOUv
         ibyg==
X-Forwarded-Encrypted: i=1; AJvYcCUJOp4tjcnKHEJ+A9qEHUL07XQerRDLxsfAlLLcFx9w/Y7ZklPpNuA+QYLynTFTbVo2WiKUqKnU/f4SNeatyXb7uQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEHAwQl4ZCIf0f/RYHInw/8rVUi6P5sCqZ/ybOrWQqAIyl01+B
	geY+HXb3B3RbB/1WGFyND8JfXjTd7p0RcSnQk+mTjlR6XMiQzB6IeKHn8THeRTyIntKedcD6LBJ
	x0PBJjUSGsUsjRPdvY7f5c70sD5+YBE8=
X-Gm-Gg: ASbGncujtnIffM1P3+IFwLGBgwGWvfLgohj/fmGNs2pCKcFO136cXcAOkcY9ONJSge6
	MKcSw2gY/9yqMM3rpO4uRTrTEth+z7V4jokocsf7fwTuzEN2BUmv4VjWKn1h62XQx/GaWeYPMg2
	z4SeIxAkmlQvEDeO0eDu1j+hSCamQMjXW9Wb7N/PXL6XL8ZxF1X0RxHzyXkzdECaitm7tnfW0py
	0pO1mkWlBEtLnP+/NYMLuUN
X-Google-Smtp-Source: AGHT+IE8/ZW0SrJn1BcXatjgUcxcwamSv5ar6EsCV+tu4SkOwh+yQHuVlrJLqSfcqv6MXH/vS1V0/iZSpupGObxlRXY=
X-Received: by 2002:a05:622a:d0:b0:4ce:9cdc:6f2f with SMTP id
 d75a77b69052e-4ce9cdc71a8mr18348551cf.13.1758536228806; Mon, 22 Sep 2025
 03:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250919120527.1517036-1-namanj1@kpit.com> <DCYH88L0WFBM.21MZNVP7CEWW6@bootlin.com>
In-Reply-To: <DCYH88L0WFBM.21MZNVP7CEWW6@bootlin.com>
From: Naman Jain <nmjain23@gmail.com>
Date: Mon, 22 Sep 2025 15:46:51 +0530
X-Gm-Features: AS18NWC3vPk_K8sPWdDuXbJyJ6sZN89un2_I1hdM7q39BFDf470Qt7IccjPZaqE
Message-ID: <CALCkg5ax-6_B9PRfOF-xSo=gRODDszzxvh+Pt=o3zCKi3kFeMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libmd: add ptest for 'libmd'
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Content-Type: multipart/alternative; boundary="0000000000003e2377063f611f21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223855

--0000000000003e2377063f611f21
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

--0000000000003e2377063f611f21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Mathieu,</div><div dir=3D"auto">Than=
ks for the information. It seems the patch is working for us in master and =
scarthgap branch. Can you please suggest the steps to reproduce this error =
in our build so that we can provide the fix for it.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Naman Jain=
=C2=A0</div><div dir=3D"auto"><br><br><div class=3D"gmail_quote gmail_quote=
_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 21 S=
ept, 2025, 5:58=E2=80=AFpm Mathieu Dubois-Briand, &lt;<a href=3D"mailto:mat=
hieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Fri Sep 19, 2025 at 2:05 P=
M CEST, Naman Jain via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
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
</blockquote></div></div></div>

--0000000000003e2377063f611f21--

