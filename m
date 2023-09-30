Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C72E82CA4
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:34 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.47402.1696102825519357297
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2HWuufoo;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.50, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dce01b6f2eso6863491fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102824; x=1696707624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvMEAF15Hqs42BX+jrXfNapOkTLdwqXOHC3c9xjMu08=;
        b=2HWuufooaf9nwvmp8hKnF/Prb3bsPdvZNkL1Lbna63XcjDNEr0palUVjA5TcIwMO/l
         NyOuAsUPDiKjKy3knvVEY/ZdoSGleagF1f33MeXskJ/2pBJXUCgB7Xx/WN6nTvlQdLI0
         DF6ACcBKeGPXe8CCFR/Lq2WQSfw7neOoa3byC9WIna2TrADstMqixTX5MNu9ARPDDgp8
         3/Jl33AY8SAih8DXXvEysVBecQSXSIvhTPUVQocTV45n7KX9P9LSzr0OZiPOcCQLBeu8
         08b8FTQAmPclcLCtt3gemct6vyYyiQb97vv8oHv/Dmi9pw+tRercbM4o+JLy9zSNyCBH
         IzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102824; x=1696707624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvMEAF15Hqs42BX+jrXfNapOkTLdwqXOHC3c9xjMu08=;
        b=JIna+KA9yovuqJe01Kr4yExKVI6N7U3lCgatqJ1vwbJFcv366WNyZpf8+rBSXkEjyb
         KpKVMJ3IMrpYThKD71N1PFhaIbRYOmm81jKIjQuQVzbdZrxaYH53Bf9ttEIsM1aHEIpe
         b+erTVh/Gmn7RUYgBT6sFlWwhL+cyKNbORkfqAJ8AfIG4LbDwibfDOdHTd1GQChKUfCM
         u75pZKvA4ACc4MpMtIktP8aavh3bXZCaLTgvSY2C6RW1slnbsOGus4dDl76rjI8gFuR3
         JZfMLMC/necw4LnqIlFhHR8PpKt+F97BmTMsnDDfK8AdOw22o7zdaeZbke9CpE0kUF4Z
         QwlQ==
X-Gm-Message-State: AOJu0Yyo79KKyiyaizi1EvUxvSVhxY0YeQIeH8CoOM5BJEd+04HybJ2i
	NYff+HXenQHDvwbkp24GNRdnIQ5pH+0gwJ9KrRQ=
X-Google-Smtp-Source: AGHT+IEGfj/BeV8Q0f7GkYpS/MsRn50CNXxL9skZ+NkVBuBN9p89YGAQvSqriC+SzHU9LdNAkJIgdw==
X-Received: by 2002:a05:6870:f6a7:b0:1d6:6941:d1d0 with SMTP id el39-20020a056870f6a700b001d66941d1d0mr8891597oab.49.1696102824160;
        Sat, 30 Sep 2023 12:40:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/13] libxpm: fix CVE-2022-46285
Date: Sat, 30 Sep 2023 09:40:00 -1000
Message-Id: <bd594af20fce07908f8e0fb1765b0e0ccc641e86.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188468

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libxpm/CVE-2022-46285.patch      | 40 +++++++++++++++++++
 .../xorg-lib/libxpm_3.5.13.bb                 |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
new file mode 100644
index 0000000000..e8b654dfb2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
@@ -0,0 +1,40 @@
+CVE: CVE-2022-46285
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/a3a7c6dcc3b629d7650148 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From a3a7c6dcc3b629d765014816c566c63165c63ca8 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 17 Dec 2022 12:23:45 -0800
+Subject: [PATCH] Fix CVE-2022-46285: Infinite loop on unclosed comments
+
+When reading XPM images from a file with libXpm 3.5.14 or older, if a
+comment in the file is not closed (i.e. a C-style comment starts with
+"/*" and is missing the closing "*/"), the ParseComment() function will
+loop forever calling getc() to try to read the rest of the comment,
+failing to notice that it has returned EOF, which may cause a denial of
+service to the calling program.
+
+Reported-by: Marco Ivaldi <raptor@0xdeadbeef.info>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+ src/data.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/data.c b/src/data.c
+index 898889c..bfad4ff 100644
+--- a/src/data.c
++++ b/src/data.c
+@@ -174,6 +174,10 @@ ParseComment(xpmData *data)
+ 		notend = 0;
+ 		Ungetc(data, *s, file);
+ 	    }
++	    else if (c == EOF) {
++		/* hit end of file before the end of the comment */
++		return XpmFileInvalid;
++	    }
+ 	}
+ 	return 0;
+     }
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
index fda8e32d2c..8937e61cb5 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
@@ -21,6 +21,8 @@ PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
+SRC_URI += " file://CVE-2022-46285.patch"
+
 SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
 SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
 
-- 
2.34.1


