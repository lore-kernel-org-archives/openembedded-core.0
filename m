Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4Irx-0005aq-F8
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 23:26:01 +0100
Received: by mail-ea0-f170.google.com with SMTP id a11so2219737eaa.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 14:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TfgsYgl56rUPP4oAHbvpfnG9+Ex9b5O5BB9nwWizWzI=;
	b=XdhcEGgnuhYIpPZrWRhbl1rq4PhcgmGAsSygyCRIlZusdLH6XkbXvC6Tm84Jab5ge+
	WofkXnPkptc1T42g7XexfAaTXa19nEB5pGmi8pWhYQUdLbZIk0QzAftdxzScXpaUd31q
	K+sVtP67JHH2S3QGRQ1VnlxE0G9YKdthmUHRVMJcd6Y2TffydlL3A66Rb3BnE/6OSz87
	4MNq0RyLDewO0QU4SGuk4UgwAWpSjGLXZKFeBeMqUi41Pa66ettHVeKATjoy10iCbgQO
	lNoRco9qfQK/3vqz0xpX7Zq0W2egptjzZJnBwfXbjh5jESRIRYbmkaYxGy5lbmkw6s/q
	v2nw==
X-Received: by 10.14.213.131 with SMTP id a3mr31654837eep.24.1360447805585;
	Sat, 09 Feb 2013 14:10:05 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com
	(5-13-217-124.residential.rdsnet.ro. [5.13.217.124])
	by mx.google.com with ESMTPS id k7sm51774853een.8.2013.02.09.14.10.03
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Feb 2013 14:10:04 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2013 00:09:55 +0200
Message-Id: <1360447797-10187-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkoPTpNe54y18rXUuJU/QnuWuZZB+DB1qtR52J+SMo2vIkTr+UcEIUsNz3xICAPpOg56u3G
Subject: [PATCH 1/3] udev: Modify init script to use the correct path of udevadm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2013 22:26:01 -0000

udevadm is installed in /usr/bin not in /usr/sbin. Init script modified
accordingly.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/udev/udev/init |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 8ac1ff7..95d2672 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -73,13 +73,13 @@ case "$1" in
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
     /lib/udev/udevd -d
 
-    /usr/sbin/udevadm control --env=STARTUP=1
+    /usr/bin/udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
-            /usr/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
-            (/usr/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
+            /usr/bin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	 --subsystem-nomatch=backlight --subsystem-nomatch=video4linux	--subsystem-nomatch=platform
+            (/usr/bin/udevadm settle --timeout=3; /usr/bin/udevadm control --env=STARTUP=)&
     else
-            /usr/sbin/udevadm trigger --action=add
-            /usr/sbin/udevadm settle
+            /usr/bin/udevadm trigger --action=add
+            /usr/bin/udevadm settle
     fi
     ;;
   stop)
-- 
1.7.9.5



