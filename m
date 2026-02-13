Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69384EF99E8
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:02:07 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1690.1771023717647110791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QKzRjrDb;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: colinmca242@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45f10d7eb81so556706b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023716; x=1771628516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT9oHaxheC9iA8tVPV8URQHKZlZt8bz0ZUhnWAy8tTc=;
        b=QKzRjrDbybdDJMK2Go82XHugeRUUTaRwJ9sdDQOos4vk2kyttBJGcfGda+t8Kft7OQ
         XapmwPfoWqNIf+p9gNohDuMcHAqAS+tT5ybPb/yjQA1X+mhYFrvYOGUvHsgm6Pe8bgKf
         2VnXOrsmAFSdlFNgX+sOGn9Eu33gY9NEsn4kmYrI07VDGLA7NAajnhNGwh9XqF+j1rDQ
         IAIEWL9Pyc9DYyKrWH8FbRV0NN8RsthTyXblkbXav9W1hSnuG2C4bntgaNK7O+nb7NYc
         ERzbVF34X9MRsaCRXqBWKRYKvwZN/2S2crDaC5vhhhSzHFSHhMmTjDhNk3KFZLyn5Igp
         ugOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023716; x=1771628516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HT9oHaxheC9iA8tVPV8URQHKZlZt8bz0ZUhnWAy8tTc=;
        b=osdKuU3Cyt5FifurW9NvKbTGM7BKaM2rda4+Ru376qnEyq+xWbTPBrmGg1cMc54AAP
         mr02dwdD1JjlRiF/vYJt4Md0QCLyiQ4JxzKCGucCsZ8GYHDI9w7WwRkU01Bf93gcG7/q
         rdurGx7rMda3KMR4uUowPmzeaPeK+1qEffycvSIydoONBpruuh9ZzkJqEMTfIX27B+HW
         aYxTTmcwoIuA9NwiUdA6STY7lTMGnpTM6MVwt5bZOfFpvC0W8AVhLEvDTRWmdncFq353
         qNqgMc3JwarGxqU/NJN93TL54bZ8ECk/ja92N2oQbfCNIbfqzOHnbgs5I4pKNtYb7p+h
         nWoQ==
X-Gm-Message-State: AOJu0YwQi40oMvVPe5JumNgPFmISbEafkEJrPrxinm+wdAj+tClv3c6H
	JCyfhm0HDaOPdydxzG2XNPMKtTRU71HgZZR+G7j3R1FCuTvWL7tENo3aVvT8zA==
X-Gm-Gg: AZuq6aI4qGOVmy7WBTPU9ASro5fMOFHFYbmT2hqFqVgi3gFlapEgyC2YXmgFOjJUY4j
	MNFLEjCBfVoUDXD9Q+cp9/HSIlkDwMODmHzV5UMyt+GTXwejsAHfZjiCz9gnwUdzQ1n+RqzGvwz
	Lzt3QUDtnfF07AW4Dwd0GHQGiHjNAoAa7Ovpp5qGmPglFwZVWfHYKlRXcT2Xd8WegpCKY74axR+
	beUmEIu4JqC/o+ZRWljkv9bW3iegxsOvJ2jdJZwdIKhJpSKMl9git8eiN1hscdf02OK2n+929UA
	vbfyXiR5yGFg8F3FBLDu71VcQgliQEngLJVsBFdjKcQiM0Y/RtAUKjQ4VM+aEVC20YnKhZ7Xv1l
	QvCMMUH/9nQrP6d6Kz1wUQnmmra8MYXyTRnnh1HkVth92UcFGapOYTtsj+Vj0bLQutYtYKcmDlf
	Bn5eZLPlpDTokn75tAVnk=
X-Received: by 2002:a05:6808:10d6:b0:462:acd3:4c78 with SMTP id 5614622812f47-463b3e6747dmr597059b6e.14.1771023716501;
        Fri, 13 Feb 2026 15:01:56 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf101db0sm8092157fac.12.2026.02.13.15.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:01:56 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 3/4] openssl: Add legacy packageconfig option
Date: Fri, 13 Feb 2026 17:01:29 -0600
Message-ID: <20260213230130.757732-4-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213230130.757732-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 23:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231143

Add packageconfig option to enable legacy support (disabled by default).
The legacy module includes deprecated and unmaintained OpenSSL
components. Drops openssl-oss-module-legacy from a runtime depends to a
runtime recommends for ptest.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
v2 changes:
* Removed conditional logic to add the legacy package based on the
  packageconfig setting
* Moved ossl-module-legacy back to an rrecommends for libcrypto
* Moved ossl-module-legacy to an rrecommends for ptests instead of an
  rdepends

 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index 6b9ccef0b5..7f81b976ba 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -29,6 +29,7 @@ PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
+PACKAGECONFIG[legacy] = ",no-legacy"
 PACKAGECONFIG[tls1] = ",no-tls1"
 PACKAGECONFIG[tls1_1] = ",no-tls1_1"
 PACKAGECONFIG[manpages] = ""
@@ -277,7 +278,8 @@ CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
 RDEPENDS:${PN}-misc = "perl"
-RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines openssl-ossl-module-legacy"
+RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines"
+RRECOMMENDS:${PN}-ptest += "${PN}-ossl-module-legacy"
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
-- 
2.53.0


