Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1238FC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 23:16:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10.1720653393024164632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 16:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GdyJkHTz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42795086628so1708835e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 16:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720653391; x=1721258191; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qlpkyblutqJoC8dGY6Z+a71f7B7h/gEzEngwhaqN2uE=;
        b=GdyJkHTz/2HNTQfEDa+rbo2xWBtnk57H17oKQ6EBxQxSjaGZObxCFEFZm08oRUG9mG
         KfjyRCWwP9hGq/4DZmjaeFevRIEZCKad+MyXBHeWqPKvF/sifBMTwsL8P7yCmAoXZ5OS
         onL1ZqBI//jYZCr+1L1JzmOiPyu+Vnov2ay/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720653391; x=1721258191;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlpkyblutqJoC8dGY6Z+a71f7B7h/gEzEngwhaqN2uE=;
        b=cKsUsJ0KGFRgNcOP2C3XpdSWQSK4hM6uYn+IOO36IFwi+uSk+wsvsMDAh5SMqr1v7h
         RzfafsKKnRkzp19vXhq6n1tY4WrTuqa+Nt4jDoTOA7QWq0w1SkL9Q7XsAqt80TDDWoMz
         3TbnAsn/OFvEQ15UIb39I0NPz6nOcT7tDF0avfvllYObHPTlazpDDsZS3dQGtAL+nFQX
         LPn48pw+2dGRNLVSqidkfN58yaql8kq3XNNu+TYTFlf+h5cSP5G4bIU0z5ybpicGq4sX
         u+Vu5bc33aKx+mwf7F5VHaw0qqGR8ujXM3tUUbQiR9TioPy2iZTJkCWCyq8Q/WCbVEny
         j6JA==
X-Gm-Message-State: AOJu0YwbvgVZ/YgUmZBUW1kUI10drMXvaQuh4FSBL2+s43v3wdq3rtot
	wlmehwh4Drd2Zi62OWTbfh+42QC7e6JFo1mtd0S0XX88abehThe+ljnDGas7wMw=
X-Google-Smtp-Source: AGHT+IF8jmQI8HBU6nZ0ND+cOJHGYZPfNG7++HESOOyJYVNGDMBaJ4HBaFIcF0kbce+DtC8aZKu+sw==
X-Received: by 2002:adf:ea87:0:b0:367:92b3:f6b0 with SMTP id ffacd0b85a97d-367cea6bfd3mr4018636f8f.21.1720653391010;
        Wed, 10 Jul 2024 16:16:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfb22aasm6316870f8f.117.2024.07.10.16.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:16:30 -0700 (PDT)
Message-ID: <b96fd41e0235ea4b0a2a5820dd51514c9fa80530.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Use override
 style append so generated code passes oelint-adv.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jeremigraveline@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2024 00:16:29 +0100
In-Reply-To: <CABGZR5rATZYeLP5c1TudH-2ky48X2MOaWOuXXuMEhka6eimMSA@mail.gmail.com>
References: <20240710193743.3686800-1-jeremi.graveline@gmail.com>
	 <CANNYZj8BmMQPjfVTh_x80ssbYaaxLzsw-ZpxVJFuZT_9WiJ9EA@mail.gmail.com>
	 <CABGZR5rATZYeLP5c1TudH-2ky48X2MOaWOuXXuMEhka6eimMSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 23:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201749

On Wed, 2024-07-10 at 16:29 -0400, jermigra via lists.openembedded.org
wrote:
> I understand, it is true it doesn't really happen in real recipes. Is
> the new version of the class bad though? I cannot find a way to
> suppress the error from the recipe itself and wish not to edit the
> generated include file.=20

We're not swapping a perfectly good +=3D for append when there isn't a
reason to.=C2=A0I'm on record as wanting to reduce the usage of append and
see +=3D used more in general.

The linter needs to be fixed.

Cheers,

Richard

