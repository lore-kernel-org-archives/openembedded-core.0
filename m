Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDD6C36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 11:01:15 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.8467.1743159666229066292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 04:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXkNxH8j;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so15341936d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743159665; x=1743764465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ySh0YfO9kOyGbybjCZ2cSwQM6ZXUj1pHZMgLXxxVlWA=;
        b=kXkNxH8j21YAmc0UkVXnbu72n6zLqdOYouQz5nZ9b6GtlSOd/DbpO+k+uhGkK8fxba
         L11nSwEr54TIbXZ4fcWyuSJrWETDlCc1JxGHwtWoXhlM+/GPFW43tReR1HACu2WV1LRy
         yaD7KSLXWSskorn2wpJo5vJR2s/xnGdwAHmpmoRDu0l66e+95FBkm+h4JSBZBZ74gBEA
         Gse4bQHxYHTTOpZp1aZdf72MXmlYB/oYtRG0iaI2bDVEd3zcvkN6Upx6v7zx5s3RoUKt
         S2BJh+QS6QoEoQmrljNy+9h2ng4ozQ+1x2AC7SUFMbVKP8igw6/uzvzA3Mwjnx4cHFlP
         cmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159665; x=1743764465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySh0YfO9kOyGbybjCZ2cSwQM6ZXUj1pHZMgLXxxVlWA=;
        b=YqSCe1HN5UBy70uQu1/kYbhISRobQBQivlNRWNC9ETwFiUV3T+br42TvI8AfjGv4B7
         bIFU+sBHD+I235wOG9IVeh3b5TIlN3fF2L8zbfeVaw4zSIJhDzcyNSnwwXZW/KZ9Kdf7
         9LvXaMLfk3RCWOYqNiyAWN9P9jcMrLQtbasIF5B2IYvpPKDzzw2YEDgyl3rx3TjsK/n2
         kyTvF5IiSAz48RWW7IZI/29f56Mv6psO63f/tCG8CkpQnwuhcv3uipNJPkoMnK23g+OX
         88tHA3UKCbniHOC0DJIRCWtsaHkODled9M/Y75e+EFjo5hmXXQcRnHilFlJjiawxrZbp
         lZ9g==
X-Gm-Message-State: AOJu0YyhRvfmCSDeojuVGVWXE/v+N8npTAHb63EUSqIcnK/LKlQ8y1EB
	agTSabzBMSvsXLlFEUpoQ3TellG4Xv6pMf0leqeFP7TTukGESXzopAshFQ4TjDfoDn5i7pqeAjK
	g7IpZY4ZHD1x2CMLSIfO1eVPeO5E=
X-Gm-Gg: ASbGncuxuURpp5MtHhIUYGiDxVJoLmPz4+7XXfj4rrYUbam/MaC8SVYzmOEE+8imS5D
	m6itfBXySmtr329mwtjpxVzESOfdZ/SykPTnEdTH+U7XlGrlz22jivQZhbre1Xtr6TDc69m6Luc
	EpFL/90BH55aY1BEmLvtmMoUKR3P/IYyLo0465dq4ON6Pi7YhU1DsnQ5uatunA
X-Google-Smtp-Source: AGHT+IEhoWic2Kdo5uUSPnYWMfYDUdo/j+i1D2VMl0jV+T1gKiA/W2Tqazo1WhU7wLxdAV7fnHYGbTI/IVfcTi2xi3Q=
X-Received: by 2002:a05:6214:1d23:b0:6e8:fe60:fded with SMTP id
 6a1803df08f44-6ed239432damr70933726d6.30.1743159665123; Fri, 28 Mar 2025
 04:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250327221807.2551544-4-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj-hV3C1L6QYJhk0kq_Bj8PkjsWmjnyi16FbSqW1sRP70g@mail.gmail.com> <topj74a24moa3p6cl3w6nky35wkhisb773ogczfw3schsgybcp@5m3cjhkzpyxw>
In-Reply-To: <topj74a24moa3p6cl3w6nky35wkhisb773ogczfw3schsgybcp@5m3cjhkzpyxw>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 12:00:54 +0100
X-Gm-Features: AQ5f1Jp78aRqAMBu_ZKFDUlqy8sPqlI0N9SPe_ORF3H-pWz8sASct6D_NEo5oGc
Message-ID: <CANNYZj_uJEoZc7O5vCtjFaaev1ntf5ocSWiMnrtnmDftw7Mq=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/7] llvm: support building libclc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213828

On Fri, 28 Mar 2025 at 11:55, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> > > +    # Remove clang bits from target packages, we are not providing it for the system
> > > +    if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} &&
> > > +       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
> > > +        rm -f  ${D}${bindir}/clang*
> > > +        rm -fr ${D}${libdir}/clang
> > > +        rm -fr ${D}${datadir}/clang
> > > +
> > > +        rm -f  ${D}${bindir}/scan*
> > > +        rm -fr ${D}${libdir}/libscanbuild
> > > +        rm -fr ${D}${datadir}/scan-build
> > > +        rm -fr ${D}${datadir}/scan-view
> > > +
> > > +        rm -fr ${D}${libdir}/libear
> > > +    fi
> >
> > Why does this need to be done, if we're only adding libclc? Is it
> > dependent on those bits being built?
>
> This definitely is described in the commit message: 'Don't install clang
> into the target system, it is only used during the build process.'

What I don't understand is why target executables are being built, if
we only need to build a target library. If they can't be run directly,
how are they used during the build process?

Alex

