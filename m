Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9360ACCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 08:32:25 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10259.1762417942728930786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 00:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FI246IeD;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87a092251eeso23221676d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762417942; x=1763022742; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpzlwy/Fen1XmO24PRYC3dIZdd+vd3P3zxNj2Rmc7uQ=;
        b=FI246IeDtfqBmtnM65P1uFkTR3SEaNLQ6OmO+7IuoTlh+5SR4ZFRl52pCU3ZE0x2YL
         Phc5dWLkbbGm9EwheZYiB8Uc2jCYrE2L1FB9s4BnpuXDNNb1ZSonqwnDRSKRGn6fjxxE
         S6J9/iInL7rKhmWBKAPSslrLDLc3642sN6VctpAASOwO9jNe25lp5jVsWJR1+dQXwYKV
         YGCnT60jM3B+FGEH0L+1UQzyuvAlrgHw2EE6j8DfEIW+q76Ulw3x1wRBfo+3gVcf0vHm
         Y0nD3QC78Udqm8jTgAISFA5rT4yy2bt4bovwAcWlD5VHSqgfoPotuq+mYC1xsmiGvuZ4
         cDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762417942; x=1763022742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpzlwy/Fen1XmO24PRYC3dIZdd+vd3P3zxNj2Rmc7uQ=;
        b=L+cv1IVlOwFY3OzBNQVpttMPJQOkN3SH3FL+uRWhzCaaYkPPg6nwaES0g3N5msPgt8
         7p7154E4O2EUzAsoc68bOjub9kzNBDlZR5myso8ibBHi+myXMtrkQjurLdch90JSpsbk
         Umh2d42D0c+5itK6Ou2pMrQTw/wawKdaXrOnStkokkUo6PE0nZ1KeZXsEafi8GuMuDI4
         PW0SbkxoQ1gJMMa9IdwRzVyue+iO19qDIQT4S+R9dB36veOWNvhq9bocjbvwOQPaTg6s
         j0jGwISSWYfvHPrAP3uaLDJGendqHq9fGbqIowH9tx9OHm+HDC21pWJJkvBjT5PlIatb
         9eRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZsgmTGjzBt5naB6nxcMolRby4kk1esewsy77o3hGzCiRIOxSe/AfvpEJ45R4o5jhx20Zk6v+NiwA6mhb/l0nYJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzmsa1iLml5rBGSHbLhIK0Br4dgsBh2JDP3Lu7aIxVSnbuko29e
	vVTUscUVZVx1ATG3ngEGlAFe0IboDC80os0I/BMoFdc5pqvpu0bc5Xfq4f58jAMKyme5VX8lOCE
	l8lPYRdfWPbSm32H4GsD++lezXwYeCUPYsw==
X-Gm-Gg: ASbGncuxrNdNIvt1zk2uXUChSmk9z4N7ibTq73oPq65duul9M4PvW8n4BBLmjc0s4fR
	oXxaDv23PWrzsM/gHsADoFtlN9DKFe1xXITwUY9IXNbW9PYPAeTOejWi5un+tb8rMVKPV5RvoYe
	8qMXtNVDN6HAJ3ltJCZauRd0ZEbQ9by+qTpIcj4JW42QheUN3svHgv4FKRP8dtgHpQdk15hHwsb
	uv5PM3YxB4a131tcrOmQAL2yRW0e8n7qrfTztlmZCBKheIx7H/iaVO5XOpCPo/P8nBTWCQYjoNM
	ntcvoKJoEw4xaH/7kKo=
X-Google-Smtp-Source: AGHT+IHQKrSybor1GcdC15Q/CULK2RKtP97ilybVawVxkXfkYsO9nWZ++JexrJ4L3n/IMx/TiCo8GBscOwAgnBbR188=
X-Received: by 2002:a05:6214:5094:b0:87c:27e2:3c0c with SMTP id
 6a1803df08f44-88082909105mr25827216d6.21.1762417941725; Thu, 06 Nov 2025
 00:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20251105232333.2800541-1-yoann.congal@smile.fr>
 <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com> <CAMSfU+7tVyd36J5ssaKeyPK4cxCtTsrgkOVejvXbaUM+n9fRMg@mail.gmail.com>
In-Reply-To: <CAMSfU+7tVyd36J5ssaKeyPK4cxCtTsrgkOVejvXbaUM+n9fRMg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 09:32:10 +0100
X-Gm-Features: AWmQ_bl2l_MFCKDteSWxKh4dUY0-ScUC85A5ghjnwYFfxlO7cnWdOXuAV_ulp5A
Message-ID: <CANNYZj-mHpSDju1-poFDpX-p5bSMJTB2JSvOzOr+SHfYvRts1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-setup.schema.json: Add schema for
 "{THISDIR}" bb-layer
To: yoann.congal@smile.fr
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 08:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225966

On Thu, 6 Nov 2025 at 08:57, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
>> This seems tautological to me; can you give an example of a string
>> that would fail to validate?
>
>
> It is tautological. As of now, every string will validate (I did not want to limit what a path can be).
> But semantically, whether they start with "{THISDIR}/" changes where the path is looked up, so the description changes between branches.
> This is coming from the bitbake-setup documentation patch review : https://lists.openembedded.org/g/bitbake-devel/message/18267

Yep, the point is to formally document the meaning of {THISDIR} in the
schema. Maybe we should've added a separate key, e.g.
bb-layers-relative-to-config-file. Maybe we can still do that :)

Alex

