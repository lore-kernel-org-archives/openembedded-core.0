Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3B858609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 20:08:53 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id z11so527284lbi.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=Cpn46VTjmFPfQ0/AVwR3rr79j/QyDUhiZYo/LvsqnG0=;
	b=ZIjLtYjP93Tt8XjOdYocFcnorHo9GC5mXlil/bYuT7yt5zOpoBrSASJDXyqAl3vYNq
	8zdeucaYk+TcSJzvT05kpboOsZpy6F5ymAUVK7yDfqgm8cq8BTcM5PuqA+uLQV+1V7mK
	44uWrr4Kq7lIMtScIFazrXzVfvVKekYKisffhDUw0Xi0yuSqz2wbJ6OBrsb6kl1ABFoo
	SuvtzOPVxwGYLeLK9xapq7ubDyt15pcd1fnC6a0N0BrZUFgJNZIFlotMmgPwVOhnJoCk
	FhpBGx0nVvtIcdcRcuYRsSTqEqyBYjHhv1uvsFRo930b3ytvQOxaDwedTEx/p139AS8r
	S0xw==
X-Received: by 10.112.218.99 with SMTP id pf3mr748272lbc.5.1398802133216;
	Tue, 29 Apr 2014 13:08:53 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id d8sm3945190lah.12.2014.04.29.13.08.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 13:08:52 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 22:07:09 +0200
Message-Id: <1398802029-13155-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] feature-arm-thumb.inc: Suppress false warning
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
X-List-Received-Date: Tue, 29 Apr 2014 20:08:56 -0000

If a recipe does not explicitly set ARM_INSTRUCTION_SET, then there is no
need to throw a warning:

  WARNING: Recipe 'foobar' selects ARM_INSTRUCTION_SET to be 'None',
           but tune configuration overrides it to 'arm'

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 670e68e..a94386f 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -19,6 +19,8 @@ ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d
 ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
 python () {
     selected = d.getVar('ARM_INSTRUCTION_SET', True)
+    if selected == None:
+        return
     used = d.getVar('ARM_M_OPT', True)
     if selected != used:
         pn = d.getVar('PN', True)
-- 
1.9.0


