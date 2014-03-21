Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id BF2136FA59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:22:09 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so1865513wes.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 11:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UiaJRvVR3ForX21bf76hc7RX+pDULFdQu+48zZzwk74=;
	b=AN+5Qwu+ahFjKvxuGVqW1MGiMrdtQJMCnd5NOZIg4lv8R1k6Im0Qs1EAO/NxqwlQiK
	iYfXMw4TT3xvJxelfWOOEZPjNkdC3tAVpjFBn4S0ZFGhosRa/3LWEYVy/KIoDvT3lKKf
	7banud1qiESuhw3TJ+6B17VjmSUN500jVjYQt2U/AaIJIuGb70AICejUgvIqOcvpxWc6
	mpjmgFMAdnMMLCu5uJQRAWepu72YF+ZSoQXATpUn67D3ImkGhrVyhMhRCcX/40c8ibAq
	DB1CYKutQcMThpRgfTAP5M4AMM9WZAIxG4ZxWVu6bGy834yqwjM0YxmLKplVbLl5ksjy
	0S5g==
X-Gm-Message-State: ALoCoQlL/IyqkxxXYHJ6pnBgA+z9Szul0LHpKrkxFTo1DPhk91qTSLzzw39YeUyJDFRGTyfciQZO
X-Received: by 10.180.108.199 with SMTP id hm7mr4323466wib.1.1395426130289;
	Fri, 21 Mar 2014 11:22:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r1sm7652048wia.5.2014.03.21.11.22.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Mar 2014 11:22:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Mar 2014 18:21:59 +0000
Message-Id: <1395426119-3011-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395426119-3011-1-git-send-email-ross.burton@intel.com>
References: <1395426119-3011-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] gtk-engines: move engine schemas to a dedicated package
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
X-List-Received-Date: Fri, 21 Mar 2014 18:22:11 -0000

The GTK+ engine schemas are not insignicant in size but also mostly useless.
Put them in a sub-package instead of PN so they only get installed when
explicitly required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 5255f00..33b6afe 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -10,6 +10,7 @@ DEPENDS = "intltool-native gtk+"
 
 PR = "r3"
 
+PACKAGES += "${PN}-schemas"
 PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
 
 RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
@@ -21,8 +22,10 @@ RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
 RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
 RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
 
+FILES_${PN} = ""
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
+FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
-- 
1.7.10.4


