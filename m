Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BEAC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:57 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.43561.1676990512338266078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TK4nROCq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 16so2583482pfl.8
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfTysN8juc1iVPA+1gh7rh6T8Zka+y/T7OPdYTuUUyQ=;
        b=TK4nROCqD87/WrQrwaHWpRNthDFAP2ALWsGbcYSbXw5mJG1NTTSCnOmV4sbABQWWtJ
         vgwqsse3If02EuqDbh1uejOTuK29Cx7xRpbMYTK672ebQXdwrip+pocdJTTvnhXrdCAI
         mSntxP7fdDEIBGl6akqk2Ju69ma78+vsziC2eDhdTozfOI42lgd3403Ur8jWXSd8obCm
         ESWMKcDg1MjlG25C82j+zIsCVaKUtoHcx4CIdCCQWliTBQL1/OjaHrrsLDMMsQ9HR8MP
         LV/BqprZ1BCfJMOX6DzTXwobt0ibOOdzZgn4L3KhkcbcXWntIZrTlJi3aYUxMJvPhgoj
         uBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTysN8juc1iVPA+1gh7rh6T8Zka+y/T7OPdYTuUUyQ=;
        b=JkuDMBApRNukBylel1/Ptq1Qm1JQ/VAAsnveOUZasMPCzJiiF/bkjCDG/RHWyJx32s
         WBWBjidTG9IFsEXfHQaZpmyIpdqUCS6JiIRQxFB90Nu1AuDl702CUPgx1AH9ALiF3skc
         fx/0nb3U0pdhGDDKGNeFVZKXJ6ZUJ042Hil/K4k0EA3Q/Sd3X3onvKRAzVUycY3nKYfg
         l56op/1AVcAuyHzaQIsfnkLL/nCvl2+UvuEh7HbxElNd/Jbll2TuCiXUbKGILBTcWl8b
         3+UVaXyWrCwGnHRwNSxTpaU9SIErA2s8AJROFgQaNGRvmbRW/ECti6FSR3XohYfNN73G
         POVQ==
X-Gm-Message-State: AO0yUKWE/uEaai0YkAlCaHa55OKHNOyIHf3YKleIQxkoj/HPgDKs6Y7d
	8G+FPwkHDxEz6cQ0yz/ctcPro9AZ69N567RTKYQ=
X-Google-Smtp-Source: AK7set/Gm51kI07+PFEhRumuMJYtCMiWbUTOR7KSbT5nG2sUDuzavUR7DO84LDB8vyok1O67AQY7xg==
X-Received: by 2002:a62:1dd0:0:b0:5aa:6125:dbf4 with SMTP id d199-20020a621dd0000000b005aa6125dbf4mr3750723pfd.11.1676990511421;
        Tue, 21 Feb 2023 06:41:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/23] oeqa ssh.py: add connection keep alive options to ssh client
Date: Tue, 21 Feb 2023 04:41:01 -1000
Message-Id: <94021c8571242dd491ee3c7c40144c5a12ca8e42.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177518

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Configure ssh client to test that connection with server is up.
If the server does not respond within a minute then the connection,
target machine or sshd daemon are stuck and it's better to exit
the command execution with errors.

Some tests can execute a long time without returning stdout/stderror
data and it's difficult to adjust timers for those cases if
connection to target machine or the target machine itself hangs
and output is not expected in minutes or even hours.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit ba68ff04c5786eca7cd8dd44056705867dea8ac4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f1b9090bbf..48a463861d 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -34,6 +34,8 @@ class OESSHTarget(OETarget):
         self.timeout = timeout
         self.user = user
         ssh_options = [
+                '-o', 'ServerAliveCountMax=2',
+                '-o', 'ServerAliveInterval=30',
                 '-o', 'UserKnownHostsFile=/dev/null',
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
-- 
2.34.1


