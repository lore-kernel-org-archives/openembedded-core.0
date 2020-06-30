Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.7483.1593486263660418928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kOefBEWx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id w2so8448625pgg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cxAZl7KjTypRg9McyXBBFh3EvMFESKpnC2p0zAztkQI=;
        b=kOefBEWxjydVJ4zo2FmDEEyZiFBpyn9C6qG2OyGX1qKQ+jJ7+5+iedabbe1+NUjj1i
         XtceUboySZZT8oPyAeo6kN00JZbo8IIvmoj1hx3K48WKuXYXVGYM0efmxHJX010Cb23t
         mSS5WnpU4wWSOoJKvE5i0vTaw4SIdIY7aTaIovmr39RIKx4wpLFgf43Nl6UXUqhZ2Rro
         ddNvBz32P4GahMQ8yTerGUQRtn6A27hAaigjcbXLHwqiksRhtH0nYI5U8kcdtbQdOwNd
         beeEbFLWNA+7ITsMi8C5wlmeLMZOlej+6D3SsHSRJlcN4KdWM86d7hVVoJ0kENDpcm82
         kRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cxAZl7KjTypRg9McyXBBFh3EvMFESKpnC2p0zAztkQI=;
        b=TIytkcy1VAFcIiMSj77zNyLIgvXUJzEtrzNjd8WEBmrzW2hlIaLA+587SVpEpv0UtI
         +Zlg77ABWsMK5kJRnbEnNP+vtmRxnD4/2+peXDsuKyi48kLar+afotm+e9O2ZAYJxfkZ
         dFjIsVz8qyns16J1AsCroCWwygUewLKPcPtV+2hrNYidRLcGoTrZFfzVMTKs6nFd5MEH
         6I1p2CAA0tptiRXoaNMAwDTgDhGOLMF0MgSTekqmwXngLX0dHJSFEaEMoDIIOg5nXnKD
         TTWYEJomhwTgGMmOiH8DMZCKisyKW7z7AMLO3Z81hdSkPrl8QPvacu/BvgqKlFZ5poOM
         ApYQ==
X-Gm-Message-State: AOAM533SX6swJ+8bSXt/Rjz8ov2mMXnQ5ZKbMeBZVtpc7/B2vdC1A6Uc
	nEGxcnvQZDMCpQhOzq9AijvqKunwHNurSQ==
X-Google-Smtp-Source: ABdhPJzdG7VPxHyA39d77B566yIgBT0fWSU9DSOm5NzTYPKoO+JQ2pC0XXl4tFMCbu0oKBIGi5xcgQ==
X-Received: by 2002:a63:f804:: with SMTP id n4mr11660129pgh.302.1593486262765;
        Mon, 29 Jun 2020 20:04:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/22] mime.bbclass: fix post install scriptlet error
Date: Mon, 29 Jun 2020 17:03:05 -1000
Message-Id: <24f4f4551d220030c0f847c648a49a15bf1fe6eb.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

fix error during post uninstall:
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
+ '[' 0 = 0 ']'
+ set -e
+ '[' x '!=' x ']'
+ echo 'Updating MIME database... this may take a while.'
Updating MIME database... this may take a while.
+ update-mime-database /usr/share/mime
Directory '/usr/share/mime/packages' does not exist!
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1

when run post uninstall scriptlet, /usr/share/mime/packages has been
removed during unintall, while update-mime-database will check xml under
/usr/share/mime/packages.

workaround by create this dir before update, then remove it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6f262a316d6c32ff9ce96ab4bd95726772b5f20f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mime.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..bb99bc35cb 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -24,7 +24,18 @@ if [ "x$D" != "x" ]; then
 		mimedir=${MIMEDIR}
 else
 	echo "Updating MIME database... this may take a while."
-	update-mime-database $D${MIMEDIR}
+	# $D${MIMEDIR}/packages belong to package shared-mime-info-data,
+	# packages like libfm-mime depend on shared-mime-info-data.
+	# after shared-mime-info-data uninstalled, $D${MIMEDIR}/packages
+	# is removed, but update-mime-database need this dir to update
+	# database, workaround to create one and remove it later
+	if [ ! -d $D${MIMEDIR}/packages ]; then
+		mkdir -p $D${MIMEDIR}/packages
+		update-mime-database $D${MIMEDIR}
+		rmdir --ignore-fail-on-non-empty $D${MIMEDIR}/packages
+	else
+		update-mime-database $D${MIMEDIR}
+fi
 fi
 }
 
-- 
2.17.1

