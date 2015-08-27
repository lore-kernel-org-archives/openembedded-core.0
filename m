Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 737DB76DE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:47 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so885104wid.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZvTUv3m+BzaDK0fZGHeDQ52SpUTp1GbFoSRUNaQ5Nlc=;
	b=Kc0lIjA8WXFHLiNPA9+QvG3zirs7tUpZ/hFG9x675Qcg0RDJLQWvzwM2sb6Oh3LayU
	QInUVd6NzuGsHUiXV5oaigE/Jp/GPqblypNP1KEL1+Ce+xR3h70afvKTh07ARklGB5Gf
	X/FhYxVyDdnWl9f+/Wqtbc/pWuYTCI2+FnIfsIupSAdYJlkCFzsJtB7vXGbGyuXcycx3
	tMPsqX7f7JnsOUSMoA0g8/pGzyUxcSuFilwC2xFrJpMme+RMWEb2NbfjeY9MdTEtwoW/
	qreIP0eWRl1BVErgk7IJ3QvLVtEQhgbhMf2xtGpQPVqgMh16xXaPynLd6w89tivsVyfC
	vqrg==
X-Received: by 10.180.82.162 with SMTP id j2mr122431wiy.4.1440701267407;
	Thu, 27 Aug 2015 11:47:47 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ul1sm4326362wjc.30.2015.08.27.11.47.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:28 -0700
Message-Id: <9873f94b4a88ca4ecf7ed28737c5f7c6f9d6d199.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] packagegroup-base: pull in iw as well as wireless-tools
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:47 -0000

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
 meta/recipes-core/packagegroups/packagegroup-base.bb | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

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
index 262d65f..c5530aa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -48,6 +48,10 @@ PACKAGES = ' \
 # Override by distro if needed
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
+# Override by distro if needed. iw is the future, but wireless-tools is kept
+# for now as well for compatibility.
+VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
+
 #
 # packagegroup-base contain stuff needed for base system (machine related)
 #
@@ -292,7 +296,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
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


