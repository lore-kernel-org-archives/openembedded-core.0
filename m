Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF613C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:05 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.2309.1700120217460311712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJS9G8BT;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9f2a53704aaso60757566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120216; x=1700725016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kw2lSPPC2QmyTLeL7NXHu8Nz2xFK32h0Wl7Dd7cZrgg=;
        b=BJS9G8BTcUfRKT/N0jREx5Qj0ObI8P7iNRmOdj/T4Hq+ppCCHrMRifBxe03LgtTWkQ
         igrxqZyL7GhF1bhkJbmnT5uFB9xWm4nZjbsdxR5kBNdDHdfnclAg2GUyIt+9VSuTMMWi
         mTkOwtdis/zPRaZFZh/+0Cl6mgiKhmicZBhineKq2vhGB6ANuTLluVxtOGudRZU+csqd
         IiLswxpxl9Syl3e96k5oH+FwNM42ff2OuBIzCz7W2dOauPi5BIXMfUtV85/OnZAdmQyZ
         6mIccKgdTPyP5bSd/wpFVT26nAptOLtui5sBChLTrO2e0W5CYCFqtuz8H6KBzpe67mkc
         fr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120216; x=1700725016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kw2lSPPC2QmyTLeL7NXHu8Nz2xFK32h0Wl7Dd7cZrgg=;
        b=EH+yY4tDMhi8BjCkmEmOUAr/eVCuHG+P2An6GszUBHhA3vn6vF3KFJUdox9juus02U
         SzltEWziYOjAFXEj2qaaXWxvS9rgMRFwcL0Xn6ZGJ2GLvKfR5571LcaGrBO3UAzVAvWv
         qGfpjRdgYQKWNjzT/RO4kJzB0VbmQPRb3tJz97kRhnbXs0AoRHYcsPqqH5twp9YVwMUq
         QeR4Zpk861JmbLCiSdX3gMjdnzotsHuboPPghq4e7GzVBp/MfojEy+7ZBW+GHRXazA8Y
         TavrAk8YXgi91TqDZnN0Agzick3Hdx7+nyPWDyB54kiEIIQ8GwOZYk7yscTZPxG7htio
         7U4A==
X-Gm-Message-State: AOJu0Yw3sf5Zzk+t5ruVrUOTyoLeJGz3RVeuhDPoXhQh9zRqPyk35+87
	2GgJMyGKiRPIP80yL82j2THb5ehAHFY=
X-Google-Smtp-Source: AGHT+IENu0GZUuQ9owLRarZ21ST68NlHd8jcTLuZgtK+T/XR2lv8xmJjVLCPQXq3+3I4GKMIBTHt1A==
X-Received: by 2002:a17:906:1593:b0:9f3:40be:e45e with SMTP id k19-20020a170906159300b009f340bee45emr3193838ejd.64.1700120215503;
        Wed, 15 Nov 2023 23:36:55 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b009de3fd8cbfasm7985393ejc.0.2023.11.15.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:36:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv3 01/11] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
Date: Thu, 16 Nov 2023 08:36:40 +0100
Message-ID: <20231116073650.2710535-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190753

* ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
  https://lists.openembedded.org/g/openembedded-core/message/185818
  adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
  As we don't depend on PR in WORKDIR maybe we don't need it in
  /usr/src/debug paths as well anymore.

* The interesting side-effect of this is that for DISTROs which still
  use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
  all binaries to be slightly different when rebuilt with different PR
  (due to this path, even when otherwise they are binary reproducible)
  and when the number of digits in PR changes (e.g. from r9 to r10) it
  also results in slightly bigger binaries (and more unnecessary changes
  in buildhistory diffs).

  For example this foo binary, the difference between "new" and "old" is
  extra patch applied in SRC_URI (which doesn't affect the foo binary,
  but was the reason for PR bump).

  And the binary is bigger with r10, identical with r6 and slightly
  different due to debug-prefix-map between r6 and r7:

  $ ls -la 1.0.0-175-*/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29 1.0.0-175-new-r10/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02 1.0.0-175-new-r6/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49 1.0.0-175-new-r7/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39 1.0.0-175-old-r6/image/usr/sbin/foo

  $ md5sum 1.0.0-175-*/image/usr/sbin/foo
  8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
  f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
  6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
  f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v3: added additional fix for perf (and changes in other recipes were moved to separate commits)

 meta/conf/bitbake.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67ff769046..3836a389b8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
+ -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
+ -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
+ -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-- 
2.42.1


