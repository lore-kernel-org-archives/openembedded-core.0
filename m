Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.8324.1626358123686899591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Mb6hc2xg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id k20so6398151pgg.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CTH353Qk8IeYjwBvcn1jCEsALvj2HN933Ru7m2Cdw7o=;
        b=Mb6hc2xgS58/+dkVuPSAlOESotFktAqBvEY51QHA4EKr2zDrkbjLnAHAq280f9jbaA
         FNZJDcmQaDfpGmrexyWVsu9LMbzbhVP/HIcdt1yLbzmdktH08Fy5A1yXsfD61xJFu7gb
         Zd3CjsUiDn5OBJqGgd7kfTABD9N/4sz6ENnJbOIaoF3sFu3+DiLBt1M71X12H2S5y2kL
         sTNsZDoBrfiaFQXHwvaJbnN+5UngPXY5iscJ3qwJ72C8xCBkzmmrRyzfEENSJZRXdeLF
         N6CdVjr2ojuLgB3Qvx0X+YpegZ3y65LnCVMEoKVUydtylUY4ql6haAdMQ68o9jpzTQlR
         EE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CTH353Qk8IeYjwBvcn1jCEsALvj2HN933Ru7m2Cdw7o=;
        b=hTaZHv5WuaQtZJBcH01m3+xCfvr6u3hbCvBfm14lBZeRU1YspeJqUis2eu+QAaGU2x
         vazJDknzUbEuuIlskZZMVGTLFtNy9OSmXScpyi0Wh0gh/ulcnnTcdJZDE+RakgTsxQUT
         CXKyjVcpwyMfHSe0EbnCrw/G3yyh3BWQCa1MPszAdaSBwhATWtxrfwm2yA8uWoqKYYis
         hCg4yden1zjlxzN1XVSkzu8QvSk7P3yi/kDa+dbsy99ljr43chwK2nd3MBp9cNunk/c9
         SEmYodKt5hg0oOBewaT5ZVvHixbwZuYPkaxp0nCL2uydkF33ucc45nSrmaMHaEz4fwId
         dsLg==
X-Gm-Message-State: AOAM532etehD2U5Wt5wUCFZRihmdDltdewA4It/Ptigi+npGywFkrXtk
	aqSpb7R6r1TK9XnEUI+SBPjIpDSQJCjV3z6D
X-Google-Smtp-Source: ABdhPJxgDNrW/pCXR7J+3JYOVkFVdsNq27h4oY+DM5qTKo4Hyn+e0dYkGo4MwZ23IN7Hy6BhjVvCmg==
X-Received: by 2002:a63:dc4e:: with SMTP id f14mr4724037pgj.378.1626358122797;
        Thu, 15 Jul 2021 07:08:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] pseudo: Add uninative configuration sanity check
Date: Thu, 15 Jul 2021 04:07:22 -1000
Message-Id: <262b70f94c34762f5879f637dc918e2d5928f2d0.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building pseudo-native to work with uninative, we need to ensure the
configuration will work on all supported target systems. This means
"new clone" semantics, xattr and statvfs support in particular. It is
extremely unlikely we'd run on a system without any of these but add
a check just to be sure when uninative is enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea5b208ee25752bea6037cd0f3b28da7d2c9905e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 65d6e5068d..e6512bc6e6 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -112,6 +112,19 @@ do_compile_prepend_class-nativesdk () {
 	fi
 }
 
+do_compile_append_class-native () {
+	if [ '${@bb.data.inherits_class('uninative', d)}' = 'True' ]; then
+		for i in PSEUDO_PORT_UNIX_SYNCFS PSEUDO_PORT_UIDS_GENERIC PSEUDO_PORT_LINUX_NEWCLONE PSEUDO_PORT_LINUX_XATTR PSEUDO_PORT_LINUX_STATVFS; do
+			grep $i.1 ${S}/pseudo_ports.h
+			if [ $? != 0 ]; then
+				echo "$i not enabled in pseudo which is incompatible with uninative"
+				exit 1
+			fi
+		done
+	fi
+}
+
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
 }
-- 
2.25.1

