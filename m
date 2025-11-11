Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E92CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19442.1762873142065612195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i9Ur6iLw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3418ad69672so2880056a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873141; x=1763477941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jodlcdF4XMMN45pBNb87ZOu1FyAJ+Gx37uPn7UPRN/A=;
        b=i9Ur6iLw+5JNaYK7Qf6Tl7WnCbXK6fCjNp/xm9I3LzP66k63igyrkmmPWUy59j42WB
         4X2lMTOQTjr9K7w/f/6PxWhz8fKh8s24ho12CfBnNFykTRc5WOJL+EUPPTBBSITuD2PP
         rI9iGn2PDZDwltctuU82PfgbfArTKv3ery86C01J8zkMWpM1niF8ip1VL7unoHXwGTvm
         3NRsVMCD3eNncG5eoKgkTPd26vUQa+d3yLVC059/DpqM+9t/1n9mfPLGB15NjtOMWbmO
         Bu5wAQAi/ZEvmRsciAMDMJbvSxEoFFuqTvLFpGve8JH7a1ocq9AlVjHpBOzIB/ahioEJ
         RkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873141; x=1763477941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jodlcdF4XMMN45pBNb87ZOu1FyAJ+Gx37uPn7UPRN/A=;
        b=CE8gjN65Rv3MpTyNum48hnUT2RVB1/RoCwStbtulPcnUoFmYNqTkUwT3aYBBqPSOTu
         JvOyIel5FxxknKXjRhrJ3XaGVE/F3ijNT/dILJd871NqhSa1cWXnKwKKeTZUDugkWoIA
         kjrvrH7Ln2HkRRqbvYYAoBbvOhcwniFJyRbMU7wMrQIJPmjoc/MkZeCIDC/xg2KrPSMG
         27S4pL0WbyzVKAvxfDRP6iIAyxHq5sv8F8kjX67TK1Ux7IDYN7Iato25K08AEVJAVL0F
         rwI78rsN3T4KhT32Pk8mkFqrwAbRpLSJDVIF//fZv6JZVB1COhEK6K/2Qmf/W/Aujnjz
         X3vg==
X-Gm-Message-State: AOJu0YwOXO3pYvQmQc05/pcvmKlMa6c/3SdHPm4WFUy2NbwGWhS2BLIu
	UvXSG1zggFHGZgSvpZROmT/PGj0tDb5uRv+dw+JGzT5IjTQju5bMgy0zBZK6CW2wgq+yElFanUM
	El6fPIYE=
X-Gm-Gg: ASbGncva2AfdW1YOaDoJWfrsIgno1tL97teoAQPSfws0UFvZsBNRmQLvxanq51vyHW6
	6OCCMs5g2u5ox4gnOowGYBSCz2m1yYwz2Qd76BWw1Lt5u/qbpKxRkEfDk1hGBBqdh8aFlVP7cQ4
	0+glCdiwyhBePRmIyulsH2K0PYvOHgsW6rB9NHFStocLCUx1J0MHtkbzgDRk+cm7XxqjYCtjBVD
	5Q1mwKUEbmr2PQy+9MuGdTYCGiCFQZJxDV1kzenpy/EiH0n3tkUGDUbTAMMZKxmmSOhnqbBsCLa
	W36wg4PuLrGYM8Yx4AwwGKS29JD9/gT5Vo5efpbEmPdhQ1SHB9oHAgCZg8dztFNYFx+kjycrLiA
	QY6tmquUjnReo1jkFs2ORjLSEX/qdODMDpWpHZ5Is0HsA76KaRdMNZTM7NEt4u5vw2npODWr4BU
	KSKw==
X-Google-Smtp-Source: AGHT+IFOHdNOORdIxwqqTRRwJHpafvGAOYyOy/IUht53WCY3hlUVoddoeRNj/hg59mfweiHtR3M2jA==
X-Received: by 2002:a17:90b:3a83:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-3436cb0d1fbmr13807517a91.2.1762873141327;
        Tue, 11 Nov 2025 06:59:01 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/19] ca-certificates: Add comment for provenance of SRCREV
Date: Tue, 11 Nov 2025 06:58:20 -0800
Message-ID: <b1d86653f1485aa56fe8bf050931d5b8657ee499.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226177

From: "Theodore A. Roth" <troth@openavr.org>

Provide references for how the SRCREV was arrived at for the 20240203
release.

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6916cdb0f05f6644edb1e432a9421595abb9f0ca)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ca-certificates/ca-certificates_20240203.bb            | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index b198ea77a9..ac0756471c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,6 +14,13 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
+# Since there is no TAG in the git repository, the SRCREV was determined
+# through comparison of the git repository and the data on the following
+# package informatin pages:
+#
+# * https://packages.debian.org/trixie/ca-certificates
+# * https://packages.ubuntu.com/noble/ca-certificates
+#
 SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
-- 
2.43.0


