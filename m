Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6542.1599512018131421194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I20dG/bn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id o5so16917903wrn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JgGJnEL3LtePT8Uf5Hfu3UcT6Xh1tbvisJXIPMVrN8U=;
        b=I20dG/bnftynYFgpXowH9rD+7yb++sQTBpYNfblgZ1yXDAMCp8fa31rfCByfWrAGgs
         Z52lKnLe6+r/D2+Xb2PxREO40YMQmBOZe1LWuX1LeG/fA5gr6dTUlCNmZvO+E2OXU5sf
         XW4caLaLmAhomjkfhdx0GgjZCnpCX7lsykJwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JgGJnEL3LtePT8Uf5Hfu3UcT6Xh1tbvisJXIPMVrN8U=;
        b=V5KHNnOTYawyW7FOYxXYYKe8LqPbLhz4+U5F/fBx08oLAVQSEc4JkXU+/DOGP1SOjt
         tXD3qrCuCmxhhdTgxKL9As7XJ5t8UeQoGLf6hMuiSvV6ZI3CJcU6rC36HFfyGhqrVwFJ
         aaO+dIk9vGZukMA4HrtxucXxQrCaRe6mHzwOk7UQN3HNjYeFbVEPTxJSj/JK0jMRyyGB
         pvEg/piXctQWeXturns1w2NDdV4AU7Jnu233qled46CzdZoHRArweP6bxmWLxMW0MVwR
         NFde0dmSGZC8spHQngG7luFZoSG6l1kkJXsNaNQSzmBIvFV5mt2x6Q8tAhh0UFQQZO3N
         EcOQ==
X-Gm-Message-State: AOAM533orZnealNIAbmvVJGJZGqqajs2J55NFeKZqHH6gKpPI1X/7egd
	FT9ZzD/tLrGOEYwZ7p4q5ebdK17TGS3iOQ==
X-Google-Smtp-Source: ABdhPJzeSXJ01hUCOhaArDkM2j8PniJQi35tvQ4iHDvqSRy29QdjnJv7yhq6iuME5pQCpWYG+yKbzg==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4388125wrs.227.1599512016378;
        Mon, 07 Sep 2020 13:53:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 15/19] oeqa/testsdk: Use original PATH
Date: Mon,  7 Sep 2020 21:53:17 +0100
Message-Id: <20200907205321.1941682-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to test the SDK with PATH from the original host, not with our own
tools injected via HOSTTOOLS. It even uses some tools which aren't in
HOSTTOOLS.

This is necessary after changing the SDK to not reset PATH to the system
default which is bad for other reasons and brings the testing into sync
with that change.

(From OE-Core rev: 87c9602fd0dedc7bcf75b822aaf5f6ebfc17737c)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/testsdk.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 785b5dda53a..c5c46df6cda 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -25,11 +25,8 @@ class TestSDKExt(TestSDKBase):
 
         subprocesstweak.errors_have_output()
 
-        # extensible sdk can be contaminated if native programs are
-        # in PATH, i.e. use perl-native instead of eSDK one.
-        paths_to_avoid = [d.getVar('STAGING_DIR'),
-                        d.getVar('BASE_WORKDIR')]
-        os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+        # We need the original PATH for testing the eSDK, not with our manipulations
+        os.environ['PATH'] = d.getVar("BB_ORIGENV", False).getVar("PATH")
 
         tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
         if not os.path.exists(tcname):
-- 
2.25.1

