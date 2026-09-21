Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7B9C982EE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 15:07:11 +0000 (UTC)
Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com [74.125.225.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50884.1790003226166044909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 08:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GOsHbc8j;
 spf=pass (domain: smile.fr, ip: 74.125.225.91, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f27.google.com with SMTP id ffacd0b85a97d-4843796e373so1745854f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790003224; x=1790608024; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=muAKdZ2bKSgN0AjJYzhzQSOlX4EY8IolOMTmYsw1jdA=;
        b=GOsHbc8jB/I92pJaTIGYUOvgJ8g5T2s6ZE+DVb2VV9XeV4ftmnjqErB6QCGqZVc445
         v2Y38ZK5pK4BkDLpmHE3zuDtcbQ9+rJHnWko9i7LKcTVUGoHoCcUsmlHX+fFoBSd4ARY
         jCEW7kfnLlxBYXKMoJG/SlFmBcdNe+IQapSrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003224; x=1790608024;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muAKdZ2bKSgN0AjJYzhzQSOlX4EY8IolOMTmYsw1jdA=;
        b=o7kjkTgxuFGygcndyh/IoYMHJ6EO8xsfUd7tvuiW7WsnIf/nXeMvZstCMxejLScEDp
         cdl9wtAS55V1rQh3ENA8quU0WiF9eIp/xI4e9VJ+nBrY1HDlIQFed0k0wmxgWzyjLVcK
         a50Qb3jqnu5T6ZzkX9hdeI2X9iaojXZTUlJP0Zk2tj85ktNRwCDDnoK0cemCZVwDOrqE
         mDid73hoHUOppyCifkvrpIrD5qfoLQQ0yZmSONxKVtL2i9E/aJ+V+bKdjkuQqThppKMH
         z5OkU8kCABg4Kk81E29RY4kI51iBJGdvToC7ozZc/0TavX40d8saNLmzS2zGrWvAGmCw
         r/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6GKpudDmXg21ih3WtnKYRv0DRTSlUrATQUle9rfUF78dyjEzMe1/5pz2V/z1yNBOy6YVw32penKIn5DagCWQsvA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kiW3tMeW2pUSZJI0Xl1QHuQM/d55IbjfGDN2FzhghNL8KFAyz/
	Ye91Fm6F8A2gZJ40cPCdX8Y6cuVNxklGahmpfswovyuxxSHWIKyuVssWSXwKp8Jflg8=
X-Gm-Gg: AYBFou3/Z599lUPJe66YrGX9Sb9seb3NsEaSTalP0oi+2kcKSh09VRa3v1+7Es65qdB
	EV6dztuDUAm4ofQozMTfHMe62KKM0MpZ6JxUR4Rt2GdsGv7mg4gsbU/r0loPPfb4cbum4ZTcYsd
	yYBdljxD3Y8M8gpxn6KHXy4drdcOPCDHZhKIxBgmpF2Iy9f2NArykUASgVkJgltVe0qe9HEIpTD
	dmQb0M7ErXIG+o+Rri1vDTUPcvoBWtc8nAc2EJmuzupP6nXzqvM5TQL5XGSKnGPmrdPhYf8NWlp
	62zGSghjtDHM0CjuBJp3byFCyb6NFIijqgbVbp/hSVeDcSfDsM8BWIgfWc97YNORwNuEIPC+Ml/
	4jK6Cbx5lJ0N3NYOm7RFYeWOwbSMoRfAUPVMUY6yfu4ihh0ZIOqlRvv0hC80PiUtETC6aCdO8Vc
	hUiDmYaDiEyC/XtpLB3Qsz1nnpejP+pwSozyPsPQqfsD7cefvJzAV12q9+DjYkzVuGiVhlj+Y2L
	Pl3qNg9lqPqXUzjZ2CXItUjrYQbst0EH8t3Aeh5kgQCnB3OeDdlsbOjz1M=
X-Received: by 2002:a05:6000:2302:b0:485:af9d:cd1f with SMTP id ffacd0b85a97d-4871e37b88dmr15134263f8f.51.1790003224319;
        Mon, 21 Sep 2026 08:07:04 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4885a0549c3sm10868113f8f.25.2026.09.21.08.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:07:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 17:07:03 +0200
Message-Id: <DLL36OQUQAJS.8YKDBJUDHDWB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-ply: set status for
 CVE-2025-56005
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "hthakar@cisco.com"
 <hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260903051903.3667481-1-hthakar@cisco.com>
 <DLCD6S1OFYVG.1UJ6XDWKX8OJ6@smile.fr>
 <AS8PR10MB507315C1FA2936B1B4EF91D8FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507315C1FA2936B1B4EF91D8FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 15:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246340

On Sat Sep 12, 2026 at 4:37 PM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Friday, September 11, 2026 11:03 AM
>> To: hthakar@cisco.com; openembedded-core@lists.openembedded.org
>> Cc: xe-linux-external@cisco.com
>> Subject: Re: [OE-core][scarthgap][PATCH] python3-ply: set status for CVE=
-2025-
>> 56005
>>=20
>> On Thu Sep 3, 2026 at 7:19 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHI=
PS
>> PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> > From: Hetvi Thakar <hthakar@cisco.com>
>> >
>> > PLY 3.11 contains the picklefile parameter described by
>> > CVE-2025-56005, but exploitation requires an application to
>> > explicitly pass an attacker-controlled pickle file to yacc().
>> >
>> > No OE-Core consumer uses this parameter. Ubuntu ignores the issue for
>> > the same reason [1], and NVD records the CVE as disputed [2].
>> >
>> > [1] https://ubuntu.com/security/CVE-2025-56005
>> > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>> >
>> > Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> > ---
>> >  meta/recipes-devtools/python/python3-ply_3.11.bb | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/r=
ecipes-
>> devtools/python/python3-ply_3.11.bb
>> > index 0855c871cf..5bed977158 100644
>> > --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
>> > +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
>> > @@ -16,5 +16,6 @@ RDEPENDS:${PN}:class-target +=3D "\
>> >  "
>> >
>> >  CVE_PRODUCT =3D "dabeaz:ply"
>> > +CVE_STATUS[CVE-2025-56005] =3D "disputed: Exploitation requires appli=
cation-
>> specific use of PLY's picklefile parameter with attacker-controlled pick=
le data"
>> >
>> >  BBCLASSEXTEND =3D "native nativesdk"
>>=20
>> Hello,
>>=20
>> As fas as I can tell, this patch is also needed on wrynose.
>> I can't merge here until this is fixed there.
>>=20
>> Can you send a patch to fix this on this branch and then, ping back
>> here?
>
> Hello Yoann,
>
> In wrynose this will be fixed by update of sbom-cve-check tooling.
>
> Peter

Right, thanks Peter!

>
>>=20
>> Thanks!
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


