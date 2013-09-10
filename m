Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8214F6101A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:15:15 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so1046042wib.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2Uiz6OaVlm/nQzbIWgJEMKe1MbJKi+tdVC0vmxM8s7s=;
	b=MV0kNbaJHSWe5Wjf5DcKsUwQgvdJPk2LeZab2WppjMNTFV5ZrbtnuKCEf0OcWa9SvU
	gf53WHuWwUOmleLNg8WjjJ68thBxl7pbterBwHmD79mXfmq4VO6Yty8wxVzl50dmNuLw
	SDRSs6mLv17n6lmRU+JG09WJamcJpFVXN7SCkflrXNOHJL8KbSMnDGmbiQYVaDRjmbEd
	Wi9qIWTLBquZ1teQyS/DVbS/4kVVmj52CWCDVuW5G9dA0tY80+7mvbtdNytqPA05PGNG
	PCP/KXSKXad4yI8fNHt286C4XTtCs0YWHphatv65e/EZI1W9ZujIgVB6enjrkUu94e+/
	EtQQ==
X-Gm-Message-State: ALoCoQmmC3PAw1ihxLJSZb4fT96hXOpKSqfp5kLykEWz2ZBUzhBgw5EPYOYYnJbTQCDsZW3dtou2
X-Received: by 10.180.183.108 with SMTP id el12mr13482532wic.55.1378833316469; 
	Tue, 10 Sep 2013 10:15:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz8sm4932950wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 10:15:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:15:05 +0100
Message-Id: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] base: improve PACKAGECONFIG handling logic
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
X-List-Received-Date: Tue, 10 Sep 2013 17:15:15 -0000

The existing code for handling PACKAGECONFIG lists wasn't the cleanest Python
around.  Instead of diving into the list directly using indices and lengths, use
pop() to iterate through the list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index dfa580c..12c8741 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -420,7 +420,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            if varname.find("DEPENDS") != -1:
+            if "DEPENDS_" in varname:
                 if pn.startswith("nativesdk-"):
                     appends = expandFilter(appends, "", "nativesdk-")
                 if pn.endswith("-native"):
@@ -442,12 +442,15 @@ python () {
                 bb.error("Only enable,disable,depend,rdepend can be specified!")
 
             if flag in pkgconfig:
-                if num >= 3 and items[2]:
-                    extradeps.append(items[2])
-                if num >= 4 and items[3]:
-                    extrardeps.append(items[3])
-                if num >= 1 and items[0]:
-                    extraconf.append(items[0])
+                if items:
+                    extraconf.append(items.pop(0))
+                # Skip over disable
+                if items:
+                    items.pop(0)
+                if items:
+                    extradeps.append(items.pop(0))
+                if items:
+                    extrardeps.append(items.pop(0))
             elif num >= 2 and items[1]:
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
-- 
1.7.10.4


