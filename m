Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA9C783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:15 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 196so4253358iti.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nLbMujYGyHlaD28lfqN/9vqMAyXiGjo73kHjjl9DTaw=;
	b=O+PLhBn3H8E3+e4dEwEdGMokxsgUf65XfbTIoWjFEB8V3ntNADdHVnAhEsOJJ9on1j
	HxpRWqvHmFzgYdvaPs2qSRKYxyQVHAs7NSev7h/IfcIA9G8f7Y3NZYXT+gvaKhFbiBK+
	slaahKl2/sRZhW8iNComXqYIaU28qPW+cIzxzk5Noh3ra5Sma6eq1SCQVgq0x7ISzM7w
	yMRQrl23T5Te1fFjcR9Pv4tP8bFAupB3atX3OopK2/FkXxX3f6zjLMBmjW5A/UYRt/ol
	kV2e15M/TzHO9P4WYrr3njSz1fWmd93qz8zXDLjMKUIWBYnHd3tpCCdx8kUjrDn1pymz
	8nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nLbMujYGyHlaD28lfqN/9vqMAyXiGjo73kHjjl9DTaw=;
	b=JpPRbJPrtfCMl7q+9TtSEpEAZOSqFJWEZ7WXQI/kPiNX0WAY3wi40zAWUKApKPqgwC
	dBv5jRKXuZuwRAsDIN1FvZwkt33GjAhDaPBgy5WV/M1iqkGIzWrcnNBOpX32oVzxkL61
	YUbjZngPb96qQqCNebiFgftukHEXwB6n46VbsaFyOM///iSZxzzRmfWFfpY8wN/8WeUT
	UvVAxXDwTiyDxniNsGvJrIwpoCsK2vkayZtLMR0Ao+tGa423dFjF3dxkqmsH7FhnSjgG
	sPnuN2uJD9YVI32ODzwe7nf9cYYksgwd9cjG/8hKu8lSRGkvcwvycxSPoxbl76lVCem7
	ciZA==
X-Gm-Message-State: APf1xPAS642vZPqoT9+n4a2m/toedgYIG1UWxc6/tL/HnLHEb6Y/6PmX
	SfMJJkARG05ARhI+wYkDib9bPr4E
X-Google-Smtp-Source: AH8x225vCmJ1hkQTLxRq6RMv/Lyzg7mb9/dHpEQviQygxNF6PyXN1Y2KTHLpyfy1delwMRYwCqm0Ew==
X-Received: by 10.36.39.215 with SMTP id g206mr4900933ita.17.1517954596744;
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:21 -0600
Message-Id: <2db3817a1a6f8efb4025ad4ca1ab36bd7085d9cc.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 02/14] icecc.bbclass: Fix STAGING_BINDIR_TOOLCHAIN usage
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:15 -0000

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


