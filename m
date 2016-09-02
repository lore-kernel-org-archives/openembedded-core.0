Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1CC731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 22:04:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w207so4493136wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 15:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xkObZQkQpvYvvgFiLS9yH9qoTfCwZ5+PwaJqlbF6lV4=;
	b=WjLN6JPdBnYHa4s4SDZqAzcXOK3/PzYDK9tYoMw7t/So5BH7wny1BOp1+91DQ8mW5B
	OVylk18hYOz6+5Etwi+f2q9l+FiKsUhLBbKVnqtuLBm6lkXAOMvTHiXG/YdUfWO6XfpF
	nMqVfgzRf70RjxMT79h0aYRn21olfga9IebVBwt9G9FXaImL+vq3o5MehBqgD0Mz9Iuz
	zFuyx/o+0yQ4waAiK7AA4qYf27PqwYnt7uhyq0xeh4MTSDv15WM6foBTPVjybsGHiac2
	qMZQKfiEMrr6nERZr/23XCUIYDRnlEnVUAZFVicJzbBhv+3TGSaKX4+b86QKvIQqibTw
	HDiQ==
X-Gm-Message-State: AE9vXwOetVxKabMX2NpQjFqNCk4FO3XVb/XHwvGQwZbpBSlcF1+afWeGKBEaDjqDsiEkIw==
X-Received: by 10.28.174.11 with SMTP id x11mr5344199wme.41.1472853884677;
	Fri, 02 Sep 2016 15:04:44 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	x203sm5518892wmg.0.2016.09.02.15.04.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Sep 2016 15:04:43 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2016 23:04:41 +0100
Message-Id: <20160902220441.8224-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] ofono: RRECOMMENDS tun.ko & APN database
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
X-List-Received-Date: Fri, 02 Sep 2016 22:04:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- kernel-module-tun is needed so that ofono can create the
  ppp network interface

- mobile-broadband-provider-info is needed as an explicit
  dependency even though it is in DEPENDS, because it's
  just an xml database, and the DEPENDS simply allows
  ofono to figure out its location in the file system
  (using pkg-config during configure). But there is no
  shared library dependency or so for bitbake to figure
  out this runtime dependency.
  We make it a recommendation only, so that it can still
  be removed from filesystem images in case people build
  images that don't need the provider database (and e.g.
  hard-code APNs for specific use-cases)

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-connectivity/ofono/ofono.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 72bbcac..47e2a90 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -35,6 +35,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-tests"
 
 RDEPENDS_${PN} += "dbus"
+RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"
 
 FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/${BPN}/test"
-- 
2.9.3


