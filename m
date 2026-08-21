Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1093C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 10:01:58 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4225.1787306511796438833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 03:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K2W1qCob;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4813ea321cdso1347228f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787306510; x=1787911310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02jpjSkamaGB7TpnpCMzZzL9eY/mEPqsczfkz3CQyN8=;
        b=K2W1qCobyKuXUz7tYqgLdSDDsoyUcNtCwAlDDzjUnXzkaLAEgCHEjN7yIHp0+bismC
         9o6YnGMhLaMQa7SRyD9aI6549eRTK3ZUFc7tQNdLuGB06eIXMmnroySvWkD1ruDWnrtp
         tra0z23pwZBtA6yb7/0rN5zl+60XMySvsyG+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306510; x=1787911310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=02jpjSkamaGB7TpnpCMzZzL9eY/mEPqsczfkz3CQyN8=;
        b=cgHap62vBJMJy0WJJjC99aV9uvzfCXD2CQ6K92c/XWANrIaBmHdDWQIGi1Fzfd1u8M
         Ow7r5jdfkYDqFRAw/SaIoPfjX2p+uMmNMTstX295gDI9fpXViXHLS/QsBOKkfrf8GiHj
         rF6R9diE/ZjVoDEgwPWcflUZAnvcaSU3APEBWeKNFxPgiFthU0u21M63CAwsh+ycsZ0M
         CztS/fojdJ5Cl9J5ry7W5LIMkuysetaq72jvsE2/3o1DCxlaGggnXHVnx3tFxPV4SjdC
         4MwKkKuF+kSBdgsHW2UzT9EgKxaSjGZNtuTffiLqsj8EJnAyYIuWN6Tr17J43zMnA8Ny
         kc3w==
X-Gm-Message-State: AFuF++l6aVgEKeI5QgeOI8zoJ/AOGYcxiwfkr6BaCO3KBBjNLSvnxcyz
	3IBX5R2NLDcw8TsOOJnzF9lsdH9OpZggHTz65Dc+4ZNmmta+JZhlsxFqQ1gzHkaCBbqzECC7Hr5
	pa/jMmd8=
X-Gm-Gg: AR+sD11mJwuSUpZk+gwVT4lqyFIxbtXqem/fG5rjrGKEF7MbgEuJI58ncq0U5a4tQQ1
	vDFY4Igm4xGsO+wWdtniwqzOpe2zkTdOl705AvCq3Dq37bYhIC2CtO6Vk5a/8S5b7jNXLm1SAzE
	KhQOeh+ojPkc3nYFfB91R78fnuUE/bd7Qj0Q3sM3tjMiby2GYvyOfWYDB4q7VKN8k3t2hbHOcgC
	L0fD0YBcgvACnkKnZvQpIlqC3KRa3SyIzIF7inH4Yd8qUx7M0r1ty4dpHBrRbCeVUJulAPcZGqE
	jbcWKowX3CZLT2LekZx284mzKweqrAfYwLQ6z+f4Tg2yMumiQ1M0gwtmMFkP9/XEsjIvJMA7/Xb
	P8/lgdrHkh6GIpu+eKJftr5o9lLOMOZDRgPx3Y459I/6Ecgl5IE8NXV07UgMrsFPl2ljmK49RpD
	X6GcFkiGPlCT83MUtI1PhP+Yfmq1qBwqJc4jI3E66bnmOpPT+k+/Kb2aXQExrFrlXcpaSh0sMkW
	D1FepIO1MVrfHbVGg==
X-Received: by 2002:a05:6000:18ab:b0:47f:9158:5924 with SMTP id ffacd0b85a97d-482c1172e54mr5882782f8f.9.1787306507746;
        Fri, 21 Aug 2026 03:01:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441753sm18510062f8f.5.2026.08.21.03.01.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:01:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] boost-build-native: Work around reproducibility issues
Date: Fri, 21 Aug 2026 11:01:45 +0100
Message-ID: <20260821100145.4041431-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 10:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243919

Boost is querying the host's ldd for a glibc version instead of the target
which leads to reproducibility issues. We shouldn't do this when cross
compiling. Patch out the issue for now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../boost/boost-build-native_1.92.0.bb        |  3 ++-
 .../boost/boost-build/python-glibc.patch      | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/boost/boost-build/python-glibc.patch

diff --git a/meta/recipes-support/boost/boost-build-native_1.92.0.bb b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
index c70ecf9f117..fed11eef445 100644
--- a/meta/recipes-support/boost/boost-build-native_1.92.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
@@ -7,7 +7,8 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV} \
-           file://add-python-numpy-include-feature.patch"
+           file://add-python-numpy-include-feature.patch \
+           file://python-glibc.patch"
 SRCREV = "05b6b638b54e1f013fb8b281f5020e337be31363"
 PE = "1"
 
diff --git a/meta/recipes-support/boost/boost-build/python-glibc.patch b/meta/recipes-support/boost/boost-build/python-glibc.patch
new file mode 100644
index 00000000000..b19f0ac474a
--- /dev/null
+++ b/meta/recipes-support/boost/boost-build/python-glibc.patch
@@ -0,0 +1,19 @@
+Calling ldd on the host glibc to make decisions about the target isn't cross compile
+safe, don't do it. We always have a new enough tagret glibc so we can skip this test.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Inappropriate [Upstream would need a proper fix rather than a workaround]
+
+Index: boost-build-1.92.0/src/tools/python.jam
+===================================================================
+--- boost-build-1.92.0.orig/src/tools/python.jam
++++ boost-build-1.92.0/src/tools/python.jam
+@@ -624,6 +624,7 @@ local rule candidate-interpreters ( vers
+ local rule gcc-use-libutil ( )
+ {
+     local glibc ;
++    return ;
+     if [ feature.values <toolset> ] = gcc
+     {
+         debug-message Checking glibc (ldd) version... ;

