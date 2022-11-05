Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F481C4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 14:30:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.6509.1667658636789060572
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dRDCgqeE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id y16so10513674wrt.12
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ruSsoW6df02gLxPOYe79q7daglKnxAX0b4TzyKvQySA=;
        b=dRDCgqeEVr0EPPtygm/IO/qH57PI/BsnlghUWI0U8kqg8KBK63hGU7/3d2Pf69RvxH
         NrJgrEOJzcTUw5QHTMcsNgyG6c1y3t6B515sudelzjzH1vl8uDcGTvIANbuEc0qdKo6q
         HASwZEq7hxrx6qCbw+NxUVtP67KGMlHCChzYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruSsoW6df02gLxPOYe79q7daglKnxAX0b4TzyKvQySA=;
        b=I8FmGVmyI7Mfbv2m6Xc27clDSZeiqSyysfNOeowSPFZ8G5hgFgrUvl5AjQN3vp+0wx
         GcpIRGLlNubMnyh0FWxba/eik8PszaRsPjgaKVE5c4E1hcxnfZUoG5yCLAdlnGoYxhPb
         BRafkq6NhzfU41Hh2OpfM79acH4I8lINj4gj0W0sjkxouNLmnU9yExVdWyTi3n9PdA6p
         MDaAovnExIf4BWY085ijyW9r6/Rv5u9ydUDj5JcyCb5dbcv0LoRYLXdpb4OSw1ibBekL
         b4v8yahgG+mqyQ6WYq1bysoiL2FouNAE6vfDaRYCKEKSz5c1x5A3KvQWb6qe17ovgDV3
         wDQA==
X-Gm-Message-State: ACrzQf1fqtTyiNhLTPM3N8kdNfvFKFJCPrtFuWIFbcAa01M+sKIeY2fQ
	HebU8b9RP5aMeuI3M8wapLmoGWszLZ6j+g==
X-Google-Smtp-Source: AMsMyM5dNVnCfSZYTlkOaw2BrwU0odTKxjL/p2rN0sjqc0KP/E8QLPpMFWLs/JhQywjZOnyfpK+tIA==
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id e1-20020a056000120100b0023661f4b384mr24868087wrx.505.1667658634712;
        Sat, 05 Nov 2022 07:30:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:364d:9947:1359:2fc1? ([2001:8b0:aba:5f3c:364d:9947:1359:2fc1])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c4fd300b003cfa26c410asm1861358wmq.20.2022.11.05.07.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:30:33 -0700 (PDT)
Message-ID: <78b40709e286d7dcb076b66fcf46a97c57842b04.camel@linuxfoundation.org>
Subject: ada support status in gcc-cross (braindump)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Nov 2022 14:30:31 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 14:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172746

One of our patches submitted to upstream gcc caused a regression in the
ada test suite. To debug it I did look at whether we could enable ada
in our builds.=C2=A0I'm writing down and sharing my notes for the archives
in case we ever want to pick this up again as it took me quite a while
to work this much out.

To do it you need gnat on the host which on my ubuntu system resulted
in something like:

HOSTTOOLS +=3D "gnat gnatbind gnatmake x86_64-linux-gnu-gcc-11 x86_64-linux=
-gnu-gnatbind-11 x86_64-linux-gnu-gnatlink-11"

and I changed gcc's LANAGAGES to:

LANGUAGES ?=3D "c,c++${FORTRAN},ada"

Sadly this fails to build with errors like:

| s-valuns.ads:55:04: instantiation error at s-valueu.ads:579
| s-valuns.ads:55:04: expected type derived from "System.Val_Uns." from ins=
tance at line 55
| s-valuns.ads:55:04: found type "Standard.String"
| s-valuns.ads:55:04: instantiation error at s-valueu.ads:581
| s-valuns.ads:55:04: expected type "Standard.String"

which is basically because the host's gnat version doesn't match the
target version we're building in gcc-cross.

Digging on why a standalone build eventually works out ok, it seems
that when building gcc stage 1, ada is built against the host system
libgnat. In later gcc stages, libgnat is built using the new compiler
and since there is now no mismatch, the build works.
(see gcc/ada/gcc-interface/Make-lang)

How we'd solve that in OE, I'm less sure. We'd probably need a gcc-ada-
native recipe which was an ada stage 1 compiler which we'd then
configure gcc-cross to use to build ada.

I sorted the upstream issue so I don't plan to pursue this any further
at this point, just document what I worked out.

Cheers,

Richard


