Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A896CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:01 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.25999.1758748675624585840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 14:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3WZycZiI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5565f0488bso196537a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758748675; x=1759353475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0+BIpiRAUuLjHOnrTlWCXa8NFTdVnCmgA2nEAx+CBs=;
        b=3WZycZiI6qgREmU2AKMtI8QoYCsFWNwY7iwoxMdE3XhSbQzEXyLoGWWt84AltB1YLi
         9MiRdQ1l1cHGvrKI0RAh8gUZadDO36Dbj/6HZV7936w8gu5n0OXq8hP+X4LD8yBFl26o
         mrSE8kxDvDhhLTtHKHr74VNOimdAB2sW3UCHXYYc3mfAwcUQQqOxIZB1Tw/MyYWL0OJd
         X5nd+TlhkeM4fN3sUN1PUbU7lnVUTxZCstQEvFaoKXq4JGHS5o3xj1jmf/Pb3uGMNBBJ
         qH4DYHgNsJRnvr1u1Y4KuXG/mU9P4YJZxfPslIq9eGMWudd4tHvS7wDa+VzR+Lm5j6sA
         k4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748675; x=1759353475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0+BIpiRAUuLjHOnrTlWCXa8NFTdVnCmgA2nEAx+CBs=;
        b=bV/cCWA8BPkF3DpW6gmwKbAOijwgYt4cgWYXrvrc7VhYkEdsIbryFCtPMGY03k6FU4
         vngvLHcSp1AfLfYjm4ZXU7ltkwyTZw3GGBwwcL1DJaSQOqxxG+/HS17sRHIdyd5647WC
         bAiuUb0GWcqYD4zbiX7GBLo3zjw5oblOB3gPLou00hdtAaTPdjup/+zN4M5pO/jOsd96
         QnkbKJS/F1V//aWi23rmRLdNcsw4aI6mySU5tcICYmd2+WpPItoGHRQhZMiXnHr/c0jD
         0MGIDWD5GTUU9T3yL5Difwk5IaqYqYC0EH+UrKf8dXKLUf6ONcAO7qHcq46/OOGMshvr
         MtDw==
X-Gm-Message-State: AOJu0Yw0/jGP6kVRywBZ7T19Id3wI3ieKJvvqg9lDCyBp/RCcCXONOcq
	7BxKqGe4QsUIvASq1hrIJqtlMjZw5VvYBVS2GodaJts/TjiZj5iVngQ2UAjeEAkRFz7MX1RObc1
	smZ/qq2M=
X-Gm-Gg: ASbGncveNAwlV5u0HFe9KYvmRcQnlYpiBKQlO7Mxbqxe6YMmVetdJG/lvTyyQ3dreI3
	no93CWzznROTPq93r5cvzVA09NyYKsNRj019p0ZOVEaq9UOv+5k3v8NlFgp8uLNetZKX+IQETOe
	Ajlpo6rQsM64zjbSqcH5JalA+tXU2z5aVyt2MZ9PelX+RN9yb0xWIddgV1QjF7vh5F13c1SWYCB
	2IFKZH0CSo0uAlcsKtWh3oUx/ENZYTE7fzCwEda9CBzjF+1AcitQLl8gbRyBOcjUObZVCi35aDO
	Uaf6uFpUwaGTG7F2HIFOKG3blYYywy1bl6IXCNCpAGdX/Oc4HIpq+nMxoeIZUc+K2l6Ga5T7oLN
	JLGxvqiodgjCo6Q==
X-Google-Smtp-Source: AGHT+IH5TawzpJQrYfPjXAQu9Vk++Jgwou2G4RdKb9QUpJ/jHzjvLcGokge+qhA8VykCrmIITbENYw==
X-Received: by 2002:a17:902:d60d:b0:269:8edf:67f8 with SMTP id d9443c01a7336-27ed4ab6084mr11316695ad.52.1758748674885;
        Wed, 24 Sep 2025 14:17:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6702cf9sm2194555ad.38.2025.09.24.14.17.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:17:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/3] Patch review
Date: Wed, 24 Sep 2025 14:17:47 -0700
Message-ID: <cover.1758748538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223989

Please review this set of changes for walnascar and have comments back by
end of day Friday, September 26

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2435

The following changes since commit d728ec95291f05cbfb436eabe8717ebe9a0dc11d:

  python3-setuptools: restore build_scripts.executable support (2025-09-22 12:42:57 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Ross Burton (1):
  expat: upgrade to 2.7.2

Yogita Urade (2):
  curl: fix CVE-2025-9086
  curl: fix CVE-2025-10148

 .../expat/{expat_2.7.1.bb => expat_2.7.2.bb}  |  2 +-
 .../curl/curl/CVE-2025-10148.patch            | 57 +++++++++++++++++++
 .../curl/curl/CVE-2025-9086.patch             | 55 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.12.1.bb      |  2 +
 4 files changed, 115 insertions(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.1.bb => expat_2.7.2.bb} (92%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch

-- 
2.43.0


