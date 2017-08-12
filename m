Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7BC36060F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 17:21:53 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g32so4456281wrd.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uHVokjzgKKzgETXLAU72Nsx7nTXUxT8GLEPXPYW1M6I=;
	b=tP3RI+8JrcP/duR4DbSParud3bxQXpeNZDpyuIOdYqa5lGMYu6i9YnQdS91Ox8EobY
	z/khRyHIVIUYU1fAjYG0lLGcD9eEubqP/opnsFgNURP+V9htUXM+LDOfJXbWlLXq5s/7
	LjTAxqhQHg+2l/oiDlRd40m06I/3hSjs7kluOWld3O/CNK63jI/XV7ZOJpmVml+2tTI8
	4P1stOSV0CP13EVBkRrsuttrjwbNFxxI7rFkqsKGRCsugyJtm47JaJbdUNkXGjvH46sZ
	hZgpwZrpXfIlXu88rYwr4ACkqxQ1VOfgtCVmQGKXk+4hgftuEvRtYt+QAJltKxLGYQTd
	Nh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uHVokjzgKKzgETXLAU72Nsx7nTXUxT8GLEPXPYW1M6I=;
	b=TVCYOHKbwBh5HebsflCHQu1vegH7WMm1njyvH4auUJWAls+8hLj2YPRre4+YO/IOra
	sNlJgQhz6rfI3yCRZ8FqWr/bUwWEiISFGQOKPi0HNdi0unNWHjUCeo5XzBkJ4MHBdhgN
	ESw1mwdromftX1EDJfRseSJHZ002dkcJeoBY+inaU/sEgqarIDfk0yickL+fguYgyY0L
	w8W5498UZlj9FzQI/iW8MXCyvBsQc137SGh49c3KpQ2BW/kMiveKQCCsJ1hF2PDj6x3e
	+x+hZ/MSApREe0SfQpHsIsEvv9JZD6tEjwoCLujoHamH4slEdftSkrB5EyDbhmPKp0D0
	9ZsQ==
X-Gm-Message-State: AHYfb5j+qz9522/F02pYeUzzrqECj9x9XI9WHmXJ996UEmbvUPrl49US
	Cy44bIvyCK/S6GQM
X-Received: by 10.223.139.21 with SMTP id n21mr15205703wra.116.1502558514198; 
	Sat, 12 Aug 2017 10:21:54 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	x14sm4429070wmd.19.2017.08.12.10.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 10:21:53 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 19:20:57 +0200
Message-Id: <20170812172059.5299-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.4
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [Resend][PATCH 1/3] dpkg-configure: do not reload daemon configuration
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
X-List-Received-Date: Sat, 12 Aug 2017 17:21:54 -0000

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
(cherry picked from commit 94fabe4b03e899d8876027ee2ced649737a9e522)
---
 meta/recipes-devtools/dpkg/dpkg/dpkg-configure.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi

The thread did not get any positive or negative feedback.
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg96339.h

Any thoughts?

Max

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
2.9.4


