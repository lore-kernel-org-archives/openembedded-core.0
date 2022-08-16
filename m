Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833BDC32772
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 20:58:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.21000.1660683474354520899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iWJVjicA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso13514wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=rO49MPg+KGDXgc+oPFzuPt7aHnPYPXuQZ3mBbfNDZjU=;
        b=iWJVjicAm4FCceY1v1kZyuPFl7wvhI46PBUfq9ctXtzAkgXYl/Sx9uOHiWmKlHAUyD
         eGmo3nJgq6cdRU7yL7mdfGfFOHeG656OtdyLXSF4QmLTJKpqOMGT0QS36RrJy8he7DQb
         d82FzghtZuHywQ1E8E7Wpd8tfe2gxkUm+3EjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=rO49MPg+KGDXgc+oPFzuPt7aHnPYPXuQZ3mBbfNDZjU=;
        b=JcnyXyW0vtXJB6RqNkqmXN3Izt1IQZEMdIU4dhHfZmM72urFEA22K+DbjE6mxu6qxa
         tujibc/AvAxqi8ybhz/UYMKXIEZdb8U5duzskugTBQADCEYgfDt/P9imRCgbdumvCqHg
         DKzCMkVgJJYWtHqZX+Toj60kN/DXyH9HsS3/3Ft/JmjD+sjpntTQl3qUwRcFSR0FdHpP
         auo5KZZpWGejq+PgOO6sjpALM4t3ItjtplMCf1rVosrCOBjohcpq+QmI8z8I3XuVZzGT
         AhYVSCt7aIFp3Wqz+S0iMsIGbVQtJE5WKFbZYtlZ/GAKBVQCUpl30DUBvsUjSQ7Z4fra
         qLZg==
X-Gm-Message-State: ACgBeo0nBqgwc4QkTnUozWOUKHWwwrHhAyMjT+fS26r0KHo58G7+P6uy
	bM2af5YR7VgOr4sXzl5eDlxNiTzJmVV6HA==
X-Google-Smtp-Source: 
 AA6agR6k9oKMpcEemwH9s0oi7eY+ltMSXLoaSPjgwWUSmAi7raHIGl7EowrBJRSIBqPxyQPfPGw9xg==
X-Received: by 2002:a05:600c:4e8a:b0:3a6:d89:aa24 with SMTP id
 f10-20020a05600c4e8a00b003a60d89aa24mr176235wmq.149.1660683472608;
        Tue, 16 Aug 2022 13:57:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3694:2ef4:2932:37d5])
        by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b002250f9abdefsm5349460wrr.117.2022.08.16.13.57.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:57:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] gcc: Add a patch to avoid hardcoded paths in libgcc on
 powerpc
Date: Tue, 16 Aug 2022 21:57:45 +0100
Message-Id: <20220816205746.1672987-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 20:58:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169461

Tweak the powerpc code to just include filenames rather than full paths
to avoid build reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 .../gcc/gcc/hardcoded-paths.patch             | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index c42fa3d72f0..488e0c95b18 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0026-rust-recursion-limit.patch \
            file://0001-libsanitizer-cherry-pick-9cf13067cb5088626ba7-from-u.patch \
            file://prefix-map-realpath.patch \
+           file://hardcoded-paths.patch \
 "
 SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
new file mode 100644
index 00000000000..aa3d16f6000
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
@@ -0,0 +1,19 @@
+Avoid encoding build paths into sources used for floating point on powerpc.
+(MACHINE=qemuppc bitbake libgcc).
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: gcc-12.1.0/libgcc/config/rs6000/t-float128
+===================================================================
+--- gcc-12.1.0.orig/libgcc/config/rs6000/t-float128
++++ gcc-12.1.0/libgcc/config/rs6000/t-float128
+@@ -103,7 +103,7 @@ $(ibm128_dec_objs)	: INTERNAL_CFLAGS +=
+ $(fp128_softfp_src) : $(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@)) $(fp128_dep)
+ 	@src="$(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))"; \
+ 	echo "Create $@"; \
+-	(echo "/* file created from $$src */"; \
++	(echo "/* file created from `basename $$src` */"; \
+ 	 echo; \
+ 	 sed -f $(fp128_sed) < $$src) > $@
+ 
-- 
2.34.1


