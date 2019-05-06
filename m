Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 77A9A7D391
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 17:51:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g3so7157118pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LEkfMaWY9uGXqW33P3GGSxP9mi6XMnIoV6MSqL99V6Y=;
	b=gdh9F5XPZmkeSaMf0OtJPdL9a38Intze7aAgdX/SfwkF4D7cQGR5H6HkzWspzNJcVV
	0Z5AYoXoGwi4q/2dZsqjXtiZ1m/rKH2ZaN7N8QMJHcQEPX7gpTGM5vyCaKM3qSft37iv
	BZtpG21+l04lSpf4LQPnI7CWg42BgfRkv+jTs4k7Kfql98k7JUeJP3YNXwEMO9kvQ2wM
	ElQtLGmZje933TJQ1wGZDpp1n/YLJP6YeTAUI4VOGZPEess/dddfB6jVExqFvnMR5T0O
	WI76DeSOaBbCnnXvTZ1aQnGjLWsyotIJILbdU/Klfs9KImkNR+CmZ7ncol9wA43VW6mm
	sfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LEkfMaWY9uGXqW33P3GGSxP9mi6XMnIoV6MSqL99V6Y=;
	b=GyOz9rB0GwRtvjmppO4ySXotC+N8Y4EbqAFQWYlP7mgxDr3CaKcJYOq1ElKSqttr4o
	U5VocycSRPmfHjNCHUWLs9jqhBARyA6o25Ep3H/FPjmawZ1cG5jxzqqVE48eiPmSGBJp
	Ei4cxdY1YjA1qOUw6Be4lMZZ2TMIq5fV507FaWaB31K5z0OgYup9zF5pMKUTPfkziAIb
	24LEAXGtj4m3/m8BRkocQQaAly8gtnMgG4DUwCu0JhK8ABvgXdl7+b6eFZ1s4yUTwAyY
	qPfeVOaqxC4ylYvCDfaHBcknO4C5RJN5laKFoIVeiVhjGpcX9qXyXwLOamm8SvXY7kFU
	tP3A==
X-Gm-Message-State: APjAAAUYEtb2Lt6+urxiqF2/5IpYTj0/BslLjYTSfQ5RiVuFarrEK+WS
	/o8EHLEcOXQNhMOUbFwSZ2Fxd0t9BNg=
X-Google-Smtp-Source: APXvYqws54O0B4XQRPESZA4uKXgknKqPweR7TJZHQG2Vt2vu7vG9OKYWXeBk7VuFZGNV0HN0P6NTXQ==
X-Received: by 2002:a62:b602:: with SMTP id j2mr35092528pff.68.1557165104253; 
	Mon, 06 May 2019 10:51:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	n7sm14764022pff.45.2019.05.06.10.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:51:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 May 2019 10:51:36 -0700
Message-Id: <20190506175136.7594-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506175136.7594-1-raj.khem@gmail.com>
References: <20190506175136.7594-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc-target: Do not set --with-sysroot and gxx-include-dir paths
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
X-List-Received-Date: Mon, 06 May 2019 17:51:43 -0000
Content-Transfer-Encoding: 8bit

These options are not needed on target infact since the defaults would
be good enough for compiler to find the relevant headers and libraries
from compiler runtime

with gcc9 it starts to strip the sysroot from gxx-include-dir which
means it tries to look for gxx headers in localdir

ignoring nonexistent directory "usr/include/c++/9.0.1"
ignoring nonexistent directory "usr/include/c++/9.0.1/arm-yoe-linux-gnueabi"
ignoring nonexistent directory "usr/include/c++/9.0.1/backward"

instead of sysroot

Removing these options make it behave normal

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 6270059644..bdc6ff658f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -2,9 +2,7 @@ GCCMULTILIB = "--enable-multilib"
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = "\
-    --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
-    --with-gxx-include-dir=${includedir}/c++/${BINV} \
 "
 
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
-- 
2.21.0


