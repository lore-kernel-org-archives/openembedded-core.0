Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5200C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 09:04:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9101.1681203852633794222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 02:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=X4Nu0rJ9;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ga37so18859663ejc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681203851; x=1683795851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMQAuiAx/kPFkN46M6wztIxvpGWA6fEojtd7KzAdSKU=;
        b=X4Nu0rJ9E9LBerO08GaRr+teKrOJm9hZZDKMLwv4E87Wz9LlxRAzzNJZwsnDHp7g1f
         WMuGG3uVktfFf+wVAc19BOmqFQLjtQXaE8NOXj+lk8kbiAyTIS1F6sxlPtg5crIIAfqv
         g+ub3ABcUqV93jnmI/VDlxRwI/ymMJlD+y5MLiXqFRvuxRnMdMhT8Tr406ZXSns2ga4L
         In1J/SErnGQgtcB+IyIykroOZrFN8al9Oryf7tnmfU4hEcDeD9mnI7ykQCyK4YZb8l1T
         /hBIZn2Emwvg7MN2Cw/09EKXg+HUcrSujdYbLE9C7GxzL0oN90+fYpYq7FHkQGgjXVOA
         DBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203851; x=1683795851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMQAuiAx/kPFkN46M6wztIxvpGWA6fEojtd7KzAdSKU=;
        b=ciHoECrnf3yUpZMeK5DTndxNoVmRObaYzaLZyuOVlBtfmPT5c8cDuDCkfRaRDvhUyy
         qK/1mLK/rMrl4p4vo1qYHi9o3JL6axDgeULIfhyC98EDafZAbDRG4VaAi3SGeOeQRVaP
         tgxFYVzqS6S+hYqMpBbYACsYGEf1ACYvYGx+plGUdQc/JKBQnuxYA/JHd4f0L90krWS0
         55rsfGeIeSj0ysMMTkmx3Qyms+G8TuGxuzTBICvSaUiGzNgGO6GRu1d34RHaioLuyO0R
         nY0IpHFO9yjkDZojPZCdgwlb2GjHINkQqbtwhe2ZICb9xD14MeBSEzrBw3Z8ww8HoDpj
         lYsw==
X-Gm-Message-State: AAQBX9cyY3skaKEorf1Bp2VG+av10jrYyXNIZ1cbodu6L1P6PW5wI3Tw
	fX1IFYYud9jNUUhKGoPNGIfx8W7hpMQ=
X-Google-Smtp-Source: AKy350bTx6760PNWQvaP8IbquoYmdAGJa1k80EOWu2Kf0aV7r2uy4ioMrZ+pq80mzex5ERJNnjv/pg==
X-Received: by 2002:a17:906:f285:b0:932:4990:2563 with SMTP id gu5-20020a170906f28500b0093249902563mr9151698ejb.24.1681203850810;
        Tue, 11 Apr 2023 02:04:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lo12-20020a170906fa0c00b00947792df079sm5925678ejb.115.2023.04.11.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 02:04:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] populate_sdk_ext.bbclass: redirect stderr to stdout so that both end in LOGFILE
Date: Tue, 11 Apr 2023 11:03:47 +0200
Message-Id: <20230411090348.2434686-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
References: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 09:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179912

* this in the end doesn't help much, I was debugging warning (about base-files.do_install
  signature being different than expected) from:

  python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'

  this shows the warning on console, but it doesn't end in $LOGFILE, because it
  writes only contents of cooker log into the $LOGFILE with:

    with open(logfile, 'a') as logf:
        logf.write('Preparing SDK for %s...\n' % ', '.join(sdk_targets))

        ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
        if not ret:
            ret = run_command_interruptible('bitbake --quiet build-sysroots')
        lastlog = get_last_consolelog()
        if lastlog:
            with open(lastlog, 'r') as f:
                for line in f:
                    logf.write(line)
        if ret:
            print('ERROR: SDK preparation failed: error log written to %s' % logfile)
            return ret

  maybe we could remove whole support for $LOGFILE parameter and just redirect
  the output like other commands on this line

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 7f55c83ee2..8146036fa9 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -739,7 +739,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE 2>&1 && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE 2>&1 && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 	fi
 	if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; then
 		rm $target_sdk_dir/ext-sdk-prepare.py
-- 
2.40.0


