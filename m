Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE65C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:55:18 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.116794.1738677316829132356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jGv6SYLC;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5826560e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738677315; x=1739282115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIqmf4Vh/vUjx4bkq5bh7BF3FJk6rv3fTJ0xDTtNUSM=;
        b=jGv6SYLCq6K85Ji9ESEkh0zV4vNGzhGluDnTYv72RsbzxOLWgBOIyRdx+sz/aG2t+3
         VQCVK/rzG6KigRbXOih+lLgtpZZ3hnoHWcNuPRBGDS5YLFD/YekhafUNyVzsWsJdcMKp
         rjl0Eivwi/7LVRR2TF6nEf7AyH93zl32/zk8i8FJO+kvhNgh4DA4OfIXlGo3vUwq5gwR
         3IMpKT99GxHQWes0VwYgZrnTyQU/ncWkkviH4XMgznhd4WIoMAKls1eutj0drt9UIqjF
         5PAJWwW6YXxDv/A40JRDx4TQeKIKpE7ST+9PN8DGlnXzE3MBKbGDTGNr7Ic1W42wd/Sj
         xYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677315; x=1739282115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIqmf4Vh/vUjx4bkq5bh7BF3FJk6rv3fTJ0xDTtNUSM=;
        b=hCL/1tRC0mttEE8Y6F0eSBiAMZOXv9PHdLlDJNzFZM85hhnDDN4ScaAR67VZdbix2F
         cto6zcVjMiwsf19Kaa3JEycfarLfZcdj0XUeyyYgfGRCMQZOipmKmAHbEgGhHHcuKNjV
         n6VuQFRoAYekxZr5Ptw08izzABkQtJiBqZNxCr5cw+XTS20xe3P8UX6o4vjFdf30cWO5
         CYa7bdNMT2gn2dlXZek8vSyGgh1jBx4KJz7A1re/ngGIP9179FD6Bw/BOPj8EnjHqhpP
         95KOxtgdS1JVN/2WNztpjTvckAI5zi8Elj0tfGYjBhqa3NnFmn/TsBg+lnh6Bo4NK4wq
         eRBw==
X-Gm-Message-State: AOJu0YyBqRMPW3X3TcBmL/URyUBe216M/fpiqmClGTH+Ar2Eda18pMA6
	3Y59wI8sn+uMJrRkanxVeI7pKiQXnsFVVhxoxIVkXCDEn5Idyanzo9lv1KqZJxutvuyar1lBsEj
	s0G8=
X-Gm-Gg: ASbGncuILjTJUY9CoY9gNJ4V6owQ8yeu34TlkPRtHmB8Hsq+1/DCSo/PvbqlOjfDUcG
	+wIdLpRONcHOnpu3sKKchb/Mmhr5NlOyD8r+BXAUGecs4e25a8fp2/RkpJ3H85iosz8ayfbhHEv
	mT8iHheaH2ihVDLs9EuyIyqQehZriIUPUJcZhDdXW/8UTV5u6kYc2YaZE98BNFyJLopfY0DDfbd
	BBXs13oFZa7EoAP6k/jbmtuHJ3zZRBddUTA8QckIqH2JJBcrYGFjvL8sQrbD4BRj92TcCcLpzUq
	WtZsqD0Z4m54qkxHsw/Ps3WI+c5YPn1ADCu5ulkLfM0cQXb3VhJbn8mUHnJq
X-Google-Smtp-Source: AGHT+IHXcSVJvS8gz7HNx/oJILDE16sKBluvUH3CsqpG4WV+sRp4i6W+uIjlnrBS18SHKUXi878hFg==
X-Received: by 2002:a05:6512:6cd:b0:543:e4ac:1df4 with SMTP id 2adb3069b0e04-543e4bdff35mr8177417e87.7.1738677314842;
        Tue, 04 Feb 2025 05:55:14 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb07a0sm1578017e87.123.2025.02.04.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:55:13 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Jon Mason <jdmason@kudzu.us>,
	meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 3/3] systemd-boot-native: fix kernel signature for secureboot
Date: Tue,  4 Feb 2025 15:54:57 +0200
Message-ID: <20250204135457.1219477-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204135457.1219477-1-mikko.rapeli@linaro.org>
References: <20250204135457.1219477-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210799

systemd update from 256 to 257 broke kernel secureboot signatures
inside signed UKI files with u-boot based UEFI firmware, e.g.
meta-arm and qemuarm64-secureboot machine config and secureboot:

$ cd meta-arm
$ kas build ci/poky.yml:ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

systemd-boot itself is secureboot signed and verified by firmware.
Same for the UKI file which combines kernel, initramfs etc.
Then kernel from UKI is additionally executed using UEFI firmware calls
which check signatures so the kernel binary inside signed UKI
needs to be signed with same keys too. PE file padding added
to systemd ukify in 257 release broke kernel signature validation
for u-boot and sbsign/sbverify tools. EDK2 based firmware like
OVMF may not be affected because systemd-boot is able to disable
signature checking after a signed UKI has been loaded. This feature
is not supported by u-boot.

Upstream systemd bug report:

https://github.com/systemd/systemd/issues/35851

Backport of:

https://github.com/systemd/systemd/commit/38801c91292fde004bec0974ed5602984701e03b

Cc: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../systemd/systemd-boot-native_257.1.bb      |   3 +
 ...vert-changes-to-use-SizeOfImage-from.patch | 120 ++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 5b4b63c294..967ac57fc5 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -1,4 +1,7 @@
 require systemd.inc
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
+
+SRC_URI += "file://0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch"
 
 inherit native
 
diff --git a/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch b/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
new file mode 100644
index 0000000000..3db8be2288
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-ukify-measure-Revert-changes-to-use-SizeOfImage-from.patch
@@ -0,0 +1,120 @@
+From 60d76dce7b013406412bc9720dbf05fb558ea099 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Tue, 4 Feb 2025 09:24:26 +0100
+Subject: [PATCH] ukify/measure: Revert changes to use SizeOfImage from Linux
+ PE binary
+
+With 19812661f1f65ebe777d1626b5abf6475faababc, we make sure at runtime
+in the stub itself that SizeOfImage from the Linux EFISTUB PE binary is
+taken into account, so there's no need to take this into account in ukify
+itself. By reverting the ukify change, we again ensure that Misc_VirtualSize
+reflects the actual size of the Linux EFISTUB PE binary in the .linux section
+which lots of tooling depends on. It also makes sure we don't measure a bunch
+of extra zeroes in the stub which should fix systemd-pcrlock measurements as
+well.
+
+This effectively reverts 2188c759f97e40b97ebe3e94e82239f36b525b10 and
+0005411352f9bda0d9887c37b9e75a2bce6c1133.
+
+Fixes #35851
+---
+ src/measure/measure.c | 32 --------------------------------
+ src/ukify/ukify.py    | 16 ++--------------
+ 2 files changed, 2 insertions(+), 46 deletions(-)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38801c91292fde004bec0974ed5602984701e03b]
+
+diff --git a/src/measure/measure.c b/src/measure/measure.c
+index e583444e0bf..2057ce2a0e6 100644
+--- a/src/measure/measure.c
++++ b/src/measure/measure.c
+@@ -544,38 +544,6 @@ static int measure_kernel(PcrState *pcr_states, size_t n) {
+                         m += sz;
+                 }
+ 
+-                if (c == UNIFIED_SECTION_LINUX) {
+-                        _cleanup_free_ PeHeader *pe_header = NULL;
+-
+-                        r = pe_load_headers(fd, /*ret_dos_header=*/ NULL, &pe_header);
+-                        if (r < 0)
+-                                log_warning_errno(r, "Failed to parse kernel image file '%s', ignoring: %m", arg_sections[c]);
+-                        else if (m < pe_header->optional.SizeOfImage) {
+-                                memzero(buffer, BUFFER_SIZE);
+-
+-                                /* Our EFI stub measures VirtualSize bytes of the .linux section into PCR 11.
+-                                 * Notably, VirtualSize can be larger than the section's size on disk. In
+-                                 * that case the extra space is initialized with zeros, so the stub ends up
+-                                 * measuring a bunch of zeros. To accommodate this, we have to measure the
+-                                 * same number of zeros here. We opt to measure extra zeros here instead of
+-                                 * modifying the stub to only measure the number of bytes on disk as we want
+-                                 * newer ukify + systemd-measure to work with older versions of the stub and
+-                                 * as of 6.12 the kernel image's VirtualSize won't be larger than its size on
+-                                 * disk anymore (see https://github.com/systemd/systemd/issues/34578#issuecomment-2382459515).
+-                                 */
+-
+-                                while (m < pe_header->optional.SizeOfImage) {
+-                                        uint64_t sz = MIN(BUFFER_SIZE, pe_header->optional.SizeOfImage - m);
+-
+-                                        for (size_t i = 0; i < n; i++)
+-                                                if (EVP_DigestUpdate(mdctx[i], buffer, sz) != 1)
+-                                                        return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Failed to run digest.");
+-
+-                                        m += sz;
+-                                }
+-                        }
+-                }
+-
+                 fd = safe_close(fd);
+ 
+                 if (m == 0) /* We skip over empty files, the stub does so too */
+diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
+index 3f36aa7af6b..08e7622c499 100755
+--- a/src/ukify/ukify.py
++++ b/src/ukify/ukify.py
+@@ -388,7 +388,6 @@ class Section:
+     tmpfile: Optional[IO[Any]] = None
+     measure: bool = False
+     output_mode: Optional[str] = None
+-    virtual_size: Optional[int] = None
+ 
+     @classmethod
+     def create(cls, name: str, contents: Union[str, bytes, Path, None], **kwargs: Any) -> 'Section':
+@@ -918,10 +917,7 @@ def pe_add_sections(uki: UKI, output: str) -> None:
+ 
+         new_section.set_file_offset(offset)
+         new_section.Name = section.name.encode()
+-        if section.virtual_size is not None:
+-            new_section.Misc_VirtualSize = section.virtual_size
+-        else:
+-            new_section.Misc_VirtualSize = len(data)
++        new_section.Misc_VirtualSize = len(data)
+         # Non-stripped stubs might still have an unaligned symbol table at the end, making their size
+         # unaligned, so we make sure to explicitly pad the pointer to new sections to an aligned offset.
+         new_section.PointerToRawData = round_up(len(pe.__data__), pe.OPTIONAL_HEADER.FileAlignment)
+@@ -1166,6 +1162,7 @@ def make_uki(opts: UkifyConfig) -> None:
+         ('.uname',   opts.uname,      True),
+         ('.splash',  opts.splash,     True),
+         ('.pcrpkey', pcrpkey,         True),
++        ('.linux',   linux,           True),
+         ('.initrd',  initrd,          True),
+         ('.ucode',   opts.microcode,  True),
+     ]  # fmt: skip
+@@ -1182,15 +1179,6 @@ def make_uki(opts: UkifyConfig) -> None:
+     for section in opts.sections:
+         uki.add_section(section)
+ 
+-    if linux is not None:
+-        try:
+-            virtual_size = pefile.PE(linux, fast_load=True).OPTIONAL_HEADER.SizeOfImage
+-        except pefile.PEFormatError:
+-            print(f'{linux} is not a valid PE file, not using SizeOfImage.')
+-            virtual_size = None
+-
+-        uki.add_section(Section.create('.linux', linux, measure=True, virtual_size=virtual_size))
+-
+     # Don't add a sbat section to profile PE binaries.
+     if opts.join_profiles or not opts.profile:
+         if linux is not None:
+-- 
+2.43.0
+
-- 
2.43.0


