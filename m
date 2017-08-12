Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 27E6677E0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 17:21:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so9833104wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MyHfeTaLeswmuq3N9ipejX5da6wUHtwN+m4RVRPXIVM=;
	b=orFzt2NxdvXJnEzXMSGjlyqK/TM3MycbVqQwOEg11Vx+9mX0paiVkKQsgN5ZlnOi2i
	LQ1nTM/Ngb0Ko42ztUB2BmEzHWa63A2WLzT4b4i3nrOdvsZWXF7I0PGG4Cg9e5BdIKJc
	kWJbRIqBkt3heEEPmVTE7/ahflIuRYn0z/MOJnOETMw2wIPbZWssM0Wx+g4CDUlJm6iv
	2R6FfiLn8RBBAvm7lCpD8ve6sgbEQN/v3n3kbOMhaGQX6i71RRr7eJDg2vTFgliVMavs
	giNqeoRblkgFmDHbEchqcjTUbS/gGtn5eMEd7vzdIMxM4UsH97sm8UbipHjdN0tdFLr4
	dIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MyHfeTaLeswmuq3N9ipejX5da6wUHtwN+m4RVRPXIVM=;
	b=TaWcsdsDhGdTSiGC0QdYslef8UXG9C7wAEQBv0sdZYcN2oCieGdz+TCsZyVZ2FIepJ
	qINRhDCroJ77DgVGu8euT341TdvtWzzM6xIEE6httk2ZMTipxr2lM4I8fEvgCiUT1bop
	LnDsz7R4XsSdFEl4wdJEcSLrAJoWETqBoRS8zgNZWLCV2SMWjF+Tnqzz2P0qhNFTvndT
	mSnaDFe8GBj4eWhuhRNNB0bYiJA7rzo7Pcajg03ndJklGyA2/QtyMMjxuvKu6mYX7DdH
	ZIc2NuxWjtsIv3fN8Kum9AQztMZnmHfewqP+vMFsXekqsWnohF3e9gciHj5OSXd5Tcuh
	F81A==
X-Gm-Message-State: AHYfb5jW7URcA5AZMkYw8NX9bWaT59KikVT2NdAfPs4nY5+ozVSnpeSf
	qjCVtS4u1GHkGvQW
X-Received: by 10.28.207.77 with SMTP id f74mr1465573wmg.166.1502558520697;
	Sat, 12 Aug 2017 10:22:00 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	x14sm4429070wmd.19.2017.08.12.10.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 10:21:58 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 19:20:59 +0200
Message-Id: <20170812172059.5299-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170812172059.5299-1-max.krummenacher@toradex.com>
References: <20170812172059.5299-1-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [Resend][PATCH 3/3] run-postinsts: do not reload daemon configuration
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
X-List-Received-Date: Sat, 12 Aug 2017 17:22:00 -0000

In case a systemd service disables itself while init is still in its
boot sequence the reloading of the service files can be problematic.
In that case: It seems that systemd looses the state of .device units,
and some services depend on such units (namely serial consoles such as
serial-getty@ttymxc0.service). As a result no getty is spawned on the
affected serial tty.
After a power-cycle the second boot (which does not disable services)
succeeds.

The following sequence shows this problem:

| Jan 09 16:36:28 apalis-t30 systemctl[162]: Removed /etc/systemd/system/sysinit.target.wants/run-postinsts.service.
| Jan 09 16:36:28 apalis-t30 systemd[1]: Reloading.
|    ...
|    And then the failing one:
| Feb 22 15:33:15 apalis-t30 systemd[1]: dev-ttyS0.device: Job dev-ttyS0.device/start timed out.
| Feb 22 15:33:15 apalis-t30 systemd[1]: Timed out waiting for device dev-ttyS0.device.
| Feb 22 15:33:15 apalis-t30 systemd[1]: Dependency failed for Serial Getty on ttyS0.
| Feb 22 15:33:15 apalis-t30 systemd[1]: serial-getty@ttyS0.service: Job serial-getty@ttyS0.service/start failed with result 'dependency'.
| Feb 22 15:33:15 apalis-t30 systemd[1]: dev-ttyS0.device: Job dev-ttyS0.device/start failed with result 'timeout'.
| Feb 22 15:33:15 apalis-t30 systemd[1]: Reached target Login Prompts.

(the time has been updated between this two events, but that does not
influence the issue)

Using --no-reload in the service file avoids the "Reloading." message
above and seems to not cause such issues anymore.

Reported-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
(cherry picked from commit 4a425d05bac5dcba023b67aa3d726f7e7869404f)
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index 85a0439..1b71a1f 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -8,7 +8,7 @@ ConditionPathExistsGlob=#SYSCONFDIR#/*-postinsts
 [Service]
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
-ExecStartPost=#BASE_BINDIR#/systemctl disable run-postinsts.service
+ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
 RemainAfterExit=No
 TimeoutSec=0
 
-- 
2.9.4


