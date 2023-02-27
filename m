Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7606EC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 05:01:00 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.83527.1677474050943050469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 21:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LA7SQPpq;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d7so5400440qtr.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 21:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uIKtP9ivDhZAFarCbpa4u6nQ2wKgdYSujglpl1xa/U=;
        b=LA7SQPpq4ee8HLKJcsn44dDPWUQbvw141e6/K0i01gZQYMeIdicSNESr9Sw0rJtKcT
         yUYhdp6oYQoCsKGD1usCEh95SdefStA4Q19XckUXsf1mFVjvDWxJBGDYCf8q7+HTgVg4
         0BY7pOg1kSIUk8QEhZYyR93LVzXrNnhQxDNr+2Ix8AkQLs9VwJLH2l/9Vr8kWG8DZ0Gx
         sR/hscv66ksHTw8cuAOYwip+l1iK/SeDuMpWLJAsFBn7EaGE0H3x75bc7WbpuCA6TYNX
         6TsnecS4PdDO5DxtPNcuOnSwQztFdLBN6fIHFLGV0LZ+tq1MZggOERmDZAoEQcPBmspE
         2x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uIKtP9ivDhZAFarCbpa4u6nQ2wKgdYSujglpl1xa/U=;
        b=FZlJm3Az24JSl+ahL4m+XS1qzXWPSebsuPKlLa6PbpkIJBYNhWSHwkG8iR5jR3L6dP
         +8Rm3ospwMC1tgvVBaSW540Il8CF+ObGj4ZswNSsut542DqgNlXkwYqIcPbY/aJOPKoq
         4e4siVT7ncVNajRHAeZzCvbAfI9o9/xaSEQMEezK0om41MvI/6fVdwYQNi8LhtR+rCXJ
         ZInznLw0q8sh7f3pRlLviwzfxPoF0gNUy/KAtHtiptgdVhZzRWXD/Dmludn/ZkRQ1j2C
         dKpxgb+2lxQlfly0Em+NfOGKbR6EN+G+1orXr0Jl6Ejw3zzNLjQiFXfpuWvpf6FbNmu+
         KhXg==
X-Gm-Message-State: AO0yUKUQMW/jlyyOT8UU1q5nFqSR7X2Ja0RLfAnFM5AoKVZCGU+c1YIs
	TkEX0omzCbZN+PNfE8vS07bezC4ZclU=
X-Google-Smtp-Source: AK7set9LgD4MHJPeUhuKd1vh/tx0Opk/gJF3vbvhsZ2quxH+KR9esUjigBubL5+H8JDsKvyhaVKP8w==
X-Received: by 2002:ac8:58d6:0:b0:3bf:d8b6:4cc7 with SMTP id u22-20020ac858d6000000b003bfd8b64cc7mr3949817qta.58.1677474049673;
        Sun, 26 Feb 2023 21:00:49 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id z29-20020ac8431d000000b003bfc1f49ad1sm3998579qtm.87.2023.02.26.21.00.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 21:00:48 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] VOLATILE_TMP_DIR: add
Date: Mon, 27 Feb 2023 00:00:40 -0500
Message-Id: <20230227050040.12943-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 05:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177772

Provide a mechanism to allow users to choose whether the /tmp directory
is on persistent storage (non-volatile) or a RAM-based tmpfs (volatile).
The default is volatile.

Works for both sysvinit-based and systemd-based systems.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/bitbake.conf                           | 4 ++++
 meta/recipes-core/initscripts/initscripts_1.0.bb | 3 +++
 meta/recipes-core/systemd/systemd_252.5.bb       | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dcf6ce99d138..afd9e2f5527f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -90,6 +90,10 @@ ROOT_HOME ??= "/home/root"
 # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
 VOLATILE_LOG_DIR ?= "yes"
 
+# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/tmp
+# otherwise:       /tmp is on persistent storage
+VOLATILE_TMP_DIR ?= "yes"
+
 BB_RENAMED_VARIABLES[PNBLACKLIST] = "SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] = "CVE_CHECK_SKIP_RECIPE"
 BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] = "CVE_CHECK_IGNORE"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 7c9d9ca4f107..4dc477bb8d69 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -108,6 +108,9 @@ do_install () {
 		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
 	fi
+	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
+		sed -i -e "/\<tmp\>/d" ${D}${sysconfdir}/default/volatiles/00_core
+	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
 
diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-core/systemd/systemd_252.5.bb
index ea468da150ce..8b92b2cf425c 100644
--- a/meta/recipes-core/systemd/systemd_252.5.bb
+++ b/meta/recipes-core/systemd/systemd_252.5.bb
@@ -288,6 +288,13 @@ do_install() {
 		rm -rf ${D}${localstatedir}/log/journal/remote
 	fi
 
+	# if the user requests /tmp be on persistent storage (i.e. not volatile)
+	# then don't use a tmpfs for /tmp
+	if [ "${VOLATILE_TMP_DIR}" != "yes" ]; then
+		rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
+		rm -f ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
+	fi
+
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
 	install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
-- 
2.36.0.rc2.17.g4027e30c53


