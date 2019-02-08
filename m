Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id A5E5C7C5D7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 16:48:33 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g4so3336814eds.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 08:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=izIDFluJSsghaEmSj53GXdzcALWV/heJ5kZbprYpXx8=;
	b=rVaCm35ZCNvcayl0j3pOMG+FEyGQv7Bqn+xoJbVe6kJMFvFdyNZnu27c14ocHm8xYP
	GNBv/nCxz/3/LOq2BcmzWNMmQlOsiTzHtmBet+Saud12wcbUKrNjmgVPD/LNfX/Mxgtj
	+qyTq40+f7ybgZTzypAn+zEOAoovL9Sk8OMDolQl0/7tCFEPFgbwL3cARaB7rHMAHraw
	eoduTuIoC8WcwionQtrCIXma2NTW4djOuDFGdXaoFKKR4JCwyPKtWJ2DYvq7YLby274p
	ppp+otw5R7MXaxomrLunqaW4q4CS/LGi8VRTxUd7VcOxhegAtvXK7LWm2hbk2OnaV96d
	rCBQ==
X-Gm-Message-State: AHQUAuaIjRFWJVAqL+/9fwf6V6GevcKalSdSp3APFb7XyUu3KEUTjjno
	hPgmxYyqvHFHuOWNVhK3p5cgQqPx
X-Google-Smtp-Source: AHgI3Ib6kdPgNuuXq02uG3ZJKprJgEW7h5/q09tmQ+G8OnX4O3cncjaHNbdB8S/T8ZvW3STjUt8BEg==
X-Received: by 2002:a17:906:4344:: with SMTP id
	z4mr16466037ejm.27.1549644513866; 
	Fri, 08 Feb 2019 08:48:33 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id r16sm266162ejz.70.2019.02.08.08.48.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 08:48:33 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 16:48:32 +0000
Message-Id: <20190208164832.6047-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Fri, 08 Feb 2019 16:48:34 -0000
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
v2: fork fewer processes
---
 .../sysvinit/sysvinit-inittab/start_getty          | 14 +++++++++++++-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index e15ae35f90..d3ebb84e18 100644
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
+            getty="/usr/bin/setsid ${getty}"
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


