Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E87C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:19:59 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.8717.1636132798510756956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYRSM9BJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id br39so9353667qkb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csFJUSTYFKdNlA2KTj0y6/7Qmb5oj8QiBXTe+cbeSxc=;
        b=fYRSM9BJcvnMB7VQufsCet3QGHXKR/f2SyRz2elud05oV0fI+j3pb13I5S6Ne5QyO6
         RlOYokQeG2fmglVDjZ8wiA8ilMoYINYjo3R45fYPA7ObPZmguas/LF/Gqm5jp8z4i1bK
         vqYbpTL1SASiPbrgaEL5H2o1XzAwVd7iLBqzsCBYcatv1Geqa/d4bCEjVt4Avg6dvAvh
         ndcMKwKd5Fb05/KJXOuJzG1q1WmaQCh5IvCRx/lcbcyzu915ShuOHGxXdNB5gPmAM7Dn
         UHocr4ignpN7+sBg29z/LWHwNLLj6QO0Oiytekb1nxP//1lAnekOIT5q1ylDRhFg+iPT
         VoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csFJUSTYFKdNlA2KTj0y6/7Qmb5oj8QiBXTe+cbeSxc=;
        b=5x+AUp4VLMLK/RSM2fE2vlS2nLsQ0j7l22lDbBZ0gNteKIYRgnyaNsdHO1Ajvee6zb
         EKRvkzKRne9ZWrTNJzx/tHpsM8eqwT0I4yIOxfVSDxUGnqHS3HmNdFTNPIDQQIb3s6b4
         iYOdp7Oz3psFx9j8q6kv/USkXd4Tu9Z4NT/AXeGCX3PYurpkJun+ojFM3dKV2dgw5aoA
         pBPRN2Oi7iiNI9E8bW7xYlVP4vw9E2YXistoe8KcIvVwRomJ8C/pIBnnfz+Zwxs18b5q
         aRJItNSG7kD46WcMQmnoIbzGAscy3Q9hjDDzLCWPPAGpdMlDcMf090sz3rZpXcrHCDH0
         0TKw==
X-Gm-Message-State: AOAM5313eNil8A95W2QEIPZMODcZum4hyfCrd3/91KQTsjb0qo8RamUi
	E4VtasbhZwGXSO/9wUfcN0OzYWNLh0ddDg==
X-Google-Smtp-Source: 
 ABdhPJwW0GRDhXxSpjiKkuYe0tDutTIAWQEPXSRdbb+4OnI4KgSyw9MCraPnkYTswwG3/1fopQuRVg==
X-Received: by 2002:a37:6c45:: with SMTP id
 h66mr47729243qkc.468.1636132797522;
        Fri, 05 Nov 2021 10:19:57 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 l9sm5839126qkp.128.2021.11.05.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 10:19:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] ppp: fix build against 5.15 headers
Date: Fri,  5 Nov 2021 13:19:54 -0400
Message-Id: <20211105171954.8848-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:19:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157915

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.15 kernel has removed ipx support, along with the userspace
visible header.

The build error was found for muslc, since it doesn't have a
fallback header, we disable it for both glibc/muslc.

This support wasn't used previously (as it hasn't been very well
maintained in the kernel for several years), so we can simply
disable it in our build and wait for upstream to do a release that
drops the support.

Although the tarball we use for our build (versus git), doesn't
use the autoconf disable flag to turn off the support, it is included
in this patch in case someone is building via git source base.

Upstream-Status: Inappropriate [OE-specific configuration/headers]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...1-ppp-fix-build-against-5.15-headers.patch | 36 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
new file mode 100644
index 0000000000..c91246dbf5
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
@@ -0,0 +1,36 @@
+From aba3273273e826c6dc90f197ca9a3e800e826891 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Fri, 5 Nov 2021 12:41:35 -0400
+Subject: [PATCH] ppp: fix build against 5.15 headers
+
+The 5.15 kernel has removed ipx support, along with the userspace
+visible header.
+
+This support wasn't used previously (as it hasn't been very well
+maintained in the kernel for several years), so we can simply
+disable it in our build and wait for upstream to do a release that
+drops the support.
+
+Upstream-Status: Inappropriate [OE-specific configuration/headers]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ pppd/Makefile.linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
+index 22837c5..23b9b22 100644
+--- a/pppd/Makefile.linux
++++ b/pppd/Makefile.linux
+@@ -91,7 +91,7 @@ MAXOCTETS=y
+ 
+ INCLUDE_DIRS= -I../include
+ 
+-COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -pipe
++COMPILE_FLAGS= -DHAVE_PATHS_H -DHAVE_MMAP -pipe
+ 
+ CFLAGS= $(COPTS) $(COMPILE_FLAGS) $(INCLUDE_DIRS) '-DDESTDIR="@DESTDIR@"'
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 235595ff76..bd6435e69c 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-ppp-fix-build-against-5.15-headers.patch \
            "
 
 SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
@@ -39,6 +40,8 @@ EXTRA_OECONF = "--disable-strip"
 #
 EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
 
+EXTRA_OECONF:append:libc-musl = " --disable-ipxcp"
+
 do_configure () {
 	oe_runconf
 }
-- 
2.19.1


