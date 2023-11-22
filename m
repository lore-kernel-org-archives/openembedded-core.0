Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D124C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:44 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.10884.1700620297149476367
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MMBC2gEA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d648679605so3340371a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620296; x=1701225096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkkHVjx4fvGIAndEXco2GjTo6CAYvOXzll/cUW+rptY=;
        b=MMBC2gEAjLEmA2w35loNWjuumvUisbebhZ8CuYPBK2nhgJCOyRxFWnmovvHXYjyBwx
         dnoJBH5us4nLZ4d3sgFR61hYExn2k6Hn5MO+mrB7tIhZzFCRZbo/UUP/USMFgpK31eEw
         m2HWBaaNQhgksuGkEa3y8d3dOxRbX2irzEI/4/n9X+Dzp/MGBuOGDMD60NwaYyA5ZWLF
         iroydYP2QsuOGwY1+C0L7UbvCVVzq4ZpEE5+1rrf1txgxfaH+FasthrKlHyMT1OpngfS
         JAfJ6P8g4RZ9P8VHMzESQjbazgk5TKFyzyn2+RWS8X1dsMd+dCwmwd7bMXUwPCvC+9/h
         NQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620296; x=1701225096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkkHVjx4fvGIAndEXco2GjTo6CAYvOXzll/cUW+rptY=;
        b=ZZ/PDbBVm07ka/bjeSSNbZJSwl8Nk+sA6ew5lJitaw7BNreCAXmhaOpb2fydspLWpQ
         vj6x73g/aR4H9fvkr6qS0LvaTqgCsvTnFxf8wrut7MIzNE9KZBJt8tNIOA6XjE0lhyuI
         +qR4573V6mFoacBex4TFz1XRMmls+qO8PKZ3KYdOXUpDrQA16+9Dk1l/aaHAscgDsDKJ
         b6ZoQLfp/uQNe8cBAP05SmEvmEJ09iomt62rmkrc9bfGBwq14SUdGf05aNUAyn0WIFUk
         swnPoYgVMB+0Kb+p0WTTlKubnFWvUUjk9puFdd+vQ6Eb95KHwd9LQFUp2iyAMWFuSd9O
         wokA==
X-Gm-Message-State: AOJu0YxOb6b2zHz4LkNe5Y7vN530iGim0bKxfTSsln4vkbDgHcIQCy6L
	e0vccKUK1Sl8n++7wu19sALsJuE+zL+pUmZS8VCS/g==
X-Google-Smtp-Source: AGHT+IG9GvrULFIjjP6U8qkZwKYCykFdj1ob2Up+Qp6g7QcM3U69FOqMg+HLSit5owJiqH2YYQxFxA==
X-Received: by 2002:a05:6870:cc89:b0:1f4:d2df:c53c with SMTP id ot9-20020a056870cc8900b001f4d2dfc53cmr1656785oab.24.1700620295689;
        Tue, 21 Nov 2023 18:31:35 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/16] binutils: Fix CVE-2022-48064
Date: Tue, 21 Nov 2023 16:31:07 -1000
Message-Id: <88cbf5eb4a075e677b1f9e6444ec6378a5949978.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700620126.git.steve@sakoman.com>
References: <cover.1700620126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191009

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0034-CVE-2022-48064.patch        | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc29141812..3787063cba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -68,5 +68,6 @@ SRC_URI = "\
      file://CVE-2022-48063.patch \
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
+     file://0034-CVE-2022-48064.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
new file mode 100644
index 0000000000..b0840366c7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
@@ -0,0 +1,57 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 20 Dec 2022 13:17:03 +0000 (+1030)
+Subject: PR29922, SHT_NOBITS section avoids section size sanity check
+X-Git-Tag: binutils-2_40~202
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931
+
+PR29922, SHT_NOBITS section avoids section size sanity check
+
+	PR 29922
+	* dwarf2.c (find_debug_info): Ignore sections without
+	SEC_HAS_CONTENTS.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931]
+
+CVE: CVE-2022-48064
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 95f45708e9d..0cd8152ee6e 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4831,16 +4831,19 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+     {
+       look = debug_sections[debug_info].uncompressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      /* Testing SEC_HAS_CONTENTS is an anti-fuzzer measure.  Of
++	 course debug sections always have contents.  */
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+ 	return msec;
+ 
+       look = debug_sections[debug_info].compressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+         return msec;
+ 
+       for (msec = abfd->sections; msec != NULL; msec = msec->next)
+-	if (startswith (msec->name, GNU_LINKONCE_INFO))
++	if ((msec->flags & SEC_HAS_CONTENTS) != 0
++	    && startswith (msec->name, GNU_LINKONCE_INFO))
+ 	  return msec;
+ 
+       return NULL;
+@@ -4848,6 +4851,9 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+ 
+   for (msec = after_sec->next; msec != NULL; msec = msec->next)
+     {
++      if ((msec->flags & SEC_HAS_CONTENTS) == 0)
++	continue;
++
+       look = debug_sections[debug_info].uncompressed_name;
+       if (strcmp (msec->name, look) == 0)
+ 	return msec;
-- 
2.34.1


