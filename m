Return-Path: <max.oss.09@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D05060125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 19:35:52 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n204so13014053qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LOGJZT3HQeUgv3pOeThpmxVWemzzOidiqiYhDCTG2DQ=;
	b=TaPCfH+S8m9C1zk+vjxCFHhntluUEO71OmV9h8SrfCO2Z8VUoV2S2+FIQ7wJo+avVe
	y08QLvlCxNYKM0MM+WJxouE4Wcu99ovbQEDxs5zGgAjmpVGulkr8KCsZbj0kNeotDdL+
	XuJNFPaxc+Qr0FXHy67a/Qej0+GvwNsipgUeen2uF6GwHpnqp0W/jazJ5C0g/Goc0UU5
	VWmR6UzQ+BWVnBH6WGezzvRVxAGx2EBGz9RbdqQy77GxqPbYgoTU1F4WRsvayC/DiHyy
	S3+stTMnjee4W1PaG1XTTYz0itn/FoeKFrmLs7tdWtQ6BlzNu0um1wIdfHDVsh6i6lA1
	7yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LOGJZT3HQeUgv3pOeThpmxVWemzzOidiqiYhDCTG2DQ=;
	b=nD0FsYauyx6rkQEPLHmj2rfW9GbUA69unYuQ/QYpHrneKdyof5YdO9yOTGxX0KDZnR
	d4qkEvHpgTjOr8XrOfVPMjge5zLifrfSNXmmU/nErDBfn9TyDVASairhueIMXGK2poE3
	P7MlYBVcPXby7wimMYqYJ9ti51xzeXuaIU8+Cq3uD8M/3kcwGcJgeP0HGkqch/CTt0Xh
	Db7fw8USDZMdpfHg8aygeeJddqhZpyKzz27PljAwaLAJvdZNnMKGuVpB2wCIL+nA6OQ2
	7xbW7RCWv+s5Q7Bb4Iw+tuNRh6MJmOBX2+BjWUwNIvKVcswFl2ji1UB86+iBbIMA6eok
	oYqg==
X-Gm-Message-State: ABUngvdtZm0iPVtLGv92z6lohpRWNWBPM+wdp5VDsO9HHpw6jksPc4Kt2pe/yUvtUFyoaA==
X-Received: by 10.194.22.41 with SMTP id a9mr9847388wjf.30.1479152153703;
	Mon, 14 Nov 2016 11:35:53 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id c202sm182134wme.1.2016.11.14.11.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 11:35:53 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 20:35:40 +0100
Message-Id: <1479152140-17722-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.5.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][Patch] systemd: systemd should not depend on systemd-container
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
X-List-Received-Date: Mon, 14 Nov 2016 19:35:54 -0000

Currently systemd depends on systemd-container due to a dangling
symlink deployed with systemd.
Move the symlink to systemd-container.

| DEBUG: systemd contains dangling link /lib/systemd/system/systemd-machined.service
| DEBUG: target found in systemd-container

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-core/systemd/systemd_230.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index a949fe8..cc196d1 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -369,6 +369,7 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${systemd_system_unitdir}/org.freedesktop.machine1.busname \
                          ${systemd_system_unitdir}/systemd-importd.service \
                          ${systemd_system_unitdir}/systemd-machined.service \
+                         ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
                          ${systemd_system_unitdir}/var-lib-machines.mount \
                          ${rootlibexecdir}/systemd/systemd-import \
                          ${rootlibexecdir}/systemd/systemd-importd \
-- 
2.5.5


