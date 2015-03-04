Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBBE7378D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 13:03:56 +0000 (UTC)
Received: by wesp10 with SMTP id p10so44011902wes.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 05:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LpZ92pszRc8iOSgfCGCkc/LeQUO6R44YT/qcAFmhiXs=;
	b=KE/37jFdnXn7wGWQUMN/GL5figbNE6vwagupix8Gpnt9lg4F3lulJt43KMgGBpIdry
	ObH+f28lJejANAReztKj3xLwsO2URCGEAaYphp9EyTXnBkhlJBy4xGuaWB2DbGTjYh+D
	YQeXfcO1yHJbpqFw8NuiZnRufVVgQiw4DGiWZdtLmvHmsl+UsAZQFst/cidYetC28RIP
	4PvXKlT0yEzwAS/Zqi09D1bVa+ip6prLsKAbPRbDIcw0GrlIH+AbF6RTZJXPpOJth6UJ
	lHfQaqJ5LjFDqsTgBS700Jo47bCcSCBl4Z8GBE0iDJr7HQCTo+EeLt10ThkwUW8uBxf6
	DXTw==
X-Gm-Message-State: ALoCoQkAWy5FwWrTM2AehTxD4jXQeVkOWMtrSsbOcKSl335HlN+w6NuX7I/+WvEoXl6fTR4uqSjM
X-Received: by 10.194.75.193 with SMTP id e1mr7686045wjw.126.1425474237298;
	Wed, 04 Mar 2015 05:03:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hl8sm5873667wjb.38.2015.03.04.05.03.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 05:03:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 13:01:23 +0000
Message-Id: <1425474083-4782-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425474083-4782-1-git-send-email-ross.burton@intel.com>
References: <1425474083-4782-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] pkg-config: strip system library paths reliably
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
X-List-Received-Date: Wed, 04 Mar 2015 13:03:59 -0000

pkg-config was skipping every other link flag due to a list manipulation bug,
backport a commit from git to fix this.

This will stop users of zlib.pc from inserting the sysroot directory indirectly
into builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...Strip-system-library-directories-reliably.patch |   30 ++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb  |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
new file mode 100644
index 0000000..84d0dd8
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig-0.28/0001-Strip-system-library-directories-reliably.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport (will be in 0.29)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ce1a2416ce0f0bd9a8a8a5caaf7dad20cda4d47d Mon Sep 17 00:00:00 2001
+From: Andrew Oakley <aoakley@espial.com>
+Date: Tue, 29 Apr 2014 13:14:35 +0100
+Subject: [PATCH] Strip system library directories reliably
+
+This loop was changed from a while loop to a for loop in commit
+9bf6277b, but the iterator is now advanced twice each time round the
+loop.
+---
+ pkg.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pkg.c b/pkg.c
+index 3697fec..c847c95 100644
+--- a/pkg.c
++++ b/pkg.c
+@@ -917,7 +917,6 @@ verify_package (Package *pkg)
+             }
+           system_dir_iter = system_dir_iter->next;
+         }
+-      iter = iter->next;
+     }
+   g_list_free (system_directories);
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
index 3070da9..57a22d4 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
@@ -4,6 +4,7 @@ SRC_URI += " \
             file://pkg-config-native.in \
             file://fix-glib-configure-libtool-usage.patch \
             file://obsolete_automake_macros.patch \
+            file://0001-Strip-system-library-directories-reliably.patch \
            "
 
 SRC_URI[md5sum] = "aa3c86e67551adc3ac865160e34a2a0d"
-- 
1.7.10.4


