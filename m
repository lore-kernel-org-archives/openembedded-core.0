Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.7677.1593486333359674560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mrPKycVx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id l63so9233048pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=64vRS6PphnscCdX9XcGNAf4vyuc0wDtiWFF3+Z10ro4=;
        b=mrPKycVxDbSbRWuOVVRo9mW3veaiIBsJXbbAns8UnHA6AdmZsDjVNqSs81J9nwcU5a
         fvjcqBNTbudIgDhgOfHybX/FzlpqhxDnkzVA0uAJrW7ZmMNqHecDaRm2M7I0h5mfITXm
         6PANdhMyfUSK9mlzTg0ELjHlWBeyUOec+K6WjSgg8HYl9I/bvwLaoLu/27BYiIeC6mBn
         XhAq1ZvINEYdSbNHyQJecqwtZ0yT3/ZzRyXMsviaC91rryWDu5lNXQ+HVGa+JwLZpG1m
         ndt0iHCcJ3cjCnr6xMVM8fl2mALXIk44lozLrMShuxg/xyRTTBTvngkWf5yf+OlWDc5q
         k62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=64vRS6PphnscCdX9XcGNAf4vyuc0wDtiWFF3+Z10ro4=;
        b=J4n9nRzY+EoTPOrjyZ31lTQOShoq74EzAo4oUIsnmy4mEUWKKfo0lNXjTQHhUHIvlg
         tERNsXlYaAqQg7inR+QTlIdcuYw3EfHcYQb06Rn20s5Xrm/hfX8kYl01EQT7NP+XMOWE
         MbRqKm11Ck+wg817Icqz7mP7SDmFDt6ccweaUFqv0f8Wz9x1klQvVy3Ec8y2NCv6OdwI
         oSydPh+LUZcZcUvlxNfwnqwfo0yXj5gh3EYhhC2FnTWPkFmoGmS3FwVkUXjme6OXDfUc
         QD56c+h0B8u5Rmje4K3ucOhOxLy9xSu3Uqp8AAKp14IRGtp1EweiGuCzAUfKBLGlfldM
         MH8Q==
X-Gm-Message-State: AOAM530VAAyz/toUKKRE/SMpNnIMxLffUUHGJYEQCEvTOm9HWf58J0gF
	7xYTabxefHZFtBgaJuwNdBnCs90fPUa6dw==
X-Google-Smtp-Source: ABdhPJweMhwEklBwPNtaCa7vgTv18c1M/2Y4G1aW/TwCuL29cseRfcFYPZZicHm5hqpuRQl4S9TpFg==
X-Received: by 2002:a63:5644:: with SMTP id g4mr12564086pgm.381.1593486332467;
        Mon, 29 Jun 2020 20:05:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.05.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:05:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/22] populate_sdk_ext: Fix to use python3, not python
Date: Mon, 29 Jun 2020 17:03:19 -1000
Message-Id: <1373006c28541e8fd6ceb6d5ed905ff1536ef3f7.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We should be using python3 here, it was missed in the conversion. Spotted on
autobuilder tests failing on systems with python missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db07b09196022078346aadd565760240b7da6a71)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9f26cfc131..fd0da16e7e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -676,7 +676,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 	fi
 	if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; then
 		rm $target_sdk_dir/ext-sdk-prepare.py
-- 
2.17.1

