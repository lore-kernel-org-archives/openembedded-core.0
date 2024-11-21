Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C291E64030
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10490.1732226092266061671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m/JU1nuE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-723f37dd76cso1454265b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226091; x=1732830891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7OdZiHyaYU9qNLb/zG5/Urx/dltNxSUap4SPRQKUlQ=;
        b=m/JU1nuE2/Ue50bjRS7UumCWBfhRUjCTMI+42PhRdw2Ae+a7+gTf1oNE24oIOh9a1T
         dpMLl7uaUNXYBvOtzc5D7jci3BMUWNK0IrwL7eK3ukterVNXI54u9Dx0lSXEWQZ25l8z
         k+aHUsf9ibMLrUtZCchyzxYSzIB+Fg+Y8qKa/V/REx35coCXLWGBrfqzIrbLXJmMSV36
         ln21wl4Bk1OgJo6prJgI+PCZPNTiLjP+YRv/oehfJ51cpzhhUy2dP5b4bNVfv1nsr+/Z
         ZhTOy+H6P/Coa7JhuPWCIL4pfeTzE5R2fIA/tTYbwS96nbAtmtmMqUXuOf3y2WXNAzrY
         /whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226091; x=1732830891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7OdZiHyaYU9qNLb/zG5/Urx/dltNxSUap4SPRQKUlQ=;
        b=bIcWTpiEDAsk+fGVs1Y7JIDSnBf1KSWnQIFBU+dcIHCOm5tPFmoxd8S77DAUB+iIKO
         uFFZu/9DCIGUX8JIgw4AIDMV3gzwck9egaCqJid8/HLkTc/RShKKsU9a/KVwPf8Qjd71
         5IWZyspc4voTPhj6EjPxiu19+PBKDJi69TnOmRuJVIAFEEPWLMjyf2ZiG45gE38ZzMb8
         lSAfAaEP0sH3NFApojV1FRbwsUnE/D4RgXdvdiap2W4b3YzhUNxTQ1k+DaPn3nXHQwXH
         4fWGm2kI7usndB9BDSuiNqVmwq1oil+rsf+EcTeZNTX2wOhRe0GFZyjta6Utax3dsk0l
         4lDw==
X-Gm-Message-State: AOJu0YwYUPWI2csDfJR/QTl/Wgce22RqDhitQJQEUSJKK/W6qp3vZalZ
	kFDkDs2hej9Zevxwul1dJzFaO+C9cg2sM9oa5F44Dossl/mOQRQ7EgBOKmF/9SbaUACRhNmSRx+
	w
X-Gm-Gg: ASbGncspFCjcS3HKw7fFmlyN37jxpBiIMR6n6UaLSgEqlYCWyPNCt24l1nZ9h+lMFrN
	tXVI7aPuL4RXDJ6a8qva8D2GsCMbOXozDYSiCAsUEhvmgXJ5IjAdwCg/AsYsVWdfzhdeaAZmqh3
	Y975xJk2oxmy6/8e/X7nHF/0u4AOsz+BnGh+VugS1Eoql1jPZyx/6ll0lOeaJ8uvBDc8s895PjX
	Hmnn0qdqoDgsPMC/KaXNqMTrxbjx/hsCDrKgDE=
X-Google-Smtp-Source: AGHT+IH5CqZKE5fERWJSOGohm5OQXz1HnEJiLuVEl4/r6c0eI7QwwZB8UpCkNqRtghTN5cRgCIFZ4Q==
X-Received: by 2002:a05:6a00:23cc:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-724df5de0demr903047b3a.8.1732226091440;
        Thu, 21 Nov 2024 13:54:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/27] package_rpm: Check if file exists before open()
Date: Thu, 21 Nov 2024 13:54:10 -0800
Message-Id: <2cf4c9179ac67c64f66813a2cf526cf5c49f79ab.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207575

From: Pavel Zhukov <pavel@zhukoff.net>

Exception handler tries to read() /etc/passwd file in sysroot
and if file doesn't exist for any reason then it raises FileNotFoundError
exception which mask the original source of the problem and makes
debugging of the issue more difficult.

Fixes:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/codebuild/output/src1899304708/src/build/tmp-container/work/core2-64-oe-linux/emqx-bin/4.3.12/recipe-sysroot/etc/passwd'

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ad9a0e0b11eb7bc5a3dd45fc8945e094ea949e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 6d1519a272..4a700ec124 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -205,14 +205,22 @@ python write_specfile () {
                 try:
                     owner = pwd.getpwuid(stat_f.st_uid).pw_name
                 except Exception as e:
-                    bb.error("Content of /etc/passwd in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/passwd").read()))
+                    filename = d.getVar('RECIPE_SYSROOT') + '/etc/passwd'
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/passwd in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exist in sysroot!".format(filename))
                     raise e
                 try:
                     group = grp.getgrgid(stat_f.st_gid).gr_name
                 except Exception as e:
-                    bb.error("Content of /etc/group in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/group").read()))
+                    filename = d.getVar("RECIPE_SYSROOT") +"/etc/group"
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/group in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exists in sysroot!".format(filename))
                     raise e
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
-- 
2.34.1


