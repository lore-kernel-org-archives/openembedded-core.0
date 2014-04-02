Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9446E6F9FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:26:04 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hm4so387949wib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gMcbs3LKyfBoM4//mM+RTReppPiaRV1VRfU/YJCo/RQ=;
	b=0oWRpCcSXF+GrN2UgzlD2LT92qoH4ngnM92yqbZ7ffXrqphPFx8ml4vYY+faffJFnS
	FajtSh/D6wxmApbKHLWdJBt8jG34gWgJf5/B746YqYAJ4Ne2Fr3eGMIzjV/m6zKMFLl/
	9vV5sj1VubENaomxVGPGc1HrtrrZzjGdFwJBAbNpzNdqPI7wGfeHPLRlhApMVPWAe7j6
	U83hsZoC1Qj9127moabLmJiEil5Z32izjPY7hxe7F9ClrmIt8OUNyNCswuUWh/ICGEWc
	NisfMZUeyjHDlgglPzYp+HWO9Oyf/rev2BRjYvuz8ljG98poMaVwUtIn3ma0RCmPDZF6
	Y78A==
X-Received: by 10.180.91.164 with SMTP id cf4mr28434736wib.37.1396441564482;
	Wed, 02 Apr 2014 05:26:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm4200854eeb.22.2014.04.02.05.26.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:26:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 14:25:36 +0200
Message-Id: <1396441537-2911-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] Revert "qt-mobility: remove /usr/lib from ld rpath-link option"
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
X-List-Received-Date: Wed, 02 Apr 2014 12:26:05 -0000

* Basically part of the headers/libs are installed in
  ${D}(${libdir}/${includedir}) instead of
  ${D}(${libdir}/${includedir})/qt4

* http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085815.html
  is related, but doesn't fix the issue completely, so better
  revert the commit which introduced this issue

[YOCTO #5414]

This reverts commit f7409a9fe83ba2535a43f39ed57cd78242a88557.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 72d361e..ff63d2b 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -91,12 +91,6 @@ EOF
 	echo CONFIG += ${qtm_embedded} >>./config.pri
 }
 
-do_compile_prepend() {
-	for NAME in `find ./ -name Makefile` ; do
-	    sed -e 's:-Wl,-rpath-link,${libdir}::g' -i $NAME 
-	done
-}
-
 do_install() {
 	for NAME in */*.prf
 	do
-- 
1.9.1


