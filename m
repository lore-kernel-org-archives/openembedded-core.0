Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id AED5677E0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 17:21:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o33so4448215wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=td9+gU1bg2nPT0vJE7BHIwlhlCQkQFYu2byA65IBP8E=;
	b=iFdh/ZeU91BXJkA6DvqxQCyPzxZi7SMEB2725vjHQe7glc9ewDw/2xCpazNc30BEY2
	is8P4rzBWAjEyWbX3ZNkMT9WzGADkQe58Ur7OhxnAPjLQf5G4qDoprWP4ZEqXwXI3+Dz
	nTq4ynehrka72Riy2KdSyi8zwAdMqoVVYUTr+UMBJNM03wMLkTuSek9htEJ1Zg2YCtFJ
	PNknbtEnkWq2jWILj1ICi7NKuFufSw1W8cBOqSFupT9y5u/BH62Ebz0nYJe78pykNml1
	ea9RRkqctv2VQ0F57FNiqBH3/cRnsfySWQY89NE/1r4ettBE9fzrCIac2VhmTnhBO2OX
	tzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=td9+gU1bg2nPT0vJE7BHIwlhlCQkQFYu2byA65IBP8E=;
	b=B23YkML8Iek8TQB9pdXNz8PIkXXhi5jCNJYvx5IMvLxBTte4Cd+lPdHshUzqvvaFgH
	sBnefYtg49tdWMvgEmkbxTbEDddSL3DmCVB4fzLh02QCdF4TIsnEfEXwvCZ7w/hBn97C
	xFxthP8gWPk3POD8wfRZ9u8eB8OuomPKHTG4Qg6+H3BPoU1CTUFbiP6CKJSfKqvTxLiA
	5g7xaUJoWFPw6r0xDy/bQF7Edn9xtJwm+9GiXiBZ2L0nAaZPWxxGHB0peHRziXd8j5Fp
	X8E51p5MO3gnyW6V6A8CYBnggX+RYpO/KfMgM8qBR7vrhar20FgaKXVvFkYrqSWNegGq
	+WHw==
X-Gm-Message-State: AHYfb5gS3+uX4JPD3I4/KCzGlEeqSBY1AFKNWr3yWNn1R9hiHQMxRSyT
	NYbRbp1XzKlavbDy
X-Received: by 10.223.161.145 with SMTP id u17mr12557476wru.44.1502558517210; 
	Sat, 12 Aug 2017 10:21:57 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	x14sm4429070wmd.19.2017.08.12.10.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 10:21:56 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 19:20:58 +0200
Message-Id: <20170812172059.5299-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170812172059.5299-1-max.krummenacher@toradex.com>
References: <20170812172059.5299-1-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [Resend][PATCH 2/3] opkg-configure: do not reload daemon configuration
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
X-List-Received-Date: Sat, 12 Aug 2017 17:21:57 -0000

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
(cherry picked from commit 16b7b455ee40fd1be5bb9aacf24b106df0d9325e)
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
2.9.4


