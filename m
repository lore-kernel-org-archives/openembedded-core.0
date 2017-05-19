Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D21077F99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 16:21:32 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b84so3362529wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=r5J7Um9no27Bl+2LCtGvDlbRzGzbtkzouFLT+kstPSk=;
	b=DbVpFOkXHQKv0DqsegmlU02NWlORxIL8+t1ODMkUe5J98JvZRfu38kw5FEvI/UV64s
	PIFHfDN7Isi8c7Umb5lbRLKFdN3qHMl4GY2wGYW9BfBvJQx9xL1r/g9fobDp1hM3Er+z
	iRJC/gJ/nX/G+J9XUk8Fp1wpKgN4Ph+Q6kIWlW3SGUzau8//aswrWPgBmKH3brDeyejI
	rkIEVXiFHUQQBUliFitXI+I0JKcqmx81snOavFLdFzQxpp01mHaA9kqTl09zHnqsNXUf
	wnTS4M+GBaIo1GjdX7wOAqJYbB3dfsqwm++NXFhIR/z6nqhXv+mVCprDNsu53ICy7wGh
	tUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r5J7Um9no27Bl+2LCtGvDlbRzGzbtkzouFLT+kstPSk=;
	b=kP+uEzwWYlqgkFAWf3gv8YwQHAPzUtW3O2ZKaX2Hlp8pPjh1JHqDuMPtIo/Cle/msj
	mH+BOUY53Xvt7LXo1nPibORWtOKwYBp/AJqlQmwYd3RMimu3mPIcRAYMr5zTeI/fOVoh
	hbVJ//qlgsZC0tJBgzkNu9Yrn50QK0hPoEZ6K0IIVSOa5upEX+B0C5qYRMI2gHwTEjnZ
	MejUEb9pfl8kWsMr+EH9uFpJg84gUlnM68ijXphudbf3erbdUGkbDzzkoXUjVww/yE/t
	Tqwd6kf4Fq7ujR8N2F6GfuDXmeH/OKv2+/kNw8rTDKhi6757C502PLNl85edC0zQF59g
	a7VA==
X-Gm-Message-State: AODbwcAcpdFm5IHMGX2GGLj24ro3sTRtHKFKDZ4y4QaUzys2D/4+Z6zf
	UDqW2DgdFhGV6Q==
X-Received: by 10.28.29.17 with SMTP id d17mr7644938wmd.90.1495210893266;
	Fri, 19 May 2017 09:21:33 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	137sm10139541wmi.19.2017.05.19.09.21.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 09:21:32 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 18:20:39 +0200
Message-Id: <20170519162041.28339-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH 1/3] dpkg-configure: do not reload daemon configuration
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
X-List-Received-Date: Fri, 19 May 2017 16:21:32 -0000

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
 meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service b/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
index f0b0789..9a248cc 100644
--- a/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service
@@ -8,7 +8,7 @@ Before=sysinit.target
 Type=oneshot
 EnvironmentFile=-@SYSCONFDIR@/default/postinst
 ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/dpkg --configure -a > $LOGFILE 2>&1; else @BINDIR@/dpkg --configure -a; fi"
-ExecStartPost=@BASE_BINDIR@/systemctl disable dpkg-configure.service
+ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable dpkg-configure.service
 StandardOutput=syslog
 RemainAfterExit=No
 
-- 
2.9.3


