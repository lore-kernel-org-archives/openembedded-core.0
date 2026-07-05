Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64141C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 08:43:25 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128304.1783240998265435836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n2AlrXUX;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ea93125ad1so11870336d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 01:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783240997; cv=none;
        d=google.com; s=arc-20260327;
        b=l4aL8B3jg3kzKqQFm5WkxRRto4btvoSuhLb3PBLsupGKJdXo6v84cNN1wXFT6xe9Qa
         je56AewCVO6D6u3NoYvHDzmbWGyVxgH/X8E+uoFDgQW0NguuJaKJOMW+9T+xPJaBuM+9
         EaJRN17OpnNnq+wR3F7wyUG3RXTL800M/SdlYc25397diPul3pfkzWYb8RAW8PpfThoP
         GISaed4FFQ/wQVUcCMe2u0CAF5pDYmoS9JbMdMrXQIc2xaRZvUoilN85qDj6arnMdVkk
         CC7AyoMo3VnuLfA+tdTaRqUdx7l3SUuCtCBU5WlhChPhCTDbbGGq8N3vbKo1IFfS/+Ux
         khXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L2txXeZgOblg+pncju2Q0mJtVMNYH9cGsKubIS/IUrU=;
        fh=4fzi1D7Nb/QLyCnTsLjzNXyWV5bP6528KHqYU2O5N6U=;
        b=CH3m6bQJccsmWYURPMsJ8i0AEqO36N4fh/2zSE1m9q/CA19+irQWBKh5O3vXREXJf3
         rgM4vtTiR0WCASd/lQgP17TjQiTRg8OArAFqwMazthOhoAm9KL//DXDvrEtW9YD+b/07
         AfvO8Ac6rJyf0Fb/9/k7yZoUHoxFgKcrY0mkkiYODt2XkyluZoQtXGHl55xle4A+Q7Uv
         Wa1TQCY7aCBIkVpL0DvzjBcalgai1JNrKen94RUINRsWSGbFC6ktNnKcdLS5L/QquPrx
         XRQvoZUvAH/c4St9JmKPgJmnpsfsWmf/9LHieXDBAZG0G2JDE1f90yOqXgyI70eN4hqM
         n/yA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783240997; x=1783845797; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L2txXeZgOblg+pncju2Q0mJtVMNYH9cGsKubIS/IUrU=;
        b=n2AlrXUXDvdiUY9x8lUQhq9K4iIQCZZgzn2xyWC012fMtZa9GtGOE1Yc84bmVJG0xj
         mGdO6y31Z/dssRt1vAaAcN2h+6zPyaHu+5imH8d+CCG+0NdE2JDdjDZlWZruwkRyJWjo
         JyRKB4RxwhiiXGX4hyJ9+jluWuoLF5KLsXTED4rTh3H+WhgOyrbhmuAKwo+6d+SxT3Eh
         wJwNdpREsWwpahbxgDcjQ7iMUIcw9Quyh7N1uPzL8gtJisYpSDr71B+jJzkqAZENjlT+
         ud09mvYVeEQtGEBIxXVo7KjVZlWvSRKiTdjde8fcFXXI7//gx2s+sXqlRTAVOQf3a873
         5GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240997; x=1783845797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2txXeZgOblg+pncju2Q0mJtVMNYH9cGsKubIS/IUrU=;
        b=c3IVIOEeQJxMkih8KsZ0b3B34nNqmjQYdHm321YOoXQp9wGX9Pj4GBd6jWKZljonnV
         tbBt+cGSE8c92jevFqfGmUEQS8K/Jbu2iCSs6xWoYGMgMSekuvhZr7w3bFfUYEKbnou8
         ChsZtB3qUewc0LbZRkRv6rM7GNCB9b75N3ANKzgAVGeZ4Z0snubTKOe4p4tRalLUDKCM
         IwumjPj1dXLj0dNFHZyV2+JKpcFKN/HbYl+aVO/M+4UyT8cy9Iy2r2zOTK8XtQPrpmAE
         XWSFrb2eaiouLBftGfew1MneHWJ8TfCe1kOWL5RcEHSRsphhaeNzyJdcywIJFd7kE1XO
         /D7A==
X-Forwarded-Encrypted: i=1; AHgh+RoQtjn7mktUOhATwfSebka/vBinbZC7AxVO03JsLH0aiuyumZAgRVc5ozZAe2p1pbOkTc01dfquww1HsIFlmNmZHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2HimpTHZf061iLpKSLxypyMQXUduGOB3TfspfitVP8mCVF1RT
	D1olmeIYnoAhP6DJ2HlCf1NoQqWQBX05y5HmPJc4FBv+Xbw0SwfeTDLV5jaJuACboTfI7HThos2
	zPsUxOuF5uhTekkk30emugtlW5PiL39k=
X-Gm-Gg: AfdE7ckBvmkVwBZVx+bmKYjhd/pp+FKBOR3YFTHq9qr0UufvtBYbI/2nDQSjKz5U/Iz
	QNR0UUnhvPcx9m0yULwAtEDoJj+LrL9v18AccVWgj08QhAFmqNKJrYzd05mcc/X1PfKm5nZxdJP
	x7CmFBEgNXMb/HNOaiiegn3pyGrhQgrRBF87DcEKrrFpUGB8d8j7bfU4Ri0PHykaFcGx3MFfzLZ
	c4Ml/o9ioUR2tIRozZYuqjSkl0QsmYgKKNC7MOeiRVRggdFZ0bWvoeIyrAFkpudqNbea3a9xFiP
	fKsforFGjZyQEYpwbYdU6XdGkYsB
X-Received: by 2002:a05:6214:f64:b0:8e9:f5b0:f61c with SMTP id
 6a1803df08f44-8f74c4add77mr96062046d6.44.1783240997105; Sun, 05 Jul 2026
 01:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
 <20260703082955.1585712-5-richard.purdie@linuxfoundation.org>
 <CANNYZj-7NkZiXow508-rdrovftFp6S6yuGKVDYMHBPp7MR440w@mail.gmail.com>
 <DJQHRJ8J3RC1.Q0KLD14LY2ZA@bootlin.com> <208d3e13b95e992d4eaf54f8210592c06ce46050.camel@linuxfoundation.org>
In-Reply-To: <208d3e13b95e992d4eaf54f8210592c06ce46050.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 5 Jul 2026 10:43:05 +0200
X-Gm-Features: AVVi8CfSL60Gde2VbW6Egd0tjz9jZ7e9NgeCu1j4paCrURc2BwQG4O8JKqxynp8
Message-ID: <CANNYZj9mveU24cR_VQky=rTAFze_2gffU22a9WJ_jetLsaxLTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/15] mesa/mesa-tools-native: Upgrade 26.1.2 -> 26.1.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240145

On Sun, 5 Jul 2026 at 10:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > Just to confirm, we indeed have this error: https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4097
>
> I've queued my .4 with Alex's patch, thanks.

This patch is coming from a big rollup of everything that was released in June:
https://git.openembedded.org/openembedded-core-contrib/log/?h=akanavin/package-version-updates

This set is now ready, but it has been cooking long enough that
meanwhile upstreams have released even newer versions, and patches
were sent for them, so to avoid clutter and duplicates, let's merge
the newer versions first, then I'll rebase and send. E.g. mesa is
updated to .3 in my set, but latest is already .4.

Alex

