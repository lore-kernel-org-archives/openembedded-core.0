Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC965D59D6A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15533.1765554018325132394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oUx7w6PR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34374febdefso1412738a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554017; x=1766158817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjfxDiWlNMb6THC92yGflMJ0ZoZqWODd4pNaxLUEjl8=;
        b=oUx7w6PR9MbuJNab+Nq0uAy0PJxlsq33h2tnyla9hj042sBjOhb4ZkR5L17FyYHRAJ
         SborIILHTHzwu2JMA4T+GuBI0Li1G1Zv//eV5ywrrmq28MxjjlXASfkby/uFO96NhaYN
         9ELqyHdlxqcCiXjmKZfWVjzKwr+FME5pCRUcD/NobjaOseFP1DC22d16Sd7LGAf6Ece4
         JTt5fnfLPb8x5TfGZmUUCLveqLpOeL9C+X/ErjJlRGqDBsl5Ipmuo757hOYP3cAHFUzo
         vGqjSjppYg5Bo1fzu9B2Gwox+8yYOi8hQHfFOh/9tD4tanl1xzW+414GiCBLDIPFWnl3
         uKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554017; x=1766158817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjfxDiWlNMb6THC92yGflMJ0ZoZqWODd4pNaxLUEjl8=;
        b=WeqmeeGlVTP/xd8cqzW2lLWz0WhVmvqf3SFA0sDRzW3gSC/Zu8c6ZDBqVnteM6vonx
         PjIKJnmRFfB8pabhntq4Nsk17F29EQKCKZE0zvqy8t9RNFDiUCjwPmt9TcXllzas+cbL
         Gytj2mUYvXT2FN9EnN/+n+U2Oi/BUl/P5HuRPB+3gPe74rIH+XEdtZomEFYftQibXwTd
         yP1sT+C/tYe3Xu+h3/FnF7fja4oIAkAY/bQH4dOlXfy8a1tIFLskrZbWptFPTg9n9A1l
         km/x/xz2uIdotFaQA+coA/a8GOnlwa7VqxABvpEYcr0bxG4jjvhOGfTctmVZvp6gwQZg
         DhYg==
X-Gm-Message-State: AOJu0Yx3eaXFymWXZsw/+i15R5e0dcJZHFbZItj9SaK0WmnXDWeJOFfN
	RkZlVtWIstaWkTPY73OZASIH3otNoKKUeXdIZJVUT2C1V9yy2lPgdOpLFcQ9Xkt7VIdVH6+MfhY
	Bnk6Y
X-Gm-Gg: AY/fxX4qCtX31Rq9s21dR5zKKutu+GgsuS/flF5DgQH7Z6CrUC0aSQtG2FKRAJwZ8RW
	0/ZS3nzq/B2nSt/PZTJgvmgxC6jdyIIZgG8I0IfjEqkftKlwexmzp7PhCrBFHF5N+ReEkP3z+/b
	zs3oOeLOkUHSjyRXIl9dXnfqUu8z4AlRuu7ZDy83BnT96ZfsR4gFS5TBFXdG0XjMsK87MtUNtYE
	JSF/tY1L9nzrZn/XWpw8yzJMkWX46ghIGnteBd5DoT5ntgswYsZGHW/Kqlj44p4+EaqTDUuXVWY
	EMjU+SCqvjU9NdW7tK7rTX6R8G6lbFtY5ytAmOqxDJQXiEMOOgeCUfMQk9S/nKzDFSRB8jiXJ9C
	LXYKSv41dXQqfr+tbDW8bIsC8njsUmhNgVKbYX7k50LJ+422R0eo/DUWt5JK5/U1iSDDEnJk0J6
	1K1A==
X-Google-Smtp-Source: AGHT+IHKjEwQidGTG/NK3j3ZqEH98v2AZAzho5vTZh/Qdfo9pMjemQLeech1ENvq2OBSwWzLV3de/g==
X-Received: by 2002:a17:90b:1d92:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-34abd6c867amr2691242a91.13.1765554017536;
        Fri, 12 Dec 2025 07:40:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] libmicrohttpd: disable experimental code by default
Date: Fri, 12 Dec 2025 07:39:57 -0800
Message-ID: <9e3c0ae261afb7b9ff9528dbc147fb6c89d5a624.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227604

From: Peter Marko <peter.marko@siemens.com>

Introduce new packageconfig to explicitly avoid compilation of
experimental code. Note that the code was not compiled by default also
before this patch, this now makes it explicit and makes it possible to
check for the flags in cve-check code.

This is less intrusive change than a patch removing the code which was
rejected in patch review.

This will solve CVE-2025-59777 and CVE-2025-62689 as the vulnerable code
is not compiled by default.
Set appropriate CVE status for these CVEs based on new packageconfig.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
index 0628ee71b5..a22b0c9342 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
@@ -19,9 +19,13 @@ PACKAGECONFIG ?= "curl https"
 
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 do_compile:append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-59777] = "${@bb.utils.contains('PACKAGECONFIG', 'experimental', 'unpatched', 'not-applicable-config: experimental code not compiled', d)}"
+CVE_STATUS[CVE-2025-62689] = "${@bb.utils.contains('PACKAGECONFIG', 'experimental', 'unpatched', 'not-applicable-config: experimental code not compiled', d)}"
-- 
2.43.0


