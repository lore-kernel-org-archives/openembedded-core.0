Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC74AE67482
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:08:50 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78188.1766401729535860347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QTVpkdcI;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a379ca088so41068836d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766401728; x=1767006528; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j2qK4AuxP9WdwOCu7PNEvFuS535CZUv0WD2xcptojM4=;
        b=QTVpkdcIPXclzT4nCL/N4ccWpggTlMIbw6HKWJK3qCyuv7UsHzLRp3ZVnpVfvIX8dP
         5C59DMt+ZL/nC+l+dM7CBPI9ldDj0kwNysPEU9B1WCdKu+5wjSRCxY+vbG+VBQdEUfFo
         wzQGjMdjWn1zxdEW0nXHLlTng7HVoZlQmjdEvljPZjysJPbndAuN1xfbqszc+t9it4PL
         YE/6yL4Zt4aHLdnN6RHtg20Bt7J9zGQLScJb0o/gs1PeGkhRAjzgaUggNwBc5EHSCbmH
         18DjSm07rodhFcqpQEOATkxgHUA6Kt+4V9LI0KQqfxQ6DlgmM9Ap0qGPFFuuZ2Fhb6EA
         UwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401728; x=1767006528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2qK4AuxP9WdwOCu7PNEvFuS535CZUv0WD2xcptojM4=;
        b=Z91HvkMSBQxNp0cLPCReScXfmjLikt0WpLwm8Z7Hjkqse7O1EokhWW7Qzr1xHgR0Vu
         g+MzMGwm4VaKUgwgmF1aBwSaeINLxvuA2850WY+lc78bXpk7MNhiT51HNlBUR7K0xVJB
         d4Ezry0aatWdIQi9LuQLl7cela6xdlqYDXwO0BUOIco3159C0I/rHtyQ39E6iVhLoTj6
         0xludTY1ZaBOkiTyfuTqolmVt0tKNrVWqbcrGoxX0eBiIxQO3s39SCUiXMxnMEg16agf
         Hb19w4lU5QlmJ1OTyjLy7X3j/LZaaUu5edKb1vQ6Yd67SD4OjjZBi5DDCdqBsrmS6AC3
         Q7ng==
X-Gm-Message-State: AOJu0Yy5KNNfpwKiTNjAcBS3NKgHEtNhIjIVi17wK3ZUfsfvbegP/qmG
	RW6i+kdfZAmntmVRDn6M9gpg+GB3v3eU212sBccdrCuIkDBYiYMn0ZCQ0Sa3eOVBSoTdzA27D1E
	8YME0i5ePaPBAH73qzdLHR/XWgWru5Og=
X-Gm-Gg: AY/fxX4dJmvULt3iQhlyjUzExgURWf8h/HjXek3MW+xAd6SkxO2KTOdYQd7mwe7EWSj
	FP5WnZ5INAciWZK8gAp3Xje3lSIswjgRmG3YWsWebqVDbuTdCdhIDNFQT/5ZYVPIXbAmfEJrZQa
	Nii81chgDh1Jt9UGLLnqSH0bdVkw+zc0clVYLEQXA88I4ucYKivB9uOHUP9+50amwgR9NXsp70m
	lxMHyPe04Utn4hjk7U0aMt+bZmB30qZBGYUN1eoaSLDQyGEmGZnReIx4ajmOA9kyzWGDrJhSciV
	IElkW3ULdlD4QpAAUVS5LLdijLwzHw==
X-Google-Smtp-Source: AGHT+IFZ9jv0bvo2EHDMZpk9nwo3orPspwDwtMDe44bS6fWgp+BQvrs5VfGFOsTgwGe6NqFjg+xpN1Mcu2kveT3K6aA=
X-Received: by 2002:ad4:5def:0:b0:880:5001:17d1 with SMTP id
 6a1803df08f44-88d86290b9cmr186015916d6.37.1766401728484; Mon, 22 Dec 2025
 03:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20251222042123.315327-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20251222042123.315327-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Dec 2025 12:08:36 +0100
X-Gm-Features: AQt7F2onzsPHdS_Ar5mrv1LsfwI26Y5UG7oUy-AGJXDUS5qzL6wezhGlnaPbjcI
Message-ID: <CANNYZj_s3=QssJ6aXgV7_KR4hstKNaz3QbacPTRHCHFCGq6JBg@mail.gmail.com>
Subject: Re: [OE-core] gdb: Upgrade 17.1
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228292

On Mon, 22 Dec 2025 at 05:21, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
> GDB 17.1 includes the following changes and enhancements:
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

The commit title should follow the convention: "gdb: upgrade 16.3 -> 17.1".

Alex

