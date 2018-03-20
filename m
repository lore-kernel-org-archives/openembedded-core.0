Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 635377899F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 12:10:18 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z12so1437030wrg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bhp7mjWdIuQ0BuW5SpQIjlaJl1MuGpcqtAJi/ARBu8U=;
	b=CLwgxqbsdMyaupBSRWigLL8JI1N9QlY/MKHt0WRFvNW87itmmUdaNdhwvimy7T4zdC
	XWbFZqBxGLX+uchvWNXElWZ54lhC/n4HLaXi2ZvuVt4TKKEaLnGgU9sywWvfDNqZwnzg
	Maj6N/fuC7hT27rfMwLZABIcMImJIqGCLaVzUHr64rRB1MQeUB4/1gW/bO5TrdJDcRnq
	FsgEFxjuwQdyJbnOI10eysKmxZ7eN3Q+BTKggfN7ebcOCrc4ozZ52/xIs/u2DM//R99I
	YBg0EN8PqpQDwI6YG9tTmPRAu59C+TI6DQCcJ8LxyZ0X6Hre4g3gmiY8Ice8d0XRhPYP
	HV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Bhp7mjWdIuQ0BuW5SpQIjlaJl1MuGpcqtAJi/ARBu8U=;
	b=Yz3/fcNyW1951xSdtpA5oT+LoavbvO5P8R3lMyyQvi33Xt4Ouaojwfn80ZILCe1qwk
	zSQhgedw84d6djod5TjKJnmzSS5EhQXuZsEPyEjAP+U5iAHu8V/swu9EiFMUCxjlWuHd
	zPqvQ6DU4hUfbj3Td+xm7t32gKaiuvDDoGqA0ACCgWfBceU21x+ylyhuQAnfMLwvWdM+
	RQY1a3Y9qVRFlKZwyRcmiiGx3Z2IlLiC1oHQfebRduzUvDTV1lL3TriuzRDyF0BvskvM
	skwIKV3sUZ8E3pW4vS2ERPL9lI8/NORKVq4aioZ0htFwHkzaIYCqNDX1o4mdyipmcBml
	0L4w==
X-Gm-Message-State: AElRT7FGX3Q5r9wH18DZ+RE+UeVwSi4l1Zs6xuQ8HoF2jsujFBWWabUb
	lsj19Bu2zWmr3OPfqo0VgFJ9xQ==
X-Google-Smtp-Source: AG47ELvwKjGMFfrHRAbD8ijhXq6SrYHihMaXm0R1guG8B5CWeFZCjz//4z+iSUA++Wn2QP8ox5vxrw==
X-Received: by 10.223.158.6 with SMTP id u6mr2590456wre.142.1521547819094;
	Tue, 20 Mar 2018 05:10:19 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k184sm1327611wmk.45.2018.03.20.05.10.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Mar 2018 05:10:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 12:10:17 +0000
Message-Id: <20180320121017.943-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180320121017.943-1-Martin.Jansa@gmail.com>
References: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
	<20180320121017.943-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] shadow.inc: run postinst only for target
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
X-List-Received-Date: Tue, 20 Mar 2018 12:10:18 -0000

* fails for nativesdk-shadow with:
  pwconv: /etc/passwd.29063: No such file or directory
  pwconv: cannot lock /etc/passwd; try again later.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index cc189649b2..48a3be87e6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -190,7 +190,7 @@ ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 PACKAGE_WRITE_DEPS += "shadow-native"
-pkg_postinst_${PN} () {
+pkg_postinst_${PN}_class-target () {
 	if [ "x$D" != "x" ]; then
 	  rootarg="--root $D"
 	else
-- 
2.15.1


