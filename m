Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1CCF460155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 13:15:45 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id u57so1294837wes.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 05:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RGAnVWdd53zo297DYw/4CAiiJLRNYY2L7oDyGIl+ftc=;
	b=bjLuW2LSsthU+JKrZZuB3UraL6U2LkM9qqvXLnOoP31g+UGoOinYgi+wJ/RJOMAT1d
	GENh3Lbpb5DHOYTN3CpkFq+P2rUpEsEomJY6FVRU/PUU3whbNqCO+D/kwCwWv5zwH8cm
	LvjYHxyrQ0CIdir6OsXG4NI+DVvg6IJJNfe5mwQ8aUfsdYi4DvHqtdoNCXh2U8KvdMrY
	1IvFgZu7uKO2FKC5KZ2+4yROxe1I6Q4FPh85AUchArIdW/07/g22D+4NJn7YNn4gnM8P
	ysCQN+G+eiZWVprOGPyF0oVimxcP+f5gxVQ9m81PrKfdP65cvVWZLgR5VJSycD2CG91F
	KRnQ==
X-Gm-Message-State: ALoCoQnU9V+IxchRVS3d8syY0QMOME+t2HM+C1MbpZNn5JTNi7GoGBeZPMFb9TK+YnUHv20jjmfm
X-Received: by 10.180.82.193 with SMTP id k1mr21533795wiy.15.1391692546575;
	Thu, 06 Feb 2014 05:15:46 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cm5sm5648217wid.5.2014.02.06.05.15.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Feb 2014 05:15:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 13:15:39 +0000
Message-Id: <1391692540-24139-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] dbus: mask the dbus-1 init script if using systemd
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
X-List-Received-Date: Thu, 06 Feb 2014 13:15:46 -0000

If the image is built with both systemd and sysvinit there'll be a dbus-1 init
script and a dbus service. This means systemd can try and launch both, which
won't work.

There's a systemctl mask to stop this in systemd-compat-units, but the logical
place for it to be is in the dbus recipe so it can't be left out of an image.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index cf17b62..db47ede 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -62,6 +62,14 @@ RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
+	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
+        if ${@base_contains('DISTRO_FEATURES','systemd sysvinit','true','false',d)}; then
+		if [ -n "$D" ]; then
+			OPTS="--root=$D"
+		fi
+		systemctl $OPTS mask dbus-1.service
+	fi
+
 	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
 		/etc/init.d/populate-volatile.sh update
 	fi
-- 
1.7.10.4


