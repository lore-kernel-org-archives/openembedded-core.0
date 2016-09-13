Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B088731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 09:07:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so17281495wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 02:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4lDGP5CGVE9Nye6yZsYGYcUK1jCZkeJeZT/rP3S9J4U=;
	b=IWIehib3q3enEHP9b0u/3Q2WfZ5rfGhry050Z3PMdS/GGRICXMRyy/AYLabxzauRz3
	cxv687pHEg3MMsdoK8wBvNROGdkTPC7Z/jbhVKe7GDeEX8BzkpTnGJ5l8RLUY9Wr192g
	txOgWc3Rr8rKVBLJLAeYmmGiMPuH9/FxGkItd3aeWNoi0p7FSIoJqULMQ3lCoZoATj81
	eGUDuLphXGdWTyQxHxlyGs3rrUXfe3bcEnQn5dV0bCrMLJJW0ng8zAa7gY3wWrIxFrl2
	EhtbDwMUrSSEzD+vz0rBfoJXxhsRamEYKsUfdbTWktwyRBHYbQ7NirD4T4XrY2AFvWiR
	eISQ==
X-Gm-Message-State: AE9vXwMSMm94fj3v4uOo8ADf1ywdHsr79Cm8tKmOL7+uEdKgRIzFdVMRoj8yHG5Sr7k/Ow==
X-Received: by 10.28.130.7 with SMTP id e7mr4399970wmd.32.1473757632540;
	Tue, 13 Sep 2016 02:07:12 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k2sm4221494wmg.23.2016.09.13.02.07.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 02:07:11 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 10:07:10 +0100
Message-Id: <20160913090710.22945-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] kernel-yocto: remove do_shared_workdir from SRCTREECOVEREDTASKS
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
X-List-Received-Date: Tue, 13 Sep 2016 09:07:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Various recipes depend on the kernel's do_shared_workdir
task, a quick grep suggests all external kernel modules
(via module.bbclass), but also perf, and potentially any
additional headers as outlined in linux-libc-headers.inc
are affected.

Having do_shared_workdir in SRCTREECOVEREDTASKS means this
task is removed when externalsrc is enabled, making all
those recipes fail as the task they depend on,
virtual/kernel:do_shared_workdir, doesn't exist.

Remove do_shared_workdir from SRCTREECOVEREDTASKS so that
all those recipes work even if externalsrc is activated.

According to the comment in here, the reason for
do_shared_workdir to be removed as a task is because it
modifies the source tree, but that doesn't seem to be
case.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 82b9210..53659f2 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -1,5 +1,5 @@
 # remove tasks that modify the source tree in case externalsrc is inherited
-SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_shared_workdir do_fetch do_unpack do_patch"
+SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
-- 
2.9.3


