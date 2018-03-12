Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id D43C178489
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 15:22:41 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id f1so11903381iob.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 08:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=iAAH7yRpJcFd1zCMSYibac/R3GZ7gdQre1eCKxcBxyQ=;
	b=QWWmApCMgpI93KJ3jTelVLA+ps8UBHkM5+Srth6JbdomT+PlZflssSLH/pV+YTFsqo
	1GgYsBi8xcqm0vVd2ys4Tn3pv4ihxuxvgboEwOXTV10ix+qu43rt/Nv0ckgzuJchLYZM
	0ExZbT4srm4TAm4TMRx+QSuhg02/LZtJB/LG+DyHW6u1TEnloToJM/0uOw3al5bpM20U
	tFi8I7VMAp/dXsBUpUuOEKeQTvbDdHx0w+6CpKwpQJP5+JSMaLMRs3HqYM0UxaRDlt6q
	DGR8MBy+2goH+IvoVLmx5chUrInvSlu8bg3sSuOoG1FTIMDUbsygB5DAq2u5qrQ1sn2W
	YqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iAAH7yRpJcFd1zCMSYibac/R3GZ7gdQre1eCKxcBxyQ=;
	b=HoO7m30QxunmBEvHzkSrl9BfAf/cgZDyj4msdce3HV5ztnV7cYThBs654wco/V+lEn
	7swxch6cV8iSiBuccOxGl22o/a5Tqk0M3W839ovLzbFbMoN74F5UbTWiRv/J3Q/ta4He
	d0gD3lZbUR7YHDGECVbMBCpaCJrMYqFcjIJq/aex+0P04Dp7s4w3pEDrOEBQs513RTf4
	8yP2fSKQDhbZyz2KzSgsHIMLr8ZkBBZe3xRAsgXQiLvIk8/EMj8dkl9PmRMmM9d985qP
	t2O1DAktqHgibcOXIZSeklx88ZlKuI+eYwXvEJUqkKvACXAsSsD9q1GnB122xlmWbQhs
	SZ4w==
X-Gm-Message-State: AElRT7Hqj3n50auFZUNJiPcWmdJP6fRLJ4RwUFqruS/3xLvF+HdNXdt9
	9s4cGujpKhdnPpCc3eySSwKawTub
X-Google-Smtp-Source: AG47ELv3/qLRVVWz0VkXzR2mbDd5bDv1unfTB426bIMikEvI5pGSrjvo0mni+6yUGbDMRV61YiKFzA==
X-Received: by 10.107.63.68 with SMTP id m65mr9878126ioa.195.1520868162679;
	Mon, 12 Mar 2018 08:22:42 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	l16sm3666876iti.36.2018.03.12.08.22.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Mar 2018 08:22:41 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2018 11:22:33 -0400
Message-Id: <20180312152233.30216-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.14.1.459.g238e487ea
Subject: [PATCH] iproute2: fix rebuild failures
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
X-List-Received-Date: Mon, 12 Mar 2018 15:22:42 -0000

When rebuilding iproute2, many such instances of the following build failure
occur:

	| make[1]: Entering directory '.../iproute2/4.14.1-r0/iproute2-4.14.1/lib'
	| Makefile:1: ../config.mk: No such file or directory
	| make[1]: *** No rule to make target '../config.mk'.  Stop.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index b404eedbfb..4fbfec6f08 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,6 +13,8 @@ DEPENDS = "flex-native bison-native iptables elfutils"
 
 inherit update-alternatives bash-completion pkgconfig
 
+CLEANBROKEN = "1"
+
 PACKAGECONFIG ??= "tipc"
 PACKAGECONFIG[tipc] = ",,libmnl,"
 
-- 
2.14.1.459.g238e487ea


