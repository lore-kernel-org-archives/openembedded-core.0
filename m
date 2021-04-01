Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.1103.1617290939663552284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=doNTys7D;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id d12so2121011oiw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/cMLnshuHp+C2b8U89t7zHjvxL8pDh1q8wSmg+90csA=;
        b=doNTys7DEY1v8cIyyRBc4PLzsa6Q5RSuTXWaMY/KB44joo40Efrg+uECwLCJ9e8ksw
         sa8ylCAHCsbCiNS0Oz6ck2mW/U5E/3eNB2+5JPG4eHRRoiIR7v6JHAYZFOM5NPW5kiA/
         0oHGjrbPwKI4CYiiKlWEFgru1LjB/5KVPEU+hgk87h1IlwrrnZKJ508rnQVqHy/C8tk+
         Ws5ojBh2cvyNKVHggWAhRpW10FJqrgGSrbhaOzVsLrIPWIeN3EG5uS9o4lW2WCOoBFvo
         XUlQozTzpKdqJlsl9ZZbGEJxmXfvZpDguhZb9XuPqc7KUGuq6LcWkkUFBmwWHYuT+WoM
         U61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/cMLnshuHp+C2b8U89t7zHjvxL8pDh1q8wSmg+90csA=;
        b=Pwh68dpqPpSwLZ2i2VydhG13vkohoKsieJ7Nf4E+kKJpbL5Gq/6uscEKZXWxIvuj2b
         enPAxjN0j6C1XzOVDkCRA2BJhj5hMs+O1QLEY/BRqK53M56vv+Iovr6jit/HGRACZGwO
         tUxvlyHrAdipu8Hq/219ywQCIdownEOJeQ305qnOHcGXPXaCVaQCZGuyQwo9MqYY0/2/
         uKOW/Sq+iMEjArDcrdqb5Gfs9wxZaf0NCAZw9IskPxgYoejY2cg6T3yryllIMQxYgFGK
         1x48ZUqRkiBk23vyOqpaoRG9OqZtnZ8afsiOyX+pbY9mCyXSgUS6KxeW7OMPoTIQdhb4
         cBEA==
X-Gm-Message-State: AOAM530wf0J0ilxPEX6Lb00Df4j6bT5iSAWF42oEMWjYuI1N1dgmTpCN
	lC93QdvdhvpwG4r59/RsxTiN1iKUzW/4a2coH2U=
X-Google-Smtp-Source: ABdhPJzJqrEYckIQM0uFvlkHaiNTQ49L4AOjqJnCureYfEgHi7Hbsw9EA3miHuW9wd1DOaobD1F++g==
X-Received: by 2002:aca:530e:: with SMTP id h14mr6452423oib.79.1617290938586;
        Thu, 01 Apr 2021 08:28:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/15] run-postinsts: do not remove postinsts directory.
Date: Thu,  1 Apr 2021 05:27:37 -1000
Message-Id: <d913d2fbd431ccc10a6197c4dc8858dfd9a91426.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Anton D. Kachalov" <gmouse@google.com>

When running on the systems having read-only rootfs backed by overlayfs,
removing the whole directory lead to create a special char device file
on the upperdir to reflect directory's removal. Once it is required to
upgrade the whole read-only image that might contain new postinsts scripts,
it will be impossible to run such scripts with a "deletion mark" file
on the overlayfs -- the whole directory will be marked as deleted regardless
new files in it.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a27b62b225ffeecec47c249a0b86cc54d775add)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../run-postinsts/run-postinsts/run-postinsts          | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index f84a7e18c8..95dccb9cae 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -72,12 +72,12 @@ exec_postinst_scriptlets() {
 		else
 			echo "ERROR: postinst $i failed."
 			[ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
-			remove_pi_dir=0
+			remove_rcsd_link=0
 		fi
 	done
 }
 
-remove_pi_dir=1
+remove_rcsd_link=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
@@ -92,9 +92,7 @@ else
 	exec_postinst_scriptlets
 fi
 
-# since all postinstalls executed successfully, remove the postinstalls directory
-# and the rcS.d link
-if [ $remove_pi_dir = 1 ]; then
-	rm -rf $pi_dir
+# since all postinstalls executed successfully, remove the rcS.d link
+if [ $remove_rcsd_link = 1 ]; then
 	remove_rcsd_link
 fi
-- 
2.25.1

