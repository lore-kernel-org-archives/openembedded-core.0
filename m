Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8886C7EE2D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.70175.1684081930451683708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oUd6aqJ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so7912601b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081929; x=1686673929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Gec32DQWS++iJzj1iKRxvYcbs98s53koGnfDOTceWo=;
        b=oUd6aqJ78eFYARhGfYJqqXBd1gdn4qJjPkr6BtdBizZzm22EhZ14/5UjAVLNMXrSMq
         42BybT774IPHLposr49Jy74cYmK0lN5NmzdWrHTIfiPCMyjlFt0edYhbtWj2i9GVM2Vz
         7RAoirc1NkyVhah8Uzc8+JjIqKj0ybunqe+PEivZh9QNiMa5xolrGkjj/yAfWFCv6Fgr
         2Mh4TGQH0nDR4kouHD/HFSSnBEy/Fj5vkLbaoWH5P55pGOjjWPbBKHO6NmoQo9QHdURd
         IH6dd7K5zO/SCzmAeRY6rOHYSYaX9+sq4t8xQp7ASr3K3zhX6iKsUC2pQu9viMU06k3h
         V4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081929; x=1686673929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Gec32DQWS++iJzj1iKRxvYcbs98s53koGnfDOTceWo=;
        b=ECwmCVK3XaGukx0w9L6391ViOUJUPcSLPt0MHMcegU35CflfomcA8HZWMtLisMF9Pu
         xL1pBZ0aN9DRFCXDLqZUh93Nv6GETADHrkzI2kB9H9K0+kvx94ezogpnfC5IlLCtwHVO
         jYUZhy5bsLQ0rnfq/xCR7Ths8h4VHID2AazZ5X2S3AyfU0J4eM7El8d9uPc5zLi29HAi
         HNQS5mQXRGycGSrD/8fqZ42SlW5Ix46NQ/hKLNP77afAT0KSfmn4aiYPzS/OqMSxtSXM
         pmaRMfjSji5NRli6b24n0ll+2zsQgsQG9t6moei5e5w2l2ORZGkPkS1m+1hcTScv2qlB
         XNFQ==
X-Gm-Message-State: AC+VfDyH81E0/7pFzElnhuVHJ7zJX3EHjYskXbPz5fiOrdGsohb9w9Xx
	CdIjrBz6+a+TjY0pc9T059Kcq+EhnAGbu2s8odc=
X-Google-Smtp-Source: ACHHUZ4uVN5x8RSeH+wvzEprB9RLGL+cMQtFzSqlm5PsdebF47HKSY9XsxOoQPHmZL6prUBN+IhUyQ==
X-Received: by 2002:a05:6a21:9011:b0:f2:bfe1:4867 with SMTP id tq17-20020a056a21901100b000f2bfe14867mr32617289pzb.17.1684081929474;
        Sun, 14 May 2023 09:32:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/15] populate_sdk_ext.bbclass: redirect stderr to stdout so that both end in LOGFILE
Date: Sun, 14 May 2023 06:31:38 -1000
Message-Id: <766c6f7ae72576cfab3654362ae949688f42acce.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181214

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 719f22df160ebde303274ccfc04049cffdb51577)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 476876e03d..fe656ed824 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -733,7 +733,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE 2>&1 && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE 2>&1 && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 	fi
 	if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; then
 		rm $target_sdk_dir/ext-sdk-prepare.py
-- 
2.34.1


