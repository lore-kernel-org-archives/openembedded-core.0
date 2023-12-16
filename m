Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC062C46CA2
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.15185.1702734796876439682
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 05:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=d0ZwUrxQ;
 spf=pass (domain: snapchat.com, ip: 209.85.218.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a1f37fd4b53so183284066b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702734795; x=1703339595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7rO05N3O8fkO8cN/syb0OL8fxJakT5PxfMJ7CTD2cI=;
        b=d0ZwUrxQqfyOAXqj+QoWE8Nsw1RIOtfb7BkOd1TqoEIcaidQEKONcnXY6pupqDZRdo
         U1eep2eAK6p9p8sAQ5oXWQ1V6WfDFuWOTw+CGSf+OymyabceXQ5rsONp4bPEWRPK0Iwa
         wtPOJe4bGsxRffvanE/pDGbknLt3QceqPHJeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734795; x=1703339595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7rO05N3O8fkO8cN/syb0OL8fxJakT5PxfMJ7CTD2cI=;
        b=uQ9G/VOm58Lk7tx2MKTAUYq7C/8UOdj0nxUMU6pvbVkaAlxDaOKztJMwC48N1vh1tV
         +GH1iQlElcIGVc1Xj0CEqP+rV8wIu791oFez/rsvE29bRjat3nwWNM2GR3gk3/XsxsYH
         B7pIYTVKbKuuE+21R0rLS875ND8NiQ2y8AX8pvwtEAbDXie3Y6xeIFVvpHynULBOexFU
         7cla17oWJK97urQrJ74rdEUV22y5KmXkiaOH6xtnAHSQC7jaLne8L0gegrPZY1qYaDcR
         kVrGeQAVjwurWCrXa+e6gdGUyDkKV2jQQPJAATdI7aPRDqJP4HZ6N6UNi274ML4QV6IA
         r0cg==
X-Gm-Message-State: AOJu0YyGz9PkUb95fgrP3PgpppnqMplufE49fAha9hFGvc/Dnb45t8x7
	jR25TpTcQo20+CXXyRSzM4+J1jwzHkbajJCvg9QpRA==
X-Google-Smtp-Source: AGHT+IGa7ZqeRzIp24ckRLfPILuZ1kiLqGls5iUb+52h/xOH5t5NfqbmzBZrBVHXosald3qiaaJ1eA==
X-Received: by 2002:a17:906:4c:b0:a23:f5f:7b5a with SMTP id 12-20020a170906004c00b00a230f5f7b5amr2289173ejg.42.1702734794640;
        Sat, 16 Dec 2023 05:53:14 -0800 (PST)
Received: from LC49NTQ3.sc-core.net (62-178-121-202.cable.dynamic.surfer.at. [62.178.121.202])
        by smtp.gmail.com with ESMTPSA id rl19-20020a1709076c1300b00a1f8bae93d3sm9849929ejc.215.2023.12.16.05.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:53:14 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
Date: Sat, 16 Dec 2023 14:53:06 +0100
Message-Id: <20231216135306.188070-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192564

From: Etienne Cordonnier <ecordonnier@snap.com>

The function do_symlink_kernsrc is not reentrant in the case where S is defined
to a non-default value. This causes build-failures e.g. when building linux-yocto, then updating
poky to a commit which modifies kernel.bbclass, and then building linux-yocto again.

Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15325

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/kernel.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38..130bedd901 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
             os.symlink(s, kernsrc)
         else:
             import shutil
+            if os.path.islink(s):
+                # this happens for instance when a poky update forces symlink_kernsrc to run again
+                # after s was already moved to kernsrc
+                bb.warn("%s is already a symlink! Not symlinking kernel sources" % s)
+                return 0
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-- 
2.34.1


