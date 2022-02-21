Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A422C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4758.1645478644297075076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WjyTiJ5q;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y11so9960719pfa.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=WjyTiJ5qRU0OZ24K1YnQHCpoLSA49gji/vT++wlRXYXbJjgtWbt5wP17tS+NAHD/w/
         PGp/mYJDyCLKjt6eALhGYPA7ZMHA/NePeI15KUXJqV1jgACnEq0fFqfPPx34lPAT2srm
         fUZVqc83DBSyPux13Nni4vCL8y7uY1JzU8f0Y67wNIYTzu9S/3U+eW0L+fDcr5EbBC1t
         ZGPkHcu+Fzc7pjqzRr8NUY6yR+/X3G0ioO0s/LeMGg4C7nS9MGh7/mXhEJyd54pFBgo9
         3aNXDTY3tOBtJ/G/PkutHxsa+wUf10chi82QBl2Ji2KEJTGXDC4c5XjUWCdF1C7zJQun
         VIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CfHg4DcEJtMZA8euboN687Jj3f+GOy7LRl/b0rjXE5E=;
        b=oGY1ZvyXW2Sn69QLy5j+O+p9EJ9GXwEyknjV0JScTufYWRD0bEiwUGSijLw/3eNR9s
         XM9OKBvpwDuYApCxWEHVlbuS9Z1nQ/EgGZyOFLPgG2SBr/Y00lx+rb0nzAblmFArDRPt
         +l645FuHqjkO440TqMun5jUE02sKWS9v8Tr9S8KBeWlGZOL/BNc6AY/zqqNbLp0bNSLq
         5j9AvIXjVHk4dIDH7pGuktgtyFaXwRMftepihhpJniWsOb2IsLsfC9pUN8Wzv+5vt9Qy
         3XD1L1lpsuupWMTEQgh1ybaZVlT8gzs1g+xWiUkHUlioudB2WquG+1bnC4YmAemGNH2y
         nTHg==
X-Gm-Message-State: AOAM533aM2W6xlrkKDbbBF+Xnk1EgL/fAx9MJt3UM+xBvEACe+TX9YO0
	5wGQtArbD8OaSzfYLJP7iIboaXta+temtQ==
X-Google-Smtp-Source: 
 ABdhPJxoUBB61ZXAnMBQ4z7UgtEWe6cHuaSDDid9rNyFzZxGoANmZ93xTJRwt11S1lFy1bx4dZvkQA==
X-Received: by 2002:a05:6a00:7c6:b0:4e1:799:7a2 with SMTP id
 n6-20020a056a0007c600b004e1079907a2mr21506633pfu.25.1645478642849;
        Mon, 21 Feb 2022 13:24:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 03/32] flit_core.bbclass: add helper for newer python
 packaging
Date: Mon, 21 Feb 2022 13:23:18 -0800
Message-Id: 
 <b1998ea7939172e525ef826ded9ff167769b5579.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162079

Some python packages now use pyproject.toml and declare
flit_core.buildapi as the build engine

Use pip_install_wheel class to install.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/flit_core.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/classes/flit_core.bbclass

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbclass
new file mode 100644
index 00000000000..0f2eec85d0b
--- /dev/null
+++ b/meta/classes/flit_core.bbclass
@@ -0,0 +1,16 @@
+inherit pip_install_wheel python3native python3-dir
+
+DEPENDS += "python3 python3-flit-core-native python3-pip-native"
+
+do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from flit_core import buildapi
+buildapi.build_wheel('./dist')
+EOF
+}
+
+do_compile () {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build-it.py
+}
+
-- 
2.30.2


