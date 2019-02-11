Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id C45416B463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:21:08 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id v201so4027225ywa.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pOe3yiJHUwS1hqnH2fYpupsqZXJLQ70Xv/U2oBj1obw=;
	b=KUu7jAkTqaqt1rHwEinopdoF1OohUIzUHcn8VLWYS7DCjFDEXxkGsDHitiyyexcf22
	heD/ETCyA/nJ+64jf74/1unZOlNPzku8aUOYeHl+jnPQQkA77zBKcdprYhHuYGBgrecg
	QlUCM5oCVoHwT4P+7DQMw1q6bBh/3jX/X8il3HB+NVJz0jG/GprMqybt78aUWyHsJB+G
	KLNC7zeeDZsxMUc8Fn+wYh1LZyvVbcnacy2mxaDh6itvGwnf8yMIJCspMQUtmXN6aqHU
	DSL9hlajRWM6MWBdZYbcLDfxzUSJQ9QFggSfzWdCXL2cw2zunMZbT2QmtaeLtO8vv5ss
	jYSQ==
X-Gm-Message-State: AHQUAuZ4/Mmvx54VyHGwi3jtTDtgzDzRDOTKbQlZB76RREpuAS7XkO1W
	8wPk7X348d19+YcHtBxWP+Z8nK8f
X-Google-Smtp-Source: AHgI3IaXFY/5RVHpLzs35mTCewdHR/lb+FmefC1YyFNvClxzsS3jfiuCfLDicGOYRfCa5roZquv0Aw==
X-Received: by 2002:a81:8741:: with SMTP id x62mr21844698ywf.406.1549884069534;
	Mon, 11 Feb 2019 03:21:09 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q185sm3802714ywe.87.2019.02.11.03.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 03:21:08 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 11:21:06 +0000
Message-Id: <20190211112106.4530-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Mon, 11 Feb 2019 11:21:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Busybox' getty has code to try to make itself a session leader,
whereas util-linux' agetty doesn't. It expects this to happen
from outside.
When getty is not a session leader, many things don't work on
the serial console, e.g. setting the terminal process group,
job control doesn't work, etc.

Executing image tests also fails with AssertionErrors, because
    Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get controlling tty: Operation not permitted
    Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set process group: Inappropriate ioctl for device

Update the start_getty script to invoke getty via the setsid
utility if needed, i.e. if /sbin/getty is not busybox getty.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v3: also get rid of eval
v2: fork fewer processes
---
 .../sysvinit/sysvinit-inittab/start_getty          | 14 +++++++++++++-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index e15ae35f90..96fd6cfcfd 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -13,6 +13,18 @@ active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
 # Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
 runtime_tty=$(echo $2 | grep -oh '[0-9]')
 
+# busybox' getty does this itself, util-linux' agetty needs extra help
+getty="/sbin/getty"
+case $(readlink -f "${getty}") in
+    */busybox*)
+        ;;
+    *)
+        if [ -x "/usr/bin/setsid" ] ; then
+            setsid="/usr/bin/setsid"
+        fi
+        ;;
+esac
+
 # Backup $IFS.
 DEFAULT_IFS=$IFS
 # Customize Internal Field Separator.
@@ -31,7 +43,7 @@ for line in $active_serial; do
 			then
 				if [ -c /dev/$2 ]
 				then
-				    /sbin/getty -L $1 $2 $3
+				    ${setsid:-} ${getty} -L $1 $2 $3
 				fi
 				break
 			fi
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 8585a418ab..bfd890d924 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -20,6 +20,7 @@ do_install() {
     install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
     install -d ${D}${base_bindir}
     install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_getty
+    sed -e 's,/usr/bin,${bindir},g' -i ${D}${base_bindir}/start_getty
 
     set -x
     tmp="${SERIAL_CONSOLES}"
-- 
2.20.1


