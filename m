Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FBCC04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.138758.1692116693617066273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ezt9qLZ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bdcb800594so17181855ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116693; x=1692721493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAeKeDNwm2Ww1YhcMpFdbYNg7hMFca5gDTSYOM5naaY=;
        b=Ezt9qLZ8toPjvRY6ktJNChFSYQSNEbxyVLxMAFtT3BhSxbehjSQ6cRydfN1xPgoA3t
         1+OiH/AK7XZAcmftOzr9iwLaNRxtM38sZHD/8IauQmXQRFlg+MZXhEvkqF0pdbPqfZXx
         5yx1XU3nzyci7HaokQeEPphpIrfgC6A12aoNlbOIj1rI2fK++cnAqflvnHuJTdzNo9V7
         mXzVhOsUKzELzaevyxBadcmu0rm/rDk5o9aVKiYCde1aYU0R9zOfZzjfSmHVDt7Awk7C
         r+HdiwormiJh16y6rxRaFWsBX4YWDxz/Us/oXhuAycJZw70Tra4GOzYsPg0WBc1NbsXu
         UV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116693; x=1692721493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAeKeDNwm2Ww1YhcMpFdbYNg7hMFca5gDTSYOM5naaY=;
        b=aKAD4k40vdl+ke81a8xlJa7fLBpMRP/5mp0OrI97V9ZhLV2RxmVBcIq6cJ5EvJ1ON7
         /Y5wefPeVa9uE542l/X4buR0MKW+FvblW/EcJ9ZIbWQZz0AP2BiiQoFwhMxGNbwgNFhP
         J25aT2qcEnV5eM3StqaxbB7iZfsmZb8qmL4eMnKKlxV+vAVpoEcg7uayV/nuibTj3vhr
         Z7xhf367/DzfYHjVS0lhY6Y3rkMMJXnaz4j81vYBJBkSf2xuP98H9q5AEIWLZ158gJSz
         QgsGgd/MYh2T/gVzRfLiQvHr1TmHCSWw+w9QSx0p9cYGZke6VzSYbxV/HzfB8os8nkiC
         5r7A==
X-Gm-Message-State: AOJu0YyzsDkI7SsoOdFreX4m4mVp904aQjlnha/9bXqfSTRuk6Kt6F4r
	4LtHk32n1qAhLEkxBUmk6vw3vRmlBUpS85D56/c=
X-Google-Smtp-Source: AGHT+IGMPIPXiapAIfR4+YN1TbeHB6c2I0bJU8wiflFfGYVgRuF7qGd6hWHKaIqm/2b/zvSg3EKVug==
X-Received: by 2002:a17:903:246:b0:1bc:7001:6e58 with SMTP id j6-20020a170903024600b001bc70016e58mr12549268plh.33.1692116692706;
        Tue, 15 Aug 2023 09:24:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/18] oeqa/ssh: Further improve process exit handling
Date: Tue, 15 Aug 2023 06:24:19 -1000
Message-Id: <f5842b39a5c925d5ee4dc2f584293a313fb7eb1e.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186089

From: Richard Purdie <richard.purdie@linuxfoundation.org>

It looks like there were further cases where orphaned processes may be left
behind since the .kill() calls may be unsuccessful if the process terminated
due to the terminate or through normal exit. In that situation .wait()
wouldn't have been called.

Further tweak the exit code paths to ensure .wait() is called to update the
returncode value before returning in all cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a0a1731e38edfa72a141e8fd8f2de52be562e94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 1cd496c2f4..a9566d9bd6 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -262,7 +262,6 @@ def SSHCall(command, logger, timeout=None, **opts):
                 time.sleep(5)
                 try:
                     process.kill()
-                    process.wait()
                 except OSError:
                     logger.debug('OSError when killing process')
                     pass
@@ -271,6 +270,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             " running time: %d seconds." % (timeout, endtime))
                 logger.debug('Received data from SSH call:\n%s ' % lastline)
                 output += lastline
+                process.wait()
 
         else:
             output_raw = process.communicate()[0]
@@ -285,10 +285,10 @@ def SSHCall(command, logger, timeout=None, **opts):
             except TimeoutExpired:
                 try:
                     process.kill()
-                    process.wait()
                 except OSError:
                     logger.debug('OSError')
                     pass
+                process.wait()
 
     options = {
         "stdout": subprocess.PIPE,
@@ -315,6 +315,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         # whilst running and ensure we don't leave a process behind.
         if process.poll() is None:
             process.kill()
+        if process.returncode == None:
             process.wait()
         logger.debug('Something went wrong, killing SSH process')
         raise
-- 
2.34.1


