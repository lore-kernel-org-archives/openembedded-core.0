Return-Path: <nick83ola@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8B93E7DDA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 14:37:12 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id g194so2183370vke.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u4fCzVTVKqynctQxnymfLMH0kPV/vCZ/0Z45g/O+BvA=;
	b=napdpWTPeymcKc5rVIzVLtrszPNsWeubwfnUQLr6U3r7WwSf2/aaah32cEZMY2cHrn
	k6kACYaRVuCFFTrBy/8q/0yDMUlS0e/xINDTGV8LCATlINkUw7KJcYBvHPG+B7hH+3zh
	4tOAL117fu7u7+I0riKtmdj9fLzj/LnUO+NMTTmkiZu//9N1ZFX/beo+O9MjfYbVQE28
	0Bb/kL9rjG02vGxnetaTBdbw4F4z6CTINGQLDcuczUwbwQP1d987koKE3juxwG1hHtXj
	vx0I9QJhYTIPCiGKw3HlGR8nr+mPlyxyAIRtfxEm341/EgaTwW2tHqAwDBZnMLVZ+8DD
	gwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u4fCzVTVKqynctQxnymfLMH0kPV/vCZ/0Z45g/O+BvA=;
	b=o952UPqE6DnpXTuDH/cku57tMPJs8C/b1OvOMfN4NYBhrJETugxQ0Brn+86wbrHKXM
	VtxLOjpeHn+cgW1UFnOGhWCWdPBsLD1L2OpvjMnoVuh05dQ9shSE7g7svTD0R/w5O7sZ
	Mj+M8sPAeV7eG1RkiCHfeX9K6eoxH01SuQFoKcaPM7Dwan9YpZRY77wpGCRUbinaaOhR
	DfboA5rJWc5YSy7SbVQDofLYvIuNm8+Sk0sOfLEROpU4UfFUdVnDRRhmUpFvCsfHYwcG
	Gu3PqydHmEyOguAEINwwyyBRW5ljvIe10P2itNnI4QbAQHnvLEPQBqx7uswri8edMsSA
	gCRQ==
X-Gm-Message-State: APjAAAWgvrPQjI6UXYfTQZjg5kr67jrZz7JDybj6xJdJNCK04XBz2dvN
	c1i1y+ZoovrgwnKni3Pw7kHGaCM/Yvw=
X-Google-Smtp-Source: APXvYqxFi42pAXGzaEJ54IfpISZTlvP+XGvP6Ja3uhPFiYzW8QvuUUh4+hmdg9rQABrycOArP+0iAw==
X-Received: by 2002:a1f:3143:: with SMTP id x64mr5142022vkx.32.1558708632977; 
	Fri, 24 May 2019 07:37:12 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a26sm720497vso.11.2019.05.24.07.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:37:11 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 15:36:59 +0100
Message-Id: <20190524143659.23751-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Fri, 24 May 2019 14:37:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
 meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index c6fc0495f..9a6ca9651 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
 ExecStartPre=@SBINDIR@/nginx -t
 ExecStart=@SBINDIR@/nginx
 ExecReload=@SBINDIR@/nginx -s reload
-ExecStop=@BINDIR@/kill -s QUIT $MAINPID
+ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
 PrivateTmp=true
 
 [Install]
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 29e7efc14..c4c776e37 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -134,7 +134,7 @@ do_install () {
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
-            -e 's,@BINDIR@,${bindir},g' \
+            -e 's,@BASE_BINDIR@,${base_bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
 }
-- 
2.20.1


