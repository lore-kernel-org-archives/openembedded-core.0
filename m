Return-Path: <eichest@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 012C4605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 11:09:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d5so11215933wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G/mE+nX5cLf8yj9pRkNHZ/TIfYI8Vy8kT1Ie2e1jnTI=;
	b=ntO31SGbnbl9jLVEZAetmzy41qOnrdiT0i8fMTlsHGch7eeO3T+9B630qfDIk8qgeF
	dcnHlcok1ihZMjb/MHv3mBcXiz300vtWgnKQxb9leR9qFX1XhLNhqla1RLnwGDAGcBsP
	7jIaTZnLVBNA+GRSeia05SC7uG5keFeLanBXXNLgPVrqD1qntX7ms7aXluiOGQowLvFj
	9DBXEBd2AT7p58d3pXx3G9aF/LmEsYuAVScyoj4F+apaj/pXdrF0JRxcwAdpF9gBHutc
	5ZXsUSWrTrpDjQgRknEwBq6xGIzgXWIpvIO2JmgraTwY+IAOLnz7wYZbiHbjGYJE4Zur
	bTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G/mE+nX5cLf8yj9pRkNHZ/TIfYI8Vy8kT1Ie2e1jnTI=;
	b=c1vOco5MhnH09cdqmdUXcZeKnVeYAh9cOXRZjhaNkbIlHdOT7x1RpKz2dvXxlVfe++
	BIiGzCKWb7mjsvaRAk3Cl/9D8Y9FtxlW/UycHu9iV7V1HLnqtKvsPr/CrCBB6xwNeeau
	ZkJcgnE/k6KhxCerHYJCqf5AuZxqKfuJohJdKIRN43Rz/Q7lJ+aULJTruP3TskVHxU3w
	8abMi3/npFzpHW6K8ad3iFKER1VO6ooyOQgoNeCpQiMCNlMCfhV8KDEtNpHqyo8OAXB+
	oVr/YIueWAJIMcA/UIbryKuDIb+21vVZmhMq7dCUg4W7dnGpRMig//FplkV6P1RpMfJI
	PrnQ==
X-Gm-Message-State: ANhLgQ273ejKwbjtKR2liOIO1p1W48f1FOZR087XvcgQHFGylFdcnG4T
	UGOW4cZU5/2xoi86c1AvtC3LeO4+
X-Google-Smtp-Source: ADFU+vstIb8zLqjTYDrjXsu89coUg5c+0ag4oi2YzDuThyXJSIraLTJZ8xUYDFtW3xq0Ur6cKu6EMw==
X-Received: by 2002:adf:d4d1:: with SMTP id w17mr17504853wrk.206.1584097766496;
	Fri, 13 Mar 2020 04:09:26 -0700 (PDT)
Received: from stefan-nb.local (77-57-203-148.dclient.hispeed.ch.
	[77.57.203.148]) by smtp.gmail.com with ESMTPSA id
	a199sm7692347wme.29.2020.03.13.04.09.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 04:09:25 -0700 (PDT)
From: eichest@gmail.com
X-Google-Original-From: stefan.eichenberger@toradex.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 12:09:07 +0100
Message-Id: <20200313110907.8700-1-stefan.eichenberger@toradex.com>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH] initramfs-framework: fix boothang when console=null
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
X-List-Received-Date: Fri, 13 Mar 2020 11:09:26 -0000

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

If console=null systemd-udevd throws an assertion which prevents the
system from booting. This patch redirects stdin, stdout and stderr to
/dev/null in case that the console can't be opened so that udevd still
boots.

A systemd issue was reported here. However, they will not fix this
specific use-case:
https://github.com/systemd/systemd/issues/13332

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 87551ff4a9..4898b89246 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -41,6 +41,9 @@ udev_run() {
 	mkdir -p /run
 	mkdir -p /var/run
 
+	# Workaround if console=null, systemd-udevd needs valid stdin, stdout and stderr to work
+	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/null; exec 2> /dev/null; }
+
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
-- 
2.17.1


