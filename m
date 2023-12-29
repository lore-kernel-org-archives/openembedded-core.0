Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B758CC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 16:08:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.151600.1703866084619641317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 08:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=frIy0Vcj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6da47688fd9so217816b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703866084; x=1704470884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbplpjoEyW/6NBoX1+dUbMNoyGrx07A4RvepQdafs6Y=;
        b=frIy0VcjONGobL/DSKrP6Pbsswm82JKZwx5CVu7uULKCTfUGPI/aoTrwAdd/TvLN2O
         LmA9IzGIorlqay3jx32gbZxLW5phpSUUAFomyl91dut1sk9wx43sT+3agZce+HhiodyZ
         yTe9rAb4K+8jzVMqpR5Kwn1h4qA4Ax4PFnsDG71aQ0FC4noJZRUKH4jOtOP59xuus9e+
         hVgKFXmqNINXFUUx6bHsPd3Tx2nOGuHdM5SHIRXMnYx4EibIiRz/aJ94Kay7vY29pONQ
         K0E5cR/oMiPXlV8VeVIO8GQ2hyj8VP9Looqz28VBVPfGGRrLzxjaqLAiByF3IoHvxh2u
         bRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703866084; x=1704470884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbplpjoEyW/6NBoX1+dUbMNoyGrx07A4RvepQdafs6Y=;
        b=oa9Qm33kcvqiEtLkn4CHFNOiTnkO2k4jeJ0bCGhg1drQHh8eTfOOAoD9qfwFeazXuM
         KHFCSOtnT9D4z6366OtvwOoAVxud1CUImnZOiccT4QISMqfVeoD4oqAutN3rHybd9qKZ
         0d1iwlGbTJQY6YSTl9XOjcpyegSGFXoULm+SrnZO2Pj/Ni2CiDNiLaE+UoYZs6d2TA4U
         RKs/6RYMeVba0Z7cEemLUqMFeLKk4nK1WutVf34iO8Hl5arXEe+BV5Z0jeBTCdu72CIG
         u8tkkclSHcif88v/J5GbPmn7ahr12SBABZdLTHVHyk0Iw65NGb3IJc3Fus4iiyVgIXhi
         wU+w==
X-Gm-Message-State: AOJu0YzYJRpuYdr+rb14HTJOk+pJ623LZzMi5r2xVjlM7d1uMR8k3gnV
	RuzIYrSCdjHRcSg9BqPNtvkl51uY2CgqFdgk/aIKHBd70xiKCQ==
X-Google-Smtp-Source: AGHT+IHJ5rVL5c/dZ8N3yqf5NOIepWBWouOSDdtjiy1a0kvh1soHSNpwlSsS8+GauLgx4YU4/jQxdw==
X-Received: by 2002:a05:6a00:148b:b0:6d9:b319:294e with SMTP id v11-20020a056a00148b00b006d9b319294emr4333012pfu.44.1703866083700;
        Fri, 29 Dec 2023 08:08:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78499000000b006d9b2682c91sm10028691pfn.113.2023.12.29.08.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 08:08:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] testimage: drop target_dumper, host_dumper, and monitor_dumper
Date: Fri, 29 Dec 2023 06:07:48 -1000
Message-Id: <960e7e3dffa22c2142cb672c68cd9a8f0e3998a3.1703865952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703865952.git.steve@sakoman.com>
References: <cover.1703865952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193063

The target_dumper code is basically broken. It has been reading binary files
over the text base serial communication and runs at every command failure which
makes no sense. Each run might overwrite files from the previous run and the
output appears corrupted due to confusion from the binary data.

It isn't possible to cherry-pick "testimage: Drop target_dumper and most of monitor_dumper"
from master, so just make target_dumper, host_dumper, and monitor_dumper empty
functions.

For further details see:

https://lists.openembedded.org/g/openembedded-architecture/message/1888

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6864eeed2f..0241f29dfb 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -101,36 +101,12 @@ TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
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
 
 testimage_dump_monitor () {
-    query-status
-    query-block
-    dump-guest-memory {"paging":false,"protocol":"file:%s.img"}
 }
 
 python do_testimage() {
-- 
2.34.1


