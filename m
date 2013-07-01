Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 946C16AFA6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 19:36:41 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so2244452eei.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B7qVPnbwUcf2ts41MV7KAg9CogYMHwATmyZueq7QvR4=;
	b=zTQ7MVCVF9VAs7QntOHx9yDuxaZpqs2LaY65y6OrTOp1GfEEOv3kilHEFfQaMZ51Mh
	OnKEsLwLKlbGNLzcqXKuAbTgEtKNg/By/tbWVCpqQBUoP3jZq8XaC3PZW06bu3ylHfw8
	hQSfjatIzgxUa6UszAWoZ9Sr+5fQbFWmDTa0HwksdE2u4aEB83w6oWWIWprSt9ZFDPlO
	HVZZNVtbaXR5kwg4gwJM2BLMUYIlwYSbEJjJ7ykNesjLsYN6qn5kpCRI/CP2/6M+aahn
	P16uw+vbMdsN71/lGAfkYZKnNPD4D9ge3da04k1kMq/4D8bV45U7Q9JqUCn4R1XAWeTD
	j8+Q==
X-Received: by 10.14.178.8 with SMTP id e8mr22894874eem.20.1372707402302;
	Mon, 01 Jul 2013 12:36:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm31731860eeo.14.2013.07.01.12.36.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 12:36:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 21:36:27 +0200
Message-Id: <99e982c0de5ace514f2d1eeaf4b4d6dc9c4d40da.1372707180.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <814d1612d36ac296ec0e5b522722b4a10f57ea16.1372707180.git.Martin.Jansa@gmail.com>
References: <814d1612d36ac296ec0e5b522722b4a10f57ea16.1372707180.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372707180.git.Martin.Jansa@gmail.com>
References: <cover.1372707180.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] mesa: remove drirc file
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
X-List-Received-Date: Mon, 01 Jul 2013 19:36:41 -0000

* it's packaged in libdricore package and prevents upgrading it
  when debian.bbclass is enabled
  * check_data_file_clashes: Package libdricore9.1.3-1 wants to install file /etc/drirc
        But that file is already provided by package  * libdricore9.0.2-1
* we can move it to separate packages, but it isn't very useful now, there
  aren't many gamers using mesa on embedded devices

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 599ec7e..ada1170 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -86,6 +86,9 @@ do_install_append () {
     rm -f ${D}${libdir}/egl/*.la
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
+    
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    rm -f ${D}${sysconfdir}/drirc
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
1.8.2.1


