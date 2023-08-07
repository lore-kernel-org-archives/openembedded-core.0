Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5EAC04A6A
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 11:36:12 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.32256.1691408172070514626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 04:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=w/IhZlZG;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.177, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-583fe10bb3cso50521327b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1691408171; x=1692012971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olhP2zo6qjq2+GLcUGDEAuTul544vci1KULkvFembJg=;
        b=w/IhZlZGMMKmxMZkpJo3r5wlBVo+yueh+FPxxFQi6WfPivCnV9HRWs/V0QNK2mSI0w
         pZIsb1XK308QZ+v8/oHb9hMGRonQuErInjdgTK+Apc5xVWXg/XWkhFkMfHYk+yiwHLqo
         Kb5jbkd0RerEwtrQN4Fo/BGoU4UUSdud5vdHm5tb3Zw8MCHK4GSafZpIAuS2tz5IiL3u
         yMV+gAoE7aMlgEIbmypu0OfRyNVF0+hFU/6MMOoNX6FWZbZnfHabHLB2CxMffnKXwfm/
         lDg44c+NjuWGqVFrUsrtvlta67bF3I1TxRAN6wr+j2G45n9N6xeVgCuDj3qk9UThbITC
         STMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691408171; x=1692012971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=olhP2zo6qjq2+GLcUGDEAuTul544vci1KULkvFembJg=;
        b=HOSfCJ/dv/F7x649irm5TH8GvBPEf4m23FmAW/THN/iKxstsafFw+62D7ZZuuUrq5N
         jcIit68q54i84c/lTK4bIdeoIfeHL0pu2r8zFIVaqUx6eS0/IfUC/HwGSFcTO/XU5U/T
         Y1fNzvDxKOT2OBJANldO5yzFAB4M19/S1tCDrDT+JWFNCM8oikX62gTM97sZqloigXM5
         tmflY3SzdmZPI6RRm7cfptXNef8XdX3mflUPrEberARRNLcexJl0xMbf9Otv2rFF4Tb4
         ea1Zz4sF5H4roRADxzhIDEl9rNp3H+418+1dFCdIH7S0PYPmiNXJ+lkUtmP6YOYpI7zf
         Ceog==
X-Gm-Message-State: AOJu0YzKWtIdTDHsgIRzteqTTCidpQetZ44LNyhtwSBaQBtxgxVu7ANo
	X8kynvkWtIKj4Y7STl47VJnRVNtU2Vbu+WZ++4V0gA==
X-Google-Smtp-Source: AGHT+IFQtCq1IQJlDrnp4UYuJ3BVL9ykM9rZsdb8UrDCxg/IiCQCapItAU76Ct0qAGICL+0Q7UrVlA==
X-Received: by 2002:a0d:c484:0:b0:586:9c4c:f7c0 with SMTP id g126-20020a0dc484000000b005869c4cf7c0mr9076175ywd.52.1691408170864;
        Mon, 07 Aug 2023 04:36:10 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id j12-20020a81920c000000b00573898fb12bsm2664107ywg.82.2023.08.07.04.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 04:36:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-583f036d50bso50566907b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 04:36:09 -0700 (PDT)
X-Received: by 2002:a81:4f54:0:b0:583:2ce7:2e10 with SMTP id
 d81-20020a814f54000000b005832ce72e10mr10522327ywb.27.1691408168941; Mon, 07
 Aug 2023 04:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230804200438.1651568-1-otavio@ossystems.com.br>
 <20230804200438.1651568-3-otavio@ossystems.com.br> <2023080708562589664a88@mail.local>
In-Reply-To: <2023080708562589664a88@mail.local>
Date: Mon, 7 Aug 2023 08:35:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKojK2nfFaTN5nAuw2oUy4=yXR15_XN=U2HcL+4yFDZRMQ@mail.gmail.com>
Message-ID: <CAP9ODKojK2nfFaTN5nAuw2oUy4=yXR15_XN=U2HcL+4yFDZRMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: mimic systemd behavior when
 running in sysvinit
To: alexandre.belloni@bootlin.com, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>, openembedded-core@lists.openembedded.org, 
	Tom Hochstein <tom.hochstein@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 11:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185594

Hello Alexandre,

Em seg., 7 de ago. de 2023 =C3=A0s 05:56, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> escreveu:
> I believe this change causes this QA failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7576/st=
eps/12/logs/stdio

I'll check this. @Purdie, Richard please hold this patch until I check
the error.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

