Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D63C433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 06:08:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.2332.1639807716079253420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 22:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvgGuNDK;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so4842387pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 22:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LWjZdSqXbllLDlLVM2z+chotH271jK/hKE/NkZPwXk=;
        b=YvgGuNDKXzuLRXS+SxjNKhCNeXxFMKhcVcI4CS1ZTbCqtXJ7NDdHlcsqJY6hxkXrcb
         XsvGbOs4lkqCJzau6jiBor2Cb4BBQj3Bet5n0txmslEifRgt0X1vBJwWDzf2kGKsUByg
         g5EyeP3ueS1ObpDX85IMnpszOiiGaEy/8T4ldWvuIO/YZgpyvbhEhIIhmnTYufqivChD
         dla2edZIcFKqk/kV7sTAoBNPmt4xYZm4BFmgUudULPEIUoIQIQdhnXPgSL8pPEThLEWW
         vUzZWoIgW72oLW3fM/nE8bui2e0+i2G7BbEos6ouCo3qUxxJHSXVh9Kk9lX65NxqIECu
         T8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2LWjZdSqXbllLDlLVM2z+chotH271jK/hKE/NkZPwXk=;
        b=jtKqbJrl1oNM9zeyeQboh8gmLgFZT98u0pYNI/U+xa5oD44Io0QXgCWAhCBE322VTr
         +6SpcmqTdL5rhCx/OcoYMOt/6QQ2XuH/11/qqgiS7f8+Af/xBAS7oA9d6FdX94xObija
         fzCkTsEZy/XiQbO9bvwS4NqZAvkhp4BrSwYbaAvZt6WVAIcfEOJfMwvpbp0WngEFjFvf
         3g3sIM6dhmpr1sG7EiQ2O6fSkAsw9syfcbg67CsvVsY9wnwgmOauwjr1xRkTkGMJChFD
         Hd7QCyhXVGljYlr2dN+ea9NUspiXmoFLbaOtrv+h8cBM3GJim1tTlSYo01Rt0e+kCF6a
         +ToQ==
X-Gm-Message-State: AOAM531kH/uk5IuQO+v49DrsfUNFX1bGCUrBpCqGW68fBVTYFt7lBcnl
	ciiUjpWlaszFxE3DbQOFyjOQ7RqGeu3Ub0+K
X-Google-Smtp-Source: 
 ABdhPJx2Cv5+WB7Ll5o+a+KyiRnGfLcUPhWrH84ROgsoqdqayBOpnTWbWDxhBz2i3stc5JHHl0S8xg==
X-Received: by 2002:a17:90b:1a92:: with SMTP id
 ng18mr15929141pjb.19.1639807715181;
        Fri, 17 Dec 2021 22:08:35 -0800 (PST)
Received: from ubuntu.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 12sm1186855pfm.84.2021.12.17.22.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 22:08:34 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] inetutils: fix CVE-2021-40491
Date: Fri, 17 Dec 2021 22:08:23 -0800
Message-Id: <20211218060823.72505-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Dec 2021 06:08:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159841

The ftp client in GNU Inetutils before 2.2 does not validate addresses
returned by PASV/LSPV responses to make sure they match the server
address. This is similar to CVE-2020-8284 for curl.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-40491

Patch from:
https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../inetutils/inetutils/CVE-2021-40491.patch  | 67 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
new file mode 100644
index 0000000000..54252d6bc7
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
@@ -0,0 +1,67 @@
+From 4e355804d57d5686defc363c70f81e6f58cd08f0 Mon Sep 17 00:00:00 2001
+From: Simon Josefsson <simon@josefsson.org>
+Date: Fri, 17 Dec 2021 21:52:18 -0800
+Subject: [PATCH] ftp: check that PASV/LSPV addresses match.
+
+* NEWS: Mention change.
+* ftp/ftp.c (initconn): Validate returned addresses.
+
+CVE: CVE-2021-40491
+
+Upstream-Status: Backport
+[https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd]
+
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ ftp/ftp.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index 9813586..7c72cb2 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -1344,6 +1344,13 @@ initconn (void)
+ 		  uint32_t *pu32 = (uint32_t *) &data_addr_sa4->sin_addr.s_addr;
+ 		  pu32[0] = htonl ( (h[0] << 24) | (h[1] << 16) | (h[2] << 8) | h[3]);
+ 		}
++		if (data_addr_sa4->sin_addr.s_addr
++		    != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv4 */
+ 	  else /* IPv6 */
+ 	    {
+@@ -1374,6 +1381,13 @@ initconn (void)
+ 		  pu32[2] = htonl ( (h[8] << 24) | (h[9] << 16) | (h[10] << 8) | h[11]);
+ 		  pu32[3] = htonl ( (h[12] << 24) | (h[13] << 16) | (h[14] << 8) | h[15]);
+ 		}
++		if (data_addr_sa6->sin6_addr.s6_addr
++		    != ((struct sockaddr_in6 *) &hisctladdr)->sin6_addr.s6_addr)
++		  {
++		    printf ("Passive mode address mismatch.\n");
++		    (void) command ("ABOR");	/* Cancel any open connection.  */
++		    goto bad;
++		  }
+ 	    } /* LPSV IPv6 */
+ 	}
+       else /* !EPSV && !LPSV */
+@@ -1394,6 +1408,13 @@ initconn (void)
+ 			 | ((a2 & 0xff) << 8) | (a3 & 0xff) );
+ 	      data_addr_sa4->sin_port =
+ 		  htons (((p0 & 0xff) << 8) | (p1 & 0xff));
++	      if (data_addr_sa4->sin_addr.s_addr
++		  != ((struct sockaddr_in *) &hisctladdr)->sin_addr.s_addr)
++		{
++		  printf ("Passive mode address mismatch.\n");
++		  (void) command ("ABOR");	/* Cancel any open connection.  */
++		  goto bad;
++		}
+ 	    } /* PASV */
+ 	  else
+ 	    {
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index cc9410b94e..f4450e19f4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
            file://0001-rcp-fix-to-work-with-large-files.patch \
            file://fix-buffer-fortify-tfpt.patch \
+           file://CVE-2021-40491.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
2.25.1


