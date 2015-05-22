Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id EC9DC609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:54:03 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so39631312wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nzmkMR2/EL0fvLsn86FrVb3bsboORvp6tB8DYcWv7HQ=;
	b=YbSrwkuPOAXBYUx2tHCAFC4+Zjn5zrDlrMNV7QvyWgNkAbKin8Yn9hyLQwyp4AvSv9
	wQNzBNOOSbaXnWDZ1PIEAu4OPKG5pEQg0Y0ifdnqDbfOPsF4ZahWXSo+ibZgiXIiL/cq
	Khk1VJmb181VNC6zHrEHOmcSFrnseVt7JTaNn+XrtEVH8s+n2CN/zPKaNighTa6/WX2x
	4DzqLlbFAGmBOmgepVKdmgQhrRpybaSOYFnarDrK/1TQEQf7HeyIdfcy6zPRPGm01DD5
	YPK2AQ0MvcYf5fq+DVWhjkbUdAeiK6uP7VtHcJM83LTxVPMtUFMCcED6XDQ5OFtQn7eR
	pi9w==
X-Gm-Message-State: ALoCoQkrNVPa1X3cf6Rd9OOn/vxbQegiQzTAtTRNQVeQ5Hlu2BEAXjthdSdQev4RgOd6UtVeplCw
X-Received: by 10.181.13.5 with SMTP id eu5mr7073745wid.37.1432299244249;
	Fri, 22 May 2015 05:54:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id u9sm3057905wjx.15.2015.05.22.05.54.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 05:54:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 13:49:40 +0100
Message-Id: <1432298981-23473-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2 1/2] utils: add helper to perform the intersection of two string lists
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
X-List-Received-Date: Fri, 22 May 2015 12:54:06 -0000

Useful for e.g. generating a COMBINED_FEATURES list from DISTRO_FEATURES and
MACHINE_FEATURES.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/utils.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index b8224de..7173e10 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -55,6 +55,21 @@ def both_contain(variable1, variable2, checkvalue, d):
     else:
         return ""
 
+def set_intersect(variable1, variable2, d):
+    """
+    Expand both variables, interpret them as lists of strings, and return the
+    intersection as a flattened string.
+
+    For example:
+    s1 = "a b c"
+    s2 = "b c d"
+    s3 = set_intersect(s1, s2)
+    => s3 = "b c"
+    """
+    val1 = set(d.getVar(variable1, True).split())
+    val2 = set(d.getVar(variable2, True).split())
+    return " ".join(val1 & val2)
+
 def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
-- 
2.1.4


