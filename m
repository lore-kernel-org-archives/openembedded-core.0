Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Md-0000K5-DO
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 19:07:02 +0100
Received: by mail-wi0-f173.google.com with SMTP id ez12so37185wid.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=39B/tQuOJiq2yXlWol0HCdvvFd2qSHca7LsT+vQbZgo=;
	b=gAdlD1WEafPPSCK4LZ9GWKoHICrGuXj6b4wfR4nEUjX40happjxxQmPE6XGw1fXqXd
	Hsjunb08wP62+RfR8T8eNHdYM/xed8J3wJnqcMn54pjNpHFP56P9Eu/I7836BpDvdm8B
	3d5K4RATO3/EFB4K+viBHiw5+XqRISx1Y61opZeLb/JB7Z/vbyy2YggPr8cf678UD/ur
	LLgBrj3KQ7vdCJeO4mXq7WkySJAhi8GYyIT7vUSVcy9k96S618Q3CT/L5h9rqcjo15H/
	ggTEXeczWxj2oifRkxhDJh0Wl+B8c2OZGu6TxE7Ttw/Rp36+62su5qBMTHU1Cn2I6P0H
	EdlA==
X-Received: by 10.180.72.165 with SMTP id e5mr12947142wiv.7.1363974115379;
	Fri, 22 Mar 2013 10:41:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:39 +0000
Message-Id: <9be960b9dc1f6970577d93d349c47800271ec87c.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlVd9T1WFU5BlVujiiEYQKB65VnCzTbxL8IvNUwFLmchr4epNZkPPwDn5I/YKoXd/sZmFXj
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/22] packagegroup-core-boot: revert to specifying sysvinit as default init manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 18:07:23 -0000

Don't follow DISTRO_FEATURES_INITMAN as that makes the packagegroups rebuild if
you switch init manager.

As in hybrid situations there's generally a clear primary and minimal init
manager choice, so change VIRTUAL-RUNTIME_init_manager to set the primary init
manager, and roll your own groups/images for the secondary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index e73b46e..7f278f6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -26,8 +26,8 @@ RCONFLICTS_${PN} = "task-core-boot"
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
-VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES_INITMAN', 'sysvinit', 'initscripts', '',d)}"
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
-- 
1.7.10.4



