Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBAE606D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 10:47:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u144so2280122wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 02:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cctPGnvPg5o7XLvgkPFEnn1Lr87CLulTe92hGa26XV4=;
	b=jUkM9kgeM/ovvKATzWRYZZSJdL/9ImckKQWZfqJ7ajETwgC881i3UJdA0YYXgFz+Ol
	vvaUq81IJEURHXzufegUxh0JDWhmx5y8uewphbxYvY782D8ugLPLGe1nGnpEVHF/2V3x
	7Um3b4EVhcX9jBLK2NkJoTnTD/K+FE9vMHNcYRHJrmr5KHT6cgZJGDJEol2uJizkOHn3
	XASJRzPDB3GNyNB/OFL11wawR9elxaUlKr3OYhGv+HK/KIH5+++9fiW5vGEXYebwqfWJ
	K4INJgmJvwtMu9shRbh/7qg4x7ncMoT+zG00dL9J8mydDCuiVwzMlhC68UQbdoJhguzE
	Kyvw==
X-Gm-Message-State: ABUngvcnHgMiirZgCScuAR6IOppWwJE3xDsNWwQBe1D6DD5g2Ztopne6l6gkkRGhiEuCIw==
X-Received: by 10.194.141.11 with SMTP id rk11mr4264797wjb.198.1478774822656; 
	Thu, 10 Nov 2016 02:47:02 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c202sm20839728wme.1.2016.11.10.02.47.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 02:47:01 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 10:47:01 +0000
Message-Id: <20161110104701.23097-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] sysvinit-inittab: make TERM=vt102 on serial consoles
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
X-List-Received-Date: Thu, 10 Nov 2016 10:47:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This makes more sense than the default TERM=linux (as set
by the linux kernel).
In addition, when using busybox init, it tries to achieve
the same (in a different way).

Both agetty, and busybox getty support the terminal type as
the last argument.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 6eaeb7a..e3d052a 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,5 +1,5 @@
 #!/bin/sh
 if [ -c /dev/$2 ]
 then 
-	/sbin/getty -L $1 $2
+	/sbin/getty -L $1 $2 $3
 fi
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index f136ad8..c219cbf 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -28,7 +28,7 @@ do_install() {
 	j=`echo ${i} | sed s/\;/\ /g`
 	l=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
 	label=`echo $l | sed 's/.*\(....\)/\1/'`
-	echo "$label:12345:respawn:${base_bindir}/start_getty ${j}" >> ${D}${sysconfdir}/inittab
+	echo "$label:12345:respawn:${base_bindir}/start_getty ${j} vt102" >> ${D}${sysconfdir}/inittab
     done
 
     if [ "${USE_VT}" = "1" ]; then
-- 
2.10.2


