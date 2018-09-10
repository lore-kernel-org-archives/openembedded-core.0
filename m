Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 910FC79408
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:35:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y139-v6so20663345wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xFrPLAiLzHckR4pRWanb+d0cSgEURweMX/O/++3Pr7U=;
	b=WEjHuflPvZYA7aOy+QOWXTVKfd3vwfimZAOUh+zbJs5HMG5Mra1Pn/opZHtyFU3O4q
	0Q6ia7v+W2SAldZXWztLHxnFMTqtSWiAh+OgaleYCcsTF6vohl3SMyGbBRJZPguyhb5s
	8ow8UAkn3nCEmLKHYAGrJpFYMi2Wh4Lo5o+aEk0wp3KZCUnY8TPb8xkPXr2mr4IB4EZG
	w+4PCwDYuennl3nqkuh+3vB3QHehYYaL9Oz6bXaZ45uiGU62xMiPL1LADHUogg+HmqKt
	EUJmkcIRDDNyQplOFms2CcDNPlgY6MQUBZwkM1iL0rNIMKYGypXWQY5H1ScI65RIk6Jn
	K/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xFrPLAiLzHckR4pRWanb+d0cSgEURweMX/O/++3Pr7U=;
	b=R/vUrmulv8/R1yKVmTVt39wExzWplz5ZFcjamqnsrUZ7Eby3MV42E9pCKoyBxAs1Po
	OYrX9aY8/QFDVGi2/ejRZFLqLQmMVnb2Z6sv6m80YTsQ0op8t3iLgwkAW77Zevq7QBx4
	QtrSTyzvo64YHi5p378LOZEA6N4QQZQULFHWhRHWHKKNXgBMAhdKZmxhAur7nh5QehEa
	J6y68hNku5KkYeRJBtVSVOj20gniUhHkKsDN4mkYpupCoJc/MjA+i+pt2bqRHjAVJpDp
	y7dY7f5vsivdMdpa3iusE1GL5LuCGz3hViShPbitUJhq8CkTenJtU62tuEwjDI8f3Fu8
	RuvQ==
X-Gm-Message-State: APzg51AygQkJSHZ7bhVj2Y/zoQQWMfP8P1WZi3QTUpN86ZEAo6M8oXw5
	HPAzpzXChWsRvvYSGBM1Sder+W80
X-Google-Smtp-Source: ANB0VdbnoxG95sULvlJX4JkPBMFytn75ia3iBm9GAzUxOew3WLvTVkAk9N5PzrVymVLt8c4019oNJQ==
X-Received: by 2002:a1c:7dc7:: with SMTP id
	y190-v6mr107581wmc.62.1536572128841; 
	Mon, 10 Sep 2018 02:35:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	d18-v6sm11450325wmb.33.2018.09.10.02.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 02:35:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 09:35:31 +0000
Message-Id: <20180910093531.29164-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] attr: use u-a for setfattr
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
X-List-Received-Date: Mon, 10 Sep 2018 09:35:29 -0000

setfattr is now provided also by busybox since 1.29.2 upgrade and
do_rootfs is failing with:
update-alternatives: Error: not linking usr/bin/setfattr to /bin/busybox.nosuid since
usr/bin/setfattr exists and is not a link

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/attr/attr.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 24ef5adfd3..9fc0f33cce 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -23,7 +23,11 @@ do_install_append() {
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
 
-inherit ptest
+inherit ptest update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "setfattr"
+ALTERNATIVE_TARGET[setfattr] = "${bindir}/setfattr"
 
 do_install_ptest() {
 	tar -c --exclude=ext test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-- 
2.17.1


