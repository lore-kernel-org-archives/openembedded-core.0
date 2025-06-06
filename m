Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CD3C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:47:28 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.28613.1749196045837548440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4fACU/o;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d21f21baf7so181786285a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749196045; x=1749800845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i33YNi7+KM4E6UkQ8WKXPWqrcBhKLEjT4FsO1NhYpa4=;
        b=H4fACU/oTBig1T/CzLfshuve/Ltyi5RKIwcqYc5/u0+MB2J48BwzSe/TMmEN4FAYAM
         JDyV/239b9nWOBbTjbchNFwUz+2EpYAnx3+iDeLmG0gcqEAzFaSf0fhV9lMt/A1wyJdM
         IIoDhBB4jaYMQhhby2JjJ7idD4HkeIYgoNsvyfIn8rZkra9G7RFIyXbYW4iDl11CcA02
         yudP4BtjCJQjE6JcwGscipDGXpNQbrEiynjnDVf//c7WCPV21Is6Kyh8icYh7fRZNmi/
         IAipcdVHAOUN7skTCVdyRIGrUPBYQ4rF7dRYm1xljNUfTyKN/ysBkiFjH8jL3K4odmME
         2KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196045; x=1749800845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i33YNi7+KM4E6UkQ8WKXPWqrcBhKLEjT4FsO1NhYpa4=;
        b=ix0jwY5mZxAFsFcHmWn+H8MGAGNCirXEWvwl2LWJ+zQLbNr7pGo2z8Iu2s9PTSFTv7
         R5aY9RGB3p9OHy+kOGz0noljP9SUAXFAJIFdsrMvzqo5VcU63M48bZaXmdUqVCRQsmQh
         abs1AehvT1cqnHh7rvN4ruIP8Ede8QdC9aFA6/wFI4ATIC7mOOHvIQ0gErJwEM8RtY8W
         nXvuIx54RO77hXUAOSJZ9BNKsRv//ZnqJHO9/TtjUFR7A3n3HgfNPHBjf/XzYXJgthpr
         /RlV3yphvEzJftF1kX6yQQ5zwCWslPNj0izyUbHnWLPeUE73h0chPjIPAGJP02WE5Cyf
         P6rw==
X-Gm-Message-State: AOJu0YziWbFc4h8DpaRIM8Impl1RfQD0R3xL5ZohsJu9MJwE7bePNP32
	SPswTXuh/YG1jpMefUM6sb6exJqri9V9hZ/PhgalOuzG5YrJlB8j//NcgDSe7caSd5RRc2QQ8fk
	14uFFZfNiau5fnUpQiT6hH3V1lxoNnrE=
X-Gm-Gg: ASbGnctriHWb01vg7DWFgZmNc01Jn1d3yFenTzIlQcR875JYstFBzIZ8Xa5uiqy9jf8
	z7DsIbC4mI7plK4xYkAM9dzGQhCvPe9QzAKM4FPgNU/PWzsaqisXRpMAZuxtxXzPPxgPLMavSq5
	n40y+3vL29KcC5PA42zk0SR/ULKwVG4HbIRIDaZxSYGi1+dQRnAxFy3AOX1NXy+gOTGyZJ7bpwR
	nKHUQ==
X-Google-Smtp-Source: AGHT+IHLcbJLRf6Y5X+/eiVOXl7KWxtl5aTpFB3XOPxVdcQfPDYxkcbEwrqFgTExMgOcBofyVxokpRSM0Dvj6nT1az8=
X-Received: by 2002:a05:620a:40cc:b0:7c9:5eca:ea3b with SMTP id
 af79cd13be357-7d229887d10mr392721185a.31.1749196044839; Fri, 06 Jun 2025
 00:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250605125442.364888-1-dixitparmar19@gmail.com>
In-Reply-To: <20250605125442.364888-1-dixitparmar19@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jun 2025 09:47:13 +0200
X-Gm-Features: AX0GCFsjmxH4Ar3KugjbAH9HWUsNusBY1PsJnxRfmXrSIuhM8t9OkAUcz0lxg4Q
Message-ID: <CANNYZj81Hgsa9_h6bzVah6X08Y9_kEg4CkS5BgEizHT5LEz-yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/meta-selftest: add selftest-hello-mod recipe
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 07:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218115

On Thu, 5 Jun 2025 at 14:54, Dixit Parmar via lists.openembedded.org
<dixitparmar19=gmail.com@lists.openembedded.org> wrote:
> +++ b/meta-selftest/recipes-test/selftest-hello-mod/files/COPYING
> @@ -0,0 +1,340 @@
> +                   GNU GENERAL PUBLIC LICENSE

This is provided in meta/files/common-licenses/. No need to carry another copy.

Alex

