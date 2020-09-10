Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.20441.1599740678805386042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eIOSge5V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id a9so5617369wmm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pT8CLtXu3UWxz56XTAtaR2CpV6yEOb/3KF2veBNkOOQ=;
        b=eIOSge5V/LYZNHA4obO5qcq1W+3RAoB2qIB+Ji4kF00mu7yTBUT8hJ1/6B2jXdva4b
         NNbJaJF6eF1KxrzZN17JsCe9glrkXTdkLaBxLPtV0Y6rbr+k+KQHtEMHzbQw9qXMdWbt
         2Vg0ZMX8QcfYb2eKR6U5aB0qe9fKnNqdtDJrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pT8CLtXu3UWxz56XTAtaR2CpV6yEOb/3KF2veBNkOOQ=;
        b=VROD24CpwHeAS3C28IkYUa1QNhqiTbxsDMLO3/Gx5uyf6GenPbWTdIT4D55AOBdlO9
         fYQGY9P3yk8/8P1Bg+pvLPJe3hZYMWnVJiXv3l6jc5FVShif/KxQmAFO/o02uWuCJjIP
         GgQj0s/f3jJC+w4PNIaGC2FS0hIaWV1616hqsma+vLabuoMQguX267BX6MSs9tKfH4dP
         ub/VxMAJ1c+xWkNod75EG2rjNeb6ll+L/3hMpTK4LnUYDhWxVg4+mNNRyZCiWze/jJli
         gaTTw1PAcijgml3uXQZPCrgcoNSo28/oBZ9+XoDPx+I3at+4VRD3/zeAGjJFM7Rolv1q
         wq9A==
X-Gm-Message-State: AOAM53307P6Rb/5giR3WUhe3BTyQ/bgZz2Fn9nWD5+MzhIA82YkYO4kz
	TVRT+0CNQaKMYsphJqTRzTV9d7ogC8vgMA==
X-Google-Smtp-Source: ABdhPJyWsRCjafYdqd+ti4z2VBbJumUe9wO1AN3GvZYghCVcQIiFkOJKGT6yOAMlHLTsIwPnQezynA==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr8204914wma.60.1599740677007;
        Thu, 10 Sep 2020 05:24:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 04/29] oeqa/testsdk: Use original PATH
Date: Thu, 10 Sep 2020 13:24:08 +0100
Message-Id: <20200910122433.2040293-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
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
index 57b2e0e03f2..8ec5262d56c 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -22,11 +22,8 @@ class TestSDKExt(TestSDKBase):
 
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

