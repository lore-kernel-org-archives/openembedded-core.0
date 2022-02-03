Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D32FC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:26 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.2880.1643917885189689521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YxD+83pq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 77so316140pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ao3tQsjw6N1FwyW0LTPg32N8vZR4WpZeax48N2Lz8e0=;
        b=YxD+83pqeOx4/5ndLDRhdK5jLp0rqkeozXL3Chxu63qDrC4F6FxZr7Tg1rXrp2xyGx
         8IRDWMD1L9UfAQarOhRr9NIiQY5VAex2QgCVeUzFImVVoejj4WInzUtGNP+XYKOVrUtk
         9Lx7bRB5VptSvCDSe/mlXGBAkdX5De3MpAXn8F0plrq76WPbmPXhoOwcHu7bLa51z5CS
         fDocNvl96URa98g9e4/2KXAPHtcYj44bgMEVSuYYjvEVYo63nFiw1y4LSfj5umfhAS8O
         VgrxO26hTp0nRAgilXJ+KHJmwOpmfkM5H6SvLSTmAM1hJOqvZv60Q+Oe/Ztv+k/inDHr
         E5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ao3tQsjw6N1FwyW0LTPg32N8vZR4WpZeax48N2Lz8e0=;
        b=xpe9icznMws1DXeejaYPg9YL5iCLKVJR5ztUKm/AiyN1L7PE+NfL5QRuGZyzNmUb50
         SMPo3EaydmkpMklzooW8fVjRxx+xKkHi0amPya9dLE0VBo0xrd6R7XSM8NMG16HYyJFU
         w2ePIpVlLOHRytiyUB4QOeW4ZYu6O/UUwLDMAEFPI1vSaB6ACxmnZlUSfui81GLrZO8y
         ldsBf2eXn19aOPRWiFQ3ihqt6Qv/lGIjzc2K2rhwcXxtibXhaBxuYbHmVX7UWmsWf4tL
         q88IeyYk9L13CNouuuydpDrvkqoAavOtpVWDq70rhnu2shkqwBuPWh4MVH5Fri7JdU4p
         iVTQ==
X-Gm-Message-State: AOAM533GPOr5ntrd1vk0n1Sg4a6vgce2KV/tXhwChNJFa/VpbTC4IkLA
	N2yrGX0gr9xqP37Yjd81FRJjcTujjjIvm6Xi
X-Google-Smtp-Source: 
 ABdhPJxhvud7poikW/wt04mN3MTmzepWF9es59X+GdTYl9qF4bp5S6yAn7gQLWYDBALggxmeBCghJA==
X-Received: by 2002:a63:5f52:: with SMTP id
 t79mr29077065pgb.177.1643917884066;
        Thu, 03 Feb 2022 11:51:24 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/20] sstate: A third fix for for touching files
 inside pseudo
Date: Thu,  3 Feb 2022 09:50:34 -1000
Message-Id: 
 <912d8a8f7424305cdc30ab568847c023b1b6e390.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161305

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This continues where commit 676757f "sstate: fix touching files inside
pseudo" and commit 29fc8599 "sstate: another fix for touching files
inside pseudo" left off.

The previous changes switched from trying to check if the sstate file is
writable before touching it, to always touching the sstate file and
ignoring any errors. However, if the sstate file is actually a symbolic
link that links to nothing, this would actually result in an empty
sstate file being created. And this in turn leads to that future
setscene tasks will fail when they try to unpack the empty file.

Change the code so that if an sstate file linking to nothing already
exists, it is overwritten with the new sstate file. Also change it so
that the temporary file that is used is always removed, even if ln
fails to link the sstate file to it.

Change-Id: I3800f98d0f2a0dd076352df85fad7c81460e733d
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c2720cde92..00a0e8fbd7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -841,14 +841,18 @@ sstate_create_package () {
 	fi
 	chmod 0664 $TFILE
 	# Skip if it was already created by some other process
-	if [ ! -e ${SSTATE_PKG} ]; then
+	if [ -h ${SSTATE_PKG} ] && [ ! -e ${SSTATE_PKG} ]; then
+		# There is a symbolic link, but it links to nothing.
+		# Forcefully replace it with the new file.
+		ln -f $TFILE ${SSTATE_PKG} || true
+	elif [ ! -e ${SSTATE_PKG} ]; then
 		# Move into place using ln to attempt an atomic op.
 		# Abort if it already exists
-		ln $TFILE ${SSTATE_PKG} && rm $TFILE
+		ln $TFILE ${SSTATE_PKG} || true
 	else
-		rm $TFILE
+		touch ${SSTATE_PKG} 2>/dev/null || true
 	fi
-	touch ${SSTATE_PKG} 2>/dev/null || true
+	rm $TFILE
 }
 
 python sstate_sign_package () {
@@ -878,7 +882,7 @@ python sstate_report_unihash() {
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
 	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
 	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
-- 
2.25.1


