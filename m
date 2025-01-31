Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A7CC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 19:20:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.27543.1738351205560960696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPsU37em;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so1309021f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 11:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738351203; x=1738956003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSU3a0C/iqAVDAKOIA2m5kxdiouXHciDCC2BMubpsKI=;
        b=PPsU37em4RzMfM74TgnYp4a+lcF4zr+HFH1dc3KgnG5AOtlk2G5CNoIx8IPktbGmqX
         6HvxSXtCB3Gf7HlI3cBEWb5g1ycXJ2QSFdjN/+QwYwJRWi1INDfoxh2v6bsUi39Hlp1R
         Epk+KTsZfBUEJm0XrgsVOOuigo8CQfO04GtwwUpz3qJ0zVsrjZH3cKvYTyR20R7MkqWs
         YclKSvpazy61UqT5gNQ5ISZm8hyu6iU6O6eukyEoa7phL9v9P3Ac0Oq9qOk09Ojhy8wV
         mss3Rs4Kjd4xi50HKHlPdj5Skc7MKngELi2jKG16YCISYNpAmAJhoH78Fu4vk84qKO1t
         zhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738351203; x=1738956003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSU3a0C/iqAVDAKOIA2m5kxdiouXHciDCC2BMubpsKI=;
        b=FTomdWWmfp0eyGPIJUpQXWJwQXKyve9SmrGAjjZRosUAAzjCc9/SP7nRws0w59ocHy
         g4kfkGc5MXCGTaYFM4g8tZCWkyBSs4uPZZyuRNRsdIeWDjpuA/8C+qQ1tcDCbYBA48n7
         t4wYC4/0VcrRQU1PxxYQSzPminmJN4Ck4ag3piWcFedoSeMoLnHQyQWmQOJF6KHGMSJU
         Y7tbFkr5w0AFu/sBdtUJZQauusmRJJky98vhY6oTW4hGLj5z8rxRijhMt3YX7je/DOl4
         7eeV8LCVuixuHNY1BPs8Y5uYgYDirCo532osrew16Q6AuksGzUE3czs1OqsUAKGzvrS/
         c9BA==
X-Gm-Message-State: AOJu0YyyTUV7F938v5MPCW/gYMmtKJh8kULED0+1ydNEqZFEagukyI1B
	qDGrZq2W5cf0aJeO4aGXxIOSRu1Ck5S7RLl4wdxOGQKSG58XXWrJ7O8Zwg==
X-Gm-Gg: ASbGncs7eekAtKUEXwsh8T8QWv0/fQccIfZuXl6bCXWTIlUq8OH4Nwum+WraLXr857z
	0GpKhGQZgvn9TLKwut4e2TaSunn+LqI7LmAOnEfFz7w2ne7UxEjG8QINUem55WRDgpcff9ZBRXq
	d2M8/BCAMNgoVuscIiqXc8pUepKqY2JZymCtxbDj8ThGhGubu4qXb5cR4CPkcOaJnQobkBXGhu8
	EGDvQl4EHEehBNXJyBR2ocjoSn5mXRSPaYcGuRBQyYz4BKF/ZTnqTLVZJm4D1kIYZhaIguqlA6A
	zWbfOGD0SF+naFkHCp0rocjIpxOh4Btm1w7wDQQZ
X-Google-Smtp-Source: AGHT+IGA5+/sPd8N5g8Bh9aQB9xJY/ZGUNEG6mzbJ3zNdKBlWmtatit9rmqiongcyC96lgvyrEk7YQ==
X-Received: by 2002:a5d:588c:0:b0:38a:8f77:4b with SMTP id ffacd0b85a97d-38c5193206dmr10588520f8f.5.1738351203307;
        Fri, 31 Jan 2025 11:20:03 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122707sm5494937f8f.50.2025.01.31.11.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:20:02 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
Date: Fri, 31 Jan 2025 19:19:48 +0000
Message-ID: <20250131191948.396835-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 19:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210493

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* gpg,gpgv: New option --assert-pubkey-algo.
* gpg: Emit status lines for errors in the compression layer.
* gpg: Fix invocation with --trusted-keys and --no-options.
* gpgsm: Allow for a longer salt in PKCS#12 files.
* gpgtar: Make --status-fd=2 work on Windows.
* scd: Support for the ACR-122U NFC reader.
* scd: Suport D-TRUST ECC cards.
* scd: Allow auto detaching of kernel drivers; can be disabled with
  the new compatibility-flag ccid-no-auto-detach.
* scd: Allow setting a PIN length of 6 also with a reset code for
  openpgp cards.
* agent: Allow GET_PASSPHRASE in restricted mode.
* dirmngr: Trust system's root CAs for checking CRL issuers.
* dirmngr: Fix regression in 2.4.4 in fetching keys via hkps.
* gpg-wks-client: Make option --mirror work properly w/o specifying
  domains.
* g13,gpg-wks-client: Allow command style options as in "g13 mount
  foo".
* Allow tilde expansion for the foo-program options.
* Make the getswdb.sh tool usable outside the GnuPG tree.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.5.bb
index ec75960235..97b5d8856c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
+SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.43.0


