Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.130131.1597997244605215811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 01:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwX6zvAP;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id q1so498710pjd.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WqvR2m0a45t8v1LSJpt9MDtoFDe9ImOyqzWSY30/fyg=;
        b=fwX6zvAP2lhgDcGb5evhaiPpV3noCtv2N8gGQNHTSV0mvp6Q5djKx2T4gk1KtlRl5g
         5cv+2Wp/LIuFcykm+ku1H2fcafUeS4u4ltEQo7+eDhH+fUQ/+EikwZQQFlmiYPsRkhHV
         A0UnIiwA5Rr/cylpfVZ2Z837LZHvdNJFr1f4iuMO/eCdMZHdZ4Um2e8Xaz4FnfwxElIO
         gNRR25Wt2Cv/r1IuykmLMoHAMt01eLirzp/zi2sK3QVreHFhZEYmvphfhg8dO+owANhw
         MfmTOS4YA/CH/ImBuKbfKJk3uhlvMoNx6bFG3h8U6dSut+TEIJMypVg6NcawRPuv1x23
         S9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WqvR2m0a45t8v1LSJpt9MDtoFDe9ImOyqzWSY30/fyg=;
        b=NhBJqMUxiEJzrwRwco/evAfTtxsCKYCWzLDg27cEZkAVFRJwuD6B+9Xn7PWdNpTdfL
         O4aSieCLUc9vfAQ35JA4USNCyiTlslvlPpYgF2Np0TuNe6RfmAcs0S+Eoqs3HRGtCNpC
         sxT6j6lVLjg3YzLWCYls8AkznR9ULHJudTGzBIPCEc0zRfGEAXAtPruJI7Vj0FxOMi6D
         6EbLNsm6SMPVvqpMhM+WboPeVv4LUncHw8UPV+v2i+miqt9IgyNrpmmPQ9pbVBHaxwmz
         2UWNp49+jAj4U5jpcuLD4/Tkgi8O5gcyz5EPO/NIFgT9N8L8qbuiZ5LelY8zgGjhqw+y
         4rDQ==
X-Gm-Message-State: AOAM53047yERJK8BRdfQ1bj1qXtsqCFJzlGQ7IP23UYhktrVRT9c9SK2
	+NFhQkMnhES7AsDUpudYgXQXCkF7DAltJw==
X-Google-Smtp-Source: ABdhPJytSITRYGugplbCdl2PoF4tDqvuSI3gN9xse95i6v+KGUGJy6bM/pssiaqktDRBwcNccMkY5Q==
X-Received: by 2002:a17:90b:3605:: with SMTP id ml5mr1401364pjb.203.1597997243627;
        Fri, 21 Aug 2020 01:07:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e8c])
        by smtp.gmail.com with ESMTPSA id z6sm1592223pfg.68.2020.08.21.01.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 01:07:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] multilib: Add musl multilib support
Date: Fri, 21 Aug 2020 01:07:19 -0700
Message-Id: <20200821080719.1708562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since musl ldso can now co-exist in multilib therefore add support to
build multilibbed headers and adjust the wrapper header to support musl,
it needs __WORDSIZE which is defined in bits/reg.h for musl

[YOCTO #13122]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use OE's libc switch to include relevant header instead of __GLIBC__ define

 meta/classes/multilib_header.bbclass | 16 +++++++++-------
 scripts/multilib_header_wrapper.h    |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index e03f5b13b2..0304f6d3af 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,13 +6,14 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
-
-	case ${HOST_OS} in
-	*-musl*)
-		return
-		;;
-	*)
-	esac
+       case ${HOST_OS} in
+       *-musl*)
+               wordsize="bits/reg.h"
+               ;;
+       *)
+               wordsize="bits/wordsize.h"
+               ;;
+       esac
         # For MIPS: "n32" is a special case, which needs to be
         # distinct from both 64-bit and 32-bit.
         case ${TARGET_ARCH} in
@@ -37,6 +38,7 @@ oe_multilib_header() {
 	   mv ${D}/${includedir}/$each_header ${D}/${includedir}/${stem}-${ident}.h
 
 	   sed -e "s#ENTER_HEADER_FILENAME_HERE#${stem}#g" ${COREBASE}/scripts/multilib_header_wrapper.h > ${D}/${includedir}/$each_header
+	   sed -i -e "s#WORDSIZE_HEADER#${wordsize}#g" ${D}/${includedir}/$each_header
 	done
 }
 
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 88f3193812..ae441b4445 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,7 +5,7 @@
  * 
  */
 
-#include <bits/wordsize.h>
+#include <WORDSIZE_HEADER>
 
 #if __WORDSIZE == 32
 
-- 
2.28.0

