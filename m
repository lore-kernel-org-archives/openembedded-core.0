Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEE560745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 22:06:59 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id h201so50350974qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uGJle1CJJJNTaUk1R8h7Z0GhpG1NcVRCwURu/I74MBw=;
	b=H35aw080lGIX2gszDTZA3Y3fEoq7Y7X10YXCvNf1Y+qyFEun/ha4H+3PV7FaKsQBOD
	Gq/OYqSYsU7agBetOfWezkGLFkOTEU4lezpRKKm1UiBS3ls8kG/Xoz+JIjPLkuQODLt9
	kp1eb5nklopVfh+SCzFvjLTZFFQG45Q85jwFRx6DH7GGBBgUWMu850Fvxt008jV/ieIn
	eGvCrGTet53fR+SqlBRA7OywvcYJsyw3uwJ+egtx6KnfbNMIXf1XOiraOSxArDHytkph
	gtb1N6TclQDLwHMYQqQtB5d4C/ELo5GdtePuAtrzpGSfLObd4uToAMrN6c7FDYrEIYwL
	PzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uGJle1CJJJNTaUk1R8h7Z0GhpG1NcVRCwURu/I74MBw=;
	b=cf5ZEExdBgR/A8sQ3Ynqff38+qeBBpXR0ZL+P9hY04ukGjT3SJU80jshQqw9+5ENOS
	6h4CSI62aCXYvlfXC7f910FueoEmmoaLyzB0izSEEja2bDcTRjeR0hkA9m5xNQCbWyFM
	eDA3YgxBgFbvU5PgbkRp8mrh93QB128zkHb27mfp7mTATzTbIwSJtD8UdyaCO/4S0ubi
	MBPu/uj5Glhf7fNEF4ThGcRYuec2t50K4A51bDnsYDWbUcto/qgOwAgi/9y4QYiAICd6
	Y5uelbhtvuf86XrS9t9j0gr5l6G9NXVZ81V5Rip47utNzoSY/4yn0LIJwqxvB5ASE9Tw
	o7xQ==
X-Gm-Message-State: AKaTC03Ov3BThCGO8vIu3XXFBFeSXuV8LNTy4TyptPkeRRRMsyE3J9A2e1drSCk+w6m5Vg==
X-Received: by 10.55.16.10 with SMTP id a10mr18079682qkh.66.1479766020270;
	Mon, 21 Nov 2016 14:07:00 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	q21sm12286712qkq.8.2016.11.21.14.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Nov 2016 14:06:59 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 15:06:55 -0700
Message-Id: <1479766015-20752-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] buildhistory-collect-srcrevs: write an srcrev when named, not None
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
X-List-Received-Date: Mon, 21 Nov 2016 22:07:00 -0000

From: Christopher Larson <chris_larson@mentor.com>

The script was writing the main 'SRCREV' value for SRCREV_name, not the value
of the latter. In the case of recipes without 'SRCREV', like linux-yocto, it
was writing an srcrev of 'None' for all of them.

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/buildhistory-collect-srcrevs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 8a03580..d375b04 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -101,7 +101,7 @@ def main():
                 for name, value in srcrevs.items():
                     orig = orig_srcrevs.get(name, orig_srcrev)
                     if options.reportall or value != orig:
-                        all_srcrevs[curdir].append((pn, name, srcrev))
+                        all_srcrevs[curdir].append((pn, name, value))
 
     for curdir, srcrevs in sorted(all_srcrevs.items()):
         if srcrevs:
-- 
2.8.0


