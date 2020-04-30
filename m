Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.484.1588286294605188755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ONHtUgli;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.194, mailfrom: steve@sakoman.com)
Received: by mail-il1-f194.google.com with SMTP id c16so2967758ilr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LjNsXSi7jv5/pA/pTGrnFmxISMtsdHhqWclotDAPc4U=;
        b=ONHtUgliokpSHeyimfFatl9KvNkmPPVx4hemf5mL6g6sih5p2drHl0iLSpBjtCA4ox
         /klhlrurURgu9kIifB5f8lTwatzw2RMVjudvaup/yFzQuO0UggCTxqvyWiljrPlnnzmX
         wxdhQHTj93+nUnOVZ2vLjzcuCXHXNSi260RIT9SYO6MepwBVTJ+odV4Drwu5CdGR73T0
         x0aB6uIEQwmh0RaNuSCd3SRjk+shulDifr4RJhRlVQ2f/TGDsyIrL1dfFAUm22pxrd/q
         1fzK1pbsvm1hT3FUJevzwHKjrh20ChnktMrRpV/30hgMp74CFhrjWoxqakbgHEu/yrah
         AClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LjNsXSi7jv5/pA/pTGrnFmxISMtsdHhqWclotDAPc4U=;
        b=iaQ+1DPhL2b11QEO217Ftzy0G1GNOx5kQ1Hn+7gB3sDAWzcCL1x15mUKTF32UjTtla
         PG3rRVN740covYB07tCDzb/XGJ6ECeezKkWRm7BWHn802e1CwELOnCioUGzm0Qzik20h
         EEaQx79Kn0BKJeLKZRSJ1hEw9oNKaMShy6Bp60z/Y2DJO5bOgGtF/5joDoBWY7Xouda0
         Rx/t44i0akKEA+Ty0sGWvVADOKL5ApccYWM0yNsokB9x4RkXXa055zYBJzUW8THlXr6J
         vczfpetDTDg8ZcPCUv4Jig0ahdEumahvDdQNjRv5ZPHgSOehZwYTFBsc79gpzNubC/hB
         d2XA==
X-Gm-Message-State: AGi0PuaA00p8s3uIG+p4tjeKUi38dhAjS0D2NXPcHKijVoUqfxDdJZ33
	IVPtsn9Poa2TeWdvT098mDvV3I7xS661Pw==
X-Google-Smtp-Source: APiQypI9s+39ZfKu0Q/0EsmFvVizbC0oteU3O7bX/ZpMZVaQRyYzVk3u/yjmmpN3fV8G3OrxCDYQWQ==
X-Received: by 2002:a63:5907:: with SMTP id n7mr1149415pgb.439.1588285869688;
        Thu, 30 Apr 2020 15:31:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 08/14] tzdata: remove exit 0 from pkg_postinst
Date: Thu, 30 Apr 2020 12:30:13 -1000
Message-Id: <ebf675abd0a077bc9aa71acf62b0477a84e1f536.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-B?langer <maxime.roussinbelanger@gmail.com>

Documentation says that if you exit 0 in a pkg_postinst it will marked as
installed.
If you exit 0, before running postinst-intercepts defer_to_first_boot, the
pkg_postinst_ontarget script will not be present on target.

The "exit 0" in tzdata makes it difficult to have a bbappend with a
pkg_postinst_target step when you have `INSTALL_TIMEZONE_FILE = 0`

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 1e2d9bd1b9..1e2b440fb0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -60,12 +60,8 @@ pkg_postinst_${PN} () {
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
 	fi
-	
-	if [ -z "${tz}" ] ; then
-		exit 0
-	fi
-	
-	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+
+	if [ ! -z "${tz}" -a ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
-- 
2.17.1

