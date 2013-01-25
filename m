Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQK-00087P-Ui
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:58:53 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so394606pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=z2TWn13EYNH2mBLwKDvg9A8K/D3CMArnCfYnv3ZtjxU=;
	b=Chsifc5cDK3GUr0//2Zo5VtYfwH6v3K1/8G614geVp1cX/7+baATzJf/kVnxvBUqBh
	ebZlmRMukNteAi9LpX/UHEWFjjO/RC39FgC1j5sDXatkQmJPZYzmsxDfwfqB6aQtpw2T
	WKkj5bP3xCDFjpfk4SX6Mwant/WbDPfVlKQYcsipq183kQnTlXpaLCNKth47avtNIgoI
	gJd2NEQ6wJs2AD9DgGUEUqwAuPjGdNZQLB01SaYQIRIRFLaXUhp55qqvm4acV8f5pmzL
	FKDQn0LOklIlLF9PePH7wVUSVU6UbdxslNup2S8hpw5qNMTXaYlSdVUlXSRk7aRLU9/B
	xevA==
X-Received: by 10.66.83.136 with SMTP id q8mr15888771pay.83.1359142997710;
	Fri, 25 Jan 2013 11:43:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v2sm1383592paz.36.2013.01.25.11.43.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:50 +0100
Message-Id: <17dd664946bf38c14aeca2af0e6d988a46f70d35.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/7] automake: use autotools_do_install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 19:58:53 -0000

* autotools_do_install removes /info/dir when it exists, overwritting whole
  do_install prevented that, use do_install_append instead.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/automake/automake_1.12.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake_1.12.6.bb b/meta/recipes-devtools/automake/automake_1.12.6.bb
index 59bbdd8..549051b 100644
--- a/meta/recipes-devtools/automake/automake_1.12.6.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.6.bb
@@ -31,8 +31,7 @@ SRC_URI[sha256sum] = "0cbe570db487908e70af7119da85ba04f7e28656b26f717df0265ae08d
 
 PR = "r0"
 
-do_install () {
-    oe_runmake 'DESTDIR=${D}' install
+do_install_append () {
     install -d ${D}${datadir}
 
     # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-- 
1.8.1.1



