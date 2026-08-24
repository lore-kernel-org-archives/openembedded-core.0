Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED2EC5DF97
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 00:03:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6623.1787529826538754129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 17:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cm/fb2ZH;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so319504266b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 17:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787529825; cv=none;
        d=google.com; s=arc-20260327;
        b=nuX9/KzcLH17HihfDn+SiM8sKnZ2z3b9bZ6hjt8s858HWSdapeiUGaFIbZzjxC6nxT
         xFaBd07K5XE1WCpeetwpk9ZYc2ItZ0nYcEpyfleFtkO4BN/bfoMINOHMIecs1mZ72RKM
         oe6nrJZCpMqKbHXonDjB0Rx5ld5SI3WJYqWplcWkDLvLfd5+fYmqzCRFLNm8zH4pdssi
         pgd0PK2V/unXLjtSfTQmJWm7CE6OQ4Tj+tVB6CH3xyKLRodfbI0RBd1jzYfNpoyt4/Gk
         cyWkbFa0ufvSvyusdoGFbhUX/5RLIFHeMhBAT22qhCZPdfk5uKnFrP71eHJPuLuFRZX2
         GlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MJONiSg+lNlh+aKvYJZn7nBTIvBeY0dEdwquJm53pTo=;
        fh=dpdIG4TFMGYQGK4q522jc2lWtbg8aklz6P0aB4dkhio=;
        b=DwBflzQMWE39OzQCPxNvUWS/dhpL5S2JZ9ZmaB8+Uyn/iYDtuH058uO+fmaZtXuQqr
         VkwSUtPvJf4+dSLEKj3oomQqJet5rSNzcDv8OUE7mt51VIY9I8yY1iGZFELqiz3hOE0j
         C4DcAf5nwfU8ckVPFqmokoj2jTU1yJVqsGQaWx03ejNe4FGT0oIg8t3bcDzOSeRlPDam
         V0/TdnJKMR3mVDkzZyBNEWEBkjdW/MS6O8OOsRBbYtmgYXsL1TQeJlgdcKVN8FZ6FwYm
         iV9+qbcXV9z/skM5ceDTRoDOBgOBGz7yrM+Xy/1LTeVZ0X4BwyMzXE/KlHIMjKy2EePW
         T6Iw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529825; x=1788134625; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJONiSg+lNlh+aKvYJZn7nBTIvBeY0dEdwquJm53pTo=;
        b=cm/fb2ZHj8vzRypBW+y8K8ccAx0XRfUZPTLbHdr9XrDU8OegsNZHKPa7qiJa6SRJ9x
         zIIIsd4sbGE6b12mG+Y20v2G/ZuptvCwhTbSLksoMICz87oOM1/y0JKEdbKG870O5C7d
         CdWMf/zyP//UuJcPZwjOk+naeY31beBZf/TWGQPVE9tapmgsF60/9d4Nd2fMDgPbrZ47
         KSDtcO7qOb6LaLI3XdSrcKheguMFtCW3CmbXp8H5PlXQ8igvXU5quBAw0/tn6/HPNZAW
         z2cc+lCnN7CtwNhCgNVNIjl1UNPKe9gRIGcyWeDwh3wWnbiHANllcEk6fncSXfFwFUY2
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529825; x=1788134625;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MJONiSg+lNlh+aKvYJZn7nBTIvBeY0dEdwquJm53pTo=;
        b=mVIKy+Yx8jbZ51UtCXusL85ZNoprviE4DnnDYsPwQRoxYEsRmT4IyhcNM5yO3q7vw9
         0FL/D9/ROW0nk3TiyQuzLVbJbALM8o/NGIU3n+bEMqgAC2tCn42/Jq5StfKp028O5AvH
         rm5IlKMOhb2brv3E6lkO7hpQHmanz/aMqPi+v4kSoN4/zI7+o5nJW9nD/PqAOoFs0kam
         /4PUGzsSTSwFOpjtlijw0MmpOEOAs+wC9WFKIXbixhkSjRnrVoX9byzeUYtLestWuVqG
         FiLx5qQXXhdOiww3+Dd1cxOPAnIe7Tu+pF27725EtzWmGjJ2XXSmr+YuARMa87IREcN1
         TVFQ==
X-Gm-Message-State: AFuF++nc3uS6OeVvWphEjwIEUT6+4CjqgXIdNx85BGWtjgRBx48pqhYH
	bDe/5fEUZFc6R5sPp+glCVfl/vSrEYQ8vt2vQ52VZDJzU4Jl79UdLP98lnvADkJDpBwKSj7TfHW
	nEOPtO+JdhO/QcBybxRbkBdNAibXzr2M=
X-Gm-Gg: AR+sD12lLTl+TgxvP6U/qFN8bSkv5m3DRSGvH06oHQ1oEx5xqc0mdGzxKtT2Ae2QdyD
	6yLun2udp/Cd1o9br8/3pNsjzRdfuHosGM1LJjVpSqmIjZjCkefxLFpx4y87760DB71zozLwAFE
	AJ3/4+V+4L16kXtLkgDTWuy9Pd1P/sQN6OiQ2TXBdVSb8W6vVYGT7onNcChjERyT9uFLzJmdrCn
	ixmhKgK5DMBViUSUzbjyvSuDv8mz2Agj1x/zTC6wItiGM2lGdR3L5Yf1xTl6dnTE/gY8PfrRUQ4
	LAe6LSBCP2RYSdWh974sm76WnFvAUcC+c3sY/S1m9n/DBaRoFfS90J1uVKOvqYoCsGr6/Pa4Wxl
	602vECCDmc3NQiyeJl6DBoWHrazIhagfFh2diA8LceRU1a38+avqEW1Nh1TVLVeVv
X-Received: by 2002:a17:906:f359:b0:c15:f0b8:eb91 with SMTP id
 a640c23a62f3a-c246a359a52mr1994106766b.7.1787529824186; Sun, 23 Aug 2026
 17:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260822002601.90667-1-anis.bougrine10@gmail.com> <DKVLSEW6L0T7.2PCFL9327XYCG@bootlin.com>
In-Reply-To: <DKVLSEW6L0T7.2PCFL9327XYCG@bootlin.com>
From: Bougrine Anis <anis.bougrine10@gmail.com>
Date: Mon, 24 Aug 2026 02:03:32 +0200
X-Gm-Features: AcwNN1UxNQkBYe9wPPhQy4RM5D8z6Aiq1Q2fNdrOXOYp3wfbeimQmLbiSPzX-Vc
Message-ID: <CAGgtUzZYXhG0MGwCSjjRByePOo=ZUPUjwWtk9UPX0uXraVNWKA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, antonin.godard@bootlin.com, 
	bruce.ashfield@gmail.com, jose.quaresma@oss.qualcomm.com, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="0000000000003234b20659bfb866"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 00:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244044

--0000000000003234b20659bfb866
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathieu,

Thank you for your feedback. Yes, I'd be happy to investigate the issue.
In fact, I tested the patch only with core-image-minimal, i.e. only with
in-tree kernel modules.
However, it appears that the patch also needs to be adapted to support
out-of-tree modules.
I will work on that. I already have an idea of how to do it, and I will
keep you updated.

BR,
Anis

On Sat, Aug 22, 2026 at 6:12=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Sat Aug 22, 2026 at 2:25 AM CEST, Anis Bougrine via
> lists.openembedded.org wrote:
> > - Re-sign modules after the package stripping process.
> > - Remove the package-stripping skip for signed modules from package.py.
> > - Add MOD_INSTALL_PREFIX variable
> >
> > Note that this v4 patch drops v3 patch and its relative which have been
> merged to master-next:
> > 3e34657 kernel.bbclass: add strip process for signed kernel modules
> > ffc6d51 package: extract debug sources from signed kernel modules
> >
> > Anis Bougrine (4):
> >   kernel.bbclass: re-sign kernel modules after package stripping proces=
s
> >   package.py: remove stripping and splitting skip for signed kernel
> >     modules
> >   kernel: centralize kernel module installation path in one variable
> >   documentation.conf: add documentation for MOD_INSTALL_PREFIX variable
> >
> >  .../kernel-module-split.bbclass               | 23 ++++++++++++++++
> >  meta/classes-recipe/kernel.bbclass            | 13 +++++-----
> >  meta/conf/documentation.conf                  |  1 +
> >  meta/lib/oe/package.py                        | 26 +++----------------
> >  4 files changed, 34 insertions(+), 29 deletions(-)
>
> Hi Anis,
>
> Thanks for your patch.
>
> I suspect this is related with this failure:
>
> ERROR: lttng-modules-2.15.3-r0 do_package: Execution of
> '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/lttng-modules/2.15.3/temp/run.post_strip_kernel_modules_signing.1=
005048'
> failed with exit code 127
> ...
> | DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug',
> '--remove-section=3D.comment', '--remove-section=3D.note',
> '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-standard/k=
ernel/lttng-modules/tests/lttng-test.ko']
> | DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug',
> '--remove-section=3D.comment', '--remove-section=3D.note',
> '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-standard/k=
ernel/lttng-modules/tests/lttng-clock-plugin-test.ko']
> | DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug',
> '--remove-section=3D.comment', '--remove-section=3D.note',
> '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-standard/k=
ernel/lttng-modules/probes/lttng-probe-x86-irq-vectors.ko']
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4453
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4424
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4481
>
> Can you have a look at the issue?
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

--0000000000003234b20659bfb866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Mathieu,<br><br>Thank you for your feedback. Yes, I&=
#39;d be happy to investigate the issue.<br>In fact, I tested the patch onl=
y with core-image-minimal, i.e. only with in-tree kernel modules.<br>Howeve=
r, it appears that the patch also needs to be adapted to support out-of-tre=
e modules.<br>I will work on that. I already have an idea of how to do it, =
and I will keep you updated.<br><br>BR,<br>Anis</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, Aug 22, 2026 at 6:12=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mail=
to:mathieu.dubois-briand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On S=
at Aug 22, 2026 at 2:25 AM CEST, Anis Bougrine via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> wrote:<br>
&gt; - Re-sign modules after the package stripping process.<br>
&gt; - Remove the package-stripping skip for signed modules from package.py=
.<br>
&gt; - Add MOD_INSTALL_PREFIX variable<br>
&gt;<br>
&gt; Note that this v4 patch drops v3 patch and its relative which have bee=
n merged to master-next:<br>
&gt; 3e34657 kernel.bbclass: add strip process for signed kernel modules<br=
>
&gt; ffc6d51 package: extract debug sources from signed kernel modules<br>
&gt;<br>
&gt; Anis Bougrine (4):<br>
&gt;=C2=A0 =C2=A0kernel.bbclass: re-sign kernel modules after package strip=
ping process<br>
&gt;=C2=A0 =C2=A0package.py: remove stripping and splitting skip for signed=
 kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0modules<br>
&gt;=C2=A0 =C2=A0kernel: centralize kernel module installation path in one =
variable<br>
&gt;=C2=A0 =C2=A0documentation.conf: add documentation for MOD_INSTALL_PREF=
IX variable<br>
&gt;<br>
&gt;=C2=A0 .../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 +++++-----<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +++----------------<br>
&gt;=C2=A0 4 files changed, 34 insertions(+), 29 deletions(-)<br>
<br>
Hi Anis,<br>
<br>
Thanks for your patch.<br>
<br>
I suspect this is related with this failure:<br>
<br>
ERROR: lttng-modules-2.15.3-r0 do_package: Execution of &#39;/srv/pokybuild=
/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky-linux/lttng-m=
odules/2.15.3/temp/run.post_strip_kernel_modules_signing.1005048&#39; faile=
d with exit code 127<br>
...<br>
| DEBUG: runstrip: [&#39;i686-poky-linux-strip&#39;, &#39;--strip-debug&#39=
;, &#39;--remove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39=
;, &#39;/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/generic=
x86-poky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-stand=
ard/kernel/lttng-modules/tests/lttng-test.ko&#39;]<br>
| DEBUG: runstrip: [&#39;i686-poky-linux-strip&#39;, &#39;--strip-debug&#39=
;, &#39;--remove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39=
;, &#39;/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/generic=
x86-poky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-stand=
ard/kernel/lttng-modules/tests/lttng-clock-plugin-test.ko&#39;]<br>
| DEBUG: runstrip: [&#39;i686-poky-linux-strip&#39;, &#39;--strip-debug&#39=
;, &#39;--remove-section=3D.comment&#39;, &#39;--remove-section=3D.note&#39=
;, &#39;/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/generic=
x86-poky-linux/lttng-modules/2.15.3/package/lib/modules/6.18.43-yocto-stand=
ard/kernel/lttng-modules/probes/lttng-probe-x86-irq-vectors.ko&#39;]<br>
...<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/buil=
ds/4453" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/19/builds/4453</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/build=
s/4424" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/9/builds/4424</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/build=
s/4481" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/6/builds/4481</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--0000000000003234b20659bfb866--

