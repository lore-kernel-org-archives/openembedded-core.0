Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6ED7D299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:26:54 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id a6so5011174oie.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NGAcABQROjmWTHEHuhbrl/hFBJW77qZTSu4ECk8XHp8=;
	b=hQjewodUH+axjklkYeZ5TaefVailh6CGhvtC75q0DurATlVjRwl7V/b4CGjPSLtKVl
	gXCtI4Wh8abTELN1JPBz4fIkEUz/F8/lJQw9zPe/ecwYjrxyuyQdLX1qp5zznQP2TKA4
	efO4eYJAoetYHIF4JTzlrCy+VmwAieugjpm1xkS6BujRWfshbiThtY8+p6F/PWbyn5zQ
	cmwGoFixgMMj6MKgfMIOfs8y5OO7dqNC4nyCtLfvxF95IbCihiYxb41t2EArAvzzxsZS
	dfg3XdjQtrw3P3w7ZKAIBgxZbqPKiQU/CXaR/EoxBa01rUuwKTJxwDD38R1s78dHnUZp
	KBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NGAcABQROjmWTHEHuhbrl/hFBJW77qZTSu4ECk8XHp8=;
	b=HKm/BX3L0bAwnAzAE8bWHfjFBp3LKf4Nj00UYTL/wUgWsqU9CJoUPcAtwLwi4N26UC
	oqXgoevgkc1rahU0pKVdJk6qnX4n3mhtVEyxvYiT8tRyqSgvHIVJu8+n25EaPQEjC5KR
	MkE0LH9n0pMJ+qdJ/0E568Lw3UB131Bd41+Zyjdp4oIvT/yUf/PAaUx+GKdSdRlOBMko
	Fgwqt5hgvLnVj65WkL1zCUd0breZVBvSNFnI4luiulsnz6D7EmGe7xtvnavp1//41Nam
	mWtNAmRGnjA/xGybU0XuWeUYVOywzUxNjAi/6W4hNVhEtCzAiDfXfigxdE2JAzb79bNw
	oDdg==
X-Gm-Message-State: APjAAAVTTLqdDQnWoankUHO8A38FOj41yuX5am4HXuhS6BgPgmDbto8o
	dqwZS+JcbfYdx+mHg3EYaztmuBA7
X-Google-Smtp-Source: APXvYqwc8Zf6bolyU6JHlpe93cmRRY8kHg4WKSRYGo8jM/rzu8uJdRfvfkrgp1OJjBlF9v/LWegNiA==
X-Received: by 2002:aca:ab82:: with SMTP id u124mr7130837oie.41.1554474415128; 
	Fri, 05 Apr 2019 07:26:55 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	j82sm4056967oih.31.2019.04.05.07.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 07:26:54 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2019 09:26:39 -0500
Message-Id: <d370d05c79d7f49eaaee544d995343f77e6773eb.1554474048.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554474048.git.just.another.mariano@gmail.com>
References: <cover.1554474048.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] update-alternatives.bbclass: Add function to get renamed binaries
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
X-List-Received-Date: Fri, 05 Apr 2019 14:26:54 -0000
Content-Transfer-Encoding: 8bit

This adds a function to get the new name for renamed binaries by the
update-alternatives class. The function uses the build metadata because
some update-alternatives binaries/scripts lack the feature to provide
this information.

This also adds the function _ua_alt_target for code reuse.

[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/update-alternatives.bbclass | 43 +++++++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 537e85d9a3..d601dfc700 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -216,6 +216,43 @@ python apply_update_alternative_renames () {
             update_files(alt_target, alt_target_rename, pkg, d)
 }
 
+def update_alternatives_get_alt_target(d, link):
+    """
+    Returns the renamed binary modified by update-alternatives class.
+
+    Unfortunately not all update-alternative binaries/scripts implement a way
+    to provide a list of binaries for a link, so we need to use the build
+    metadata to get the information.
+
+    NOTE: This function needs to run after apply_update_alternative_renames
+    """
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+            alt_link   = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
+
+            # Just care for the link being asked for
+            if link != alt_link:
+                continue
+
+            alt_target = _ua_alt_target(d, alt_name, alt_link, pkg)
+            if alt_target != alt_link:
+                return alt_target
+            else:
+                return None
+
+    return None
+
+def _ua_alt_target(d, alt_name, alt_link, pkg):
+    alt_target = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or \
+                 d.getVarFlag('ALTERNATIVE_TARGET', alt_name) or \
+                 d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or \
+                 d.getVar('ALTERNATIVE_TARGET') or \
+                 alt_link
+
+    # Sometimes alt_target is specified as relative to the link name.
+    alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
+    return alt_target
+
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
 python populate_packages_updatealternatives () {
@@ -232,11 +269,7 @@ python populate_packages_updatealternatives () {
         alt_remove_links = ""
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
-            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
-            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
-            # Sometimes alt_target is specified as relative to the link name.
-            alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
-
+            alt_target   = _ua_alt_target(d, alt_name, alt_link, pkg)
             alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name)
             alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
 
-- 
2.19.2


