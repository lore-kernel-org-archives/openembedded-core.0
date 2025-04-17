Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A921C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:11:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.4535.1744881083016298052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m02cnUs1;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso671249f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881081; x=1745485881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYG3HjPKZZvVKZ3I1MCoZ7CB3C533uCyu9mCsN+tw2E=;
        b=m02cnUs1ZnskKsYYSKg84RheqaSwaHappgw1yusDzxb3ovR64ZJ0fnQm0/j5QFNe+Z
         hTZ6q1zbWe2mpoul6OCuyLJ0S7OADGftIrqe8q+GPI7MF+Lmq18XsB5Gp5KKjxSraVPH
         yONWL4JFPwuHlYEu3Sux5/2rJnqmSKbB5ZGWKivZsGvd9tZAYHJJl39wwo15BLn+Z3YK
         Pc0pXMms0uPaxjWw/zeJIoH0a0xZDkHOQ2HB3hV7t8OSXgkXOmR9DXQliuLJH4zuq9sC
         Umbt2J0c7rH3gZQsuQnIJ5cNyOi3srbclOAFJBUfhPn2cdBDfuVTwqUigTwXRE0F6ytf
         xK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881081; x=1745485881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYG3HjPKZZvVKZ3I1MCoZ7CB3C533uCyu9mCsN+tw2E=;
        b=BWU97PoLfB4Ov6MwhsC+uhEee2a2+iOqHBx3wO166721FcZ6rPqQIEbM8lniwRjiLM
         Rj7J1QcK1gplAdnUsO21ZFNNeH9hCNXQO+u6VStgYbxLtYtAXlgFy1H6w5uZSRSaD8I+
         V3UgD6f5VU0JbxrGxR/SfB8nGJEirOSMHgYuwOwU2JLZfwSUtZrooBpAp1O8HDdw7ZfJ
         tKf+bWWYeHCpkpkhkhajy64BxUG86EGuujKUjHxhKOyuMgi1NPJ4CE5KKQCMvmGT6/eL
         Dtb+PWi55hdTBxSjVlWI2Jvf4Z5pZQz4wE3JNUjWmcP0sivcxVi1BDNizT0fw4oo8DuK
         70WA==
X-Gm-Message-State: AOJu0Yxjs+SHXoLYl9rdhBb8tbN9G7KgtaVXeJorkOBCI++2GV1NwA3a
	Txkhql+k/nuVZfaLkxJN8Gz6l8SxVQiFVf5T02BHe+UsDtxjdve5vLILfrkv
X-Gm-Gg: ASbGnctxGFCLGa6xCv7eIqTSzK/LyWMvE3X+qDtQ8q46t8qvVdOZDgBDt1XiP46okzv
	IW40YsZb0Yys3kDxWhu0iw36J2RMI5xob+FtUCzN/bwo/XFD2nPcUYYD6Rp3bFk9ZkexNrMqMyS
	MhSV/2KskBjNndUcIbo3oQoEqp8CbdRSsBzWO7EAWct6F9qrO/i+6rnyVay6ox0HwS+p7rZT5SI
	u/A6tgyBbBtLJjJ8ekCYMprYVIQ+Cpu//VmQxk/BBQhhhBxMhWeywTWVOzNBFMADlb7gnoQls7Z
	sElQZ1GTliL+rll2r6yv1aQOslWh8vgGcbvOp3cmaLewbW1D
X-Google-Smtp-Source: AGHT+IH/lalv/6pcrIdd7ttWNFubMQEnarW/FDCtr4rGFGit6VQv+1MFZ3Gi4irzdJQ93rgqY3tNbg==
X-Received: by 2002:a05:6000:1ace:b0:39c:13fa:3eb with SMTP id ffacd0b85a97d-39ee5b8935fmr4912000f8f.39.1744881080820;
        Thu, 17 Apr 2025 02:11:20 -0700 (PDT)
Received: from toster.lan ([185.228.163.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cfdbsm19255510f8f.40.2025.04.17.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:11:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][scarthgap][PATCH] wic: bootimg-efi: Support + symbol in filenames
Date: Thu, 17 Apr 2025 10:11:00 +0100
Message-ID: <20250417091059.1412-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215044

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Allow the '+' symbol as a valid character in filenames listed in the
IMAGE_EFI_BOOT_FILES variable.

The '+' symbol might be used to support boot counting for boot entries,
as described in the UAPI Boot Loader Specification [1]:

The boot counting data is stored in the name of the boot loader entry.
A boot loader entry file name may contain a plus (+) followed by a
number. This may optionally be followed by a minus (-)
followed by a second number. The dot (.) and file name suffix
(conf or efi) must immediately follow.
Boot counting is enabled for entries which match this pattern.

Example:
IMAGE_EFI_BOOT_FILES:append = " entry.conf;loader/entries/entry+3.conf"

[1] https://uapi-group.org/specifications/specs/boot_loader_specification/#boot-counting
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f25822281eb9423ff86105eaebb0bed48663648)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 7cc5131541..37d07093f5 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -245,7 +245,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
             # list of tuples (src_name, dst_name)
             deploy_files = []
-            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+            for src_entry in re.findall(r'[\w;\-\.\+/\*]+', boot_files):
                 if ';' in src_entry:
                     dst_entry = tuple(src_entry.split(';'))
                     if not dst_entry[0] or not dst_entry[1]:
-- 
2.49.0


