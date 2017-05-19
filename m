Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E3771780BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 16:21:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k15so17957976wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/gIqM3HpkQBsERphGXZcNz7wqLFO2mOmCIMs7zEbBPM=;
	b=DXZFlAtuddrscgey5itlMjIifytJUIn1EUqw3TE8JERiMMVjYgvW+tmzD39AYDrJ4e
	vkeGGdfo/hJegk8Wfh6Mjl4/bwjMH+xGiM6rknjTVf8cg1FGkMf4VnoppNZWgvJyZ8vG
	k5u+S1DBAyfqU0CbKmecsBb1trBXqZ0J4BhhjVPxZkub0P/ZPX10WM2kifrpfsXj70Dc
	RPI7UwrJx7xfn1oWlfcAsQr8sfV58T8wvO3RTnKSGW9irhnn2F/5qkvsqbmPW4pXrlAC
	CreIUhlYNv7bbTq56CPZtMvIJHDgJECZdR5BUHhvFGIHe7UkTXHZuHgCUPHpUrShMPI1
	Jghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/gIqM3HpkQBsERphGXZcNz7wqLFO2mOmCIMs7zEbBPM=;
	b=PQHRpFw1D4HDg5psGbcEGdh4V4qrghBboAjaG4oev0Mx5CsohslP88SS8uQXgyAaDs
	HIGI8q6cOX+6qhIYyhcESxdONh0cFilqRzYg969lDN4eIyI+vRhcVzhYcY2qsZdyb75t
	sUFDGzurYSc+qHwCTAxXXgdB0V3w9/qXEimCsOl6xNLO1TmG+PRJletqfwSnGj4cN978
	hy56OXL5+sB6qQkS0VxfCOEhwIgD/Q/9XnVK8Ghe+bZ3SHHEZ+baZbNWs0DubgH1zBw4
	wDeC56B3PqWoIxo/s9z8CDgNpPyZVHFfoJJdXDKs/FTUDb2giaFTFNY40wDsUgMSGFUX
	6gSA==
X-Gm-Message-State: AODbwcCrQR9SgLHjxooURf/XRYeC6OMJbWko2F/Mf4++nyj056NZEgnT
	/mecES0NedSuBuuM
X-Received: by 10.28.1.198 with SMTP id 189mr6791350wmb.18.1495210903481;
	Fri, 19 May 2017 09:21:43 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	137sm10139541wmi.19.2017.05.19.09.21.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 09:21:42 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 18:20:41 +0200
Message-Id: <20170519162041.28339-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170519162041.28339-1-max.krummenacher@toradex.com>
References: <20170519162041.28339-1-max.krummenacher@toradex.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH 3/3] run-postinsts: do not reload daemon configuration
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
X-List-Received-Date: Fri, 19 May 2017 16:21:43 -0000

In case a systemd service disables itself while init is still in its
boot sequence the reloading of the service files can be problematic.
In that case: It seems that systemd can loose the state of .device units,
and some services depend on such units (namely serial consoles such as
serial-getty@ttyS0.service). As a result no getty is spawned on the
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

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
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
2.9.3


