Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C79C4707C
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.151008.1703864733346104323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=om8vmdOq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3f3ee00a2so27527015ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864732; x=1704469532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+QAUwwbkOEG9j33U/JGd1N5mrVMmxYR8BIz6f43VvA=;
        b=om8vmdOqCpxrlQbEc2pPuG8CrmeTZC6+LQuiyogl/Kud2bd4YNpMNJ5G7sSAn+wR9z
         xfyu8JpwxbOCYxn94nPtiA/RmVv5QYGVAea47L/JzNvsqABNXH1xrjd9fJ3+psgKI6dh
         QSx8OiuJO+oNtFm7YuCUM0Sn49tw92P79kq+vqPb8A81dyuHkz8AK6l4Gq+auCbuflY/
         Smdnr2dt/c5NNy7rLtkn+ZR/1q3YTKgO3l/lpjeVdjYDDYmew4/5tFYrU9U4kMz10yXc
         t8JmbLVPwXbhRatKgsadZpwfbXj+plzjSH9ItFolwbxnZRgmWdLsqrPZ+4JgGRJz3Fr7
         grQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864732; x=1704469532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+QAUwwbkOEG9j33U/JGd1N5mrVMmxYR8BIz6f43VvA=;
        b=TLovUveciapf/MokZKI8Ik9BAEOYuonwxhSda72ujAOXdgYeDMgJOYkUq2hqix82pj
         r21xy3WsTZAnPc/1T4AOLhjpj5cyh3yMPr/XEep5sg5bfBy4r9we0bceCqLuPXB1NKqr
         Hm+hFnAsPqUARAZmFUqDosupJg92Wdtn0ELbhBjyHt67adfI/G6yd3uxW/e3+uM3v9SJ
         wsr41+cTm8pxg77Fy4xDCfCqXh0in9frICeM5aIDm9c27XROLhKO9rCgsyQAKSyNl1kL
         Ayxp4anKKTS4asGpHY2KJJiIuDwCIi+Z9Cd4+8AZBR5yOidJM4Km+xE8N1w1AEsyggI3
         7nKA==
X-Gm-Message-State: AOJu0Ywmgq/xncDMYvHZdlA8JsgD7fUw68SxvhQUPr81ooEhfgKJPy63
	TaTUy+DZ+AqVhMIPeHZ8MHToWNPcq1uqS3ZYlP5hnd615MB7vw==
X-Google-Smtp-Source: AGHT+IE85bGxlB68dhEYo6/rn1Wi6BSVInTE7IePSclNYt4xZG/2Q+BK8OsHBCgGS8pEzbnVJcURyA==
X-Received: by 2002:a17:903:41c4:b0:1d4:53b7:4ce8 with SMTP id u4-20020a17090341c400b001d453b74ce8mr4951354ple.39.1703864732508;
        Fri, 29 Dec 2023 07:45:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 15/41] libsolv: upgrade 0.7.25 -> 0.7.26
Date: Fri, 29 Dec 2023 05:44:29 -1000
Message-Id: <a749063e3f978a429d192445dcb5d636de668b82.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193032

From: Wang Mingyu <wangmy@fujitsu.com>

Version 0.7.26
- selected bug fixes:
  * fix evr roundtrip in testcases
  * do not use deprecated headerUnload with newer rpm versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit abd47f16a4ef8a50af4287795969832d1391d8d2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.25.bb => libsolv_0.7.26.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.25.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.26.bb
index 69cb3f7996..bae7960138 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.25.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "f1be8bf3dcc7dc14d331adbc97f337fa08e641c9"
+SRCREV = "48c985375134d2443eee551613161cadc278af2f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


