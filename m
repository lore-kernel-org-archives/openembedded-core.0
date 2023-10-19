Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9767BCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:53:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.23649.1697709236325046119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 02:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KebFBQWi;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c9d3a21f7aso63280905ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697709235; x=1698314035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwf2R1PDlnnPorjPwK9DuUdV2JnG39L1KhppoPRaT38=;
        b=KebFBQWip8MmYhx4C/r12Ao5j6T5qbxDhdgxOWqeuJPYyvgFqC/H7eO1uU1d+CSguo
         91+6NUI0cg0rokt3IPsyz2ECQfj011Grf3rPTVZziQsucEyEw9RThq7dbFTcRFxNLRYb
         JM0EBav0RTO1fGTlDLEwfMZXjnMbwfiHDIRKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709235; x=1698314035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwf2R1PDlnnPorjPwK9DuUdV2JnG39L1KhppoPRaT38=;
        b=xIX5JjM4fXytNyF+FTHh1hvnVOe2UQvz+daUMclqewKCiygNn9WCW+ahwqH6tducpn
         A8tZP/UxrtQzh6nLYNYMhQuUajmNp2GkM/PaJis0koxcKe3vPzeQp82euVQqhb1k20zd
         uVNSJl3dZzhuWKvX6Oo6Dcm1xpXFXRDX+kqkeFh6B2pZ/NfrDSW7G+/K81Kx8kKlGDTj
         Hj4lickY+lfDi4LzYDk4zmRSTsQWXq+XVAzsxiIbGDw0BEz4vKQBVS7k6CTnNkwy51fo
         5yQXFQC4rIMvvU7/Wqz6O1HyJZhG7H9RVnHy5DMNmWgn1/XsLHMeTnRIeBoyzWtRewhJ
         vLyA==
X-Gm-Message-State: AOJu0YzqZzY+KF3Z+H5RGEMs/GOPIWs32CFfRhSsHY3wWZM3RCd/0wuR
	tfFJgkJM/i47leCD+iV8k/U3tjEKSwsalPHLfYg=
X-Google-Smtp-Source: AGHT+IE1RklsE/5ihqqkbh6O4iS65J8XVoQG7PYvngKopI8Iy/fnVrXsR9+KYarQ2YkDB6We6HuPig==
X-Received: by 2002:a17:903:24d:b0:1c9:d7f7:47a with SMTP id j13-20020a170903024d00b001c9d7f7047amr2343049plh.38.1697709235235;
        Thu, 19 Oct 2023 02:53:55 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.37.150.91])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902bd4b00b001c735421215sm1475286plx.216.2023.10.19.02.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:53:54 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gawk: backport Debian patch to fix CVE-2023-4156
Date: Thu, 19 Oct 2023 15:21:43 +0530
Message-Id: <20231019095143.1120508-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 09:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189442

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches?h=ubuntu/jammy-security
&
https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../gawk/gawk/CVE-2023-4156.patch             | 28 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.1.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
new file mode 100644
index 0000000000..bc157d6afb
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
@@ -0,0 +1,28 @@
+From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 3 Aug 2022 13:00:54 +0300
+Subject: [PATCH] Smal bug fix in builtin.c.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/gawk/tree/debian/patches/CVE-2023-4156.patch?h=ubuntu/jammy-security
+Upstream commit https://git.savannah.gnu.org/gitweb/?p=gawk.git;a=commitdiff;h=e709eb829448ce040087a3fc5481db6bfcaae212]
+CVE: CVE-2023-4156
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ChangeLog | 6 ++++++
+ builtin.c | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+--- gawk-5.1.0.orig/builtin.c
++++ gawk-5.1.0/builtin.c
+@@ -957,7 +957,10 @@ check_pos:
+ 					s1++;
+ 					n0--;
+ 				}
+-				if (val >= num_args) {
++				// val could be less than zero if someone provides a field width
++				// so large that it causes integer overflow. Mainly fuzzers do this,
++				// but let's try to be good anyway.
++				if (val < 0 || val >= num_args) {
+ 					toofew = true;
+ 					break;
+ 				}
diff --git a/meta/recipes-extended/gawk/gawk_5.1.1.bb b/meta/recipes-extended/gawk/gawk_5.1.1.bb
index fe339805d0..0b0d0897bc 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
            file://run-ptest \
+           file://CVE-2023-4156.patch \
            "
 
 SRC_URI[sha256sum] = "6168d8d1dc8f74bd17d9dc22fa9634c49070f232343b744901da15fb4f06bffd"
-- 
2.25.1


