Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EDCCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 09:38:08 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38946.1781861884131091311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 02:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HiJjVD4e;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8debb065e01so4515536d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 02:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781861883; cv=none;
        d=google.com; s=arc-20240605;
        b=Re4iPf2QTBwwCmBP2/06NkxMPf/ZQokpzLdjCzOKBh+YPz9QFSo5Mox7t9eUdCjzYH
         zBxud/RphHnpSIt0yq2w5FM74YMou3+CqK2nQxvG29WdImKtLo/DWQ06a7q8anDSib6s
         0UpXQRQBdgVLK3MXWxX0H8bz4S5vxDZI9fZeEhEdYmjQiA0MhTE04twu4ppAMvX8QXrt
         TS4WvSZ2XHb07vivWqidhShZobmOPqAU1yUEsPQStlqtNzg5tc2b0ixcQFCRj1OvfLBt
         YRSQoUXxvKgV26nmQov+i1ThT66vlaLYZuRNzKwV7KOnijzSqaMzb4sf6pRx6ZauEu9U
         OceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2f16w7HpaJw2xMIChi+PcBlltLlENLHIFVQ5RjGqsQw=;
        fh=RHWf5utPhqKThjNPWcsg0gKB2ebpu/rRoaKqLv0aw6Q=;
        b=TRLP985Gt5IPEBVNnGnJaz+FhFQdOBlVprddaZGfJHtX+DG7g7ofWkqr8qG3ISAHOv
         PKFg59t1MBWGkQx+6GE+jwKQzxUoVSOyVAJ8LAxqXt0Go3L7a7kNC8fKJoJjbXn5juGu
         jsjKSmOhJcvD2Q51qVWgRw+zYo1yZnOFStbDqJoEk764Icfp7vuZ77CqHQ87yLfiGR63
         SIGbuMx9hGIOREEhaaLAgbCYZPM3SW2qc6zH64MifNBV1DCesNF5jLGknSieLDUiVHew
         c4NEl3SVrsf4eLeArtumy4TGzCazHbvnXBJo8xwWiKt+DUKa7xlfiSBE/DiW6mB5+ilT
         ecfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781861883; x=1782466683; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2f16w7HpaJw2xMIChi+PcBlltLlENLHIFVQ5RjGqsQw=;
        b=HiJjVD4eDgnt3kUR0XK2rNoepLaId2t/CQyx3NJaCEvx7ijYQpVadEIZGhrXLhmkRS
         K6ITMXHmc54cCsLHaCGwhyZc6zzwR2obFxvuw82lXsh2bA2cBKs5/ew7908nFpnfNibL
         wTVDauvHSfINJLpbkQGAg9NcfOBy5ETaUzD+/Gi3ls4LkXSzhlCkgtMF9pAxdtaOuw6B
         2Aa33ZJV+9ttaUJ7xKfu+U1GP4RgIuk9GWniIR2kELqJrPE0nQ4FQCJioce1Jge4wjGC
         R2T+YZ2mODhq60hd3j87sNxnG90hUr/+HzaN7ij8V1EIDYWYHdwift5yXS50tShZ3EII
         2Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781861883; x=1782466683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f16w7HpaJw2xMIChi+PcBlltLlENLHIFVQ5RjGqsQw=;
        b=XW0e/IP3rAyQCc/8KJRFJmbOu1r7avH0xZ1+EXYgRh5K6VL0TvXTlQc6b76C4sKbBg
         B9VBnDcFo+CprDLIJoayOUZYiNLJB+tCkdQfSmaxHlHxJqw6cDiBSx4j8AOWKjbwzaNH
         +ITApd2/AmLIknZu4UeX6mYjX4JT45vJhxMvq7lLwdWRaeGgjukviD9F4vL/GHjU1r2V
         7+IrVBFkgXB9QWWtnycOpI2S4pueKXgEmi9zD3VEDa5vO2oM2JdJe3za5SHBV7MaIEyr
         TBAuKgt7jmCGqzP/KQcsV7DO/wxcUar/YcCJrtF4L/Wintqaac0aYnfYsRSX2FvmXh8o
         aaVg==
X-Forwarded-Encrypted: i=1; AFNElJ9r+ffoLbaKX8tJzpxzahsquCxxIHIHZvd8scVNHQLFmQ1LJCgkvcv1kTVGs4u0AQqkSVXdF/YJDlSJsB+uVH+8IQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOHzkzjZ/kBGfILtOWeCS0Cw4+ehZTbh4iA2ogKHdhzbKl/g0W
	6ysauD17REBiHdIlT2Vu2D+53F42W5F6umeCdSmQ5g0PkYkAWVRzzdLw9Kvv3RwvMdrefkxaQ3r
	CsfX2JhqJNbuI21tcq0qrhC7j6BDU/JQ=
X-Gm-Gg: AfdE7ckikkAeg4m+Gc82QMSH3vEXtZHyRMJlfjLm/YeOritobk2wMm/Vs85aZlfMyoq
	TYy7HeXgqxdZGTPJl7oO1c9aXLc2zICuvyuDzXVWZYl4oejA0zPzB0UJadIk9zUvR7R95aBvmlk
	O1r+q07H0HcWbAwjiLwjYgIhKJVjNKWrAmZxS6ABRWUHfWw2AXxQUy0VuRvrHreWJPg1vMlnFSF
	kWt6y9VGC6JsoNEmWAw23LiEMyEliHko9HSZRihpWgDKm98OZ2Hg+kY6DPMCrBmsi4ZBYHP9Mbw
	jAuTn0o/7xKsRX9C2mY9/mX4+Msu92A=
X-Received: by 2002:a05:6214:769:b0:8cc:60dc:a249 with SMTP id
 6a1803df08f44-8dea4e63f8dmr22673836d6.42.1781861882787; Fri, 19 Jun 2026
 02:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com> <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <8b79a7e5-d706-4d4d-ab23-6933eece6c93@windriver.com>
In-Reply-To: <8b79a7e5-d706-4d4d-ab23-6933eece6c93@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Jun 2026 11:37:51 +0200
X-Gm-Features: AVVi8Cclg-stnYu1_coEjDbzqf6AFpS57HhSGtzgWGTHZXYqcOmcx8opt9h5rwk
Message-ID: <CANNYZj8kmEKGHmeD=ZWiSPkd80O6SBJ+1Ut=0TuS2TF7GVSV_A@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: liezhi.yang@windriver.com
Cc: "Matthew Ware (mattware)" <mattware@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 09:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239156

On Thu, 12 Mar 2026 at 15:15, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> I've fixed all the known issues and sent V8:
>
> https://lists.openembedded.org/g/openembedded-core/message/232960
>
> Thanks for everyone's great help, especially Mathieu Dubois-Briand.
>
> This is the most difficult work that I've met in the past 17 years.

Hello Robert,

are you able to resume work on this, and getting rpm 6 over the finish
line? Can you rebase the latest patchset on current master, and send
that so that someone else can pick it up?

Alex

