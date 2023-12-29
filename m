Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064C7C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.144931.1703850288812445781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NbU2f8oq;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d5adef341so26666185e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850286; x=1704455086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIht8ZAfr7vgTixa/D0R9zVx6EQdisps6c/LN626JTk=;
        b=NbU2f8oqSr2wM/yww81lZ/beXaIcFCc7rGDTMJbDlRUzeoOiS1mBwDeMZtu0QwELGn
         0Au5x8Mpc5IoMX36mKlZrApK1eT3yTfEtJgWeOcvkvpGHTbab72MX0gks0yvewqJAHzV
         u6T8CX0+G6ukdIX0FL1npNFX3T+3n2Q4F+cfxd3LeAq6tAjWtfXrIlPUARloqRy0e1kp
         y0AD1jXhL65kzskQdvSwKnOqQWuKVmJys2dHaCGCQT3QGDXj+vgEPwdriglVLahhQKav
         T2kvQ2RqtG9E2cCyBQd7StW6ukawhKE+uhQceUS/xC9W6BhfysnahYw7/FBdjhawWORC
         5WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850286; x=1704455086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIht8ZAfr7vgTixa/D0R9zVx6EQdisps6c/LN626JTk=;
        b=PLgV+50/O0mMRuvfJQ7g/RpLnNU/lQge7O+vgFZGLOMploSCM1zTcmFm+Ztyd577sm
         xJrm+QYft7WwxreQ//xhkbNB8IKOGrwz+NA6jMJKVWJziz76+9eqjBGLCDqozP4w9wXq
         CnDCJO8TY6iHGdJQD5PfFU9QK9u6LpIxG6GeU4j/ReCbKmeDBYFyHrr8TIcCoUG7NEyy
         M97yPTWBaWxif6ievz6ldPp2zI5tiZ46lIuEvG9K5hwFFIjqLyXQwGGqvVtNTon00RKb
         l6k4O9hDiYvWFZVuxE1Q+rXex5SqKO6SHG37HSRLG7kLAgXWUHKh8rrU2hpVhGUBTx1o
         Kv+A==
X-Gm-Message-State: AOJu0YzUV9sJezCSX5T483HcFZBCP0X8JR56aD62Atsmx7P2oOCCr94F
	nxp/x7rB2d6gQbQMZUXgCCLIFbfWtBg=
X-Google-Smtp-Source: AGHT+IFHW9y2LQe4+jBzMLER0FiTDinS5poNsFpNqMGpqiY6Dff7KjyLTlDxrRtp6gVbcVlvTRCCKA==
X-Received: by 2002:a05:600c:450d:b0:40d:60ac:6364 with SMTP id t13-20020a05600c450d00b0040d60ac6364mr922879wmo.110.1703850286530;
        Fri, 29 Dec 2023 03:44:46 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:45 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 04/10] devtool: selftest: Swap to hello-rs for crates testing
Date: Fri, 29 Dec 2023 11:44:29 +0000
Message-Id: <20231229114435.27810-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193007

zvariant fails to build with newer rust

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v3)

Changes in v3:
- Add hello-rs as a replacement for the tests which used zvariant

Changes in v2:
- Skip zvariant based test rather than deleting it.

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cc28731402e7..a87772076946 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -928,7 +928,7 @@ class DevtoolModifyTests(DevtoolBase):
         #    some crate:// in SRC_URI
         #    others git:// in SRC_URI
         #    cointains a patch
-        testrecipe = 'zvariant'
+        testrecipe = 'hello-rs'
         bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR', 'CARGO_HOME'], testrecipe)
         recipefile = bb_vars['FILE']
         workdir = bb_vars['WORKDIR']
-- 
2.39.0


