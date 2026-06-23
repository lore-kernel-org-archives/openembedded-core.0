Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEDECDB470
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 18:43:41 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28634.1782240220008948588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 11:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YzJ/2SGT;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6626cd98209so129686d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782240219; cv=none;
        d=google.com; s=arc-20240605;
        b=bohr2pqeb7QSG4VWMZ0LQ+P4jFujXkrQW53IOwpsTFSgmUCWAr6ZGdQWakdohIclzr
         W3FcBVXtus0GggXRi6cNnSsIZQ2WMdWQwK6jyig2VY1ZRssQQrjULwOvCMBhlEAwkcJY
         ZcJvq0JLuMC0Fk4kmjt6gpJY0jqrdKFE6kFIxheiSAFdhT/iiBaAyN6qT11aCXdTnUL4
         +KAHWlF3LdqemgxAlgBa/p0vQ8OyaZmQXl8LCSTnrtFIIFV0vE6+luitXf99kpi+VXxh
         2nZRaOaCRvkjd2axaHxNV2587VqhwIL06b3tyeSPooAnaO7G8ej3t63o98swWPUBdnIB
         9Quw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucwpyipFzp/DKAZS/rR2WejJv8xdaeMGaq01TDxmj9g=;
        fh=YfJbSikri/WlY8x3gT5qcsIzFFc5q7v296QrQzwMUBw=;
        b=MQRe1WANp34OHUh3JAKKOjwOpvK/I3rFV7X2QbDTt8oHF5alv7wVtXB5xYBFpF2HXR
         egCpEwy0LFGwoWCZrhVD7+DLs+VZFljVetGl0t0NHOIDEz1Ku4RNNm9c2lc3dR6M8xHW
         MiVNgNz15p0KhApQTNsUFrJ+WYjDS5dldxbRN/Kyu/sxT3Fd7y2lrbohsethXt3dd3qX
         zsYKrFVSp4bpllKLLvyzQtlpRniMPqlgL8Bdxr10lQAVl/76sqb2qVS56iiVd5guP5RF
         NIlE7HABOsaP5Db49bVn+CUF7qRC8jm/qdVhYCWJ8kGjst6i/51AoPvidguy2bTI9lvE
         KsjA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782240219; x=1782845019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucwpyipFzp/DKAZS/rR2WejJv8xdaeMGaq01TDxmj9g=;
        b=YzJ/2SGTXM3OCNHg9/XpR0JeFAYFb59PS4ay0mR4V65HC/PeAOYmQh9gwqQhN/zvjY
         ReLMJ48EWBu2IZJpKq26+RlXZOQS9l3GSD4V7aV14d+Gm5r6OdqHyXIe4Y9xfAEkZYC/
         K/Dc+sBgO5sSrj+hNkIvlD7wl9cQOtv1m7u71yqaE6+f/RpWqhns9PElR5vu9GGs4b/1
         +cSGRU/qnmWjgV9MercDkQ5iEyd/VX2xwXCtWze2U0EcevS92i9cIzdAIRoYP2RD2kx1
         sC4IahffzRGIH7QKoKRfqtwGdb9u6H+JhGl0SJhaNNT9R4OPNLL76S8hxy/n3YC/UdBJ
         aTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782240219; x=1782845019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucwpyipFzp/DKAZS/rR2WejJv8xdaeMGaq01TDxmj9g=;
        b=CE/ZHg6KzjdvqVGcngzoe/hjOB38lm3XArfchWZ1yOlIcTP3kom94VP2wxPnK4OxBS
         Sz4zsF8Ngvgm14SGz/EjqZsGIVRrpPxny6xyofBuDiKs4wJMwgnVs0wsn9EuAmd9qHb9
         KVAKr4AsAUatOnvY3qIY4hMSGsL+Ydl6T6Q535DioXJIjWmf2JhOC4beAzbX1nkz8ej2
         aFbur1dRhhdM/7InWpz+DbgPBTns6lbrLTF8qGa8iKzJaM7zs0cG6UUX8L7Y1Q3vcvIb
         +FpnNry4WKuFekC67xhfjfvwJtg90SKaCxRPQOnbpSYaR5aIQQ/LxON/jD4fCgTrKWww
         WBWQ==
X-Gm-Message-State: AOJu0YwJVnXcsyPVzETa8JjdNhqW+hl2NyN33eYSUNE7QXiXQgjpWKwm
	He8Ogrye9nZxlYWof1berxAlHsg0Ha2nDkUwbhU6ihs/RlD6rptItrZTOXJrzQXA4sDmLqNjAyF
	xxzodv/IZ+iCfxlKe6NmKhdTQhbZMgM8=
X-Gm-Gg: AfdE7cnecqQ9KN0/l51ZXAKy7eG7j+ROTpT/3+uk5RHYz2ofOy0angll6g6fkgJVFbs
	BxxmVH1gslhmtAGxC1h0j30jf3Ep0mqSpo/2NLD4yYEamU1H5h0bikmKHeRaEozqBm551MohRUW
	/3EtSnkfPcL6mI6SsbMIRMvlVujf/qdUYtmiJStHpBHA49NwqcTodt6cuuMx8YoO0X6WtqhGb1E
	2bYF1SpyEXVv1bYP/AmmU8xaN9SNV1PCZDHuRkUPrmv8IaJ814BcC/wLAl0Pku/dETDJv3yee60
	tcydfNQEpOrLf1Yh+XKz8MikD47MEiW0n93fjK/mmJYyfdi333kNfZFWYisr1Q==
X-Received: by 2002:a05:690e:4396:b0:662:e27b:5faa with SMTP id
 956f58d0204a3-6636e336a07mr83422d50.8.1782240218915; Tue, 23 Jun 2026
 11:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260620111501.8465-1-jan.vermaete@gmail.com> <CANNYZj8WMkUzhg_NxWczE4hXs68uQFP-1PPGSgrFJk_2fKYXvQ@mail.gmail.com>
In-Reply-To: <CANNYZj8WMkUzhg_NxWczE4hXs68uQFP-1PPGSgrFJk_2fKYXvQ@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Tue, 23 Jun 2026 20:43:28 +0200
X-Gm-Features: AVVi8CdtAnhJWkqgBWmzIj-FrvztE3VL51XqRF3_bLfk3aAK3A5SnXxpC5UCKX0
Message-ID: <CABF_=ygB=vU9f-q3GMmJJLWaPKmajc+-iOr1ALeENhUwzcZcPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-dma-buf: new recipe at version 5.5.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Gerbrand De Laender <gdelaende@gmail.com>, mark.hatle@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 18:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239418

Hi all,

Would meta-openembedded be a better place for this recipe?

We used it on an AMD/Xilinx FPGA, so meta-xilinx could also be an
option. However, the recipe itself is not specific to Xilinx and can
be used with other FPGAs as well.  @mhatle

I could be the maintainer, although this would be my first recipe.
Testing may be a bit difficult since it requires an FPGA board.


br

On Sat, Jun 20, 2026 at 7:44=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sat, 20 Jun 2026 at 13:15, Jan Vermaete via lists.openembedded.org
> <jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Add a Yocto recipe for u-dma-buf, an out-of-tree driver that
> > provides userspace-mappable contiguous DMA buffers for FPGA
> > and other DMA-capable devices.
>
> This needs justification for inclusion in core. Is this widely used
> and widely useful? Why is it not in the kernel tree? Does it come with
> a maintenance promise?
>
> Alex



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

