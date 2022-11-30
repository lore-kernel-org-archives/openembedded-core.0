Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFEBC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 12:11:13 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9481.1669810266359537940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 04:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YRVTQ9P6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id d1so26769173wrs.12
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 04:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kt8B2O/d3uB5JAksIyqtg/JdLiTL3e7uJJT59iDKy4w=;
        b=YRVTQ9P6TSrwW2/SJjtupVKQWJf63QkyrPOa0lEKeU4WASq/YQxPrOEAoTzI9pysNS
         DRsncKPhbWA7cGjmZOor2Mh2jdBeegDp+soHTIZpaYX3Ni62Pqo6HVcu179n5PlxFIvy
         2XdzX5tEt1c9Xr97nQdqJ0D4PLpzFGv2DRQlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kt8B2O/d3uB5JAksIyqtg/JdLiTL3e7uJJT59iDKy4w=;
        b=z5IXd8X+RpZQyqD0Mcd0DBe+G2TubLi9XNGfW2JW/TvlGLyt+ao5O96zvBTJQaMcYe
         okqFpM3lEACfrsoftr0Ipn5HBoUf81SxMguMi8pA1zjj3gjilbbMZIypDMoP0XaJokTm
         oxfHBeM/wSyOe30CpOP3dCeEsUz4qkA3wnZLxjb8iI/IfPareuZmqcWKDVYX0C3U9jo3
         BORbXfO3GUE2qBQjMcv1y/i0VsfYvZLtDkJXiyoNz1QiDsIq0FGx06bpjwlxTBdEOehr
         wSWK3dc92zCm61jAsgKvQTAC8KZHwLDfcUca6leswvEI//8YMd35RfbxBm9b9jWfMzfe
         QrTg==
X-Gm-Message-State: ANoB5pleOBJZ/Gx0iaL9w5GZUyFFDyj1u19gminMQhpTx03ZlGQjZXOx
	K7Vr+BDIT2Yee8i9yWjsO5NwLQ==
X-Google-Smtp-Source: AA0mqf6Lxx894s7ptRhZ1k0AYFB/56qvNyBGVcwGpnh+NLh4OwIjiigobAZG0BHVvcW+NKxYgZ53sw==
X-Received: by 2002:a5d:69c5:0:b0:242:17a6:8ed with SMTP id s5-20020a5d69c5000000b0024217a608edmr9227873wrw.176.1669810264581;
        Wed, 30 Nov 2022 04:11:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d673:1517:32d1:98? ([2001:8b0:aba:5f3c:d673:1517:32d1:98])
        by smtp.gmail.com with ESMTPSA id z8-20020adfdf88000000b002258235bda3sm1354841wrl.61.2022.11.30.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:11:04 -0800 (PST)
Message-ID: <a810720995297222c79919ce6f9e0f6776160d64.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2022 12:11:03 +0000
In-Reply-To: <CANNYZj-12v8gvNv77zOSJqnV7b22bx2xQcqjjWR4W-5r3wNksA@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	 <Y4c4UBryAjx5t2gl@mail.local>
	 <17e9291975095d514ca0a06f09c1c5d30909113e.camel@linuxfoundation.org>
	 <CANNYZj-12v8gvNv77zOSJqnV7b22bx2xQcqjjWR4W-5r3wNksA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 12:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174005

On Wed, 2022-11-30 at 13:07 +0100, Alexander Kanavin wrote:
> On Wed, 30 Nov 2022 at 12:40, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > To be clear, we don't run ptests on 32 bit targets, only on qemux86-64
> > and qemuarm64 where we have KVM available. We do run image, sdk and
> > eSDK tests on our supported qemu targets, 32 and 64 bit.
>=20
> I think kvm does allow 32 bit guest on a 64 bit host.

For x86, yes. For arm, it varies and I know at least one of our arm
hosts doesn't support it, I don't know about the newer ones.

>  But I can imagine making full ptests work on 32 bit guests would be a st=
ruggle
> for reasons unrelated to 2038, specifically lack of users outside of
> embedded world.

In general I think it shouldn't be too bad but we really do need to
test it and see.

Cheers,

Richard

