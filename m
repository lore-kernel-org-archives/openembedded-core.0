Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.499.1621543745893585853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UaGm+fJa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id h3-20020a05600c3503b0290176f13c7715so5980552wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gm8Xln5SnOuDU9x+WuIMn8lYPri2JnnqNffodD45hso=;
        b=UaGm+fJaRepnQHweG7Sg7g/M7lMpMZNb2+vAIU80Vjvk3zu3HIdrygIFm9k66sBv5E
         rZrxkngqxjdoZUq0hVkgeBfz1/z4K1ZP4H4/NG0j2OF86Pl9I99Xg3XrrGZl9owebL+U
         s3SaRty8qXHJ4JZ+E63WN5smOYhviapFidoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gm8Xln5SnOuDU9x+WuIMn8lYPri2JnnqNffodD45hso=;
        b=kEj7HzknHKuW/bk9tOgzMd31kfpTx+KWGuLmx1rVpontniAMbvotMw5F/fG/Xn5KsQ
         k1+BYMnzXh3VszI4FJRSb+8yK6HNycb4XxTiZABpJ0q4PyOiwtqlWVMHxFwWGvPHrFEh
         dm3MHXYoPI5K+2k0gg/HEmPVgcRr0ToXNCSqxqPDOXYxQBi5MM9Bi8j9Yaf47VkGu52m
         igV5zwqjBr4GanU555A8H+D4oGmjKWlxHSRbngS7MBBatapnkC4/grHxyh+BDOw9bDJv
         1mMXQOTMlylvo3VgiAEZVhI9dB/DoF+4upgbWiycHLRLzGa1hnNyzKohGEEtuXbqVSby
         cgmQ==
X-Gm-Message-State: AOAM533b3kX7O/eo23swNNN7HTuHyHbfTuH0RJnLINgryA30Q5pFur/v
	ZqnRuJFZ6TM3DXWId0Lxc5btlusnmWJ1yA==
X-Google-Smtp-Source: ABdhPJyZWZ9pNKHpH1fFhcgTFEKltJ2yC690DbRIE8pT1hOhPx2Cxhin2TZNl4/tx6bl6s2yHW1i/g==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr4174050wmk.184.1621543744362;
        Thu, 20 May 2021 13:49:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [hardknott] [PATCH 03/28] cups: whitelist CVE-2021-25317
Date: Thu, 20 May 2021 21:48:37 +0100
Message-Id: <20210520204902.2527687-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This CVE relates to bad ownership of /var/log/cups, which we don't have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cups/cups.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 244c87001fe..beee6148284 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -127,3 +127,7 @@ SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
 }
+
+# -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups is
+# root:root, so this doesn't apply.
+CVE_CHECK_WHITELIST += "CVE-2021-25317"
\ No newline at end of file
-- 
2.30.2

