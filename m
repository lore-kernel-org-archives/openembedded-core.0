Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0191FEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13059.1686751521336742015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=SohS3ZOq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-662f0feafb2so4966086b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751520; x=1689343520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYWWdLXot/0eN5YOBYg6QhABqVI2NiL0tyrDSu4JO4w=;
        b=SohS3ZOqejUZaKqPG163GLJxlclGYwR6WWFxsOu+wkD9pg9i0WrA+HycUB3NVJfO/c
         H+zgkXxikIhE7fuYPXqdBV6pTWzGBV7I62RQdGAYEAAhRU2kRAPbLoXMrq3CT6AnY+PZ
         OF4N3q9sv84w6Qxf7nCR09D54q19i/dXANR6goWgfbPXWSMirEX4nQ/Jbl5/eeKEMizt
         zEdfVupLw9y8gGlSUKTdNE5ZR4jT96tYMyIp5UYxjRNOc2k1evDRz5uljD4O/BFwVq7U
         TcMRktF2MR5U5x8kyjywEv3/CKwcB1ohqnHMJF4Nch1dgGwuasMZzjEmpuT5fAnhcDyP
         Gfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751520; x=1689343520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYWWdLXot/0eN5YOBYg6QhABqVI2NiL0tyrDSu4JO4w=;
        b=IdeNQrcrjLGqTv3y2UJFnIR6qMLo2UpueEJ+Ua+mIKxKMcGAi8kuukBTau2CGeoZ5T
         KXbeFkbEVRqHDKT5BseKoJhkJtb8B1DOOb/HfbbF02/guaLiejl/+POJpnZphWR+eYiv
         liY0568tqtJyKredDLceMa5qND/dJxaAL48fE8P41rKdAbhiKARFkNzKgvDOA8Wgjms2
         /UoA+4Z+VLti3ua+nURxZ9Qy1BEnFCDeXFHNov+8aRoMNGum8mqInEkTW1pqzg/0t1s+
         c6I9rMsQydF4XMa6rUKYKptQB8XmOtNHU0lsKQRMSIQ9aL7lHg7jOxTZA/jvRSVozrPa
         bclQ==
X-Gm-Message-State: AC+VfDyTAsajksdYzlweUzIA0t84Q3E71Pg3nTJ/fD3C/zJBeq4YMAzh
	2ehtEE5T5ep5tc/DW/QiEEqWcF3C4dG5pa9eAmk=
X-Google-Smtp-Source: ACHHUZ4iSyHxCXb5YPwutUfQ1EyYRO+GGAZxIOsMSgj8uJ0OusIA+gcgXUavGmwv5Bwl8HAMC96FCw==
X-Received: by 2002:a05:6a20:9147:b0:106:9266:4448 with SMTP id x7-20020a056a20914700b0010692664448mr2590776pzc.16.1686751520273;
        Wed, 14 Jun 2023 07:05:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] selftest/reproducible: Allow native/cross reuse in test
Date: Wed, 14 Jun 2023 04:04:56 -1000
Message-Id: <ef8b5af4dc3615e949a96cf98076e7388b143abd.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686751371.git.steve@sakoman.com>
References: <cover.1686751371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182813

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't compare reproducibility of the native/cross components, only the
target ones. With the long build times of rust-native, the test now takes
crazy lengths of time so this tweak should allow us to reuse native/cross
artefacts from sstate whilst still testing the target output is
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b494d83c639a877cefeb7cbab6d37195e492f059)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index adaabee47b..be4cdcc429 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -188,7 +188,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
@@ -259,7 +259,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRRORS = ""
+                SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
                 ''')
 
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
-- 
2.34.1


