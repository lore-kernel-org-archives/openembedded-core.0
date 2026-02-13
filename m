Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2A7EDF176
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:36:34 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74632.1770996988998130310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+MFz0CK;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: colinmca242@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so5296342a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 07:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770996987; cv=none;
        d=google.com; s=arc-20240605;
        b=DIvD/5tTedlaGHyxFme8XKrXoxuNFBOpjg2+VwA35qSK4EUAehVryzKBLIxxbyWBgr
         A2te/yERcnIQdpAC1dIj9y+dvF2TV9xXduQ9CJKPRPwgJNFdfGh2HGuorKgv0vM5/4mk
         QN2ZvuamzijUSCWlOn414sRd9cpRl9ILsB6/e91C5+SdBsCfxVmvh9IKQXFUOWU1SPzX
         Wt2z0yF1MiszPo3B1kdqiueGrnLov0h/FIcSsxzb8TdmdG8yapzH3TTEU7eBgbOJf72M
         yV/CBSE4FcTUg8B6fDhJt5mL+QY+Jkqg13dQmb9tDVDoCt2lSCgtNrVn7oiCe45UjFBa
         XUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dggg/VwiKI43K7vhQwh56yDBTPji0qeaZ3dGsiJBS6k=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=KNR02QH462U/0abjwMnHRvHz8R9/HWwCjvWVYrLoBQpwRLmidXZnQjTRjb1ejEi9pF
         Atcq85lH8iNEUpaBdLKzYxZCuHCyhorUuRtlbM70vReXQRZ32qJag89dGwuboJBdx8cy
         S4PeyumOU4qAylyGo5AffuUezoXVbz8L4r9MCqsMLAY6vJPXVu0eSPfTMMMiC1ahP2ow
         jjYNXYRvm1LXoAjVp+H7QFVRsuJwN++UP14u9MOcYVECU1reJt6ItakIvFFAWTekGxuk
         kVCZ1sEnkvq/2ryTFduXGMfsMRqiT9mvJLCZVGTqlJsKWeUJvOM+8iAYzoRhzh7Fukgy
         LbfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770996987; x=1771601787; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dggg/VwiKI43K7vhQwh56yDBTPji0qeaZ3dGsiJBS6k=;
        b=i+MFz0CKmSAcp8he57bN9JD8GYNCGYkpxfe/VuYOnhwEClWAPzqJPewyoBAWNKUMCa
         T37zO1tC8kw4W38oQti0t5wT14jAySistHGwPQug7KNgHp0lzmOsm1WWsEazDss2BI5I
         zbJ4wGBVIV0MrOYP66s6aRGqH+tAFvjNo1yAbqxm4xhOMJK/vzPPTLDBtFl2RmOLddE6
         CzKSmXN8rbgcPjb4D+mfAx6Dn7vDUwEvmKF5mqtYRb5kqPhtX0G9VgFRMk1xmu4ymCkZ
         ngCfOMZJL8WNBHjkxwXZGqsI0IyZkokK6CMZWC9hK4wJ+uOPcCTIT44yWTnSrfeEAHBZ
         MoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770996987; x=1771601787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dggg/VwiKI43K7vhQwh56yDBTPji0qeaZ3dGsiJBS6k=;
        b=ly9cSI5CVJsw2nAgWoZ6ns1AvaQZy8ZEAA8+bMWtXq0CV0JSG6uhC2qiA4c2eCoP9A
         iHRefx4+svPl11/7utvRDmytyS0R5xMGsWheFjS1++le/Yy/JrH5FLzxzn0C0i+9P1K6
         bqxubQzpRVAnRaOmJPIeycLaSYFUr6pvcYKVPA/bWN+oBcRiXoBTY9I43f7Mdf7tcqgs
         LjE0PSUdhTprWRxQmPhPz9J6q6GM2g2njABa6FS6eRjsu8xOVlVoy3WznBluKldhgM5v
         rWFsv5v2Q//Zs0j/pBG8jiqysT7z8ycjreZ4cdE0CKCtz1xDjw1ARW4Ufco8mAH8cE4L
         XcgQ==
X-Gm-Message-State: AOJu0YxX3O1xDYlbht7CupIwO2BaBMDn1tQCNxJR9U8BnFn3D6lc8jj0
	86Fz6MAW3v600lA4fHOpl/8t1ovh5BTId2Cg12Akh7imXjGWe42NNjXRRHk0UgfEzbaOGoNI2OK
	E3AP8uS6UuLtp2NGHf2MQLIWTH2hn6HQ=
X-Gm-Gg: AZuq6aL3oxOhhATb08za2DfB/ebEirH8TWm6I9rjhRjSNoyocyqT38GSKRTTLp/gf+8
	sIIzjNJaiHIR43DQvWLmsKtQbmOdCf6mx0mkZHnSkK4bLs2sVUDGVDf4BkpjA+XJ0pM8TE4SFPN
	AgV9R2w/c7/h3P1GJNW0aw/JyrjbHM7tQcQqH2/auDQN8GyqOdPoCkr1KtFBI96G6gbcN+2AuLH
	Z1JEEakLPqmzS23eIHbZ6AVtBv6kCBtkJd7eso8xr5OYb2uLLIRaaKebDd8z15ysLvThgteMeSN
	xvHuS/y97e38Llld59Q=
X-Received: by 2002:a17:907:e111:b0:b8f:c0c1:2520 with SMTP id
 a640c23a62f3a-b8fc0c1280bmr18750166b.1.1770996986398; Fri, 13 Feb 2026
 07:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20260211184917.1045939-1-colinmca242@gmail.com> <DGD4QO4N38MH.11MGPG2TIVUHJ@bootlin.com>
In-Reply-To: <DGD4QO4N38MH.11MGPG2TIVUHJ@bootlin.com>
From: Colin <colinmca242@gmail.com>
Date: Fri, 13 Feb 2026 09:36:14 -0600
X-Gm-Features: AZwV_QgkCEPAyhQMJlongLeGldQFlGrI6dh77a3xdFPRxMCgurGCtP-Hs_AqcvQ
Message-ID: <CAAyLwgRur4cK7AZGUvorK8e1GDJ_PP=06CTtsZ_P4=Fj1k_MgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Disable OpenSSL and Python3-cryptography
 legacy features by default
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000045cc9b064ab65ed9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231126

--00000000000045cc9b064ab65ed9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

The test_min_max_version test in Python 3.14 test_ssl.py is failing because
of my patch that disables TLS 1 and 1.1 by default.

One of the assertions in the test_min_max_version checks if the minimum
supported TLS version is either TLS v1, TLS v1.1, or SSL v3. With TLS v1
and TLS v1.1 disabled, the minimum version is now TLS v1.2, which is not
included in that set. If I add TLS v1.2 to the set, test_min_max_version
passes.

This seems like something I can patch upstream in cpython so I will start
that process. I think it's ideal to disable all of these packageconfig
options by default together. So in my opinion it would be best to put my
patches on hold until this issue with cpython is fixed. I'm also open to
discussing short term solutions.

Thanks,

*_____________________*
*Colin Pinnell McAllister*


On Thu, Feb 12, 2026 at 10:39=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Feb 11, 2026 at 7:49 PM CET, Colin McAllister via
> lists.openembedded.org wrote:
> > TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
> > OpenSSL's legacy module contains deprecated and unmaintained components=
.
> > This series disables legacy support by default in both OpenSSL and
> > python3-cryptography, requiring users to explicitly opt-in if needed.
> >
> > The first two patches add packageconfig options to control legacy TLS
> > protocol support and the legacy OpenSSL module. The final patch aligns
> > python3-cryptography with the new OpenSSL defaults.
> >
> > Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
> > "no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
> > options that are disabled by default. While less disruptive to enable
> > the "no-*" options by default, using affirmative options provides
> > consistency with the new "legacy" option and is clearer than having
> > default-enabled "no-*" options.
> >
> > Testing performed:
> > * Verified both recipes build successfully with and without the new
> >   options
> > * Ran OpenSSL ptests with legacy enabled/disabled and TLS 1.0/1.1
> >   disabled
> > * Ran python3-cryptography ptests with legacy-openssl disabled
> > * Confirmed ptests correctly skip tests for disabled legacy features
> >
> > Colin Pinnell McAllister (3):
> >   openssl: Disable TLS 1.x by default
> >   openssl: Add legacy packageconfig option
> >   python3-cryptography: Disable legacy-openssl by default
> >
> >  meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 14 +++++++++-----
> >  .../python/python3-cryptography.bb                 |  2 +-
> >  2 files changed, 10 insertions(+), 6 deletions(-)
>
> Hi Colin,
>
> Thanks for your patch.
>
> It looks like we are having some ptest failing on the autobuilder:
>
> Failed ptests:
> {'python3': ['test_min_max_version', 'python3']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3075
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3030
>
> Test logs can be found here:
>
>
> https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/qemux86=
-64-ptest/core-image-ptest-python3/
>
> https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/qemuarm=
64-ptest/core-image-ptest-python3/
>
> Can you have a look at this error?
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

--00000000000045cc9b064ab65ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Mathieu,</div><div><br></div><div>The test_mi=
n_max_version test in Python 3.14 test_ssl.py is failing because of my patc=
h that disables TLS 1 and 1.1 by default.</div><div><br></div><div>One
 of the assertions in the test_min_max_version checks if the minimum=20
supported TLS version is either TLS v1, TLS v1.1, or SSL v3. With TLS v1
 and TLS v1.1 disabled, the minimum version is now TLS v1.2, which is=20
not included in that set. If I add TLS v1.2 to the set,=20
test_min_max_version passes.</div><div><br></div><div>This seems like=20
something=C2=A0I can patch upstream in cpython so I will start that=20
process.=C2=A0I think it&#39;s ideal to disable all of these packageconfig=
=20
options by default together. So in my opinion=C2=A0it would be best to put =
my
 patches on hold until this issue with cpython is fixed. I&#39;m also open=
=20
to discussing short term solutions.=C2=A0</div><div><br></div><div>Thanks,<=
/div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><br><=
/div></div></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><b>___________________=
__</b></div><div><b>Colin Pinnell McAllister</b></div></div></div></div><br=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Feb 12, 2026 at 10:39=E2=80=AFAM Mathieu Dub=
ois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu=
.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed Feb 11, 2026 at 7:49 PM CET, Colin McAllis=
ter via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and<br>
&gt; OpenSSL&#39;s legacy module contains deprecated and unmaintained compo=
nents.<br>
&gt; This series disables legacy support by default in both OpenSSL and<br>
&gt; python3-cryptography, requiring users to explicitly opt-in if needed.<=
br>
&gt;<br>
&gt; The first two patches add packageconfig options to control legacy TLS<=
br>
&gt; protocol support and the legacy OpenSSL module. The final patch aligns=
<br>
&gt; python3-cryptography with the new OpenSSL defaults.<br>
&gt;<br>
&gt; Note that the TLS 1.0/1.1 changes replace the existing &quot;no-tls1&q=
uot; and<br>
&gt; &quot;no-tls1_1&quot; packageconfig options with affirmative &quot;tls=
1&quot; and &quot;tls1_1&quot;<br>
&gt; options that are disabled by default. While less disruptive to enable<=
br>
&gt; the &quot;no-*&quot; options by default, using affirmative options pro=
vides<br>
&gt; consistency with the new &quot;legacy&quot; option and is clearer than=
 having<br>
&gt; default-enabled &quot;no-*&quot; options.<br>
&gt;<br>
&gt; Testing performed:<br>
&gt; * Verified both recipes build successfully with and without the new<br=
>
&gt;=C2=A0 =C2=A0options<br>
&gt; * Ran OpenSSL ptests with legacy enabled/disabled and TLS 1.0/1.1<br>
&gt;=C2=A0 =C2=A0disabled<br>
&gt; * Ran python3-cryptography ptests with legacy-openssl disabled<br>
&gt; * Confirmed ptests correctly skip tests for disabled legacy features<b=
r>
&gt;<br>
&gt; Colin Pinnell McAllister (3):<br>
&gt;=C2=A0 =C2=A0openssl: Disable TLS 1.x by default<br>
&gt;=C2=A0 =C2=A0openssl: Add legacy packageconfig option<br>
&gt;=C2=A0 =C2=A0python3-cryptography: Disable legacy-openssl by default<br=
>
&gt;<br>
&gt;=C2=A0 meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.5.=
5.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.5.bb</a> | 14 ++++++=
+++-----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cryptography.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-cryptography.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 10 insertions(+), 6 deletions(-)<br>
<br>
Hi Colin,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like we are having some ptest failing on the autobuilder:<br>
<br>
Failed ptests:<br>
{&#39;python3&#39;: [&#39;test_min_max_version&#39;, &#39;python3&#39;]}<br=
>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/3075" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/3075</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/3030" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/61/builds/3030</a><br>
<br>
Test logs can be found here:<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260212-56/testresult=
s/qemux86-64-ptest/core-image-ptest-python3/" rel=3D"noreferrer" target=3D"=
_blank">https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/q=
emux86-64-ptest/core-image-ptest-python3/</a><br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260212-56/testresult=
s/qemuarm64-ptest/core-image-ptest-python3/" rel=3D"noreferrer" target=3D"_=
blank">https://valkyrie.yocto.io/pub/non-release/20260212-56/testresults/qe=
muarm64-ptest/core-image-ptest-python3/</a><br>
<br>
Can you have a look at this error?<br>
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

--00000000000045cc9b064ab65ed9--

