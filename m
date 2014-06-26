Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id B491C60169
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 14:17:12 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so3775002wes.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 07:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F3OXn6Py/j2O+LuJkrrudhrXlIkDvE8jJ+49cxDG27A=;
	b=XUMEYMbuy3lF8Pqbj0ikeVitvi8rAdi6mJlTML05/1yIr1CCE0D20OamqBuEaVW3im
	4htFNKV9+IN9H65Bb9nCeTDLyZQxwGMs5OL7vsSPIrDOeYs/MKkbJCxXLbSqBLq0edP+
	TX3jDgprUrSjwUFLLTeaN3iA04cTnbiatLk7pelfO9tb3hQj+LHLx8ukk58jLNtVIYDe
	hPEf8rWZCVyJxQCzQOWKoke3cXp6kgOIc3ehWi4aFF7y7R2dqo21BRHcegK1J/AewgVk
	U6kjv7AagwixxknBpb4Zb60VQO4tt6YFlI+rySmrfL/kgSLvLOVcMI0j7BfOln8mexe9
	gbBg==
X-Gm-Message-State: ALoCoQk2mxyLv45Hu2i50il5Z/3ZLCOWJY6V7X6W8PN70HdUQEz5EWRNl2Hy4ukIh4BxrGNJRR1i
X-Received: by 10.180.100.200 with SMTP id fa8mr61585wib.23.1403792231181;
	Thu, 26 Jun 2014 07:17:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ez8sm24982213wib.12.2014.06.26.07.17.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jun 2014 07:17:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jun 2014 15:16:55 +0100
Message-Id: <1403792215-4306-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] patch.bbclass: unset TMPDIR after use
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
X-List-Received-Date: Thu, 26 Jun 2014 14:17:18 -0000

GNU Patch < 2.6.1 has a race condition so we create a per-instance TMPDIR to
avoid this.  This was implemented by setting os.environ[TMPDIR] but at the end
of do_patch the temporary directory is deleted but TMPDIR is not unset.

In general this doesn't cause a problem but if do_patch is embedded in a larger
function then TMPDIR is set to a directory that doesn't exist.  Avoid this by
removing TMPDIR from os.environ when the directory is deleted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/patch.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 86c65b3..1e2aab0 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -177,6 +177,7 @@ python patch_do_patch() {
             bb.fatal(str(e))
 
     bb.utils.remove(process_tmpdir, True)
+    del os.environ['TMPDIR']
 }
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
-- 
1.7.10.4


