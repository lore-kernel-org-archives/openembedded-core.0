Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF57C7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:24 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id d10so1344504itj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nLbMujYGyHlaD28lfqN/9vqMAyXiGjo73kHjjl9DTaw=;
	b=gzmz9bCnL09aE/eyCHpvrt3Gf0Jg+DhvV4If+iwnywVrJLI0c5nPxwHPOpm5nORgjb
	vZW9z6ihkPf1SgOx+JFB3TyfekkVrrvhMlGhFd/cptME8uvllVyENztgI1Y7CL8TkFlO
	nPLB2Kx40plJ/ajKWJ3vGOWcfXoOCeBBMS4ENbGyMpJtaheJccK4s3DaSCJn00VHB/1P
	Y9fPxDvpns+st4HZP5yxeVrlvOzYYybLmbPld9SXNvVq38CDdXKAp492yarkT+6Y1E6Z
	r7tkrkPXBx28l9LJ4FArOwjHhECDCoXYHOED/RB/NtcYRcJdFE2qKWNL5zIFvr/qYwVN
	6GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nLbMujYGyHlaD28lfqN/9vqMAyXiGjo73kHjjl9DTaw=;
	b=QnqP/IStl6FzsudOe1aBEEAHXD2ICWY1DriQbCZPBAveTAjCf11WCIrmHgbfTWwB4K
	JH/G3Vi0Dcrh3rnCIoOaGhRdfim5V9po78U5Pe6/Y/FmBAKk9FiR7SH8Pp5YoPKptIj+
	iCUbbq38ywjKuc7G6x1I7ADBwnCgLgKZTFQrDQEkkCm++zMpfnVHJ/biqJq6xXXmZTyF
	HcUKlj59t5Ko0MS88c0aj2U+egp8BV8+KpYrd4dgYj0ZwGzl8L8/0ABpc+L5fhm/OVou
	HXIkfC4EJitkNp65DiQS3jasv1VHD24o6b07XpJ3GH2TDB42Kj4pNToTzteyRJOcB5Ao
	czYQ==
X-Gm-Message-State: APf1xPBaHCTEoM4PprZATZXgsa7kXioGfaM1cQR7tSxxF6pMXXgkkEzd
	CFrzU2Rsr0jMuI2FUq3E9nsvjg0z
X-Google-Smtp-Source: AH8x224y3vYJDk4RvIvyD3WT+mqWkhUYBFpMgUYCaodSjJpflwoKOjfQPX674223x+y0z4tr34Ve+Q==
X-Received: by 10.36.120.80 with SMTP id p77mr6038938itc.115.1518454345886;
	Mon, 12 Feb 2018 08:52:25 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:51:57 -0600
Message-Id: <fe95881608b727e473af111c05cd1b4ada74ab32.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 02/17] icecc.bbclass: Fix STAGING_BINDIR_TOOLCHAIN usage
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:24 -0000

STAGING_BINDIR_TOOLCHAIN is actually a path list, not a single path. Fix
icecc.bbclass to try all the paths in the variable instead of treating
it as a single path.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e8725b582b3..35a1aaef86f 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -210,15 +210,14 @@ def icecc_get_tool(bb, d, tool):
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
         target_sys = d.expand('${TARGET_SYS}')
-        tool_bin = os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
-        if os.path.isfile(tool_bin):
-            return tool_bin
-        else:
-            external_tool_bin = icecc_get_external_tool(bb, d, tool)
-            if os.path.isfile(external_tool_bin):
-                return external_tool_bin
-            else:
-                return ""
+        for p in ice_dir.split(':'):
+            tool_bin = os.path.join(p, "%s-%s" % (target_sys, tool))
+            if os.path.isfile(tool_bin):
+                return tool_bin
+        external_tool_bin = icecc_get_external_tool(bb, d, tool)
+        if os.path.isfile(external_tool_bin):
+            return external_tool_bin
+        return ""
 
 def icecc_get_and_check_tool(bb, d, tool):
     # Check that g++ or gcc is not a symbolic link to icecc binary in
-- 
2.14.3


