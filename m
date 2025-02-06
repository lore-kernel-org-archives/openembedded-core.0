Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72952C02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 20:05:27 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.52043.1738872325101039235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 12:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=gx4bFGJj;
 spf=pass (domain: foundries.io, ip: 209.85.208.44, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dcf0de81ebso2331526a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738872323; x=1739477123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUe7ns4sxAvMryzGbMCbMh26HIhCtU6nxZH+WeVS+5U=;
        b=gx4bFGJjV6HWEio1bPp7crc9FUvIUIeEYyIeRJkLDeppx9EhCjgluRg57iX2taphSD
         pb4OruN8uQjGZrphvwjzfexEh8QpBaig+aEXFuUM+R5CFeut8azC0IR/mZYnw3X2UOKV
         e3EeJZybJkQTZrk/+PV+1nwBpLG3rr9Jc5AgOWB1WVt30USambder51/ocL2PDQ8X1yH
         wv5EIVI/oIRHpFoIEkMMBHzZp6FEUOT66OkYeygPT5KwHq3RCacfc0jY9/5KKBMbghF9
         FdnqqCJlgoiywtsiCZHhAGMeVKteqg12W2E2jsIcPg8aDhADfEmrLlhBs1N33gN18mLe
         liaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872323; x=1739477123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUe7ns4sxAvMryzGbMCbMh26HIhCtU6nxZH+WeVS+5U=;
        b=HejXmVyX4g5YIEkfNXprljVYRyjOD/LKlpX05SxhJkQmBdsoFo2ae3aQ+0YMWCdQck
         eXDPICwgnRLakUjuNGwzBIk5hSC5Y9PHw2a3w8Z1UWv99Yy9DaSJzS5Ipkqw4IZmZeES
         kBtKiRvd/h48uCZxJQ6xTY39FIEtH5h9PhnoCW3VzLbcGolikvpXB8h2W/1IC+rolUaK
         iJGkZj4A4dhsoUu+W9FHvBGdVUKnxpDjTfFyLvGJ6Np+XYOd+g+6ImMn59h1biGIaV3X
         SuTRFeo3WcD+3ywkVRdaKHyNK8FWCy0IcN0Ebe51Iz1afRfHgsQiBcvBpAKTAvT5Lu96
         DjQA==
X-Gm-Message-State: AOJu0YzBPKRcZ0jqaK4SOa32ZStIWVjHENT3iHYqgcbSaP5R8NZ8vQg9
	Jw/KKl/mo9v1khWNVC5rrTS+XTxP9midDeoat8UEBzhBUGYVoJ2ccbm96gNJrhEPqnG6je+irih
	PTfc=
X-Gm-Gg: ASbGncv8LTL1jfHgbFs4UBLjF5FstdBja0H84w3+/j+2R4Dc0xeoDoWK9IM+Wuo8Qhm
	WgkF3mJiTsWyylaSqZV/sC/2kiHHtnvH6AlisFGqhUzyNo566zOdDbYK8ppUCOS0l0SFKok9BaR
	Xzk9Gj2wukkG76DZzO6/z4O+yywk1lNg1zY2kKV8QzmKQlIZGYzViF/ddCk3CrTaal23NNbstGs
	IzN8srlbnN0nMkU4ZBKqA7H49iojCy+e8BNh8CmRxGtehpz5GZswcoBfQiR8MrC+gaLE3lGR+0U
	Ced6dVymEPvNnjM2fl1wUxw=
X-Google-Smtp-Source: AGHT+IH3qa3n6Iup9tpCNE+oP0tiAOSpbA8wB0XrtPSMBRKB6iRetD7D4W/iPyKAFi9Ymn3Yt09UeQ==
X-Received: by 2002:a05:6402:35d5:b0:5dc:100c:1569 with SMTP id 4fb4d7f45d1cf-5de45048399mr944796a12.13.1738872322825;
        Thu, 06 Feb 2025 12:05:22 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c1d6sm1280917a12.65.2025.02.06.12.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:05:22 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH v2] wic: bootimg-efi: Support + symbol in filenames
Date: Thu,  6 Feb 2025 21:05:18 +0100
Message-ID: <20250206200518.2867846-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210960

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
---

v2 changes:
- No changes, just re-send patch with more people in CC (top
  contributors to bootimg-efi.py)

 scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index c05f38f229..96c710bf77 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -252,7 +252,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
             # list of tuples (src_name, dst_name)
             deploy_files = []
-            for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+            for src_entry in re.findall(r'[\w;\-\.\+/\*]+', boot_files):
                 if ';' in src_entry:
                     dst_entry = tuple(src_entry.split(';'))
                     if not dst_entry[0] or not dst_entry[1]:
-- 
2.43.0


