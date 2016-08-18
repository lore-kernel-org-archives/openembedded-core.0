Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A71AC763F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 07:56:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so3758431wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 00:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b7FBD7Nnwq97x7LyG7478m8xLV0D4EP8rmSM3/qw4x4=;
	b=dFM80iX6nFJ+IkB7oUGzGTpxgAInu3n+gRhPvR9AVE0IxyGgFl+xPgw2TEyKLgii4k
	ShQgRpo8FMyuQFkYuAjOIkaR+edrzSFNw2p3EA4cc1oRMB8U/hA8St8bs4fnJarYly60
	eZk9qJ+reDqR/DUnWt5i9j6ZQFeMBOUp7skZNv6JbyVXCc9m93S8X6h4r4N7iaVPFRtR
	BfqbB85W91fTVA6eT9WedDmpxTZOBS8Jn4ZUvSvcROeUGcMeTUkEblwcY5i6WbvJ6SPD
	pD5UOAUyPrAPQ0UqG3/1zWvEfbrwaZMNEOZbpiecDZ6tymWbDlxXt3csidABJOiFSLbV
	gAag==
X-Gm-Message-State: AEkooutpl4ejolJ6LLKwv4vGhcURlWAv0+oS0B64Dm1Szm/Qw1QaRke3up3SsXx1sfikvA==
X-Received: by 10.28.203.134 with SMTP id b128mr1201543wmg.36.1471506992571;
	Thu, 18 Aug 2016 00:56:32 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q65sm1318701wmd.24.2016.08.18.00.56.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 00:56:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 08:56:25 +0100
Message-Id: <20160818075626.15973-3-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818075626.15973-1-git@andred.net>
References: <20160817152538.14181-1-git@andred.net>
	<20160818075626.15973-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] kernel-module-split.bbclass: generate dependencies across recipes
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
X-List-Received-Date: Thu, 18 Aug 2016 07:56:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The information retrieved via depmod is incomplete with
regards to kernel modules that are dependencies, in
particular where two kernel modules are built from
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


