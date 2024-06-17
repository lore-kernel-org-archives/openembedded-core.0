Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6154CC2BBCA
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.55030.1718625951060128814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LxxQTsJZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-705fff50de2so622287b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625950; x=1719230750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aww4cdiYqr6EvK0tiYYPGqQJdWN57n9kvj4D2oqsLl0=;
        b=LxxQTsJZlkbAfmTie6cO/YjpeLH8ns/6r69QrPIl2Xk5Dw9Tizx+ONu/BNrnAExnag
         fN5nzM3irQk+d5dtMVhSLyu2ja/OvfDBP+dye+cUd7qLL5slrS4B6UnQI3x2luoeRgJr
         OZWE325CKG0XRG86C26hsa43Ria3Z+rlf79bpSoBBCKht4SFdTtUYrHv0cHP6+uPHkHh
         izFWck8NLXw6PeDXQtF0taI/TYlxauvWsOXDtAXTClCPf7ovd5Gd1RFbkXsTCBcOuJUC
         /0IRkUCwaVBFLlR9XNhqzhRLn1GPMg9u3vvicduWzaMC0DgzAhH5euZJ/eczCxJtGk77
         8LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625950; x=1719230750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aww4cdiYqr6EvK0tiYYPGqQJdWN57n9kvj4D2oqsLl0=;
        b=FUR/egH2Mf4nmISDFksDPBQRq0jcLjOWk5hh5ZSObi/s/g9rc73yG995kio/1Fttb6
         Mvm1l6nCmajb61J3fNwx8/tDPIZF8Xu78Fn0MzBGfTPHaIqNawMLA6xd5wYXBx2hyMCz
         EaWnw6c4MaL8dRSymldGiLck7PtWHQbpRJ/Fe+fnk/nxO0aqGuUAWKdaG9pRYKFP9JOr
         XzvUqmm1VBEciHJMoHqxKMBmn1rLNb8VawSW0y2de3L/PENTawLSWPLdI1EOBEmhPUeV
         M7ibhVWbSSKQUNcPXwaT++MiWeBYUx8tti48NFEZ7dQUgEdifWd/tLR7OfstiFPp/DEQ
         puhg==
X-Gm-Message-State: AOJu0YxafIPkp02bn2FKQblGt89VfqA/uoTz1bpwWmOfitlCXnhIIWip
	KsCewv2P7de04MxPmq5djEcbQToQ+xC+c8hiWr/5tNz32xKqchT5Y45VFcNHdIqZOxoFEof3BRu
	Q5oM=
X-Google-Smtp-Source: AGHT+IHvQYItTP8ZCVrOX0vlKITXAG6H0JmY1WQfE8KH/TMWIyKw7nLoVTj5fMIbNScD7j+61TB2Vw==
X-Received: by 2002:a05:6a00:3c8b:b0:705:a32c:8b2a with SMTP id d2e1a72fcca58-705d6ad136cmr18569479b3a.13.1718625950250;
        Mon, 17 Jun 2024 05:05:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/22] iproute2: Fix build with GCC-14
Date: Mon, 17 Jun 2024 05:04:54 -0700
Message-Id: <06b5a2db1d079c86652534b6fc7e504f77604af4.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200827

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 127df0ac9b55fa2a7f3269934854f805843d01cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 442c6bdd4f..fd05707cec 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[selinux] = ",,libselinux"
 
 IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
 
+# This is needed with GCC-14 and musl
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
 EXTRA_OEMAKE = "\
-- 
2.34.1


