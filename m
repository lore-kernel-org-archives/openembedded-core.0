Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 58D7377058
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:21 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id pv5so3841073pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A8Q7dSmyFDU1zapTVqU/o1XMNDWBipip52fj8fao8Sk=;
	b=NVNccHiMruv7+KvAqJdkrKvSxFDCQ7ypd26GZdvQoPU44Qj7dBQno7TtJrxs0O0Z90
	Z5X3WF/Ne7/qrFTzNXzqRi7hPyNA1VDMvSwPfE/sCKMNcJ7yQJn6vwaKhPdhmJztfDOC
	bSnBBlDh8RTEdlMwrKHgvj3GPWN5kCNbcBccF7F3P2O9/Ikrnt8zvhwvTTrWJyEYowMV
	r3xHSy5xvO/M3G8raFoQyji9nI5AvqGaPZqhLKSEpjI+xleZROQAi6CsVKHpj0ZtuxlD
	m9WcReR0W5g0GF8dPhQyYAv41FxSCrvxt6T3YkFSNI97x2hk+ee/OxTbwSVn8nKj74js
	uh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A8Q7dSmyFDU1zapTVqU/o1XMNDWBipip52fj8fao8Sk=;
	b=mBU/hmDWGEfegZ1gcHkwiuEf1LhmATolXyR1QdQkc7L5F7lA+LeMKSLbvrDp6AdCPX
	PddM16whKfiGYRrFwUgfTXSOo0O5K/aWYkLHQWsrp+dwcnD9ZRKSDqDXLSPwl0mWguWF
	lIyV92ryo9oAaxvy83+Al/9VviagLUl95sFLE3ECPPKFyJianf94pJByjB8c1xjJgOTh
	9pVbBiJ+44fbNr6lOKUFnsHH4Ew6IeTUzBxl3LigjqSzvS/TXsO524DqL6McPEXkHMvv
	xKuSXzpqfA9reNeLBVRX195tj0JbkTmTUfC0cVBXdpaysbtLLMRrmKDM0xNl86p+3i2z
	jK6w==
X-Gm-Message-State: AG10YORhR27lTGEgXivZEYGVHBCHrxn+0XEF3Hvnb1xaveTs0d4BpvhGpU1hpgJ1WI4n4w==
X-Received: by 10.66.218.40 with SMTP id pd8mr8843132pac.159.1453512382791;
	Fri, 22 Jan 2016 17:26:22 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:21 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:00 -0800
Message-Id: <1453512366-11405-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/7] sqlite3.inc: fix readline PACKAGECONFIG
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:24 -0000

Make it clearer that readline support for the target build is now
disabled by default.

Since readline dependencies and configure options are now handled by
PACKAGECONFIG, avoid duplicating readline in DEPENDS or duplicating
--disable-readline in EXTRA_OECONF.

Also add --disable-editline to EXTRA_OECONF to avoid a potential
floating dependency, since the configure script checks for libedit
before it checks for libreadline.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 5eb5de3..7245285 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -1,15 +1,16 @@
 SUMMARY = "Embeddable SQL database engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
-DEPENDS = "readline ncurses"
-DEPENDS_class-native = ""
 LICENSE = "PD"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-shared --enable-threadsafe"
-EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline"
-PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
+
+EXTRA_OECONF = "--enable-shared --enable-threadsafe --disable-editline"
 
 export config_BUILD_CC = "${BUILD_CC}"
 export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
-- 
1.9.1


