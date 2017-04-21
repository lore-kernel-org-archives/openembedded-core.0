Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id D59BE77BB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 21:09:58 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id a140so768605ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2qy4Go8EhJSTBgjjaPsNVx4pq7wnIGaDP5qBgupKPmM=;
	b=HF7WcLuN8SO0ZRhtmOcUbWwLnjxNb/VDXYu2wrpYDgN1Hihe8gPoliVdpXjV41HpSG
	9fY1mkRlCE1nvPQxfyye26vdbDerg9UYc8cCaxer7l9GFAjbe8OiwhHhYb9icG8zsWIV
	1zJMBl/ohT/Y/8rp8IeG13HqKusBLmPla3EMoScHrppBDuoL2D9yXnvj345Ppvck7xI6
	6MvfJc9e0nEuJxft9BcJYb3CFRVvGjdl0oxhdF3OG/ja1C/44uHCsi64mei8xPm8oYBh
	BbmwsQtZ8qz9mzLRXDtFNPwUp156/EFET+/bTZuPSkoXBymNoCjWHev+AvyVXxNQXQNy
	G66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2qy4Go8EhJSTBgjjaPsNVx4pq7wnIGaDP5qBgupKPmM=;
	b=e5EaWCHw2kgWZuedqm6lPzlomvN3f4JSoj9hx4yu8gK4Xpd7vBZzNQwKjMzV/YLHjI
	RQXRRnqE/qO6ZUAG1T7+dItf/Wx+5hS1kATh6z1LGGTmh60UxynjgEYpz91E9KvKsMG4
	VpJpAaSXP44AJXcyIdIb2dDBC72a5R+4Xp9jq0z0lWura24r/DZojVZPv+esxLyRDi28
	DsesUc6V+R98qdhzcJA8QFPPOYBRUwd746PI/tzbqT2HkuZxCxOvdHtA/RZZ7dfY/0ax
	jpg+Lj5xjosvBdk2EfajHTPiveZwEMDyyHlZet22M1fakiwgGM90yjXYquYjoYEo8Dsm
	GOTg==
X-Gm-Message-State: AN3rC/6O2xXw3QkDPvTjH2Q7yc7fMaOSLwHsb7/kJRbSgVokyT6VBKVN
	lOCdSbAEf/yfXw==
X-Received: by 10.99.153.9 with SMTP id d9mr14104394pge.214.1492808999871;
	Fri, 21 Apr 2017 14:09:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o10sm17709954pgc.18.2017.04.21.14.09.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 14:09:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:09:48 -0700
Message-Id: <20170421210948.2656-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170421210948.2656-1-raj.khem@gmail.com>
References: <20170421210948.2656-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] ovmf: Fix build with gcc7
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
X-List-Received-Date: Fri, 21 Apr 2017 21:09:59 -0000

backport a patch which fixing warnings with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-UefiHiiLib-Fix-incorrect-comparison-exp.patch | 45 ++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
new file mode 100644
index 00000000000..0529a27b168
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
@@ -0,0 +1,45 @@
+From 73692710d50da1f421b0e6ddff784ca3135389b3 Mon Sep 17 00:00:00 2001
+From: Dandan Bi <dandan.bi@intel.com>
+Date: Sat, 1 Apr 2017 10:31:14 +0800
+Subject: [PATCH] MdeModulePkg/UefiHiiLib:Fix incorrect comparison expression
+
+Fix the incorrect comparison between pointer and constant zero character.
+
+https://bugzilla.tianocore.org/show_bug.cgi?id=416
+
+V2: The pointer StringPtr points to a string returned
+by ExtractConfig/ExportConfig, if it is NULL, function
+InternalHiiIfrValueAction will return FALSE. So in
+current usage model, the StringPtr can not be NULL before
+using it, so we can add ASSERT here.
+
+Cc: Eric Dong <eric.dong@intel.com>
+Cc: Liming Gao <liming.gao@intel.com>
+Contributed-under: TianoCore Contribution Agreement 1.0
+Signed-off-by: Dandan Bi <dandan.bi@intel.com>
+Reviewed-by: Eric Dong <eric.dong@intel.com>
+---
+Upstream-Status: Backport
+
+ MdeModulePkg/Library/UefiHiiLib/HiiLib.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
+index 8579501..46ca7bc 100644
+--- a/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
++++ b/MdeModulePkg/Library/UefiHiiLib/HiiLib.c
+@@ -2180,8 +2180,9 @@ InternalHiiIfrValueAction (
+   }
+   
+   StringPtr = ConfigAltResp;
+-  
+-  while (StringPtr != L'\0') {
++  ASSERT (StringPtr != NULL);
++
++  while (*StringPtr != L'\0') {
+     //
+     // 1. Find <ConfigHdr> GUID=...&NAME=...&PATH=...
+     //
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 73fdfc6239e..9d988e9d414 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
+        file://0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch \
         "
 
 SRC_URI_append_class-target = " \
-- 
2.12.2


