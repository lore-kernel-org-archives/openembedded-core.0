Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3677E76E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:22:18 +0000 (UTC)
Received: by wiyy7 with SMTP id y7so9623124wiy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oiswpb3Bk1z4ibsFQvmPPQ3w4L0WlKJ3jD7/gDnzaLU=;
	b=rAZa90y+j/QXhYwct05s44Bz8GrNF42005WO+4l4XPwsssHFWonTKO4GB/oRNmpwgl
	38LThAziNNyhL+nlE2+wYSMUhSuCdf86CREuQblufMmdrUqCj4r59tDEh8+XQX4NoAR3
	xpsXs5wih9umk8hohKIuR/HU3hBB4o4qfrdmXkY6tfNKqXVEgEs2uApWe0zb551A5/2Y
	nF5Gsm4+62Uef3kER821h4xsKPnX/2EWbVGgvShLIjTDksPK5mxnEvGN0O2D//ucLy6d
	2Uo2CLbqnyREF+arrW8XnL6j96Op4bg4wmd+8WsWsa6IDl2qunMSR13+8xgIHQYvaWWI
	8W/w==
X-Received: by 10.194.172.130 with SMTP id bc2mr14466121wjc.85.1440793338955; 
	Fri, 28 Aug 2015 13:22:18 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fa8sm5331474wib.14.2015.08.28.13.22.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 13:22:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 13:23:03 -0700
Message-Id: <436d42c3392ae4b0e7eeed55fde0b48dc2d934ba.1440793291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440793291.git.chris_larson@mentor.com>
References: <cover.1440793291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 5/5] packagegroup-base: pull in iw as well as wireless-tools
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
X-List-Received-Date: Fri, 28 Aug 2015 20:22:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

As was discussed in the commit which adds iw:

iw uses cfg80211/nl80211, which is the way of the future. wireless-tools uses
WEXT, which uses ioctl, which is in deep maintenance mode. See
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions.
Also https://wireless.wiki.kernel.org/en/users/Documentation/iw indicates "The
old tool iwconfing, which uses Wireless Extensions interface, is deprecated
and it's strongly recommended to switch to iw and nl80211."

wireless-tools is kept as well for now for compatibility reasons, until we
have verified that all the network configuration mechanisms are using iw.

This adds VIRTUAL-RUNTIME_wireless-tools as a distro convenience.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/default-providers.inc       | 1 +
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 8d92c2e..9f84d5c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -22,6 +22,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
+VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 262d65f..9e40b28 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -292,7 +292,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 #
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
-    wireless-tools \
+    ${VIRTUAL-RUNTIME_wireless-tools} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
     wpa-supplicant"
-- 
2.2.1


