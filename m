Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96037C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 10:25:08 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.18804.1754648699474262141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 03:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cM3qs0uq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025080810245489be6d05cd0482c245-peuzs5@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025080810245489be6d05cd0482c245
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Aug 2025 12:24:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ced5+T2bqmp2+LTGj2sXLnySG/Rd/jjNHgRlUlBaAw0=;
 b=cM3qs0uqIi0fYooePqoSnkLC+x23Ktad2yzcKNj60t47INhe/v8f0Eic8wFZJ5y/n/RQ5v
 /gKHAx12O9dqkUgESpDYSyVEPYtiTq7DvM6qb0sNLl7mjMeOVC0R2U38WpcGFtCMDLt8fYhb
 CZKH2bHqFDrH3brtZxkdodFyqqq1wFe5o9tsVYH1q0J8hH2SJemIzgp9xZNWP4+woMf/0bDu
 QUk6PYCW4hTdYSsAbSlHW7NkRa2S0I7pFNq3XrMeFWTadIOPWmVpUH32pOmuu0+1VwpkWQeR
 qzkx++v3iG3DstzmRH08sDc0FeFuLVBlalv5d0yMcKJkRM/JYyUufTrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 1/3] oe/utils: extract method for parallel_make without d context
Date: Fri,  8 Aug 2025 12:24:11 +0200
Message-Id: <20250808102413.10446-1-peter.marko@siemens.com>
In-Reply-To: <20250808055059.8851-1-peter.marko@siemens.com>
References: <20250808055059.8851-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221647

From: Peter Marko <peter.marko@siemens.com>

oeqa does not have general access to d variable context and needs to
determine parallel make settings.
Extract the code from parallel_make into reusable parallel_make_value.

Also correct function description of return value from None to empty
string.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/utils.py | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 779c5e593f..8aa15373f1 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -174,18 +174,14 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
-def parallel_make(d, makeinst=False):
+def parallel_make_value(pm):
     """
     Return the integer value for the number of parallel threads to use when
-    building, scraped out of PARALLEL_MAKE. If no parallelization option is
-    found, returns None
+    building, scraped out of given string. If no parallelization option is
+    found, returns empty string
 
-    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
+    e.g. if string is "-j 10", this will return 10 as an integer.
     """
-    if makeinst:
-        pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
-    else:
-        pm = (d.getVar('PARALLEL_MAKE') or '').split()
     # look for '-j' and throw other options (e.g. '-l') away
     while pm:
         opt = pm.pop(0)
@@ -200,6 +196,20 @@ def parallel_make(d, makeinst=False):
 
     return ''
 
+def parallel_make(d, makeinst=False):
+    """
+    Return the integer value for the number of parallel threads to use when
+    building, scraped out of PARALLEL_MAKE. If no parallelization option is
+    found, returns empty string
+
+    e.g. if PARALLEL_MAKE = "-j 10", this will return 10 as an integer.
+    """
+    if makeinst:
+        pm = (d.getVar('PARALLEL_MAKEINST') or '').split()
+    else:
+        pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    return parallel_make_value(pm)
+
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
     Helper utility to construct a parallel make argument from the number of

