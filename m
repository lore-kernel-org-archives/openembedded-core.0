Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C01CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:41:22 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148702.1781595676946981770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 00:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OLBPSLPz;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cebfb15413so46296716d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 00:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781595676; cv=none;
        d=google.com; s=arc-20240605;
        b=ChgRB0IXN4dfI8feADvTkOipoxuES+GLs7ylVUTY/+mEcsEGKpgu9P04Ec0Np2iHlY
         rz8ieACW7VADvJZL/ZtJ9QO7HU1bW+jP1BxTFZLkBcUQSNkrHpLgSxnKGPNOkeeeAdOD
         9HpQEdqXFVLsH49YM8VCmjm6bb421dDsJknvvOhST8Rr+0Vm3m/lOn8kwWkqXBenkXkI
         bKj0lDvCoTwBVO7R5PXOwGqiSQ2exGchjNeGMdh5TwIoTa+fcLh1mJS0QoXtaHCjNzdu
         SXpgfPem41RLgYC4iE9TGT9KySMI7o0IyZ5NPP0eb8coVQ80ebY2DOkvlD1grjgrBPSZ
         Gg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/zQiMIufvoM2S0r7hN0DlQ0Ib3hW6MXYBpK3Fd/XPqw=;
        fh=KDBggjr8BLztnc4QKL9wpIZeKsRhbOowKcZEQS8F7CA=;
        b=OcgSzxaJiwyqvgG+g2bdtf9dijmEH63U4md8bUogUEYddrNHp/QA8zASD2hD9eI7Bt
         lLBnLihPwcx1Qkm9dwVs9BVJCep33GxVVkIxpV4CxjCOi/vEh9dpgIrlBWx6U7ePMtA3
         j+hRxnEsM3yiNes4w8lLRZpLoEzmA+mJsxh0ydDGBMBLDYq/OAbop2Fv2pD2jq9H13my
         WN4PkcCiAcMB09aMt3X7tncFyQi8ivPTXLnZm4mgUFCD8m79s3hHayAFVDWoQD+FcMXV
         K3N4Ycv0LMDhBt9SD5ifmsTSqrtuUzSFxocnMdztIPjqMOf6k2k60/urvOchD+NAevcR
         nNgg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595676; x=1782200476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/zQiMIufvoM2S0r7hN0DlQ0Ib3hW6MXYBpK3Fd/XPqw=;
        b=OLBPSLPz62f0JZmNYc14K1WUtbSntms93jfQ39TvMXVH+shIrRTRaQdwxat7V1IdU9
         3vNbIlHyu3s2Tv9calZooeY6mctZKcOk3Ko483/9NgMlSq9zBbq2sBIBqlcxLSueQNlh
         BuadjD3CI4UlFZX3iU5Ak1A0omjC9unqiFiCzuUBcUVKXmarjRBygiwXjsV2Fozuabgw
         ZA74dH5eF6F0GCQWbcZpkNQMldUoHObdkSH6RsLPNxs5u1Pix9YgNcHgDuLpATQ5vMKt
         YXUsEVXogAjTwJ4k71Y5t+udr0qXOpr2whK6xV8D/eMTyQX3Vhw46aAYDbVCGLAvIu4I
         B90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595676; x=1782200476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zQiMIufvoM2S0r7hN0DlQ0Ib3hW6MXYBpK3Fd/XPqw=;
        b=SHF9ohgzuste168R/EaMlPsbIaaI/RavQa541CodOaiQD5c+FxChr4bCrJFvb1tgxi
         31RTB8k5AyFxyS7P0ICECJSBQAVhhKxEc/Tyq7X2ouJih71/a+pOi0KhxDThyCz7dUsx
         uk61ZtVPWBUxxe93dm6f5HPDisqWyMcoSOWTrGu+jvTA6X+b1Q2Rg5k/v06WWDsZqsgE
         RSvwTaIBrosKbd0xYb5VdRtsfDmN4bhN0gAr1TFqqzq5RANu7orPBc8dMBtZHXPjHlUt
         KJ4hm7geJFaEJb1WN4oS1akH8Ov09vWGO0x9MSgfDPyzzEICiuHYVVTZ7FlrDyQFbF0l
         TIZA==
X-Gm-Message-State: AOJu0YwrQUjWB7g5Pi3v/8PO4bCPt2a/dcul2E2UwzzuYhIPsaM9/HyC
	EAjMSeTyMH1iWljfO/YkTu2G8m7IckLu+w0vmLjkBLaZkE6AccNbL5kxzmlB+N+pz2N6B6/ugJX
	ic7vOfR1SSGx6TYqHT+t2EV8mnkWcyld9BkdU
X-Gm-Gg: Acq92OGPG5fxNhh0TX7BtXNpgIggFXfTifugm/8xpJaCyfPACootaNVqsR50/mxwFAc
	/29V611hIHurr9PDiLpif1c9qWHejhtj4MJ2fhrVh9kPNF9mOenkrjTu2xPNV/vdJHoQxtwA2uV
	sE4tpHF5c/gbFikgTnE3krPDribQ6GuiC0MbAxdy8uNgBP2ZxPdagujAVkl8upl4VdYocGSrf/3
	x9Gh0ZT07psDhESbNug/aAQuVN3nsDs/KiGPaqOAFS57zX733TcxvXf7TybYNDL5mzs4N+MiS/R
	I3NAxRKmOzRWLYgeuPddGpF4hyQlaAI8wNjWeVjOpg==
X-Received: by 2002:a05:6214:5c43:b0:8cc:f7b7:bf8e with SMTP id
 6a1803df08f44-8d44ca85583mr230837496d6.10.1781595675800; Tue, 16 Jun 2026
 00:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260616065334.422-1-wangmy@fujitsu.com>
In-Reply-To: <20260616065334.422-1-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jun 2026 09:41:05 +0200
X-Gm-Features: AVVi8CfblTJFlp_rs3XQA6h-RcxFkDKEnxJLRMOo39dKPxpokskVOfBvXVTIg4s
Message-ID: <CANNYZj94RgkS+5wsKPLkr7AwdLXgXL3pAeqRZEbVi3rPnE1rEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: upgrade 26.0.6 -> 26.1.2
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238874

On Tue, 16 Jun 2026 at 08:53, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> Import community patch to fix typed enum compilation error in
> src/intel/compiler/jay/jay_ir.h. GCC < 13 does not support the
> ": uint8_t" enum syntax used in the new version, and the fix
> explicitly casts the struct member to uint8_t to avoid layout
> mismatches.

Unfortunately there's one more issue with an even older gcc (version 10):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3961/steps/12/logs/stdio

| ../sources/mesa-26.1.2/src/intel/compiler/jay/jay_to_binary.c:366:7:
error: a label can only be part of a statement and a declaration is
not a statement
|   366 |       bool hi = simd_offs ? true : jay_deswizzle_odd_src2_hi(I);
|       |       ^~~~

This should be easy to address: put the 'case:' block into braces, e.g
{ and }. I don't yet have a ready patch that you can take :)

Alex

