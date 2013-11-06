Return-Path: <ajlennon@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3026D59C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:24:57 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w61so5236620wes.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 10:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=UrXrUTrV9kilIz0mXd25zOPtbzSkpbXDJM43Ht3smtU=;
	b=ta7MsPaQBeP7biZSWfxyrTqyEaB4k9sqG+xXuyfsF2WRPnOALLmJH57L8ZzUqbURoq
	vbKBYusHjcChOeIRvnCj1b/0cjGhgCo/1goVfrjgcvd8iwqI90KoCUqQVEfXvAVNhnWg
	bom4+xblAKXsVvUzsGoNO6LmrH8GPVq4xhexbTJJ++/O6W4dwC3Zol3QuLI9BW/xo6xo
	Rw9X3YBD083G87Zhf1OddJc03aLQNRmJ5VPw3WlQgjM5GQ+tPWxVndZK9nob+TtLmX6+
	ZrRUpXwrp/TPG5K2RnLbJVWhjJnGh6GhEoCW3tdnDy8oLID5CILwdMrUbq2BxXZRGIZ3
	C/Bg==
X-Received: by 10.194.250.6 with SMTP id yy6mr3782710wjc.13.1383762298293;
	Wed, 06 Nov 2013 10:24:58 -0800 (PST)
Received: from localhost.localdomain
	(cpc16-live22-2-0-cust180.know.cable.virginm.net. [82.42.220.181])
	by mx.google.com with ESMTPSA id y20sm26583954wib.0.2013.11.06.10.24.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 10:24:57 -0800 (PST)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 18:24:45 +0000
Message-Id: <36aa3d4b7358bdb06122705908d106bb074fc2cd.1383761518.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383761518.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1383761518.git.ajlennon@dynamicdevices.co.uk>
In-Reply-To: <cover.1383761518.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1383761518.git.ajlennon@dynamicdevices.co.uk>
Subject: [PATCH 1/1] sqlite3: Add support for column metadata API
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
X-List-Received-Date: Wed, 06 Nov 2013 18:24:57 -0000

I found that Mono.Data.SQlite has a dependency on the column meta-data API, thus enabling this API enables use of Hibernate / Mono with SQLite and no doubt enables other ORMs / utility libraries.

ref: https://bugzilla.xamarin.com/show_bug.cgi?id=6333

The API is present in the used SQLite3 sqlite-autoconf-3080002 source-base. Thus we are enabling pre-existing SQLite support rather than introducing new code.

I am not aware of any issues that enabling this SQLite functionality introduces, other than a slightly increased library size of circa 1.5KB , i.e. coretexa9_vfp_neon i.MX6

- with column meta-data API        610360 libsqlite3.so.0.8.6
- without column meta-data API  608880 libsqlite3.so.0.8.6

Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
---
 meta/recipes-support/sqlite/sqlite3_3080002.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3080002.bb b/meta/recipes-support/sqlite/sqlite3_3080002.bb
index 91dc6dd..18ff292 100644
--- a/meta/recipes-support/sqlite/sqlite3_3080002.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3080002.bb
@@ -8,3 +8,8 @@ SRC_URI[md5sum] = "6d6cc639a4da04fbbdda7b1a1a01b386"
 SRC_URI[sha256sum] = "fca3a0a12f94dc92a6d9e700c3f6cab6cd4e79214bd7b6f13717a10f4bcfddb2"
 
 S = "${WORKDIR}/sqlite-autoconf-${PV}"
+
+# Provide column meta-data API
+BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+
-- 
1.7.9.5


