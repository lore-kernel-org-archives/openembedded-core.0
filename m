Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 608A27833C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 07:13:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q132so14266532wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R1kkiQNaNu64k9zmEQGYPAnDKKhZEVJ1IuciYLD5OMw=;
	b=MRernI/VQ4xU5XNF5Ab5cQBT5xmXekp3KM1SVVPquW5DtorC5jbnOS4yO3iuxsYDuH
	Ee92V4dsRzQqbNyjoswWD9xVwI/U7BMl+df/ut5ahMGXqi9iAhH5kBN0Eu/7THjGY6XE
	JH/er0o0WUs/0Cm3f44vCm5I2v6N3gKf547VDY+IGaKkQQ8V7Ff0WkKg1aJRWP6iiG8n
	iETn5Ff/tcuQ6zNOnVQa3l2Qr6zAMYjt7uelTD8w6iql0O6o+xQOR4+hH+i/CwuaX6+z
	iTeGzYec/6xaQzq4nXAMNqcUyKRE4wxiQZxQdB4rsNnEhEtYCiGeek705te7dWMpErp2
	YMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R1kkiQNaNu64k9zmEQGYPAnDKKhZEVJ1IuciYLD5OMw=;
	b=hc1x/NnupSAGiXWvfgFqnf6QrwPo1yiob/CbSuwOg1efbxQ8X1k5x2Rz8Tf5cTUyRC
	vFluoShV/IjCqTt7lhn8KubbbLHV0qUa8Hjes0ifs7QnAs34TXSC4eAPSHbV2KEl9+nL
	47hSGgseyq9VnDsVZA2NMRhdnieAiWMMgT8/MovBxqsORZHdK9mu3XcMvAK4fQpRzmZz
	2w7d5es7Ghl2xRIyez3q/4kMZ70pi6UbAsyxfOy8oOym95Fqwd8n2TVGz34YDvwPyLIu
	+uSulDP5Fqbx8VuylZ+AfYlmOEp0EPZuQBarIOW0KCUS/a3YCBG2zQHFeUO1sJyuPYFb
	ayHA==
X-Gm-Message-State: AMCzsaWXKcxZBnBy490ZSELJwyWnSsmX28aw/K2wUTJsWgc8tR9GfBvd
	9+WVkRSRNxrJfv6N8SDsSndsIRTEEQ==
X-Google-Smtp-Source: ABhQp+Q5BftTpgakrsXKQOGUNzCMA9B7VTAcIq4c2Ba7pyUtgGVFnI2rlvfgBMJppvnaAZgezKV3hg==
X-Received: by 10.28.22.2 with SMTP id 2mr709361wmw.47.1508397217674;
	Thu, 19 Oct 2017 00:13:37 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p54BD539E.dip0.t-ipconnect.de.
	[84.189.83.158])
	by smtp.gmail.com with ESMTPSA id r68sm793081wmd.4.2017.10.19.00.13.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 00:13:36 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 09:13:25 +0200
Message-Id: <3f8409664a4ab00c05d2804c9c4642c4ceb3059b.1508397167.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c50c4521e6299e86250f5b3ff2b58709500814e5.1508397167.git-series.patrick.ohly@intel.com>
References: <cover.c50c4521e6299e86250f5b3ff2b58709500814e5.1508397167.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] useradd-staticids: skip recipes without static IDs
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
X-List-Received-Date: Thu, 19 Oct 2017 07:13:37 -0000

When enabling useradd-staticids.bbclass, one has to define static IDs
for all recipes in a world build, otherwise those without static IDs
generate parse errors or warnings, depending on USERADD_ERROR_DYNAMIC.

Defining unused IDs is a lot of work and clutters the passwd/group
file of a distro.

Distros which want to avoid this can now set USERADD_ERROR_DYNAMIC =
"skip" and recipes which would have triggered a message then silently
get disabled. Trying to build them then still shows the error message:

$ bitbake apt
...
ERROR: Nothing PROVIDES 'apt'
ERROR: apt was skipped: apt - apt: username _apt does not have a
static ID defined.

However, some recipes only get selected indirectly through
dependencies. If the recipe providing something that is needed for the
build gets skipped (for example, the nfs-utils recipe providing the
nfs-utils-client package), then the error message is a bit more
obscure:

ERROR: Nothing RPROVIDES 'nfs-utils-client' (but
.../meta/recipes-core/packagegroups/packagegroup-core-nfs.bb RDEPENDS
on or otherwise requires it)

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/useradd-staticids.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index eb8e59e..3d0bc09 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -40,10 +40,14 @@ def update_useradd_static_config(d):
 
     def handle_missing_id(id, type, pkg):
         # For backwards compatibility we accept "1" in addition to "error"
-        if d.getVar('USERADD_ERROR_DYNAMIC') == 'error' or d.getVar('USERADD_ERROR_DYNAMIC') == '1':
-            raise NotImplementedError("%s - %s: %sname %s does not have a static ID defined. Skipping it." % (d.getVar('PN'), pkg, type, id))
-        elif d.getVar('USERADD_ERROR_DYNAMIC') == 'warn':
-            bb.warn("%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id))
+        error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
+        msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        if error_dynamic == 'error' or error_dynamic == '1':
+            raise NotImplementedError(msg)
+        elif error_dynamic == 'warn':
+            bb.warn(msg)
+        elif error_dynamic == 'skip':
+            raise bb.parse.SkipRecipe(msg)
 
     # We parse and rewrite the useradd components
     def rewrite_useradd(params, is_pkg):
-- 
git-series 0.9.1

