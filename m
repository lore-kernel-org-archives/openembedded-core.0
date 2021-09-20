Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.11109.1632141987677665203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BD8rf9T4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id w29so29315284wra.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MkCGY+GDbIitbbAhVYBR1iQsWiX4KEHgH6FEt4akJh0=;
        b=BD8rf9T40W3/ILMaPupSVvnsdNHDOREPdSLgmVuAwHyp8vsPkJGsjSGvatZFc1AtlB
         V5NcHM99MKomgUvZXVKALzgqBtG/sDIvJcgnZiYMfm/QUzBafKHldj+QacocJtf5uXg9
         z8jGTzFUqJilcM8QMpXc/oNebtT2c6TnTmXXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkCGY+GDbIitbbAhVYBR1iQsWiX4KEHgH6FEt4akJh0=;
        b=ubdtJMXuvJGZ9kkcZNwNg6j8+0CehbIQaaMN59mYQ5XXD2STLr9zlUM7tCvdZUYCBh
         vNmSlwJRwL2cPyyapWykQ8NrlhMj4EnCoq1XKVs+TwgDhCUwMhtvbIHN/Mol73YSML+G
         Z6K2xjvefj6SBIAyQ+94R5WHL+OWm0QmkdU3oK3qkYUdeAqhEQrimxS6kPNzHnxr7BBg
         /um0wlgJZvF00FXHSzA98sa5jNzmO2N8laSoA+JX3n9so2xMq+qHHC9RBb+qccLgUo6X
         WEW2ikBkr2MpmlFcd4a/Fv4fd+QBFbBaikcbVJy5WU8wjHynF0Aqsdvi5EXptPsFIQRQ
         l9XQ==
X-Gm-Message-State: AOAM531hmBP2Q1YkPsGjuKNM/ULBThcPpxqE6XDTpMHOEnSCk6o2VTxm
	7lG/8DbsmB+C6fHj4ukpBHa31/5Fd/vmJA2O
X-Google-Smtp-Source: ABdhPJzi64W46+PU+WRT2AScvX7Z3hIiTNXu4+11dI5CU6lLpOAyy/3t3oyqOHkjMh77MYdmsejaSA==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr28273706wrv.51.1632141986128;
        Mon, 20 Sep 2021 05:46:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] lttng-tools: Add missing DEPENDS on bison-native
Date: Mon, 20 Sep 2021 13:46:12 +0100
Message-Id: <20210920124621.1576702-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was being provided by other pieces of the dependency chain but is
specifically required by configure and could fail if those pieces come
from sstate. Fix such builds by adding the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
index 95bb2519d7d..47cab42fcf5 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
 
 include lttng-platforms.inc
 
-DEPENDS = "liburcu popt libxml2 util-linux"
+DEPENDS = "liburcu popt libxml2 util-linux bison-native"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
 RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
-- 
2.32.0

