Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 68950780B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 16:21:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b84so3363031wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QDT57BypVm3dUl9jScQxH1aIjVleUzMQ7Xu2vB28Quc=;
	b=gMzXzn6g/PLo6hErtG+X5Ts5PAQQep2WYmnARc61dkzUkq3PCI3BssRhHxy47SW71o
	DKq/89b6Esf5tbTIzprmvrC7BnwOHyyU7OEEf1yVMBo9IwBEv9ZW5u5p11bvULq7ASuL
	Jc9y7aLRCrgxQ4VOY7AUXYS4S5N6oKIRbHQrOmDFaUiSblsSsWuYKLsw2G0mxKRX5y1i
	dr8hG87vPRoR2uxnga9sUgA+pq4N9n3ivi4KeRfvkhi8ntJy1hoP5qXjnsa4OYGceu6Y
	KrSdHxW8xc4e0fuDkPDH0doh9mjwJ4Z7eW7vNBJW8TGVUjqcr/G3WsF7tIYoo306tmbz
	GHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QDT57BypVm3dUl9jScQxH1aIjVleUzMQ7Xu2vB28Quc=;
	b=FtPS8R2N1E0iAOf2NezbtSOzJIbjhu4LZ8AevgSNRZpuH7PXoE6Cis7hiQkgr9CDYH
	W3zm2bePiYS/BqCzFnRJgSS8hZ7lhWyX/cyxa1WLaadqeHumL4sx1k/U15SpN607B3rh
	j564BvfXe6iU5FhuXQ+pmYjHMjiWNHdxeqKDm+75ZPOGVuQc7xSARKfa8rc+Cm7Zm8S8
	OY3CRmRvtngmOXVTpOb68HSrkm5onzADoiQAe0Qbb9SX9MeHe3fCzzbVAFdrWKRKsrob
	s8kwmGNGTWAtSae5JuejwrtS/kFQNshUe4IeCwOeYjAbiy5ivejuPYrsafmGG4onUjFw
	nMdQ==
X-Gm-Message-State: AODbwcAvqfhSMWWv0ZbRR1vy1kviKFSt3kwgO8T2+Wy2C+jww4a4O0HH
	Pr9+36l/3KAGvA==
X-Received: by 10.28.140.74 with SMTP id o71mr20489410wmd.90.1495210901463;
	Fri, 19 May 2017 09:21:41 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	137sm10139541wmi.19.2017.05.19.09.21.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 09:21:40 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 18:20:40 +0200
Message-Id: <20170519162041.28339-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170519162041.28339-1-max.krummenacher@toradex.com>
References: <20170519162041.28339-1-max.krummenacher@toradex.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH 2/3] opkg-configure: do not reload daemon configuration
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
X-List-Received-Date: Fri, 19 May 2017 16:21:40 -0000

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
 meta/recipes-devtools/opkg/opkg/opkg-configure.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
index 8e74026..432c3dd 100644
--- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
+++ b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
@@ -8,7 +8,7 @@ Before=sysinit.target
 Type=oneshot
 EnvironmentFile=-@SYSCONFDIR@/default/postinst
 ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg configure > $LOGFILE 2>&1; else @BINDIR@/opkg configure; fi"
-ExecStartPost=@BASE_BINDIR@/systemctl disable opkg-configure.service
+ExecStartPost=@BASE_BINDIR@/systemctl --no-reload disable opkg-configure.service
 StandardOutput=syslog
 RemainAfterExit=No
 
-- 
2.9.3


