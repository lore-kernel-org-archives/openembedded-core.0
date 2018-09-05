Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D4CAD74C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v16-v6so8370731wro.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rdz88AzB6p2z5uC1bpDH0Cqn154H94WaAwsrMI/9OWM=;
	b=SJ30ewxU4sRp67U3ApixC/++uiCkfA9TjqNvKSWuF019uTEYA7ttM9qDadOZjhv6XZ
	mNuCGWEfAEwmT6Vtdb82pSvD1tw/fKIhFsUW+umMptU2lnxNf9F5zgEQ5qkKUXIjJSta
	FEoUbsnhK2hBaSgIwOpmEtDpMW5kgWvjs6cyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rdz88AzB6p2z5uC1bpDH0Cqn154H94WaAwsrMI/9OWM=;
	b=WKTWOJuFcZYZXIIhfjH4ED3AtlVkU09NsJY2q0+OmWMO9rkUCJBL6cAqHb6UaiEbM0
	RItlSDvIOUSxV+9ggOTgk18wIqLv5vt6oxMCKaFd32wqLDsOf7vprwC1btg9zWyfEaXI
	39FO2fsJcXaaYjS5JmzpX1c4c0oJqDemhBvuC1FCXsrRisa7O1lcmB41OOHtHMYaGMyg
	B2sgYGW3ruiJlS6b3XmU7i9R3ln9FnGMXnBQ5hTPcxG6x9CHM7gJZ830jgyjPF7CyLmQ
	UeubIMzU0h6rJYX+hedz/tkPtgdn8a99+RCb85zYYpc2DFxLrrzvok3ABJ1UMg8BK9OT
	cqlg==
X-Gm-Message-State: APzg51DwlKCB7zaZsMir6haK8fZmjWUpnvv9ePaMONQqJfiemoQNPGVJ
	Zl6Fpt5IOCGiQ7CKc9Dya79A/Sz9m/Q=
X-Google-Smtp-Source: ANB0VdZNU1/We2EK0u+dJ7IJMtU1M0wstMQEhKRH0GiDZziNWOi2hh5Ca/gAbE5H2UX4C1i2V7ycHQ==
X-Received: by 2002:adf:ad8e:: with SMTP id
	w14-v6mr29017157wrc.178.1536166354315; 
	Wed, 05 Sep 2018 09:52:34 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:23 +0100
Message-Id: <20180905165227.29435-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/8] binutils: Fix variable conflict
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:34 -0000

A recent binutils patch added the LDGOLD variable but its already used
for controlling EXTRA_OECONF options for gold. Separate the two variables
to different names to avoid build warnings and confusion.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index b56fcd4cd01..81ecbb50cc1 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -38,8 +38,8 @@ FILES_${PN}-dev = " \
 # Rather than duplicating multiple entries for these, make one
 # list and reuse it.
 
-LDGOLD ?= "ld.gold dwp"
-LDGOLD_riscv64 = ""
+LDGOLD_ALTS ?= "ld.gold dwp"
+LDGOLD_ALTS_riscv64 = ""
 
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
@@ -50,7 +50,7 @@ USE_ALTERNATIVES_FOR = " \
 	gprof \
 	ld \
 	ld.bfd \
-	${LDGOLD} \
+	${LDGOLD_ALTS} \
 	nm \
 	objcopy \
 	objdump \
-- 
2.17.1


