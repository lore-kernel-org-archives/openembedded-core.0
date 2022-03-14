Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7B7C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:02 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3516.1647298141432280776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X4xVWgUq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id j17so26406842wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91HR77Bpkeu4DxKrhdBTD4cekl+mNPeoyMrPkCuW+ZA=;
        b=X4xVWgUqWHVI22FSQPtIIZrmhZtSi7p/bFSCPFwJ2luf6uOpAxOnq/uokFX640rt4z
         fp5+XDbbnEwhoDgQtzzdp7P+meyij4m+23TIBC+c0gc2VFBFNop62YPmeRWxbqUecsAt
         loCcU7b5iaV9GAV8kvtztM2bUqzuVcnZpTsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91HR77Bpkeu4DxKrhdBTD4cekl+mNPeoyMrPkCuW+ZA=;
        b=GYQ05cxKjqxBtzlFG1SL02qUZnnHUlIm2jMY+7yd5YBOjs5D/+Fwvm8CmcQZaDflBF
         1/qFlcT2fDE6d7ivAobjp3JLnP0eqiubd62Q2gXx9VTAh2D2CunZVQdFRZIbeQcLPDze
         lc0DrVOcohULjJwncHDlNx3yD+AGmp+N+l5+1aeC+/Ld2bZillD6rvSuivkOqHQoVslj
         kVPKd5yc2dLwgb8cDFhaLYt8asbDbKDLB/9713VstwAxbrKRMrAgSO0oQPrbaZ2aHDCZ
         a1pHGpH2aXnn4YM5+fQejuiNBVpjuMEaNPeh1UREqAJfpqN7QKyvS8CsOv0N/yk8lJab
         5HGg==
X-Gm-Message-State: AOAM530yIdNzs/o1rzYyEG7Az47ZEbw7uCgFWmo0+ddq976olutEdRmj
	UoAVnampbug+Ee618WGWYkGaL/0wqKwiZZpD
X-Google-Smtp-Source: 
 ABdhPJwRWIKYCDVmRC6lQPWgHu+oTqNe3grugO66NitpqW0yaYplu/dVErOOO3GITzItnOFXp8WZ3A==
X-Received: by 2002:a5d:4e02:0:b0:1f1:e6fb:543 with SMTP id
 p2-20020a5d4e02000000b001f1e6fb0543mr17600819wrt.240.1647298139729;
        Mon, 14 Mar 2022 15:48:59 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 21/33] python3-ply: move from meta-python
Date: Mon, 14 Mar 2022 22:48:25 +0000
Message-Id: <20220314224837.834776-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163187

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-ply_3.11.bb                 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ply_3.11.bb

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
new file mode 100644
index 00000000000..99c037bb734
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python Lex and Yacc"
+DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/ply"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
+
+SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
+SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.32.0


