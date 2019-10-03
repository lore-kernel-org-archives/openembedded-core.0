Return-Path: <michaelcooper81@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6BA960879
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 15:36:35 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u22so2763752qkk.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 08:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=CoHQbjz2aOvqi6iSpnSbSfOxCuP03lkDy5AxnttCCRQ=;
	b=fQcY2Cg0WkWuJKLKgNOtT88tiLCOY++QZQM6Lo9wdsgXjvftq5meoNuQjeAEVw+XjK
	jl0RhmOkoFt2DVvRG18aXSbRCyrr5l0/6v99BF0frZ4Gnbu/54u6osuFBP0ndxTLWkYg
	vFvGw8a870ORB7dEa9CjSB9tj/co2SnjOmBpXJ/UpdJ/Yj3xL6TBv0d41A/XONeholzw
	anOq2iCU53p/qW37q2l8UaqwCi067NduWgOYaZ6d6xCKt6mIQJ7rr90LQhVi4s6EtULM
	X8Dl1byb58YI/S5L/7EmkogtKWB2DVVCCgtgiU0OAvF9suBMOwoylumoilQs0nmaXE7T
	eIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=CoHQbjz2aOvqi6iSpnSbSfOxCuP03lkDy5AxnttCCRQ=;
	b=o0hy50HPM6G8Ay6bygE+qoay06wvTZK/QRucVA5GsC1igvKtEayfDWNaW7mNHuAB77
	L/ealAcw8ZQQT29QuFU6NrXLO++k/geZxpEi1+Jv59oSW0+SSGiEeST0SiUO6viwBKCO
	G1BKfKwkpV5gEkUM/htucBBpNQJ7vgEXubfpZ7DVoY9RINVLYGHj81/sRcrvSiUkJlYt
	Yly/AiuHJamhVFKekohqaODXq1tkj1UEnio9ZL4tgbK3Yl+cBbpW+3rFbEDhaWbuq+Su
	frhGf4iGvE/h/MAhTR6iviOHQTksRkELSeKuMJmA+/Hm60vqo4ZAxIL4932Or7bK1Wqp
	e5YQ==
X-Gm-Message-State: APjAAAVlZiLCAyheRaw4ElIgvxUpcSVgJVapnjSzijKO82hskv51yXer
	MFQoZgkkn1XFILlNsZ8PqIP6a+VsPCyjdMj8lu5X/7FjI5QJgvlH
X-Google-Smtp-Source: APXvYqxisqrkD8B6ddHs8JMH9yMdNGVe0MdZMeDvEVa3Rwvu068hdtrf6GxQnk8ENXI+ztYa39GTVxp6+xSOGYSBEGw=
X-Received: by 2002:a37:b643:: with SMTP id g64mr4867366qkf.463.1570116996310; 
	Thu, 03 Oct 2019 08:36:36 -0700 (PDT)
MIME-Version: 1.0
From: Michael Cooper <michaelcooper81@gmail.com>
Date: Thu, 3 Oct 2019 18:36:25 +0300
Message-ID: <CAEaKURdr0+G66Nm4-nOMVn_3yFUBJJAqxdgzovNuf4o9PyZL4A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Fix #13560 - Partition numbering is broken for MBR primary partition #4
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
X-List-Received-Date: Thu, 03 Oct 2019 15:36:35 -0000
Content-Type: text/plain; charset="UTF-8"

Bug: When wks describes extra partitions that aren't in the partition
table (e.g. boot loader) and exactly four primary MBR partitions, the
last partition gets added to fstab as partition #5 instead of #4.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13560

Signed-off-by: Michael Cooper <michaelcooper81@gmail.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py
b/scripts/lib/wic/plugins/imager/direct.py
index 3ce6ad55b8..2441cc33ad 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -316,6 +316,7 @@ class PartitionedImage():
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self.native_sysroot = native_sysroot
+        num_real_partitions = len([p for p in self.partitions if not
p.no_table])

         # calculate the real partition number, accounting for partitions not
         # in the partition table and logical partitions
@@ -325,7 +326,7 @@ class PartitionedImage():
                 part.realnum = 0
             else:
                 realnum += 1
-                if self.ptable_format == 'msdos' and realnum > 3 and
len(partitions) > 4:
+                if self.ptable_format == 'msdos' and realnum > 3 and
num_real_partitions > 4:
                     part.realnum = realnum + 1
                     continue
                 part.realnum = realnum
-- 
2.17.1

