Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266C8C3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:43:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.5375.1721479374710344864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jfsvB0Jl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b1207bc22so1380876b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479374; x=1722084174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8rCtJ2Rjwk2dh7otpMzlr6tHACpxLpAenRpzo5J/18=;
        b=jfsvB0Jl1QxUAO6b+3V5xYjDmCN8E4In7maPHDEzTgIki7q2pZDEEiQsNa68RNaSg5
         ogsPuuIV3VciHJSYmcjyTA3Qgvr3PLZBaOJUoJywN1e+2nHkjcbOUjBNx2iq7tgTFC9V
         ljK5AtIDxI1oUaiUqrHKUNWSdmhfkWw8XGYwWOkWl7tsclb3P+W//6LCXMm8hHhSE5TJ
         +YkYSiDPE6U8DJ91a3k0fjLj4bL0uT/dh3Mr9Cr33BILmhg38z9aKXb9U1IDh+2Da54N
         +xoH13+34S3EiF2647F21cN7Lq/Wgj6AN4MqlSBv2Yz3Nh0Eco4iphwJ+SF5Rfak1Yrc
         D2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479374; x=1722084174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8rCtJ2Rjwk2dh7otpMzlr6tHACpxLpAenRpzo5J/18=;
        b=njLkCYKEobSIQdO0T9yEM27nhavg2IwFF1GaWQz/8lYipGIpK+9aLYdX54LTK9avv6
         MbCW+wxw3M9AaJbseZ8cw5l+BhFZ1XHm8tn9JjSvrHyaQs5jK4zZ52BHMUuile5p5Wti
         nfbEt8f/AHAN9NQZkXR5O4m4ea72B1OPyWULoFPrsqcmVYzNpFfr+4FHd7BrLgyvWioG
         cOx3Y+rcmaJk3ngHKWBbwg0smKm0MEM/3cXl7GCqdWdawx9unm6l1lTtzvjfK4JzfXwn
         ZntvhoYTYvkqvhugrSsDD+Rtnwpr300AQLc6Ek0YBtU6hSdxS6D4b3+z393TGTUSEQbZ
         42Pg==
X-Gm-Message-State: AOJu0Yzd6toHYZ+Md5uYeVkrNbFyF4XoFr9XOklZCc1yC4f7HSMl8y30
	2k45cpysoR1CrSi/xALdfPOtqkOAZviNuARfYhHgEUAp66H/hhjrMUV1ykXumhZoQlFCZ7//mNP
	NwAw=
X-Google-Smtp-Source: AGHT+IHfO9za6hnJYVERT1cp72BtbNPlmRJV6R+PAq7SX3y/LxDEJycgUZ5/kpEIq6jBHxn+U7Zfzg==
X-Received: by 2002:a05:6a00:1250:b0:70b:29bf:bbde with SMTP id d2e1a72fcca58-70d084b4cf9mr3708565b3a.12.1721479373867;
        Sat, 20 Jul 2024 05:42:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] ruby: backport fix for CVE-2024-27282
Date: Sat, 20 Jul 2024 05:42:43 -0700
Message-Id: <94a0350058e51c4b05bf5d4e02d048c2e6256725.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202279

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2024-27282.patch            | 29 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 0000000000..5d64a51488
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,29 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
+ 
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index d4b977cdfe..7a927d2041 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
            file://CVE-2024-27280.patch \
+           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


