Received: from mail-yh0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UUFZm-0006mW-0w
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 14:10:32 +0200
Received: by mail-yh0-f50.google.com with SMTP id 25so907132yhr.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Nl3TlRRo8FynwB3/2dTmjIy0W97YlxE5HtB01zLMQfM=;
	b=nuG3WqxYQI6Zexhx0HAcA0eq4hlF4Zfh4KE2s2CR2BNmuLCoIATfSZXQBGHwmV0oMI
	pexfWiVXRBmrPKjt33217Z2J2viLzHEYdm0O8GKiOmfafbJyHDQiHfFdtuz1et6sZDqP
	0WnoAI4YNl0Ztr50WXVNimND/f5dtPgc17Uz+7jmIxMABte1w7Ci9fE0LcWKak0tFAYH
	eqJ8DVl+W5bCWdEnp19Fda4I0dYSc2+MS6a0jys0QTu872uqPRZXjbJt61iiT1FZpuJE
	wEHfWI8Kuqa0W6hnURtPUdRARmEGRuqDbng/RgF+vwDX/cK510UYWRJMwolQs/YgUZZg
	EhKg==
X-Received: by 10.236.110.207 with SMTP id u55mr16382769yhg.135.1366631568818; 
	Mon, 22 Apr 2013 04:52:48 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id h68sm41278067yhj.24.2013.04.22.04.52.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 04:52:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Apr 2013 08:52:29 -0300
Message-Id: <1366631550-12726-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] udev-extraconf: Avoid mounting unknown filesystems
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
X-List-Received-Date: Mon, 22 Apr 2013 12:10:32 -0000

Depending on kernel version used, the system can hung when trying to
mount the extended partition (not the logical one) as it is a holder
for other partitions and does not have a filesystem in it.

To avoid this to happen we just mount partitions when these are using
known filesystems so it does not try to mount a partition for an
unsupported filesystem.

Reported-by: Vladan Jovanovic <vladan.jovanovic@gmail.com>
Reported-by: Leonardo Sandoval Gonzalez <b42214@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Vladan Jovanovic <vladan.jovanovic@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 97af608..d1419ed 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -47,7 +47,7 @@ rm_dir() {
 	fi
 }
 
-if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ]; then
+if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
 	if [ -x "$PMOUNT" ]; then
 		$PMOUNT $DEVNAME 2> /dev/null
 	elif [ -x $MOUNT ]; then
-- 
1.8.1



