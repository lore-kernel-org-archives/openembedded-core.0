Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC1370F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:22 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id kq14so17893640pab.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MKJ8jXmPo74J3pImrnCQDTNz/h56dRKpPQACuwPhlgU=;
	b=Fgb+NW/bpxcR1eSYLw+BauJ1YeLZuyRzmaD3zs7qS1Pz7lW1OtCRgMimdLRdjPH3px
	qK6t2l4KhG2EHkL4JEG1ZQ/K/WmO0t7kEDHKEeRA8mIk9exgz2E1TYWYXfz8/AKrRVNj
	89191mdlnCUj82t0IEYrEIAFzYxIzSnaCfXeu1uih6SdSyXKBSGRRJrLVDZx6V7dm419
	DKcpvKGQdrtTctSFt/VAid7E3Af7Vm4IOkGBSfVGtDJdhiXcwSopT+rC7rN8dvaQ+Pf5
	psstN7V+oUyofskn4yhHlGzU41HpMmnJHNeyX1jbEf3hSECjn1dYRo/bQTSoqxKNI5Mt
	kgDQ==
X-Received: by 10.67.1.37 with SMTP id bd5mr15721976pad.151.1409765301623;
	Wed, 03 Sep 2014 10:28:21 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:47 -0700
Message-Id: <2cddd349eb9cafbbaf5257fb61beb9dc249df85c.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 8/8] python: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

There was a remnant line which altered the LDFLAGS in Makefile to add
-L${STAGING_LIBDIR}. This isn't necessary with the --sysroot= bits, and it was
blowing away the correct LDFLAGS picked up by ./configure.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 58bcced..109b733 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -75,8 +75,7 @@ do_compile() {
 	if [ ! -f Makefile.orig ]; then
 		install -m 0644 Makefile Makefile.orig
 	fi
-	sed -i -e 's,^LDFLAGS=.*,LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
-		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
+	sed -i  -e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
 		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
 		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
 		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
-- 
1.8.3.4


