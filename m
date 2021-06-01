Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.58343.1622557156420984799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iFo/XAa8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id e7so4874584plj.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0em9BWn7SDyph3eJuwpqXLzXSsvvc/n4+FBH5vd5/4w=;
        b=iFo/XAa8nuJk1AmtN/jFBhdVYOt56CdG0t1A+Un8iSYQrts6doUNgTRMfA3lFgu8sD
         XlGXVndc+2avxzC2EykVmrnqbyXBlfCBdYFJ+i/KPrUSOQX91FqMAoKfTK1sZhzpGe7E
         e3ZtPjWNV//hppNLSodqKzBWXDZ0nOzErTCGf2WHyroQirmVah0F1zTo1PO1APz5LIGD
         KZzTO2YlwthhS6RhNJxTA8Qo+NzhQVbokMk6+X5xwicht6ZhaW4GqCUg7CScZZ9CqiXc
         urqm3YWdwH+1UKGWEQ0SkPRvydXcd8jUvMnNzQkwMPOnAOsd7hmBovKs/5PdmPLWbBXJ
         ZQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0em9BWn7SDyph3eJuwpqXLzXSsvvc/n4+FBH5vd5/4w=;
        b=h4PfZ6OC3io+rxeD8h52x8ZNcTIZRG63pcCpRnMGDVZ0hxpwIFrVRnfYRaIO5hUVPx
         tNun5AXwBgj/ZhekNSJAQymoLdBcboxR4rMM04fB0nl9rdw/Zv6ADuS6vtnFbXxyzRt8
         hOEdY3r6JhD3AJoi76Y5nOSFxW4DrrcWydt1nGH8pNWPmBZscKJn32yE3WSPodtHC1Q9
         emlvq/1JqJ0AeV0xmVCUVk4n9Y+mxfJUrGFjo3zLfiC54gzHbd8OU3aBPAWXjcl7Z1uO
         g1CoIaDcf5VP5PycCzvWzAiD9DwiQa6Te3lHTEuFh1kpq8l5fO7hzLGIEsenH7fCLUFA
         GqjQ==
X-Gm-Message-State: AOAM530+u2JgQv+CXZbwuv5XcR9BK0CUr0AroKhHiywih6xfhyKkNBf7
	E+BkwnYgwCMscmDOXuq+goQgqOxpVrvxSJh0U/c=
X-Google-Smtp-Source: ABdhPJz6XnTxfPLtOF437VOjKZ8+skjdu5DwcP+HsFtbmS20PZ3ldP25i+4peV9d5HZcgNNUXUHIOg==
X-Received: by 2002:a17:90a:fb51:: with SMTP id iq17mr11834662pjb.96.1622557155579;
        Tue, 01 Jun 2021 07:19:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/26] unfs3: correct configure option
Date: Tue,  1 Jun 2021 04:18:09 -1000
Message-Id: <09b9027a9da8b5cf34e1f1c016d9d6bbbe904dcf.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

On some new distro like ubuntu21.04, unfs3-native compile failed with
error: undefined reference to `xdr_uint32', since new distro has new
glibc.

>>From glibc 2.27 rpc support is dropped, so unfs3 need to link to
libtirpc.

Here is defination of ac_link:
ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'

Depended library should be added into LIBS, not LDFLAGS, otherwise,
gcc may not load the lib since it is before conftest.$ac_ext during
configure. Finally, it results in compile failed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27867862c1fee6c0e649286500fa1ab015d57faf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 5a3c060ba9..b1882defa2 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -36,7 +36,7 @@ BBCLASSEXTEND = "native nativesdk"
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
 CFLAGS_append = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append = " -ltirpc"
+EXTRA_OECONF_append = " LIBS=-ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.25.1

