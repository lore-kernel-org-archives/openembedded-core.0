Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1306C001B1
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.61514.1688484638463043571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yHwgTJj7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b89cb535afso9595675ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484637; x=1691076637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt7TMU2QHSIOjTeb8ri3HgQEDv5ZUBo9wtOTcagfS7I=;
        b=yHwgTJj75BwpInEoV6GmQaG44EIY+13XLhl9i1ceeAed+7lVmvgzhRzuI9f8Qis2RV
         GK4mN5W5bPrBFOFxVAtFSQ9Cp5Bhw6UC6WxFkfj09Hj2l/QuaiMeScv3uLEs5ewBOYUs
         Z8X458YKIybsirCW0FPe5zwnE6EvXJB+EA4A6H/0XhyDkVcGJkh+WEVoJ5jPEnlPuO4g
         ogcTIio5oYT1K56RbIP6tkZdiJ5KbzKwddtQmdMTxHdemo04GLb7j41MnmvPJJ45gdmd
         SdbTkU1xAUGbub/WNis7/FCudjGOtlJoFBEsrdn3NCuXv+upGjWuz8eUtlUgxU0qiXfx
         x/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484637; x=1691076637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xt7TMU2QHSIOjTeb8ri3HgQEDv5ZUBo9wtOTcagfS7I=;
        b=fdPuihAOvHsZsjnmtagIBrcIm0pjM4yhvPHu9l9lSQjoZCt53inD4Yx4FYsBbxZEdT
         ljMQsi8dpPtzhzDv3RqJMdogp6NGxKen4jNnjSQEmDhYYJXhWdTXBLviSFqqsxKr1kDZ
         2VDqC48vrjNkPibUT1N/kttfm2OXRtybw7wIqd2+g0tDhicmuyMCXuKhnpPi7PcwxGkn
         ihV1Vsoe0/eEi5g8t4rCqscBC2ZUgqUhQFMEdEr7cbH/n301Eic9B4BHRUz1k/n9Nsmh
         PXJxEiBtY5ua1KHF1EWQfqRPTXANT46V/djFXu9BQxlI5+9Wv/WHKqkBRjhHjdMoA2MF
         uc1w==
X-Gm-Message-State: ABy/qLbPuO+sngtM5Og0Kik8HEzyi9LKmyXns6WLIqg36xi19tBmjHEp
	iFodtsgIpD7wwSliM193KmBrHmswPqDeTJrrk+I86A==
X-Google-Smtp-Source: APBJJlHMfkHH25DLwwV0K9/9EhfH7Bdp28cKK+QEXeEDiYvJ40OZFtBocR/hGVgA0U/ALHh5KpjO0Q==
X-Received: by 2002:a17:902:c94d:b0:1b8:64a9:ea60 with SMTP id i13-20020a170902c94d00b001b864a9ea60mr11529508pla.53.1688484637566;
        Tue, 04 Jul 2023 08:30:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/30] dnf: only write the log lock to root for native dnf
Date: Tue,  4 Jul 2023 05:29:31 -1000
Message-Id: <207cc7acef40f92b5de306aa6f035258c0eec828.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183864

From: Changqing Li <changqing.li@windriver.com>

From commit 742a1b7124, log_lock.pid is writen to root, but following
file is not changed, which will make it never deleted, and an unexpected
file exist in root dir after boot target.

$ tail  -n 1 etc/tmpfiles.d/dnf.conf
r /var/log/log_lock.pid

Besides, root dir may be read-only, so it is better still
keep the log_lock.pid under /var/log, only write the log lock to root
for native dnf for fixing issue mentioned in 742a1b7124

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dnf/dnf_4.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.14.0.bb b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
index 62df8c4ace..95007c9c4b 100644
--- a/meta/recipes-devtools/dnf/dnf_4.14.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
@@ -15,9 +15,10 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
            file://0001-set-python-path-for-completion_helper.patch \
-           file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
+SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
+
 SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


