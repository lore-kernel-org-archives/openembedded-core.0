Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E89C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.20268.1700174923550810252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0I4BYAp;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9db6cf8309cso187467366b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174922; x=1700779722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdINWa2NOTzzDn2JLeo8XSLNYZlyVd5C1BIpEjvmmeU=;
        b=N0I4BYApffOaBX7QE3EtgjKcGs+gl/dMGy28tLnrTCMf3d66hDJUg+JT3Ak7FXdP81
         jnGkqjhFvJNcxl2GClEX7DImJvY7rjKYZng+RvBoyiypXHkU8CnVxrqYVc0a5qMJWM8W
         NabNKPepUDXeMqaZLqGQwtOLDFV0VLMPmZAzTlQyo9T7gS374iqyUoIE8oaVtI9cq1k4
         pkeG1IiB/vIrhFzavtg8CzecWpzlxXw3H89aWevGH5OlZZn+57BT7Ibtzx9ix6pbZjpw
         J/2h3zQ4JGHhj6PxNh2X2UySAiEzBPRlmp8cnE6YCeF+duid1jacXftGc1SqgoStNgaZ
         kb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174922; x=1700779722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdINWa2NOTzzDn2JLeo8XSLNYZlyVd5C1BIpEjvmmeU=;
        b=W7gefRuMZIsHV66J+zn840wnlKqy4A7PvIkKREKlxGisScnSB8WLLY41BS9V/jLPDh
         xkw8N9AEXoDcsg5q2QlE0MU0wGUMfOX2cOtx4UOFuC6hb6DpqVp4RE+ndyYG0Gl2OG7+
         SEDClKDCnaOOQNmkpB711wYfFcB2j39oGdZ6DV4mH63B4hqhJpBNoU4F9lwAYZIIKlek
         19Vvi+kq86O1hF9lj2BO7U4lua047+ZpgOy1j5gxN6rspJoaZPMcGZzpPFOYQ9rzLidg
         hPBfVOW4VQdiFMHnAz/iP9axhn2VDW2oVrzwZJKWIQH+DidoMnFtW3DfuHihxEPGUBCA
         SodQ==
X-Gm-Message-State: AOJu0Yz2gs2inV97V6N+Q4PW2al7VXaudG5bh1ty0i3RuVcCGPKfZ9QS
	9D1LVuq2mP8I4N1tqQ0vO6qC9SEq700=
X-Google-Smtp-Source: AGHT+IEQJUVAB4CbtGMMN7rCdhhz5Mo2VyyvyqJt6dtfYoZUoSgNB+s1+ZoLehOC2RbM8XfGpqX1hA==
X-Received: by 2002:a17:906:af18:b0:9e6:18fe:7447 with SMTP id lx24-20020a170906af1800b009e618fe7447mr12598112ejb.9.1700174921668;
        Thu, 16 Nov 2023 14:48:41 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u19-20020a1709063b9300b009e5db336137sm118657ejf.196.2023.11.16.14.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv4 01/12] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
Date: Thu, 16 Nov 2023 23:48:25 +0100
Message-ID: <20231116224836.2696913-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190815

* ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
  https://lists.openembedded.org/g/openembedded-core/message/185818
  adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
  As we don't depend on PR in WORKDIR maybe we don't need it in
  /usr/src/debug paths as well anymore.

* add TARGET_DBGSRC_DIR variable with "/usr/src/debug/${PN}/${PV}"
  because there is quite a few places where this location is being
  used in various recipes

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
v4: add TARGET_DBGSRC_DIR variable

 meta/conf/bitbake.conf | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67ff769046..59f142f6bc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -646,12 +646,13 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Optimization flags.
 ##################################################################
+TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-- 
2.42.1


