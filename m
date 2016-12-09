Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1E871D68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 18:20:49 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id w63so27081594oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2016 10:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M9rwMpGrnUBgnuQUVMlEKruOYkoJywV7uWj2rLD6Cr0=;
	b=YX2Pc+Fr8TJH3Q9/aSOlTSleqMA4UQ0fYx6g2NXjVi2On45b53J+9rrvzHapdnWHlg
	xl4iZk7ZDz2EAMnmoF+MvdYbUWSpPN6GCoJE/9rdwfCTAfoZHmKNNjfJDkoiAnXz8fX/
	mgbPx2+dF1bjH8+3/mrwDx8x9brNgLXzZZ+MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M9rwMpGrnUBgnuQUVMlEKruOYkoJywV7uWj2rLD6Cr0=;
	b=EhGVlQ12PZdVnCiq2P8rRmeCaOJZ5oJuItF9n30JX/SgCdxJOObbwQ0aOni69ejdLf
	ydRL4reqe+I7zxNWpN9jYHv7mIHu4VfatcyAKI6zxXzKd9qE3OP1bViwgMmt/AeCR49m
	lS5UjWiVBysXQHO6DEXJYMWiYN5ePQaYAqgdrruYUCA8xzWqCIridS2epWVrf3ieIc16
	ccQ0NLB8Bpgv4vU8vpCnl2CrDqHtcSA1uTYFwQz7w9DjiZlK5mtd+Ebv2Be+ZU1hhpZw
	x/O0VTFGkBYqT/DFyV/MfGVjAfDODhjJj4DlRLW2L6WjQOFB1O9GdFB7Ei09nEeqEF/I
	E76g==
X-Gm-Message-State: AKaTC01w5XsPaIQ1Q4I1z0tbQHs4URlAanXCP6SuQvuSi7qn46jGJSbkuOBGdjl1SLJzJjxR
X-Received: by 10.157.14.210 with SMTP id 76mr41792811otj.71.1481307651123;
	Fri, 09 Dec 2016 10:20:51 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink64-18.telefonia.InterCable.net. [201.172.64.18])
	by smtp.googlemail.com with ESMTPSA id
	110sm12815430otc.39.2016.12.09.10.20.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Dec 2016 10:20:50 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 12:20:18 -0600
Message-Id: <1481307618-11526-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] RFC: weston-init: Update systemd service unit.
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
X-List-Received-Date: Fri, 09 Dec 2016 18:20:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on the "ultimate" systemd service unit [1], this unit
works without the need of weston-start/weston-launch, as is
recommended by Weston developers.

It handles:
* proper VT/tty allocation and handling,
* PAM login (XDG environment settings),
* correct logging,
* optional arguments to Weston via config file.

[1] https://phabricator.freedesktop.org/T63

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-graphics/wayland/weston-init.bb       |  6 +++++
 .../wayland/weston-init/weston.service             | 31 +++++++++++++++++++---
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 22ba5f3..4a97eba 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -10,7 +10,13 @@ S = "${WORKDIR}"
 
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+
+	# Install weston.service systemd service unit
 	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+	sed -i  -e 's,/usr/bin,${bindir},g' \
+		-e 's,/etc,${sysconfdir},g' \
+		-e 's,/var,${localstatedir},g \
+		${D}${systemd_system_unitdir}/weston.service
 
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 689ce41..66d49ec 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -1,12 +1,37 @@
 [Unit]
-Description=Weston Wayland Compositor
+Description=Weston Wayland Compositor (on tty7)
 RequiresMountsFor=/run
+Conflicts=getty@tty7.service plymouth-quit.service
+After=systemd-user-sessions.service getty@tty7.service plymouth-quit-wait.service
 
 [Service]
 User=root
+PermissionsStartOnly=true
+
+# Log us in via PAM so we get our XDG & co. environment and
+# are treated as logged in so we can use the tty:
+PAMName=login
+
+# Grab tty7
+UtmpIdentifier=tty7
+TTYPath=/dev/tty7
+TTYReset=yes
+TTYVHangup=yes
+TTYVTDisallocate=yes
+
+# stderr to journal so our logging doesn't get thrown into /dev/null
+StandardOutput=tty
+StandardInput=tty
+StandardError=journal
+
 EnvironmentFile=-/etc/default/weston
-ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
+
+# Weston does not successfully change VT, nor does systemd place us on
+# the VT it just activated for us. Switch manually:
+ExecStartPre=/usr/bin/chvt 7
+ExecStart=/usr/bin/weston --log=/var/log/weston.log $OPTARGS
+
+IgnoreSIGPIPE=no
 
 [Install]
 WantedBy=multi-user.target
-
-- 
1.9.1


