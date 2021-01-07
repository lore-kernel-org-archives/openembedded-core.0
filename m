Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.1443.1610056909977615855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 14:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iXdyNS3X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id i9so7099036wrc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 14:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZwRVX+zJTrIXKA6yPM23Z6gK1PbUpfyZuo/1tgZAO/Q=;
        b=iXdyNS3X290em+qbhoWcmiGky0omPEUSmu5PEayRRaiB5XvVJmHdMeNENrqxfVeeP3
         ++2Y6kTvFs24Qrm2QdturYj6HwWZu8XFONCPGW4dp2HLYjavQ2zvCjHTgCtT3OmySby5
         7M1/MyBF11XH6ljqR9Hh/QcMxphNBD0d9Lz4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZwRVX+zJTrIXKA6yPM23Z6gK1PbUpfyZuo/1tgZAO/Q=;
        b=B+2YptQaskoVqVARtSkP0/QozI8johr4+48Xr9cZI/YC0Y3yE8QJQHPLRN+WVSxe7L
         Wh7AI9YGBGp3XVgQgWfAsN3ptRpqIji1KLzVRsyG2esmF91pTi8qHLg2soDlJztTjUDA
         ern4hWsKOagTmdUVolrAiMWRf4x0AtYxsbo+AtpmRYX+O7pniRg1mnUNnH6GRpo13Jet
         yARpHl35a4xBwBOoOJngaHrscVvOBSNGoWfFJoAUv94sOSRzJF8fF5lyLk4OL/dDZ17W
         iTG1q05bcq0GaCUC/KGaddobI4OE5j/2/zya8zIEe1sP0UrUeYGc9ytqY7TUFjw17jtR
         GvbA==
X-Gm-Message-State: AOAM5337DTEYIG/PTo6I3rY+Su/BnJbhxFl5ZN94YD3BbId7hysmoZ6l
	O7+zX1Uy2D1upHAokhDXnz9vk56K9QmD9w==
X-Google-Smtp-Source: ABdhPJzLbPH4+qQpfeqNehT0rJenGfjgTxgWYew5dpAZLPJn2CqRe3e7B5Go1aQlmKqji12XeIV4cw==
X-Received: by 2002:a05:6000:1d1:: with SMTP id t17mr656969wrx.164.1610056908436;
        Thu, 07 Jan 2021 14:01:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id j59sm10962686wrj.13.2021.01.07.14.01.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 14:01:48 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] ppp: Fix reproducibility issue
Date: Thu,  7 Jan 2021 22:01:46 +0000
Message-Id: <20210107220146.594812-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210107220146.594812-1-richard.purdie@linuxfoundation.org>
References: <20210107220146.594812-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Depending on which patches the make program has, the internal or external
utmp could would be used. Add add a patch which avoids the issue and makes
the build determnistic. We saw the regression on ubuntu1604.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ppp/ppp/bashfix.patch                     | 38 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/bashfix.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/bashfix.patch b/meta/recipes-connectivity/ppp/ppp/bashfix.patch
new file mode 100644
index 00000000000..d557fe1902f
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/bashfix.patch
@@ -0,0 +1,38 @@
+We were seeing reproducibility issues where one host would use the internal 
+logwtmp wrapper, another would use the one in libutil. The issue was that in
+some cases the "\#include" was making it to CC, in others, "#include". The
+issue seems to be related to shell escaping.
+
+The root cause looks to be:
+http://git.savannah.gnu.org/cgit/make.git/commit/?id=c6966b323811c37acedff05b576b907b06aea5f4
+
+Instead of relying on shell quoting, use make to indirect the variable
+and avoid the problem.
+
+Upstream-Status: Submitted [https://github.com/paulusmack/ppp/issues/233]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: ppp-2.4.9/pppd/Makefile.linux
+===================================================================
+--- ppp-2.4.9.orig/pppd/Makefile.linux
++++ ppp-2.4.9/pppd/Makefile.linux
+@@ -80,7 +80,8 @@ PLUGIN=y
+ #USE_SRP=y
+ 
+ # Use libutil; test if logwtmp is declared in <utmp.h> to detect
+-ifeq ($(shell echo '\#include <utmp.h>' | $(CC) -E - 2>/dev/null | grep -q logwtmp && echo yes),yes)
++UTMPHEADER = "\#include <utmp.h>"
++ifeq ($(shell echo $(UTMPHEADER) | $(CC) -E - 2>/dev/null | grep -q logwtmp && echo yes),yes)
+ USE_LIBUTIL=y
+ endif
+ 
+@@ -143,7 +144,8 @@ CFLAGS   += -DHAS_SHADOW
+ #LIBS     += -lshadow $(LIBS)
+ endif
+ 
+-ifeq ($(shell echo '\#include <crypt.h>' | $(CC) -E - >/dev/null 2>&1 && echo yes),yes)
++CRYPTHEADER = "\#include <utmp.h>"
++ifeq ($(shell echo $(CRYPTHEADER) | $(CC) -E - >/dev/null 2>&1 && echo yes),yes)
+ CFLAGS  += -DHAVE_CRYPT_H=1
+ LIBS	+= -lcrypt
+ endif
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index f05f40dd06f..72e7ae5e9db 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
 
 SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
+           file://bashfix.patch \
            file://pon \
            file://poff \
            file://init \
-- 
2.27.0

