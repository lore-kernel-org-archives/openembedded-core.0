Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDAD17016E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 15:25:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so25234623wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lsp83SIJNAqC7pk/l4bRI4caKhZwkcFT/bAHWx/tG4s=;
	b=Mmi2C1Ek+syo2qUNRJW3bOGxxsf94JDMTEkPrdJhm8lc4ZFjNXEiNJ8X6vgli0XrCQ
	5uio/8TUDs/I0uRgOt5hjVC21nLPOUohzzJvYIsMyOXLuZJLVLpt4XgBSgNHTTQVk43v
	6EdNuYRwfEWd1U130cmv7aJRBtJv9Fx36+Xp+SggBRaKsNM4KlU+/R0tLO/l7Z2vBrJk
	RYqwobgAEToHjrK4Qv1aQZmCg0uYUHsFVn/h/V8bwlSuWRid8048UGxY2FRFOm4sAbbI
	r89ENbKVvRWoWa7+2/dmwXqdt75oJ3pil9s7XpJwGzPMy0ISZc2VOR1Vrqs7WDfbSd9B
	dz6Q==
X-Gm-Message-State: AEkoouvP+Mjk3KFqNsyWviSKJgBeTUqlTJnSNWx9r12x8EbpDKkbem6RyiNCutLt0OjDFA==
X-Received: by 10.194.78.74 with SMTP id z10mr47733504wjw.68.1471447546840;
	Wed, 17 Aug 2016 08:25:46 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a21sm27188657wma.10.2016.08.17.08.25.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 08:25:45 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 16:25:38 +0100
Message-Id: <20160817152538.14181-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160817152538.14181-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] kernel-module-split.bbclass: generate dependencies across recipes
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
X-List-Received-Date: Wed, 17 Aug 2016 15:25:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The information retrieved via depmod is incomplete with
regards to kernel modules that are dependencies, in
particular where two kernel modules are build from
different source trees / recipes, which leads to incomplete
dependency information for packages created.

So far, our packages created didn't contain dependencies on
packages created by other recipes, as we solely use depmod
for that, and depmod can only work well after *all* kernel
modules have been copied into one place - it doesn't work
well in a staged approach.

Now that all .ko have correct dependency information at packaging
time, we can use that information to properly track dependencies
across recipies, and can combine the information from the
.modinfo elf section with the information from depmod.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/kernel-module-split.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index ed42d2b..db0ad33 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -173,7 +173,15 @@ python split_kernel_module_packages () {
             d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
         rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
-        for dep in get_dependencies(file, pattern, format):
+        modinfo_deps = []
+        if "depends" in vals and vals["depends"] != "":
+            for dep in vals["depends"].split(","):
+                on = legitimize_package_name(dep)
+                dependency_pkg = format % on
+                modinfo_deps.append(dependency_pkg)
+        depmod_deps = get_dependencies(file, pattern, format)
+        all_deps = list(set(modinfo_deps + depmod_deps))
+        for dep in all_deps:
             if not dep in rdepends:
                 rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
-- 
2.9.3


