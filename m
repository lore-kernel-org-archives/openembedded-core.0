Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.12021.1613756035406596583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aYSidnNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id x16so7710347wmk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QhXUHe/ldlnYJFBTAlUQF7T3GNwozwzf8f/PjU3JYTA=;
        b=aYSidnNy7L9TcmLsRVj+mftktoaEnz7OKtJV0piT5LpJKfGEV60XbU24HNMrT0pIyI
         33E6q5C7CJzsqWtLPKMlOzMsuJMP+SOMxhwMdfNiTnNp+0E0RdWfJhhmNL27zscndK8p
         /7xLTfgdNbi/5So2jAdiUQAac1SyCBPNcv2as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QhXUHe/ldlnYJFBTAlUQF7T3GNwozwzf8f/PjU3JYTA=;
        b=lZGWdVre+Bp33gSrQ4jyMJMTZTGYl4rFs4Jd5G3QYW6nMBNKwYYmWBy76J8weaaTgP
         7uHb2rrGv4aAIFEOOV/YFaztNPz80lcLs7DDjgIM5u63N3jWHX2MZT05XP92nXzkvt4F
         hINt9gt8NEYe2OF0FK6rzIaqJRaLCmYxnOVKGRfA87xeXe7drtm4KEytNtINb3Q93qyx
         2OejweIsRuA/UjQoDKHvnYezrOfF/+4fA2tMbpbljKd7PoBCCW6sGtHaujbR+3cOw5mo
         oA0lPJwBmXIzBFwfApYON/JlZqHxioXDUQsmmU/kbxXwIG+yb/uw3ohQ5Q+NViLPYgrl
         tmfA==
X-Gm-Message-State: AOAM530Lhhsdek53OjnkvglFMgb/RD16D4XLxxVPCMGPzUbIES7sbm0F
	BdlnbCE1EPLFcDA/lpPHjKN1H68eZI0rGw==
X-Google-Smtp-Source: ABdhPJyG3oq+r8yScKqlnDMtIDJ10nx0h8V9BG2L+767+HfxOcQESnBYlanQvxyXekNpXUzdIu/icw==
X-Received: by 2002:a1c:9843:: with SMTP id a64mr9082769wme.44.1613756033558;
        Fri, 19 Feb 2021 09:33:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id h13sm14218924wrv.20.2021.02.19.09.33.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:33:53 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] licenses: Fix canonical license for 'or-later' handling
Date: Fri, 19 Feb 2021 17:33:51 +0000
Message-Id: <20210219173352.2151521-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPLv2 and GPLv2+ are two difference licenses with different meanings
and we can't just pretend they're the same thing. Change the code
to treat them separately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 11 ++---------
 meta/lib/oe/license.py       |  9 +--------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dc91118340d..358c716a801 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -252,16 +252,9 @@ def return_spdx(d, license):
 def canonical_license(d, license):
     """
     Return the canonical (SPDX) form of the license if available (so GPLv3
-    becomes GPL-3.0), for the license named 'X+', return canonical form of
-    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
-    or the passed license if there is no canonical form.
+    becomes GPL-3.0) or the passed license if there is no canonical form.
     """
-    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
-    if not lic and license.endswith('+'):
-        lic = d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'))
-        if lic:
-            lic += '+'
-    return lic or license
+    return d.getVarFlag('SPDXLICENSEMAP', license) or license
 
 def available_licenses(d):
     """
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index c1274a61dec..665d32ecbb1 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -10,14 +10,7 @@ from fnmatch import fnmatchcase as fnmatch
 def license_ok(license, dont_want_licenses):
     """ Return False if License exist in dont_want_licenses else True """
     for dwl in dont_want_licenses:
-        # If you want to exclude license named generically 'X', we
-        # surely want to exclude 'X+' as well.  In consequence, we
-        # will exclude a trailing '+' character from LICENSE in
-        # case INCOMPATIBLE_LICENSE is not a 'X+' license.
-        lic = license
-        if not re.search(r'\+$', dwl):
-            lic = re.sub(r'\+', '', license)
-        if fnmatch(lic, dwl):
+        if fnmatch(license, dwl):
             return False
     return True
 
-- 
2.27.0

