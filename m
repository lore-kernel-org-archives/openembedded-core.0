Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909D4C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:12:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.19604.1640182374212147141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1HBmJlPT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso2739309pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=buI8aN3UOhu4uvY0otY8dSNCB5OcIWkniAgDKj9WHmQ=;
        b=1HBmJlPTiNIfsBUX9IBsi9TPSBlu+Z6AnfIhmWKK9hNcDDb8QMsrtcbsij1MlJHU+G
         TqwUf2FuHxB4Zm7f6mdee6GIKuiKIpu8HmheXLeyNWiCu8B6InTczh4E4YiyGaNIv2uH
         byuqH7U0kZ9xPQuUzdPz5TQroIpUvKTL/QttGjvs1AbIvzT6vuyIVTNq/TMndlORcOb8
         XfETO9+eI3RB9YVLHLl/QJ9X1Fmoxo4njg32AWns0NGfAaD744Wo+YPx9yBkhIw7OZM9
         D5zGtPb7J5CsnX8tZXFKrygLME8zQS8qo+fMBwMFcGz4h6/1/TmiY5u07KkqoLcPi4QW
         8aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buI8aN3UOhu4uvY0otY8dSNCB5OcIWkniAgDKj9WHmQ=;
        b=3BiRIi5sRGxw388fhKgjIObSvMS90me1yN5PxZX+OSTQsDaQKkzhzOWWudaiOdTnn8
         /eUYDSBqdzRX6RPa9CRkdIDvcn3bWDOmelv7Gy06AJzVD1fgFV3vEDeCaKK5MCqImZKb
         AOEMP+NF7gH0fMK32gGhnpEXHzHBC4OOP+Q4DcWdWIoyMr9UaOP3IqpVEMRBrjsqFYZH
         UH1svT8TnN6uD5bIRTFocC+dsiY1rOtvC+ORwcDhrRwKtO8OPcZGTfLSl/DR8OqNPhew
         0RKYQIXTF/q6y6qv/ccWNqKYCz5LMbd6eKGOT2KEUejehLO0Eze6ABiw61IoG46DW/NX
         esGA==
X-Gm-Message-State: AOAM5310amGNE1h8bnh++aegpbRnJ7DEngzb6tcu9dAX2QFNLRLA26vT
	6wJ8vGmetyFMlC6NlYasnWOol5ZHRw0FM2XD
X-Google-Smtp-Source: 
 ABdhPJzkQU4vz3KUtEnYTYSTBF2ePY5QSF6rliurPO9Ahfxo2Ky47Vzo9N4znw52aQvHoUqIOcR3Og==
X-Received: by 2002:a17:903:2486:b0:149:1ce1:d45d with SMTP id
 p6-20020a170903248600b001491ce1d45dmr2967531plw.57.1640182373190;
        Wed, 22 Dec 2021 06:12:53 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] inetutils: fix CVE-2021-40491
Date: Wed, 22 Dec 2021 04:12:18 -1000
Message-Id: 
 <22de3b937dda28a6aa4113549f32f36d67b6751d.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:12:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159950

From: Minjae Kim <flowergom@gmail.com>

The ftp client in GNU Inetutils before 2.2 does not validate addresses
returned by PASV/LSPV responses to make sure they match the server
address. This is similar to CVE-2020-8284 for curl.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-40491

Patch from:
https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=58cb043b190fd04effdaea7c9403416b436e50dd

Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


