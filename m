Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47776C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 06:24:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9166.1716445450499573703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 23:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmAMH4c2;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5206a5854adso6504713e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716445448; x=1717050248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p/48MegVvoPN1djmKCHHixVqmaEmSc9YXWf/MuF2alk=;
        b=HmAMH4c2uf0z9J8zPWxFsDit8oifw/wI80wRXc4x1Iq0TI4C+l1GNuPeFnIcZJnePT
         CrHsiPKtdYjz4EZggGnnS+wGPoPkzzTpfDCR8Rjg8bH/hNBiUR1GL0mkW22kZZwGmyqQ
         q5L9htUen2SdmfK0cs+aOyjnrJwM2mC4RkHPvSxVS4rVmywZowUX9cyzF9p6alNWU+AK
         j7PwrfXzg1JEqj5JGrzEvrRAI4i48OUovPhmcvCE322PDgpZhsgKTZ1u38dLiLy5L4es
         9ICZ++HLyW8mtjlWF81YnlFxtSBt6N6S1jKBSxELiWznzbJPNiBiiA2INWmK/1Ts4FD1
         6c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716445448; x=1717050248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/48MegVvoPN1djmKCHHixVqmaEmSc9YXWf/MuF2alk=;
        b=NsDPhzWwYsilfS8bBQkRxseWGzStmPwV0ra8XZD9H1XI8i1N7qcFkApVWLPNWCz6n/
         yzSrYMCMOiHEXTlvxFMBZqJBBD6nbgfn5M1teb0HEL2I+4D2ATVKoH4Dvlc7OrqrJKdQ
         nRIhT0sapmuTxf9nAn3mNmiKJN1jxUZ+CD/3bcAa/seLz1bCMK046LMUXLEIS6oeQFjo
         UKJVoDT63HHRYZtYqqN6xFv8nHMOfV0c+2fVCSTHvpXyOfBttsJ6Ij3PWA/aVzaC1epW
         XGpZe1dr0EQ1ai37Nt4LI0QK4QyLCViG5SuKA7De2ZvYDKwVF6tQFEMMu1ARkdaE8w2B
         3DbA==
X-Gm-Message-State: AOJu0YwPZ3jAjVmfSE2GKf2r1P+csSLpn+3wedEl5xZ2b0WzDpzj4+rm
	OD1Jaw/ze93kdpjj/fomG/OQFBAHeIgRADAIdW+ZWJOdL5ztT83mPuEmk27yd00M7S77sCK5/Pl
	01dbM1TGOIy2gV7eqYdoZAHHDzqY=
X-Google-Smtp-Source: AGHT+IF03t/uq/uQMAJg284UcAlLY9YLBu6flf0aI6R1DY4PsRU2cwH5ex6DB69vvudDADTF41xiuBBYMxTk9WH0qAk=
X-Received: by 2002:ac2:54a8:0:b0:51f:5872:dd8c with SMTP id
 2adb3069b0e04-526be316400mr2319495e87.39.1716445448036; Wed, 22 May 2024
 23:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <TY3PR01MB1105631CC9A9A05E506C8D948A0F42@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1105631CC9A9A05E506C8D948A0F42@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 08:23:56 +0200
Message-ID: <CANNYZj9UpUdJ2G5ng2Evipz4MeqbK_SuQuuQDpamnnuAxY8-Pw@mail.gmail.com>
Subject: Re: [OE-core] About an issue of run-postinsts.service
To: leimaohui@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, stefan.agner@toradex.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 06:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199778

On Thu, 23 May 2024 at 05:00, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:

> And I tested by qemu and on PC, there is no issue that mentioned in the patch(fd266b1b66844d660ebd8e33fe22c08c8ddaccbf) which added "--no-reload " in run-postinsts.service.
> So, can I submit a patch to delete the "--no-reload " from run-postinsts.service?

I think yes you should. The original change feels like a hack around
bugs in systemd, those bugs may have been solved long time ago, and if
they have not, we need a better way to handle this (that does not
result in systemd warnings).

Alex

