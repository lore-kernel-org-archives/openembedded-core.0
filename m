Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web09.5091.1605092594369330886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 03:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=YLD3LhTb;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3385; q=dns/txt; s=iport;
  t=1605092594; x=1606302194;
  h=from:to:subject:date:message-id;
  bh=BmjeNeJxd9aTdTD0aAzEorJmDPpxz6dRNmb0mlp/os0=;
  b=YLD3LhTbRUnqgQoWg4eJyZMM79rUzhKJVofRq7PbskBrdqdgwqwALYhc
   l5NLk9Xe1IKR9lmyvusODYtkxkRCh6yOX6dgUDasuPVdE9ZHVHWEIk/gV
   5nF2/6Wj83CAwSZ3imQy6hL6W0zGs4rbIKndml8r4aUjt0Iachcl7amwI
   Q=;
X-IPAS-Result: =?us-ascii?q?A0BIEQCixKtffYoNJK1iHAEBATwBAQQEAQECAQEHAQGBZ?=
 =?us-ascii?q?oE8AoFeVQEyLrINCwEBAQ0BASUKBAEBhmICJTgTAgMBAQEDAgMBAQEBBQEBA?=
 =?us-ascii?q?QIBBgQUAQGGPAyFcgEtfgMBAlsjIYMmAYMGD65vgXUzhFBDRIM5gTwGgTYCA?=
 =?us-ascii?q?QGIPYUAG4FBP4ERg1CCXQQXgQ2GLwS4KYJ3iQ2SBAIgoXaeTZVRAgQGBQIVg?=
 =?us-ascii?q?WshgVkzGggbFYMkUBkNVpZOhURBAzALLQIGCgEBAwmMAoJGAQE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,469,1596499200"; 
   d="scan'208";a="605284918"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Nov 2020 11:03:12 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 0ABB3ALP031538
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 11:03:12 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id 8A1BECC1251; Wed, 11 Nov 2020 03:03:10 -0800 (PST)
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] binutils: reproducibility: reuse debug-prefix-map for stabs
Date: Wed, 11 Nov 2020 11:03:10 +0000
Message-Id: <1605092590-17779-1-git-send-email-dzagorui@cisco.com>
X-Mailer: git-send-email 2.7.4
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: alln-core-5.cisco.com

powerpc 32bit Linux Kernel widely uses .stabs pseudo-op to
produce debugging information in stabs format. Faced an issue
that during Linux Kernel build with Yocto build system for 32bit
powerpc platform resulting vmlinux contains absolute path in
.stabstr section that cannot be remapped with -fdebug-prefix-map
option.

Yocto uses scripts/mkmakefile Linux Kernel build approach that
allows to store all generated files outside of kernel source
tree. With this approach each compilier invocation is performed
with an absolute path to a file that will be compiled and this
absolute path is recorded in init stab. There is no way to remap
this path.

Reuse remap_debug_filename api to make -fdebug-prefix-map flag
aplicable for init stab.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta/recipes-devtools/binutils/binutils-2.34.inc   |  1 +
 ...-reproducibility-for-stabs-debugging-data.patch | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index f65fdb7..b5f5a1c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -43,5 +43,6 @@ SRC_URI = "\
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
+     file://0001-gas-improve-reproducibility-for-stabs-debugging-data.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch b/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
new file mode 100644
index 0000000..98dab1b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
@@ -0,0 +1,32 @@
+From 96882eb9263b6b1c953e33a6764a83f4a87a9a41 Mon Sep 17 00:00:00 2001
+From: Denys Zagorui <dzagorui@cisco.com>
+Date: Mon, 9 Nov 2020 15:39:10 +0000
+Subject: [PATCH] gas: improve reproducibility for stabs debugging data format
+
+	* config/obj-elf (obj_elf_init_stab_section): Improve
+	reproducibility for stabs debugging data format
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0541201782c006c09d029d18a45c6e743cfea906]
+---
+ gas/config/obj-elf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gas/config/obj-elf.c b/gas/config/obj-elf.c
+index 7cf921c051..92b55e06c2 100644
+--- a/gas/config/obj-elf.c
++++ b/gas/config/obj-elf.c
+@@ -2186,12 +2186,13 @@ obj_elf_init_stab_section (segT seg)
+   p = frag_more (12);
+   /* Zero it out.  */
+   memset (p, 0, 12);
+-  file = as_where (NULL);
++  file = remap_debug_filename (as_where (NULL));
+   stabstr_name = concat (segment_name (seg), "str", (char *) NULL);
+   stroff = get_stab_string_offset (file, stabstr_name, TRUE);
+   know (stroff == 1 || (stroff == 0 && file[0] == '\0'));
+   md_number_to_chars (p, stroff, 4);
+   seg_info (seg)->stabu.p = p;
++  xfree ((char *) file);
+ }
+ 
+ #endif
-- 
2.7.4

