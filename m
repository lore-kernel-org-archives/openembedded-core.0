Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 019BD606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 22:54:52 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so150264640wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=CEPL587GDDSyikgK+IN27LLTN8zKwIUPfTMf8ndCinY=;
	b=v/TW2/FCO0QT0IzJ/0+VXXH4jm0AiJWaO1y5UvU2RWus6DS4vel9jtJn9vYSsgkFwo
	32CNO10YOSy7J1kK1Y0Ms/P8O7AmoT35PYBtb2kx9IS+5+eha/PJw1P/2LRyA8EMylnW
	LoH2YLDiAAZPVbJjbwyuS6wg/uXYVrmnF1Xe2r0Dk+840HmWX1NuamAKdSrnYkQFE4oT
	JIAD6sNQj5N6FyKjT55lZ5hl85rUQzyvYP2g9N+DHUZaGqcGiF3uWoDCyOyDEzWykYEf
	7GRQgtdcTnvDo+eZrLhl+0fsVkLUWDAfnI4S8RfjyhocR/nWwyRVxl8IDJlk2Sa/G9+8
	Cl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CEPL587GDDSyikgK+IN27LLTN8zKwIUPfTMf8ndCinY=;
	b=gIL4OorkJy8t6VFOTmZ5g4kytSjadopJtnehQ5NitBQBDqmwz7BZeZta8gxz97voy2
	71RX/SLOLvIKBF3ABKTnEF2FHrLVQJFC8ZPr/LndtnSyHm6oN7UCjxIM5ftYUUBQBoiQ
	caZxavABX1qZDn9N9uX/ZFWi7zzOcyS0g5K+ZKc0Smq6KcXo6Ik3lpy+BuN6FJtTJJBq
	dPRkpVKUCsU8LPqL81oRpOrxndNXgU4sFOE6CDMoPXazZV1aNmk9u+xqTSqblpEwi0vo
	sdCiqliaCs5Dq/eX0k382RfZ8mGF9vJSR2bs1X0/VdVycoFwXiBalVhYh0h/8dDlRB3v
	Z33w==
X-Gm-Message-State: ALoCoQkN6iM7+g7ZHVb4CUilOrVaynQRX24sZ7DZZBTPK7SPY+E7RpMqs60LYQ1dzYRuTWNBZQu7
X-Received: by 10.28.186.67 with SMTP id k64mr32389732wmf.56.1448924092502;
	Mon, 30 Nov 2015 14:54:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c194sm23316661wmd.13.2015.11.30.14.54.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Nov 2015 14:54:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 22:54:45 +0000
Message-Id: <1448924085-26449-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][RFC] base: don't prefix/suffix packages when expanding PACKAGECONFIG
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
X-List-Received-Date: Mon, 30 Nov 2015 22:54:56 -0000

When handling PACKAGECONFIG don't add nativesdk- prefixes or -native suffixes to
packages, as the classexpand logic will run next and so the same operation
again.

Apart from removing redundant code, this also fixes a bug where the nativesdk-
prefix was being added twice in some situations, resulting in dependencies on
virtual/nativesdk-nativesdk-libx11.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e6d1599..4af5ee1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -355,32 +355,9 @@ python () {
 
         mlprefix = d.getVar("MLPREFIX", True)
 
-        def expandFilter(appends, extension, prefix):
-            appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
-            newappends = []
-            for a in appends:
-                if a.endswith("-native") or ("-cross-" in a):
-                    newappends.append(a)
-                elif a.startswith("virtual/"):
-                    subs = a.split("/", 1)[1]
-                    newappends.append("virtual/" + prefix + subs + extension)
-                else:
-                    if a.startswith(prefix):
-                        newappends.append(a + extension)
-                    else:
-                        newappends.append(prefix + a + extension)
-            return newappends
-
         def appendVar(varname, appends):
             if not appends:
                 return
-            if varname.find("DEPENDS") != -1:
-                if pn.startswith("nativesdk-"):
-                    appends = expandFilter(appends, "", "nativesdk-")
-                if pn.endswith("-native"):
-                    appends = expandFilter(appends, "-native", "")
-                if mlprefix:
-                    appends = expandFilter(appends, "", mlprefix)
             varname = d.expand(varname)
             d.appendVar(varname, " " + " ".join(appends))
 
-- 
2.1.4


