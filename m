Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F78C8303D
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 14:42:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.18807.1751726537362156433
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 07:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6p552P3;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so341432166b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751726536; x=1752331336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++uMIexJ+oi/vK/qXzSSnCeUy7v+LBj2oisKMCjoNww=;
        b=b6p552P3h4EwSSgpJwcK5W365ftZE0K4tXimHNgCgp59lRKbsIjpsqPQRSELKCkO9g
         4zidRSYonzfoi/CSeOlzpnzoSRJep0dv9Kd/zZQp8kHi8jesoYChncDytN9PpP9/sPEQ
         nrIkz7AcjI1x3hKh5mmBmL42xmzLPpgNSpj3h67Pg5oLM2fLkeqWMJVROYhhiq1h+qkL
         kCOILchmNnzhipRuQg/Pk6zzJhmtzeOMmwp06XtwcciHpriKUzQkncKznCYuxIMQMBM2
         +TOSTou817H8Ea3gD05Yv8ZvEkckNXKQG80sPWYEVhiosNW53n804Ucat1uCiy9JyQiS
         18+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751726536; x=1752331336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++uMIexJ+oi/vK/qXzSSnCeUy7v+LBj2oisKMCjoNww=;
        b=AG8PcmIsvANQMiYvniNg51KThjpt7YJtLa2mzNHkziFu7NpMBNSeizUG+ZAmPz7+w3
         YDFxNPJxgPB9b+ZT8LEDeby+ERSbNOWjc1c3CkKDKTNr4DWIJ8Pt2uCpysgkeCMD5Dr4
         lH8JK6oNRr2fujqKbd+bkz2nMt9y9QHHSJKkIRQF5PSuEP5d/VnDW74i8bPv2pVSwZG0
         iS4r0bUU58McveqEHBE6jWsMmWMVR4YBWlQ//rFBZl+j5HtGgpfHwcgWhCCjT4yRFtj1
         ByGkK6EPCgd0MW+3aMQ79f1xejQ138IL5FcfwbNsUgw0UE60yAcLtRAcRBdgZXQ6HEAm
         1kMw==
X-Forwarded-Encrypted: i=1; AJvYcCWbmH8gmsTr+eT+AduneYTBA4Lto8s1rG0JYQ6BIVQaqswn8gI2H+jNWol7Pnywrv2xCbDe2Q3KFA1rGnsLcy7LWg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLgZuyHdxjp1jI6U78yHBqLQTsPMJIK5TFcHTFcTj57qDMWi+3
	KAnLlJfULqPg06tje1E3XnfzJtvGQN2Dq5956LoGJrmANCDNOuXAgMYt
X-Gm-Gg: ASbGncss5ZUO3RUt0abXfUeWarA8sXddKU7b801TNCGFZVaQ49RdyEas8XJg0ZTzm3l
	XjsfgRcON/L7pO5UeYEPLotKTRAn7IVNd7/u7syGSW+BUy9UGGxocTymKONhw9dHkoAAOm2vn9e
	PBhDV5+ZGfoZB3/BRNNMrXcSq8h1MycrJfUJ+taSpu9sMS4yPQiqIoHyItL7vljxj0/lAjAMPvI
	NSo++eyQe9z7xXJBUgh4CKrupovckQGIWm8WJtFTjLMsTgWGC2Ucolf7ZMsxMNfAu7p4E7BMMsz
	2SCenUXqk6eIm5BCdRITQXY38hymBTmUYTrkOzRcX0CacSUZ+kVEmXQ=
X-Google-Smtp-Source: AGHT+IHoQGf/hSHsX1pRHJCpuJy7E/1R1N+q18/B4s+onY+mb10UAXiBg44MKcdY/OHNaumCC3BAnA==
X-Received: by 2002:a17:907:2d86:b0:ae0:de4a:3153 with SMTP id a640c23a62f3a-ae4108ba1b0mr245590266b.38.1751726535387;
        Sat, 05 Jul 2025 07:42:15 -0700 (PDT)
Received: from nitro ([93.159.20.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac35e0sm358110966b.73.2025.07.05.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:42:14 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: michalwsieron@gmail.com,
	openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Subject: Re: [PATCH] bitbake.conf: Add relative path from B to S to
Date: Sat,  5 Jul 2025 16:41:26 +0200
Message-ID: <20250705144126.36056-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <ad0656d62bfd203a2f0c984d15e683ea3ca01f46.camel@linuxfoundation.org>
References: <ad0656d62bfd203a2f0c984d15e683ea3ca01f46.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 14:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219954

> in that we removed -fcanon-prefix-map thinking it worked and it clearly=0D
> doesn't.=0D
> =0D
> We *need* that option and it will need to be put back, probably gcc=0D
> specific. Copying Khem.=0D
=0D
But then what do we do about clang, which behaves the same way and=0D
doesn't support -fcanon-prefix-map? There is also Kirkstone, which is=0D
still on gcc 11 (that option was introduced in gcc 13).=0D
=0D
I also went and adjusted the 'reproduction' example a little bit to be=0D
more similar to Yocto setup. I put the meson.build and hello.c files in=0D
a 'git' directory. Then from parent of 'git' directory I am calling=0D
meson with absolute paths to source and build dirs (again to mirror how=0D
Yocto works).=0D
=0D
Now regardless of the order of prefix-map flags I get the same output:=0D
    $ dwarfsrcfiles build/hello=0D
    /usr/src/debug/hello/1.0/../git/hello.c=0D
        /usr/src/debug/hello/1.0/../git/hello.c=0D
which reminded me that this is the actual reason I first saw this as a=0D
bug couple weeks ago. After all, Yocto won't create a 'git' directory in=0D
the -src package.=0D
=0D
With -fcanon-prefix-map it's a little better:=0D
    $ dwarfsrcfiles build/hello=0D
    /usr/src/debug/hello/1.0//usr/src/debug/hello/1.0/hello.c=0D
        /usr/src/debug/hello/1.0/hello.c=0D
=0D
Best regards,=0D
Michal=0D

