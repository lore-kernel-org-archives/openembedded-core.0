Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id A54BC78A1B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 19:05:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2-v6so315488pgq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BK7NsWzvl/S9mnMWyhzHfGY6dr369S/FTJm1o2aPRX4=;
	b=NGj6qtoy3N0LAQsyT3o1tqu7l5SbGz/5bK2CAb8/AJLjyTBPeBe+vc9wFdJNLxbDNJ
	+o2UJt18OC8h/Ta2kJo19KZ09o4ihdftyUWePzAxcqThDdU+PjydEllx703kzsEcvS36
	M7SmRVCgWTln9hv0TbC8RZQKE67OH860+l5+I3yFrZF4/VgZ2WACSrB+tKalRsEfdgDk
	CHgs+JUZvPnpWAhdCsCAXTRD8EiOdYkVsTbPiQi6C+1/QzZYYJhwZf8OJTUAe7dHzhxN
	/2QRJfEfvHXuIrV928n4ChFfPabtXTdfwy8jF4J80TR1uwh60S2nzIFcs3CMosbM3BdO
	ZhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BK7NsWzvl/S9mnMWyhzHfGY6dr369S/FTJm1o2aPRX4=;
	b=hl9+GN8FKlFfaVyzNFHUxid4hEzs8BIhaapPdOb6IEKWCoCX9Cl/+5FOQJwvvXIakX
	bNrgnyBN5BkRoRVx+M7elQ8oKxHi78kPWepMaJl0AFNMWhSQ7v/A4+FZ5biBFW3sriSF
	6L6eBFoD2YgdgEyBSSto/508WSW5Akq+XFEs8/brd6hQhzGYxKsKWTglfmsImVTg0T9F
	SPZCHCdk9Pq91gxFah4G6yUIxicaKGA4gfd0ML/XtQ0GmzK7keedwS0TwgFJgruHonTR
	GUKrxk3pftAnp2Rqv5Z6BvZsaz5eQm9HjTfbwXHWHYGvOGb/DqDVFOb+v1MAnwr6+1cQ
	IJ3w==
X-Gm-Message-State: APt69E2iLJB7D9WJhCugAruKxOCTzhhCRbMzfuEj4af/ARld8d200JP8
	jGYLUJAfo2XJQ/uiM66tT1UWFQ==
X-Google-Smtp-Source: AAOMgpeYAcmBt2R2JuZy4UiD88zguKBm/SDcB7msDzHe8aWyoxhcs5vhB3p4Trb156QEFxHMTGuptA==
X-Received: by 2002:a63:1a49:: with SMTP id
	a9-v6mr10661145pgm.423.1530903959545; 
	Fri, 06 Jul 2018 12:05:59 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm22272773pfh.86.2018.07.06.12.05.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jul 2018 12:05:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 12:05:53 -0700
Message-Id: <1530903954-20926-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] openssl_1.1: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 19:05:58 -0000

Using += with an over-ride can be a source of confusion so try to
avoid the construct in core recipes.

The current usage is incorrect and prevents the aarch64 and musl
specific config options from being active together.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 94b75eb..ac2ad81 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -122,12 +122,12 @@ do_configure () {
 #| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
 #|      return syscall(__NR_eventfd, n);
 #|                     ^~~~~~~~~~~~
-EXTRA_OECONF_aarch64 += "no-afalgeng"
+EXTRA_OECONF_append_aarch64 = " no-afalgeng"
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
+EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
 
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-- 
1.9.1


