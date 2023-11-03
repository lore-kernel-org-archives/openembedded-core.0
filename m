Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703C0C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 22:51:50 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.68882.1699051906554172231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 15:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZEZ7Tsh;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so1463216fac.0;
        Fri, 03 Nov 2023 15:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699051905; x=1699656705; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0VmQ8jQ10OKyf/u8R5f1doWgNMddezA14x9VGys5tnk=;
        b=KZEZ7TshHnGV1TC5AqN10XOOvUgnKQJdTEwVEkPdoEGNjf5MK3saknhxNICe67r4pa
         3H9lvznxfzYJN3d1CninsPs5Nzb9h6PG3Qcy7moMHhRORk/urgrWNuR+cd1a1etjyB9i
         TkOupMUfgCYl/cP4wlwjK9MltADNyBw/6BYXL5ZGVAXifcy3vWv2ZEyRFwWGkFl+JhZy
         dgGGdMJFWr3sRj2tnirFT1E4Z16CYnmSbOusXdfAH148DRx019gO0By4xtD8GdoVrBaT
         YhiIPxVpSGaM+gIN6oOvUj2I9IPEt/asfofdeTUQNYjT8LPU6LWw9L2TqbptrGLJP2AT
         sxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699051905; x=1699656705;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VmQ8jQ10OKyf/u8R5f1doWgNMddezA14x9VGys5tnk=;
        b=gkVZqtMBfZY4saAkSrLeMYazZB77sNzpaOgwGkMTXtEJgdV+RnS21y6m07hz+sK1e2
         dnpgbPSw6BX7dJ8heACFvumVkRCC2a2kY2f/Ewv4HV+9UUgnv12GojSMeyxLJ0KpdQBX
         HEAXgxc0SoipKJUSf7RHv2t1tMJJvlI40NexP1HqKS8nSP5Sa/O3aG8Kq1cCsO/V184E
         7uuJwVYVRrDNmwuYuaV8wzPHO6WGhGWGhjYBKAkEeg3PgJ/BZEmikT/VtFvj6vc7RYIJ
         IOk9Lyu37KXpQ6yK5cHEmpSJK2vvRpWdYJaQQwQyrlRY1+fQruAx3ojt8k27+HULyBiF
         N5oQ==
X-Gm-Message-State: AOJu0Ywi507VH2xPSDwY3PqdIwJfAiqTbh14x+uXgtASYV2/wB2/hDCi
	wfETTj71sTRX/bHh+q10LymxFOMr7e9saSxPya+LjrHeMrvadQ==
X-Google-Smtp-Source: AGHT+IGzsTLCRiu2s9F3sAENfGDhYQMJ1Sd0Ompzk9jvXR3oCjDWKlcxBafb4gVRTSYUakZ3LJoF6nokAHbDFb0Obr0=
X-Received: by 2002:a05:6870:13c5:b0:1be:ceca:c666 with SMTP id
 5-20020a05687013c500b001bececac666mr22933836oat.14.1699051905470; Fri, 03 Nov
 2023 15:51:45 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Nov 2023 15:51:19 -0700
Message-ID: <CAMKF1srnoQYw6zFu7xvZX59AV_t_Am=L8B_e46jVJsue2JQgPQ@mail.gmail.com>
Subject: Script to apply auh generated patches
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 22:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190167

Hi All

Here is a small script which gets the patch from patchwork and applies
it to tree.
if you use patchwork in your flow, It might be useful.

https://gist.github.com/kraj/9fd27c8763aaa2943e1790d714bacee0#file-auh-sh

Thanks
-Khem

