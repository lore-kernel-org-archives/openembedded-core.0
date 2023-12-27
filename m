Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0110BC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:46 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.94600.1703644238590419054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fqkTNUDg;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bbb4806f67so1133400b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644237; x=1704249037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUVnDU2rdeKUuFd0IZx68UKQm4URy+JZ74+tMJ76vw8=;
        b=fqkTNUDgdoDCmTQH5sbsNYUB6kGGUbmvQ+o1TVxIFapeS9hygohtGzElVtsme89ZFc
         Mro8t/OHxqtf9dWS32GniwtL+U4A2OJYByeb3XUd2Rbq5bxZRf9gJxPtfFKeeOs8/Qnv
         kQD2WLfW27Lv9O96K48SrgqbKU2eS7u6jtwXxzXftrG7WLS75xp+B7iQ39G40FDkNjA9
         U140T/VFY3n/DmVauXz/xsx1FiIpyu1FUNmuzHmEcscJ+LVUcYjKeQUA/0dDqzWXX/nc
         yqbdSv2YTtYZg7wwkNXPt6zk0ga9No+xV2AZeaXBHAJ5joofgZ4uHe9xHy7unOZS3iIt
         F9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644237; x=1704249037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUVnDU2rdeKUuFd0IZx68UKQm4URy+JZ74+tMJ76vw8=;
        b=aLT8vAeFnIzYXOrlZaFKxUT8uE8VVo8jgdzWtCzP5sAAMGTeVwoaMewkjxTP99rbXm
         Z+h+Mzah2wRkZa2zkgxuC1zibcpi6HF8N4JMBhiAF/4mQAqGEZNbYWebYuDoUBOERpmD
         60fgfi9pwyz09SFaUpnmGY0e1f6LmPjU43SbaF4kzsQrhXdOyp3Mw/xkQzSMYppxCb9N
         +lbEEPjsxA1w2eXH0QMbnbNq51cQkUoHUQM4EFszwOAYMpt33N+sfzKB80IDd1mn9nbC
         yMIn5EgQN+gzoujQMVfaycMyyvmT/QJpzIHSK6MvfVZA5V2zbUFpgmDo/QIO2YRheXBX
         kj8A==
X-Gm-Message-State: AOJu0YzG3FME6lsUB5Xsnj7QFPGUfiHe1Li65fIGxBbyKKwzk1vyPYYz
	mMOV+L8Y7I5rCSMWn5pCFnKC42ehr30x5Yc6vjjM6oSlnPWbAA==
X-Google-Smtp-Source: AGHT+IEdO23rhTt93wkvw9gkO8dC7BUwHeMkYA4Qmo9mEgLwJE//bbBUU6LmOLzyAUcMqNkyadG/og==
X-Received: by 2002:a05:6808:11cc:b0:3b9:ef59:42f8 with SMTP id p12-20020a05680811cc00b003b9ef5942f8mr8951556oiv.21.1703644237201;
        Tue, 26 Dec 2023 18:30:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] testimage: drop target_dumper and  host_dumper
Date: Tue, 26 Dec 2023 16:30:21 -1000
Message-Id: <94e9019d2f170a26206c2774381a1d183313ecaa.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703644078.git.steve@sakoman.com>
References: <cover.1703644078.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192921

The target_dumper code is basically broken. It has been reading binary files
over the text base serial communication and runs at every command failure which
makes no sense. Each run might overwrite files from the previous run and the
output appears corrupted due to confusion from the binary data.

It isn't possible to cherry-pick "testimage: Drop target_dumper and most of monitor_dumper"
from master, so just make target_dumper and host_dumper empty functions.

For further details see:

https://lists.openembedded.org/g/openembedded-architecture/message/1888

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 97e68d94b0..7c8b2b30a1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -99,30 +99,9 @@ TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
 
 testimage_dump_target () {
-    top -bn1
-    ps
-    free
-    df
-    # The next command will export the default gateway IP
-    export DEFAULT_GATEWAY=$(ip route | awk '/default/ { print $3}')
-    ping -c3 $DEFAULT_GATEWAY
-    dmesg
-    netstat -an
-    ip address
-    # Next command will dump logs from /var/log/
-    find /var/log/ -type f -name !wtmp* 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
 }
 
 testimage_dump_host () {
-    top -bn1
-    iostat -x -z -N -d -p ALL 20 2
-    ps -ef
-    free
-    df
-    memstat
-    dmesg
-    ip -s link
-    netstat -an
 }
 
 python do_testimage() {
-- 
2.34.1


