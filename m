Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F68C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:12 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.44919.1669904865204756937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lBhrmHO7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 136so1821659pga.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03jrrJ1rvIokgXJc2Q1Z9w3J3D8XIOOW+EvIBSEf0Y4=;
        b=lBhrmHO7fYv/HuOsgQzanLaZoMf5VpzngdyxkfKlSk7nXBwu47PTxTL9jQJA7O6yig
         rKo7rlCPvowqT/I8Zvqvw3kSSn9hYGZhm8ihi58362ZCEtorQyWweEu2SUm0WY6sl6Gc
         ZQqTg6facsktrQQidsAp48ZY+d6Et2ofqSL3f5Hz4e7N5XnrSG2ftWh51F2hKCCNrMH2
         27Ajau73n7E5rTTUKCnzLs94UudmweGUZaXLWXxUkwVbqU6ChAC63Qh3+UnKx+qWHFbW
         1tm/FRqNovR7dwegKFgVke0vLjcjlLlkxparJEuwQp02WY3UXIMvv0vAfQiTRVl6Hmue
         j6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03jrrJ1rvIokgXJc2Q1Z9w3J3D8XIOOW+EvIBSEf0Y4=;
        b=SJ6sjk39RQaqPdjVDfQYN6NOVF9T3GtqSi31hbKUvIe61sqkhDBIq/Mymuee2YTpEv
         taj1XVUTDbxJHhHvCUK3LLCpur6UVrlohMiiKM+N0QmVGd7exDbJIMWIjm87jMv+UNPl
         ppQCVMdyAeWpM+XoJVkAV0Nm88Pj6YrZSpLl9bmA720mZ8dfUKDkyXNT4yE/kdLMO9zL
         /dh60a5bhfU2JX0XuxIKG7EDFQWRr7WqhZa7s3RNyLwkZeG80XBigCE13XR1EkUcAIba
         TqS+4tSm6T/qO2ntxJ0bDNlOweidsYWv8480+QpZeAibwgkQJxzj7guD7PvLVZNBsImZ
         r3mQ==
X-Gm-Message-State: ANoB5pk8wOOcymVgiYn7Uzr2ZMoNedcNH3zMu5oKYbcY0o1F7aiGYRVS
	OotU1MS0EPGHBelEVXAqDGY0MMHlDNuhF2A6nUE=
X-Google-Smtp-Source: AA0mqf6x0wtPdOzm694EJgEQFYh4JRWKv1I/HmGJYrASwUJP4rbPjTGnd8aKuiJattDb+SbONTuTOg==
X-Received: by 2002:a05:6a00:1696:b0:537:b0c3:691 with SMTP id k22-20020a056a00169600b00537b0c30691mr47345447pfc.59.1669904881966;
        Thu, 01 Dec 2022 06:28:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/23] kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
Date: Thu,  1 Dec 2022 04:27:11 -1000
Message-Id: <640ac18b2daed698adbf849a5aef55f5de9e5db5.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174103

From: Chen Qi <Qi.Chen@windriver.com>

Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
at rebuild. That is, even if we set it to "1", the kernel build time
is not changed. The problem could be reproduced by the following steps.
  1. bitbake core-image-minimal; start image and check `uname -a` output.
  2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS = "1"
  3. bitbake core-image-minimal; start image and check `uname -a` output.

It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
build time will be set to current date. But it's not. This is because
the compile.h was not re-generated when do_compile task was re-executed.

In mkcompile_h, we have:
"""
 # Only replace the real compile.h if the new one is different,
 # in order to preserve the timestamp and avoid unnecessary
 # recompilations.
 # We don't consider the file changed if only the date/time changed,
 # unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
 # reproducible builds with that value referring to a commit timestamp).
 # A kernel config change will increase the generation number, thus
 # causing compile.h to be updated (including date/time) due to the
 # changed comment in the
 # first line.
"""
It has made it very clear that it will not be re-generated unless
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
explicitly in do_compile to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1b68c2d2d385013a1c535ef81172494302a36d74)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ad2b296c2d..3e7264fb98 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -361,6 +361,10 @@ kernel_do_compile() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -406,6 +410,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
-- 
2.25.1


