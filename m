Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.18837.1593298264225908797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 15:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z4nucwaL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id k6so12882211wrn.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/lJNN5Ksvv0shacyIxRcnVANKUmLSXUiUefUqnJRGA=;
        b=Z4nucwaLj0QnK15Z4pfxZUI4dVBCKHzEFbmTzBk/Kv9em2ajLNPHzLaztlTiTCu2qw
         ICM3PoiugD48TLOR4kV/ROC5C3AXYxheWyoAPIU5IQMSkYXaqnEUbRSQ0mqm6R/8Fri3
         rHXxJeYJPRWSomn7qASZcwwozsrbQDEvER+G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/lJNN5Ksvv0shacyIxRcnVANKUmLSXUiUefUqnJRGA=;
        b=KT43fvFK77N9F5FHH6nPmKrZbnah5wuLyO566tz5k40I3qeyNnhLGUNaebadMlx7C6
         5I/ShMKstV+ph3I5BUh+FBvJTjpsraqbX9LDgJdwUFqPYrWgwpxocx/z5pwvk18FqM4R
         5edpLmU3sNqqlXk8+IJLo4x1sKnlQkg2zHy964XG6JU8hPIDcNiKkozql3Qikm5GC9CQ
         OAXlfZgFXjRa4vKVXxKoKEoREiQvSq5f5425Ey1ZEyRSK/BUqA67ysXLku5S15x6cP//
         HROCrvaq4hwsOxoRAnlbMZgpJ1hJCgfPoWLUhXXbGwTZuKvOqJBKMvGD48t8iTwQDSRu
         WTQg==
X-Gm-Message-State: AOAM532yZziPe3UUgfCyI0u/jJi+SCXCHK/DPvpXb0w3NukBjoU1YCzQ
	eWhAVOrkFmiFzHQrPYpaeyfWJCB8VPcC1w==
X-Google-Smtp-Source: ABdhPJxrjYZLWr8xknPrpY1Wi2JF5QQ+pjFMUbCnU7Sm6Uu4WEhjn1Ojx7m5bPQoFnwXE7/FbONS+A==
X-Received: by 2002:adf:ab08:: with SMTP id q8mr10087622wrc.216.1593298262242;
        Sat, 27 Jun 2020 15:51:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 33sm36261997wri.16.2020.06.27.15.51.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 15:51:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Fix to use python3, not python
Date: Sat, 27 Jun 2020 23:51:00 +0100
Message-Id: <20200627225100.719632-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should be using python3 here, it was missed in the conversion. Spotted on
autobuilder tests failing on systems with python missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9f26cfc1316..fd0da16e7ea 100644
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
2.25.1

