Return-Path: <matt@madison.systems>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADCA60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:35:15 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 7so1309752pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AEDHCJWfumTthGU1SnXxZ8fgeB3VJDmtvrBsgfZDss4=;
	b=iwDDQg++cCYnQsAzBQPIVqvX/QLy+pXUCaXvJchqMLFNkLV3XLMFP/NZbN/Fb5n4i1
	VmtC9dEVOafQQZA6NfCSur1eKmO/QvW6OGMTeehrLOZ+x+9otysSUUc/axSWuHaPwzqg
	FdtEPyPet0YxJmEUNcxW8KWio+O/pzUD6iOQZQfwQrgpgkKBtPdv177/QdXaad4GHZbc
	9VGcmLWwHccuDEmYjcTZ8WIDmisMiEPTzGhCJfwmRP3zcvYsOIjDepOFI5+BIxYS3ajs
	9Rujh3MT/ZjQdbSrrpj99Hz4cAYwTGoShxCgFrOSTFPBJoLydUmCrXSzJa+rCAM6/Qk7
	RHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AEDHCJWfumTthGU1SnXxZ8fgeB3VJDmtvrBsgfZDss4=;
	b=MEIbLCGUVRme+KYQcreM/jD/pt4TW+XrYIufCft9qELUBMq+WvovSMlHsRuOR5oDhG
	QTh0t9+nhhpke6LLUjc3JM5yAVSyU+OP1Ja55okFpISIEJHI23r7lswLvzZwsTKECiG8
	yXXvnMvsAtH2RBBZywarhS+JFwjdDTo5B4OECK6wveyHh3DA2GvnV9zR8KBWfszDyEE0
	02UfeFyX/MgiL0zsQHjkkkQx6sxnw7pBxcPXy65AWmJ8wag8IzzpaV1HzBUxQ4Dg+4Oh
	dSxOLwLz86SV1p3+oGfWi1/LEviqRxYyujVKpcw+ZVi4EfYHldAwntmbKRYQ3etFpx9e
	sQhA==
X-Gm-Message-State: AHPjjUhHnNBM3HZsCBQpMmXQFahYoUeWhQuQ3gNT3ylhusKczBzJ/BWQ
	fptO4B2HFGYM7bHc0dOkY8SaTJH1+a8=
X-Google-Smtp-Source: AOwi7QBpwEgpEckEWzFmd6E2MMm+Apmx6k+tYGkUuxR7LY0DOr7eC+wMiAl4uCKlCSy6ADHcYO7Etw==
X-Received: by 10.101.82.8 with SMTP id o8mr4780605pgp.261.1506620117113;
	Thu, 28 Sep 2017 10:35:17 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	e133sm3159362pfh.177.2017.09.28.10.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 10:35:16 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Sep 2017 10:34:42 -0700
Message-Id: <1506620082-27597-2-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506620082-27597-1-git-send-email-matt@madison.systems>
References: <1506620082-27597-1-git-send-email-matt@madison.systems>
Subject: [PATCH v2 1/1] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Thu, 28 Sep 2017 17:35:16 -0000

Remove the TUNE_FEATURES references from go_map_arch,
to avoid an unwanted variable dependency.  Direct
comparisons of the architecture name are sufficient
for covering what Go currently supports, and using
TUNE_CCARGS_remove adequately handles the conflict
with the cgo-supplied flags for mips.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/goarch.bbclass | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 9ed562d..659b26a 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -28,6 +28,7 @@ COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
 ARM_INSTRUCTION_SET = "arm"
+TUNE_CCARGS_remove = "-march=mips32r2"
 
 def go_map_arch(a, d):
     import re
@@ -39,18 +40,14 @@ def go_map_arch(a, d):
         return 'arm'
     elif re.match('aarch64.*', a):
         return 'arm64'
-    elif re.match('mips64el*', a):
+    elif re.match('mips64el.*', a):
         return 'mips64le'
-    elif re.match('mips64*', a):
+    elif re.match('mips64.*', a):
         return 'mips64'
-    elif re.match('mips.*', a):
-        tf = d.getVar('TUNE_FEATURES').split()
-        if 'fpu-hard' in tf and 'n32' not in tf:
-            if 'mips32r2' in tf:
-                newtf = [t for t in tf if t != 'mips32r2']
-                newtf.append('mips32')
-                d.setVar('TUNE_FEATURES', ' '.join(newtf))
-            return 'mips' if 'bigendian' in tf else 'mipsle'
+    elif a == 'mips':
+        return 'mips'
+    elif a == 'mipsel':
+        return 'mipsle'
     elif re.match('p(pc|owerpc)(64)', a):
         return 'ppc64'
     elif re.match('p(pc|owerpc)(64el)', a):
-- 
2.7.4


