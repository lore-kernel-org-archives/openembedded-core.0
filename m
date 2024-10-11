Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA88CFD2EB
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:51:59 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.7034.1728636716904617018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YhBi1f5Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2facf481587so13971531fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 01:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728636715; x=1729241515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EiUSNHcTT4d24gNG0QEJMP/+Xngv1A14JD8aJUDqL/c=;
        b=YhBi1f5QcCh0rjhmtWAqNPH9lMjKVKiXZjxovTQgwHEn3NVY4DcL5p/J7dp7WJHGT6
         SCwS0kUD97VDU/Np7P4J0SPr7eZalWEJ+kWOmpjj7KgbUmuSrd1mYMrrs9lfZYe/NDFm
         miVqQHQPlrEtbNP4f9bTIBV/Ck5EHpDYZ1ctoqOGk+WBDkZ6llPq4NgYAEj9w3X0+w5G
         TeuTlFgk+YRIHb1xX5ckHNhVS6Io6uGATmaDF0Or0+43n8K6DB1PDfvuBCd2il8RTJo+
         wBn++adCa5dTQt4umI+gCb2gmPsAdwuEObhb83+7bo+z7O8WGVMXslTfxADN98PakGG8
         coRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636715; x=1729241515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiUSNHcTT4d24gNG0QEJMP/+Xngv1A14JD8aJUDqL/c=;
        b=lO6+Z+e5M8dzmLOfzkANJxHIe4rZTta6xKVDCwTVpkMS0+t00BlJWlOfekFCvVO0Ok
         njbdcEX0ehitXkqhv4OWLjCxo4q8cG9jgBD6Kogvwip1rjYKpbf22fxnfbTQAqRrMKwt
         v1x39AiMoTbe51YV2NWXed0HLbX2AUveh4oOPFI6Oe7m4Hq7B8MNaYghHZusnyNJguuo
         JYCGQBkgQB2b46Z9nT5S7+CULnrRKOKTJCa7/Gl3f3AaVr0CXUxC/YLyK65+m5ZfcFUl
         h2yQlF5ddFhTFMhYo1AtwLSb1buCBoM5KReQ5p2UW6HC+Y+cDkoQ5yF10Kj4R8JiXyc1
         TpYA==
X-Forwarded-Encrypted: i=1; AJvYcCUD8x30ohe0x4NVBSkubOm8DLrtJqRReHUcNUy/QPaymuzacMUkv1fiIX0u9vqERYiYoqLxj6MUukVcQza7tw0bfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwbYcxe5wGLQvOfJT/a8Xn6ova/OcaLGKtIVBlnfze70UQFHel5
	O/iAxKX3vbbtnGpPa+RBkZQUCoUK4wzBOjLq4/9Wfi3PhYF6nr04X55ok6hA4ki7A2D0CyBhwLS
	kYn2coPNvGVl/1vN6LiaDwp2UKXo=
X-Google-Smtp-Source: AGHT+IH6CdEjm/xqzet1JzWzBkpnpc1sIflh6r/+1vhBEJu/7C7MdoZEWvBCtYRWiyq9MyWTj/rKQNlkzR+BF2hVAxs=
X-Received: by 2002:a05:651c:19a3:b0:2fa:bba7:2699 with SMTP id
 38308e7fff4ca-2fb32715fb8mr7589631fa.16.1728636714474; Fri, 11 Oct 2024
 01:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
 <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
 <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com> <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
In-Reply-To: <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Oct 2024 10:51:42 +0200
Message-ID: <CANNYZj_-phKSj0smbkC=n5UVgDzmB5zxoOsOSnVhA=unGaJzRg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 08:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205665

On Thu, 10 Oct 2024 at 23:01, Claus Stovgaard <claus.stovgaard@gmail.com> wrote:

> Hope it make it more clear what workflow their is broken with the
> change, and why my patch suggest to making it a configurable option.

Thanks, this is much clearer now. I do wonder if we really need all
the complication of having an extra variable (that isn't tested). Can
the dummy app recipe be written such that it takes the list of
DEPENDS, and adds everything in it to RDEPENDS, with -dev suffix?

Alex

