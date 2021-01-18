Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3373.1611009469687299295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P9pi+I28;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id u11so5108957plg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TyF/bfv6fgtoB5EUDh9Y9yQZD6jfSklcqyAbFCKQYGM=;
        b=P9pi+I28PQHa5RmyGi5VVA5d6XMampuvG0zfsRWpJJFo2243jlMpvfXXLmuC6Ludvh
         QJYi5qtCrXHonZaSYS8N4kExqtiRbCoF11hcKRl4BOxGTqrwAuB/weEOZbOnJRrMW7SD
         j2HrLYvN4iMYbAxrG9HAGWcSEwXUJitzdvtjbS+0Va0QTp4hN59K/4u2MyNzuAijTIlM
         vaPpS4UEFXgQqfYFCmbjYPMPgpoYs9/4UfNb0Cldb/MgSispYCWQSqIUUv3PerAS58YW
         Mtdk7K7peuhe8p5XeOIMW+JKcF/RaoCgzXVd5akBlThuvFQODqtpZv+Svc1Ap2+eWoqM
         hYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TyF/bfv6fgtoB5EUDh9Y9yQZD6jfSklcqyAbFCKQYGM=;
        b=HFVQUqKZQDDwCPlr64Y5rY/t40/GyuJsrOiQ7oOI4L3J2CYazCxExaQfb1+FuZLi7Z
         Au4RzFTDeioEw7niEIyhvE9gcScLhe/oghqcKpB14RUc8gNObpcFEsoO7qRre1JOHPBV
         NtZyjbBSD8cQfwrWFm0E1gb3jOG0oUIbCZwlfEX6GxARf8gI9TMhsWitg/TbGlaGuagu
         aT+cO60e/eBVIYs63ipZOWz/gkhSy/hHRjmzoCp1kpj3UFCvvndDJrrq4gyHxxT73tSr
         Y8gD8esfPAdsPNtoAPvR0OJ1xqumMClNNzhpaAjTzXfGTBGMnlU4Z/PhSITFrHMc9wBk
         FRaQ==
X-Gm-Message-State: AOAM530CIg/sLmKivnViYO4U90nGOU91Xf04KXrjRgFxKlszSaKPOfuq
	SovVbTlsw3k37OctR203KNKnlrqhykRbN5cayuA=
X-Google-Smtp-Source: ABdhPJyjXl15sIzlt6YtLHRVicqIbHuHArQuES0WolL0qzkeruXpcEjif0hLz5rjF3sgjyBhOslVAQ==
X-Received: by 2002:a17:902:e84e:b029:de:45bf:1296 with SMTP id t14-20020a170902e84eb02900de45bf1296mr1498703plg.49.1611009468568;
        Mon, 18 Jan 2021 14:37:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/19] toolchain-shar-extract.sh: Handle special characters in script path
Date: Mon, 18 Jan 2021 12:36:17 -1000
Message-Id: <172231d2758f72bd012e1ef7ecdde1349dd2c83d.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Andrey Mozzhuhin <amozzhuhin@yandex.ru>

Extracting SDK archive may fail if the script is run using a path with
special characters such as space or asterisk. This is because the shell
interprets such characters after expanding the $0 variable.

Added quotes to all uses of the shell variable $0 to fix this.

Signed-off-by: Andrey Mozzhuhin <amozzhuhin@yandex.ru>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0453acbbd45604537090ec7a3295b34309e6eecb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-extract.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index bea6d4189a..dd9342758b 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -95,7 +95,7 @@ while getopts ":yd:npDRSl" OPT; do
 		listcontents=1
 		;;
 	*)
-		echo "Usage: $(basename $0) [-y] [-d <dir>]"
+		echo "Usage: $(basename "$0") [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
 		echo "======== Extensible SDK only options ============"
@@ -111,17 +111,17 @@ while getopts ":yd:npDRSl" OPT; do
 	esac
 done
 
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
+payload_offset=$(($(grep -na -m1 "^MARKER:$" "$0"|cut -d':' -f1) + 1))
 if [ "$listcontents" = "1" ] ; then
     if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
-        tail -n +$payload_offset $0 > sdk.zip
+        tail -n +$payload_offset "$0" > sdk.zip
         if unzip -l sdk.zip;then
             rm sdk.zip
         else
             rm sdk.zip && exit 1
         fi
     else
-        tail -n +$payload_offset $0| tar tvJ || exit 1
+        tail -n +$payload_offset "$0"| tar tvJ || exit 1
     fi
     exit
 fi
@@ -242,14 +242,14 @@ fi
 
 printf "Extracting SDK..."
 if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
-    tail -n +$payload_offset $0 > sdk.zip
+    tail -n +$payload_offset "$0" > sdk.zip
     if $SUDO_EXEC unzip $EXTRA_TAR_OPTIONS sdk.zip -d $target_sdk_dir;then
         rm sdk.zip
     else
         rm sdk.zip && exit 1
     fi
 else
-    tail -n +$payload_offset $0| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
+    tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
 
-- 
2.17.1

