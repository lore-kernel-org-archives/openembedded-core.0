Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.6539.1599512021681012260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QmEBi2Gg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id o5so16917976wrn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qoo7bOLLJeKpvr2eqRN83w0U7aJHHz46VBmHJnonEeI=;
        b=QmEBi2GgcLLUc2Uyrl9qYmSEZuoR9bBUsLbsJQCn8oLSSOl3TViP17tRQ4gT6Pf4yK
         5995rJLp5xgqL/v3WCvtcRUMP6klnW3LLjbziy7MYDw8r55PhFrAWodDdc2ZfxeJjsSj
         i/73JoVjAP1h6nS3rVOMAWV2hd0bElNOdQR9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoo7bOLLJeKpvr2eqRN83w0U7aJHHz46VBmHJnonEeI=;
        b=Saa7HsJJYNrMXMSigkTtoVulPkyEQSwFX4UjMxy3maQ110QilNNxKH7J1Fqy4WxQ15
         dST2mJXkNvE9OBMhVBCaTMLtj/x+ZlcEOdTSh72a+ms6Qu6f/7YaQwmCwnK1PIuPPk2q
         BRSNSg+RjV4cFzU60wfbxhrUn/Ejnp97MM5Zu074a1teqP6TDdFDBSJkH/0TL/nvlJId
         i4e4gq1Cxt2V/jx4fqLnDzyPkkELP1kfEkZgR6mMVmddBXCHmnY52e57LsKbiDzpOOG5
         M5kzTidtQ9I0lxNG1kGf3cTYlJME9dBJmrxFmOuZt9F3Ri0ME4NbiIEg65Ovb/fBbBIG
         Gl3w==
X-Gm-Message-State: AOAM533nSjQ+6oYeH8ueriJmeh2gc6kMlUmTC2OZQBermQDJnuE4IE/w
	6v6nseXS2+3353wVcG4j6L37Ymjo/vf10Q==
X-Google-Smtp-Source: ABdhPJzRc/2exEpVoM6c731mw49r4m8KJ7KwyXta6E6RZh0H5d3LpvqTaQCrbXk9ugIZm0cNjchSnQ==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr19334552wru.89.1599512019964;
        Mon, 07 Sep 2020 13:53:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 18/19] selftest/signing: Ensure build path relocation is safe
Date: Mon,  7 Sep 2020 21:53:20 +0100
Message-Id: <20200907205321.1941682-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 5c4e01b2c36..87d3ae6bafe 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -44,8 +44,8 @@ class Signing(OESelftestTestCase):
         origenv = os.environ.copy()
 
         for e in os.environ:
-            if builddir in os.environ[e]:
-                os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
 
         os.chdir(newbuilddir)
         try:
-- 
2.25.1

