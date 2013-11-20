Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EBE5D6D9AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:41:37 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id fb10so7366533wid.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KiY/YSkizwBnm156uu4yX9QzjuT9LJj0mF/b4NQknWM=;
	b=wyOvGeYqGKO/lYSzhbqlQYniaPUoBpLj3IcT/w/yhCURj+AEnOGufeltpk2qRi++GJ
	RalfgRHp4/zuwV65Zl0qHOIFwfn96tZFDtRSATY/XiqAXy/tZ5DLHlya7aaS3GO6qWDT
	CMVs8WoN8i8ONAyotfQFT9KiOp4UTEAxdvSOUjeResjqA2RUP9RkNAl3QYxfEjnwcdVP
	9u4Iqi/FtfrjOdY4P9rwwoZKmSsqOOrRUOvn3eOycnKU0mJYJWD2KVDnS4Ynf0c0/IoL
	1COYR8bOP9pTrXogrQmrL9mxC09Q9lwdd6+wnlcgky54qV/gPQqip06yIOM9v+hEe2eZ
	WN4Q==
X-Received: by 10.194.206.5 with SMTP id lk5mr1557869wjc.46.1384965699474;
	Wed, 20 Nov 2013 08:41:39 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id w20sm9706956wia.5.2013.11.20.08.41.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:41:36 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 16:41:10 +0000
Message-Id: <1384965670-23435-4-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
References: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH RFC 3/3] opkg: Don't use update-alternatives
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
X-List-Received-Date: Wed, 20 Nov 2013 16:41:38 -0000

The symlink from 'opkg' to 'opkg-cl' doesn't need to be created with
update-alternatives as there isn't any alternative. Instead it can be created by
hand in do_install_append.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index d16b8c2..f476e67 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -69,6 +69,10 @@ do_install_append() {
 			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
 			${D}${systemd_unitdir}/system/opkg-configure.service
 	fi
+
+	# The installed binary is 'opkg-cl' but people and scripts often expect
+	# it to just be 'opkg'
+	ln -sf opkg-cl ${D}${bindir}/opkg
 }
 
 do_install_append_class-native() {
@@ -97,13 +101,6 @@ rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 fi
 }
 
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "opkg"
-ALTERNATIVE_LINK_NAME[opkg] = "${bindir}/opkg"
-ALTERNATIVE_TARGET[opkg] = "${bindir}/opkg-cl"
-
 BBCLASSEXTEND = "native nativesdk"
 
 # Define a variable to allow distros to run configure earlier.
-- 
1.8.4.2


