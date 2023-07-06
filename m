Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5093BEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:16:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17730.1688634981907280009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=eVjoRlsu;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc0981755so4882685e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688634980; x=1691226980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kOebgC2mXDMACiWCuhK0HspNQyoc/PYEA3k+vUNyEw=;
        b=eVjoRlsuPJ4MniYjVtrtwVe6gr+5C2Jsc0SOekxbLMGkkrVzcaT8tdgUyYDq1MCiJc
         thdhGA5ca+BS523Sxhr0DaA+zU/8MFJqWjksDZNn/R6SnbgcKMIouIu4btpfwdHfdkDi
         Y31Xtj/COAQBaCSxtBW2eeYY3GgfZsr9wmoOCPwq1cVWkaQCmkiNP0Kc6HLZYFQEY5Wb
         GwW+THdL+24mtiSHUsjtfJ8QkyrEV7sJ5Ss1Woz/c+sobz4Yxes58RIigbOhgX5WMq33
         miNvQ4ajHkzl1yl5k1p9UtrcJRE6JBTEapVHtiSYHr6ygbufel5/AYCX3eSKcZ5PDrV4
         QF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688634980; x=1691226980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kOebgC2mXDMACiWCuhK0HspNQyoc/PYEA3k+vUNyEw=;
        b=MfDTdY8obVMgcVKGouEoxBjOYqgkv+enJnajtN2U4UNSdOn9l22eAS2n4o4I5E4CL+
         1m1gZSkhVoYCCXniIikdvdOu7VyLgBPK0ajFATd7dNyErStz/rIEVW0A0CA4+meA5aD0
         fPyoOs4U9irkOFu4MtmyntJbtCrFXeQiRlGfKzlWX4wSUsy6yhy9afGkyDPxGkCuvsJj
         gb1gIhPD9Av1LbP1bhwrsjC0MRPS7srg1jeqknyui/KhVvBLpPEV1QbjY9zOTVf6XUzp
         9y79BF7tkIVhQCzYbd3179iZa2meAJoW2pDo/3q2u6L9QglPBKED+yp3W+U5w2UE+hyy
         oaLg==
X-Gm-Message-State: ABy/qLbeAXI7hzU3egdXo8zZzxKS10Tde8ziKeZpN3gCOKMThoh6vmDa
	CQLXXFHs59A2k+kRZ2mXMran5LCWYV4=
X-Google-Smtp-Source: APBJJlHmm41zp+zO0Fk9AQ+Zf4unYsfeWztQVEX5u+7MqxeGu+O2KNaApOfP5u5DkAv3UJLNOqxYyA==
X-Received: by 2002:adf:e505:0:b0:314:1ce8:a0a1 with SMTP id j5-20020adfe505000000b003141ce8a0a1mr853531wrm.17.1688634979635;
        Thu, 06 Jul 2023 02:16:19 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:d306:52c9:26ff:aa02])
        by smtp.gmail.com with ESMTPSA id i14-20020adffdce000000b003141f96ed36sm1389471wrs.0.2023.07.06.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 02:16:19 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] ptest-cargo.bbclass: fix condition to detect test executable
Date: Thu,  6 Jul 2023 11:16:16 +0200
Message-Id: <20230706091616.200995-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183918

From: Frederic Martinsons <frederic.martinsons@gmail.com>

before that, a test executable at None was picked.
Moreover, use universal_newlines to subprocess call to avoid
being polluted by fancy carriage return characters.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 4ed528445a..5d53abe969 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -23,13 +23,13 @@ python do_compile_ptest_cargo() {
     bb.note(f"Building tests with cargo ({cmd})")
 
     try:
-        proc = subprocess.Popen(cmd, shell=True, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+        proc = subprocess.Popen(cmd, shell=True, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
     except subprocess.CalledProcessError as e:
         bb.fatal(f"Cannot build test with cargo: {e}")
 
     lines = []
     for line in proc.stdout:
-        data = line.decode('utf-8').strip('\n')
+        data = line.strip('\n')
         lines.append(data)
         bb.note(data)
     proc.communicate()
@@ -50,7 +50,7 @@ python do_compile_ptest_cargo() {
                 current_manifest_path = os.path.normpath(data['manifest_path'])
                 project_manifest_path = os.path.normpath(manifest_path)
                 if current_manifest_path == project_manifest_path:
-                    if data['target']['test'] or data['target']['doctest'] and data['executable']:
+                    if (data['target']['test'] or data['target']['doctest']) and data['executable']:
                         test_bins.append(data['executable'])
             except KeyError as e:
                 # skip lines that do not meet the requirements
-- 
2.34.1


