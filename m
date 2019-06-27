Return-Path: <jpewhacker@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id F27DD7D674
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:54:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d126so1286515pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f/iV/DqpTJL4gawb47vkCH2HWwJkvLhFElVLowieQzU=;
	b=ihH8zPVBl/Vlsd+1ETKC7YzOCEbIAz7xVUHJqsqRaHOlLWqX3txnmI29JV977WyaG6
	1WHlCCMM5rXTjo0ohaIh6qXMjGZZW1TjXrhpjTqnNKGPaRe/JdU1ZN6AJMnkhs+OKz4o
	YqpvKfhVcDGnCIssI7BGIBs7O4Xki+8eXGjhZE1ak2bvn6wQZKiXSAdp3bEqAocnD1Br
	zXWuXvRbl6dh3Mm3358CBfu8Qzy/ud2YVKmhTHX1X+syWa6vEojzGB8r5iubg0eKbZmh
	e8+Oyv27I67y3U4gz4qqFlMHLnr/1SmdHxxYPVR/IqabWShA1JwX0Wy+08ctQHwE3/8t
	74BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f/iV/DqpTJL4gawb47vkCH2HWwJkvLhFElVLowieQzU=;
	b=HZZ727nOqIpoZyTE7/8rPP4tkJWQUDv2VUximLSvVWyfJdvMAkx6XYelMjAYQzKz8p
	YPmE05HLrVs7Zs337pgOZKBozPGIXP8L1gWypkgaLKmSoFEWKIp4C6vqLIKtBaDQgqG8
	rivXWNfhxUC4l3e9TqrvFpMrPQlV1HO8C2HW5KTm1RCG97MxPVwKDq2xNCGP7nSWmlMh
	1YelcFiASM/r25L+6ZaJhUxptzPk5f/NSyqT+MC0CFAQt/TbaqAvXJoAj2HhLkOVSsel
	IWsNSV7bXoTF/cFcCMdhtCDhzSUXNCQG+jFUYrXnlFhghLnJcNUM5kbRg6H2NXj/VD4B
	zKrQ==
X-Gm-Message-State: APjAAAV8CGH1PYwVOktW+vvWERrl0EaiWo5TXMzjeoUZI1J1lwLqvTFv
	B5Q4RVV/GCbkAFT+vIvALzaVh5Zf
X-Google-Smtp-Source: APXvYqwYOhe0ao+69+3tnHT1auzncCi0yR+TfdEy7LYliXAm/hpb/2Lsj9kUcnu1rqIVPJ2tKZObDg==
X-Received: by 2002:a65:6245:: with SMTP id q5mr3845502pgv.394.1561643686656; 
	Thu, 27 Jun 2019 06:54:46 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id h1sm2261237pgv.93.2019.06.27.06.54.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 06:54:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 08:54:40 -0500
Message-Id: <20190627135440.15815-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Fix locale DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2019 13:54:46 -0000
Content-Transfer-Encoding: 8bit

gettext is required to generate the glibc locales in do_compile. If not
present, glibc will skip the generation which isn't reproducible.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 073d1533e37..c400ee10b0f 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS += "gperf-native bison-native make-native"
+DEPENDS += "gperf-native bison-native make-native gettext-native"
 
 PV = "2.29"
 
-- 
2.21.0


