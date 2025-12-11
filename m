Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306B0D41C21
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 11:06:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6939.1765451177366793806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4vcDexu;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8824a756771so9758816d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765451176; x=1766055976; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OxZWzdeumqHJ/+DAhPOiQ4oElqlCYY87j4Vawrmy+rs=;
        b=N4vcDexuVY7RHWR2NEpLC4X8x8sxVsbRc1KiZbffwlyylrmREZwVETaRyWuG+5DJ2F
         w40XM96A8jdnpTc4iHGgIob0Cnq/beS9MLZuarBLg2GqLjWHxo2v/HWiuxyZU6yefMgm
         ZZ7eJy3HoRS95Hxbu6Te6x9yk/2PrnKk61jLVXNjBomtCpBO9lxJX5CjYiHyds1abOZ1
         8f/rUYCDms92CshZV/xApD+Vow/UZX+B7zoI0fJJbv1CFZwdhhrPex+ygcCRLUgxO2Sx
         +86BrmWZ8DrT1fmlzHrUP0n5sD/t21wh71PNeKp/R4qtAEk6c1p1AMYaOimitCx52t5R
         ipkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765451176; x=1766055976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxZWzdeumqHJ/+DAhPOiQ4oElqlCYY87j4Vawrmy+rs=;
        b=f5qSq1W51OUs2vfbbM0ZZFz0uq9sGWPrNyRjqeOcL88oagGpSODe7FymCEIKz/BPDM
         r4IHSpLnPXbSOJtRP5Ppn36bt93Gk4zspTUiVgvk6kcPXNTSZSDh32nEG7Gpdu4cfnhl
         hS54DySAu485gKA/JyI5lleYnOYg4GK+xmd6zf9Ox+QkmMzs7vqJQBi/s/BvX2Etr6s5
         d+Ewl7CWrH2Ci3zOyvE2BcQ0J6MiU2HEr1JCxxQ69mYBf0v3pPukmzf2o4gQQ7ajxJ4A
         3xngbsKQ9WlQXt08tjCAn5jxZyGJyOPclJJfzyyHHgK7yJJhLDt1ZSy4HpCpBfkgkxnc
         Qczg==
X-Forwarded-Encrypted: i=1; AJvYcCXnAKZ5oQj9c1HvzVKibSAxR6shMHw8Hfdz50hfraozkumG5EnsV/dyK2D5OTHM2ciW7ilWWumH4eV9vGD6L4ZJzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy46lpWQHfhRgadLm5biKkmm9UUXbN6WL4rkyS3osrjaNeea50+
	T7nyfRpZvcMQ6COq7W5aLWhhqKyfu2oEomQ5uVfXHXmv1rPi3zTiogxFEn3d2rX1RE1ZuKELnhB
	XhEBNqt8zQTBXCLAlnpWL8tnmDEGXOME=
X-Gm-Gg: AY/fxX4TJzOVi+nCrwXxuAaURggXY/eGlPigdBm3NqCwWHgSbJ+EzzBtAPGy7g1tBBf
	SW52iOpeXAlKFkNhUpasQmqrwTD/3bBIuFPwoMIotwc7miVokpMzfzUhSfeGs8GD73PTKE68dC9
	txzb4Kflvi85N27LWKfvc/UKZAKo3TMrkkh9DRwyjEwbZeFHprpk7OJbWpaLhfNpxh2VIfoU0KK
	j1TzQvowiwIC48Qjkkhxf13of2OT+rno4RY6u2ZnpZvxOtL8PbiGWs0jIP9IiyK1NI9+4lxHWXh
	b0GaJLKEE7/aL/ydeRLQZnRjvKuhCw==
X-Google-Smtp-Source: AGHT+IG7Lvd8VgkQOC9nJrtj0FRd9RtN7Waoz6RvSnJl5JdMGUP2OQe8HeL2A4YpTLFa7y56pyFZthgjo1cwiS+cX3s=
X-Received: by 2002:a05:6214:449f:b0:880:5249:be3e with SMTP id
 6a1803df08f44-888716cb48bmr20858056d6.13.1765451176321; Thu, 11 Dec 2025
 03:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20251128065949.7462-1-liuyd.fnst@fujitsu.com> <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
 <TY3PR01MB11483B8E76FD565C2B2BE38749BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
 <DB5PR02MB10213BDFA0F45360B27487270EFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj8ruGgfaDju0dpnch7Qmum2ZYTnEechW8HbCgXqj3tEkQ@mail.gmail.com> <OS7PR01MB11486702E8368904865CAA2EB9BA1A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB11486702E8368904865CAA2EB9BA1A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Dec 2025 12:06:04 +0100
X-Gm-Features: AQt7F2qDXqq2jLS13LSsi2kmmuMQ4WylgamiDCiD3QTsv38_TicQqlpnhOPwcmU
Message-ID: <CANNYZj9PbOwdLVW6=rtFgDveEGdjzndA=TCwof+jGuKZUqQwrg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for multilibs
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227519

On Thu, 11 Dec 2025 at 10:54, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
>      Can this fix method be accepted or we should find another way to fix this problem?

Hello Liu,

this was just discussed in the patch review. I think the patch is
correct, but the agreement was that the commit message should
specifically say what the failure is, e.g. copy-paste it from your
builds, and it should explain why it happens. Can you send a v2?

Alex

