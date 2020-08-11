Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web10.16599.1597157320662215510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=LX5b3jYx;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=485f07f02=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1597157320; x=1628693320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XwkOkPSfpDe8A09X62f34GJPkwqe/QsVmK6VBmp+qdU=;
  b=LX5b3jYxhrfp0yk/i9BUBhjnuxZ0/IEj0haMFnjdly4vtpwWYzeeKmJh
   aypkCLD+0U5iSUUdU6naqYnJzd/9jENHd5yYNqghhG8DnRWFDKTB4s8B6
   bO4PFEMfyL8yn5JEqKMWo1+RMSMlnoohCd5hrtxqQN/wSzndaRDcIO2wz
   mfilt6bjj93/678z0bRaWF+EAICrDbidKG6JJy//B/SphLlCBl1CKIyxz
   kvYpO8ZUQk1L7C+CiY/GyEKiuVEBi9pfRCXCzGj6BFj74BNr5Kce6S0uy
   70qeF5YM8K60nrAZED1L+l6X7JoMgfLYWaot35s5FEyUBbdtKLoVDhXIw
   Q==;
IronPort-SDR: 9WBnWJWVeuxygDgXj8l3WxpflZUFHFuHBhgFHn/2qRJH5MpjA3h+2o6wZ5XRgxl8ZIfC2D7VKJ
 Y2eWixNn4MVTvpUbR1U0S9LYh7LfsUB4bsTzHtltwdsEvyD6n/oIkv268GsSUjLgnSWKhBiMZF
 WLfLdeA97S/MZBlPMy44qKvgWsSlxNe7KkIucbrOb8l3TXbnCUE0WAytK71mM1n3rKNo6qZDao
 eFGn2NSIt4C7447tOo+FC785ijoPrfbqPwpu81OViP7fDNZ+X16smdG31Ge4bR7zTot9J80jMC
 bRU=
X-IronPort-AV: E=Sophos;i="5.76,300,1592841600"; 
   d="scan'208";a="144674736"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2020 22:48:39 +0800
IronPort-SDR: U7RJSJWsy0hVRoJryC+ncMTnFblg/BpZyr83YL5ztqyAatpirkp9jzv3noXS4zaA9gOY3mjuG0
 eHSsomSB0cjw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 07:36:32 -0700
IronPort-SDR: JLZ5RghsTx1ojSl+vT5xkMO75T38reCM87hMDMmBdXx3f35OsZi6JYdcRe36pvlDUdnQbMM2Mi
 gF0HB/JsV9Iw==
WDCIronportException: Internal
Received: from jbfyk72.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.59.14])
  by uls-op-cesaip01.wdc.com with ESMTP; 11 Aug 2020 07:48:39 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	raj.khem@gmail.com,
	sungwon.pino@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] binutils: Remove RISC-V PIE patch
Date: Tue, 11 Aug 2020 07:38:37 -0700
Message-Id: <20200811143837.660856-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the out of tree patch that is trying to address a PIE issue. This
patch causes RISC-V applications to seg fault when running
_dl_relocate_object.

This fixes: https://github.com/riscv/meta-riscv/issues/236

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../binutils/binutils-2.35.inc                |  1 -
 ...SCV_NONE-reloc-in-the-extra-unused-r.patch | 42 -------------------
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.inc b/meta/recipes-devtools/binutils/binutils-2.35.inc
index 9aa5e7efe3..5ae9ec4226 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.inc
@@ -41,6 +41,5 @@ SRC_URI = "\
      file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
-     file://0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch b/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
deleted file mode 100644
index 99bb38eb67..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-Do-not-emit-R_RISCV_NONE-reloc-in-the-extra-unused-r.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5b61c40c34c3db699de723c3128ba704501ccdac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Apr 2020 14:23:57 -0700
-Subject: [PATCH 17/17] Do not emit R_RISCV_NONE reloc in the extra unused
- reloc space.
-
-Redundant R_RISCV_DTPMOD* R_RISCV_DTPREL* results from Global Dynamic -> Local Exec relaxation
-which generates
-
-Patch from https://sourceware.org/bugzilla/show_bug.cgi?id=24673
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bfd/elfnn-riscv.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/bfd/elfnn-riscv.c b/bfd/elfnn-riscv.c
-index a5fa415309a..1e582052aa9 100644
---- a/bfd/elfnn-riscv.c
-+++ b/bfd/elfnn-riscv.c
-@@ -2090,13 +2090,14 @@ riscv_elf_relocate_section (bfd *output_bfd,
- 		  pic = bfd_link_pic (info);
- 
- 		  if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (dyn, pic, h)
--		      && (!pic || !SYMBOL_REFERENCES_LOCAL (info, h)))
-+		      && (bfd_link_dll (info)
-+			  || !SYMBOL_REFERENCES_LOCAL (info, h)))
- 		    indx = h->dynindx;
- 		}
- 
- 	      /* The GOT entries have not been initialized yet.  Do it
- 		 now, and emit any relocations.  */
--	      if ((bfd_link_pic (info) || indx != 0)
-+	      if ((bfd_link_dll (info) || indx != 0)
- 		  && (h == NULL
- 		      || ELF_ST_VISIBILITY (h->other) == STV_DEFAULT
- 		      || h->root.type != bfd_link_hash_undefweak))
--- 
-2.28.0
-
-- 
2.27.0

