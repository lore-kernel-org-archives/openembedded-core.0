Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.3377.1611009424602700464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f8wpBhwN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m5so10823452pjv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NXeKAhh9F/liCfi/hAWda4kye9oXhfN0z98MODF6rsQ=;
        b=f8wpBhwNNK+6Dz24fctJtlDhHdxRc4JG1WXS3sg7EZIIrvaF+kmq+Y6urO6ZURPLPX
         l4AFhVmruuU7dT/SYQTIsXkjNb1tdSBnparqfTPaLkEVpyeHIGvNbwWGcGDYtiHLtLFD
         Wf0gIR5oF6ixXtRows6POAOaStTDLDZeqqRWXegDU/ZgOaqKonmmyHzsSXPIN+hEHHtX
         iU4Y8knT2ltmiFRr/ST9pjVLyMMWifH6J1/nFjUbs2H1uT8L/VyTBucaBPHldL9pUYoV
         g8Ic6TvvLY9BI7IqNtH1quD2eXKXhXj5rLwah0IM21+oqAcG89AWGRNefAKAeAhiCobe
         F3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NXeKAhh9F/liCfi/hAWda4kye9oXhfN0z98MODF6rsQ=;
        b=CG4JjIw+dbv281w2NO/Adt6IPN7H3+i4ojL7eCkwasVqrOcy5pjXZWBXcoGTZ7OV17
         ZIbp5NBVMwMS+WHjn03mpOi/532nrqKzdJVBylWuMOKdr8rDSpRYlRxdrztB2hJtvgeO
         xKuvF/kwGc5lZLnPyPVucE+/LO3K5ms3UOByZFZNyJlmE2qD7T98gxZ0pD9DJ6G1JDxI
         33W5/qvO44w362KJPotLrMJmdCbk0Q59iBaSJnSAsZHIpV9Q15sdsVV+UK+5345tIg1q
         ac6hnEKDbov61bWvD4eN/uCg8FJGm2UPDHTT4dO2lXYE3/lQZUbzGAf1+dHcMcynQSas
         zUVA==
X-Gm-Message-State: AOAM5330pvj/XwkAFXxEpFm1oEi/q2KLL/NSQlrXW5SYPSvVRMkPF4eE
	d/qupJmijCtTC9dcFmreUz+5+wUks3Ira3XF1vI=
X-Google-Smtp-Source: ABdhPJyrNgQ5y7lt8m6dsIAeQPsoqxR9CmZUSvfRodygVeDT5SJ4S4vYSgZg7GWvdwAfrA+04KX52g==
X-Received: by 2002:a17:90b:1483:: with SMTP id js3mr1618591pjb.121.1611009423598;
        Mon, 18 Jan 2021 14:37:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.36.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/19] meta: toolchain-shar-relocate.sh: Do not use $target_sdk_dir as regex
Date: Mon, 18 Jan 2021 12:36:10 -1000
Message-Id: <cf21f0c99676793c7adf95b3dc72c42ab24e13a2.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

The $target_sdk_dir path might contain special characters, for example if
the path is /opt/poky/3.2+snapshot . Prevent grep from interpreting those
as part of the regex by using the -F parameter and multiple -e parameters
to specify which strings to filter out. Also note that the previous regex
was using asterisk as wildcard (e.g. environment-setup-*), but that should
have been regex (e.g. environment-setup-.*, with dot) to match correctly,
this is also fixed by this change.

Fixes: 9721378688 ("toolchain-shar-template.sh: Make relocation optional.")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Cc: Krzysztof Zawadzki <krzysztof.zawadzki@nokia.com>
Cc: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19d9fa7ab6c851000bc5d24281739e1b2bb8f057)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/toolchain-shar-relocate.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index e3c10018ef..9c358a53e2 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -56,7 +56,9 @@ for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
 done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
     awk -F':' '{printf "\"%s\"\n", $1}' | \
-    grep -Ev "$target_sdk_dir/(environment-setup-*|relocate_sdk*|${0##*/})" | \
+    grep -Fv -e "$target_sdk_dir/environment-setup-" \
+             -e "$target_sdk_dir/relocate_sdk" \
+             -e "$target_sdk_dir/${0##*/}" | \
     xargs -n100 $SUDO_EXEC sed -i \
         -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" \
         -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" \
-- 
2.17.1

