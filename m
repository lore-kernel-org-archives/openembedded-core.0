Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 33FD37C55C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 12:02:12 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id o59so740146edb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 04:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oivb0YVnnOJWfD/Csv5EDljRuljMkXWM4W5GV7OZ1QI=;
	b=tALrGJIs6hYAc6ap7otax+HiB4PIdGXIoCa9nfsO1p9/0yfXNeZsgU6gw5ZwGp7cGT
	u74iByhm4p4GJhwNcxlgdGzybaTXXNSV+wI2dxh6S/qOQq40uFU3weeyf4lCvSjP0q0M
	Cx1JL8WmODG32wxeSpU3qhVr8Jl5Gg/p3GLn2DCNNJD7Bh+EAL+GGdPIzC8lm0/c5xPs
	mUhvao3hZyn02ZLDt/smrQwvsby/6pppV27PBNDgJDIHpGAgZU0fuGUTFoUEuw9XdEFV
	+uEBOaXVl9qpzKssfyGDJ3YNp5MaJHFL5OFxYhtDI/qcbu7mqEpZW0z4YPK69ocRXEVW
	VK8g==
X-Gm-Message-State: AHQUAubCuMVCmqac/ISXaBZZyzHJQK9B+Hxrk3p2utErtNl77cHajCqK
	58iRZc1cVA5d5HuvDYpqRvCmxrLx
X-Google-Smtp-Source: AHgI3IZ0ijNS0y9KwievVD7q8lce12vW7pv6kNQ/lPpoTkye8NPBxRM3huxutZS2/v9wOBCWimu6qA==
X-Received: by 2002:a50:d4d2:: with SMTP id e18mr16456598edj.127.1549627332521;
	Fri, 08 Feb 2019 04:02:12 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id r17sm443464ejb.56.2019.02.08.04.02.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 04:02:11 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 12:02:10 +0000
Message-Id: <20190208120210.31861-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Fri, 08 Feb 2019 12:02:12 -0000
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
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 9 ++++++++-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index e15ae35f90..ae613f1e54 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -13,6 +13,13 @@ active_serial=$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ *$//")
 # Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, etc).
 runtime_tty=$(echo $2 | grep -oh '[0-9]')
 
+# busybox' getty does this itself, util-linux' getty needs extra help
+getty="/sbin/getty"
+if ! basename $(readlink -f "${getty}") | grep -q busybox \
+    && [ -x "/usr/bin/setsid" ] ; then
+    getty="/usr/bin/setsid ${getty}"
+fi
+
 # Backup $IFS.
 DEFAULT_IFS=$IFS
 # Customize Internal Field Separator.
@@ -31,7 +38,7 @@ for line in $active_serial; do
 			then
 				if [ -c /dev/$2 ]
 				then
-				    /sbin/getty -L $1 $2 $3
+				    eval ${getty} -L $1 $2 $3
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


