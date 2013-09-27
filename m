Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id F0AEF6CBF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 16:41:20 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id x55so2911517wes.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 09:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cg58M6H3NDqeGkwu4cixcEzTZP24xRh0UYeoPg51X/U=;
	b=JfEblcCDBKK6GkTxsCThiboUjWLLq9bsV8Ng5hhq0rQkQa/hNELzXAz1339gikLZsp
	JpVtuWw4eZCiuLf7CXAAwLIWX6ykM3nCUDMxNnxtbPf5r7kHV2H/SX6ln63byAQ+pz9A
	OiYE3oQHcUKdIWy834kvPnLXOkomdCziUC4ujkVWyHpvCiD1OJzBQru0ptk6Z06SG6Ga
	CelgeqU64K2O2msT1JeE+Clqekb2OCdG2fBbvA+9FU8Y1j9c7Ym/pvJHt1WBpyXiW47r
	Vq8Uv8kx2EW6sSo6KoMWTgBsltCxVL1/XGNahnnv22wLjo8vz5BQjZ98cnBYeRcjwUNd
	Zefw==
X-Gm-Message-State: ALoCoQmlhLq9GIBeiD6BvbyedtjUtViGWmZU08GBGKrhbhukOwK1u0BVoPYwWMnwwTkIBhAuCWbd
X-Received: by 10.195.13.164 with SMTP id ez4mr6642940wjd.11.1380300082374;
	Fri, 27 Sep 2013 09:41:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j5sm15523980wia.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Sep 2013 09:41:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 17:41:17 +0100
Message-Id: <1380300077-23074-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1380300077-23074-1-git-send-email-ross.burton@intel.com>
References: <1380300077-23074-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] sato-icon-theme: add more compatibility symlinks
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
X-List-Received-Date: Fri, 27 Sep 2013 16:41:21 -0000

libfm uses "preferences-desktop", so link it to the close-enough
"preferences-sytem".

x11vnc uses "computer", link it to "terminal".

pcmanfm uses "system-file-manager", link it to "file-manager".

[ YOCTO #4062 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index cb3b68c..cf23aeb 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -23,6 +23,12 @@ FILES_${PN} += "${datadir}"
 
 EXTRA_OECONF += "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('sato-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
 
+do_install_append() {
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s preferences-system.png {}/apps/preferences-desktop.png \;
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s file-manager.png {}/apps/system-file-manager.png \;
+	find ${D}${datadir}/icons/Sato/ -maxdepth 1 -type d -exec ln -s ../apps/terminal.png {}/places/computer.png \;
+}
+
 # Explictly setting "Sato" as the default icon theme to avoid flickering from
 # the desktop and settings daemon racing.  This shouldn't be done here but in the sato image
 pkg_postinst_${PN} () {
-- 
1.7.10.4


