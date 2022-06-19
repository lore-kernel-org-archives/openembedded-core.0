Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E166ACCA480
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.22292.1655667321367033970
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o6akNAnm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id f8so7990891plo.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uhoYbVhcOVSoviKAByMea85CKCrCq+tjBPRE5Mk8/zc=;
        b=o6akNAnmR4IckSCC1bG7tZf6bnPYY9D4Em2lWubXoEBElZuzfAe805axmMi5jgaaSt
         ZbwbcbBALMUQMFD8kNxLybZLn4g9nJa+9DYnI64J2A1JPHdAx6L+VmvfeKI3JXXceq3S
         z3y/RZU3/wQGDPpVbsBHCW9sLFcNRPcyOqLmGJSDgUxQjhzOdBgYwXhzMlF7ZUB9TWHl
         +sGBj3C1IQNg8SOKZ3c9dvEhOXKqYtH47CnCGqEAk77Z7NmD3gaiooRzkMHJKd75D0LL
         ZIY6a8e+vhibW4jLVFnD35bNpwOj8xH86kw5m83XKFSb1MfFqk4/Qq/UyujKjlAaOKw0
         eVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uhoYbVhcOVSoviKAByMea85CKCrCq+tjBPRE5Mk8/zc=;
        b=xtsEsc2/QxbyyvUNlraLjSQCytwPL7aSd12GWaWIe8cNAEUJjKSXmYMP/j4IkVm9dL
         k4n3WDCimUD3WaaVvC8Fh4J7W5jeg2p1wkgYbOe2hOWesWl5K5DnUacHtKfMMbfUgLzj
         zE9eIXTVFgFvPYxJ21bZo76cjXJskRBAZkz35Uotc7nMiD6bbzvZlrUN427/KTNuqw3X
         twD2QUASPjZ8AilZGm8tYaLVmPMM1LQhw7F8oGDCT3+O46B1AJqksdXq+KuMpqfx2p1n
         6Efp5WN6ZM4kF1dpIxe0cbCJFwDklFLWkSK9tcDuJN0a2Tsx0iEED+uwPXYXByvtfXzk
         y28Q==
X-Gm-Message-State: AJIora/zGkgnkAReYwASGhuwbbu1sDFTwm8iw74t12CkC0ytlk/b7VaL
	AljoOSh+oZ+ZUfv+nCsh144GYOiKm5vbPDba
X-Google-Smtp-Source: 
 AGRyM1ssvMeSmbOdTXDs8R1Nai/6F8G8+oJ1fh/a5RloD1UC2ceLSxhT5J3ZRRRVB8hFDx4xjS91iA==
X-Received: by 2002:a17:90b:384d:b0:1e3:1266:d378 with SMTP id
 nl13-20020a17090b384d00b001e31266d378mr33791114pjb.127.1655667320381;
        Sun, 19 Jun 2022 12:35:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] openssh: Whitelist CVE-2021-36368
Date: Sun, 19 Jun 2022 09:34:56 -1000
Message-Id: 
 <179b862e97d95ef57f8ee847e54a78b5f3f52ee7.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167064

From: Pawan Badganchi <badganchipv@gmail.com>

As per debian, the issue is fixed by a feature called
"agent restriction" in openssh 8.9.
Urgency is unimportant as per debian, Hence this CVE is whitelisting.
Link:
https://security-tracker.debian.org/tracker/CVE-2021-36368
https://bugzilla.mindrot.org/show_bug.cgi?id=3316#c2
https://docs.ssh-mitm.at/trivialauth.html

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index ddc9ed0b32..eaec26cac0 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -60,6 +60,13 @@ CVE_CHECK_WHITELIST += "CVE-2008-3844"
 # https://ubuntu.com/security/CVE-2016-20012
 CVE_CHECK_WHITELIST += "CVE-2016-20012"
 
+# As per debian, the issue is fixed by a feature called "agent restriction" in openssh 8.9
+# Urgency is unimportant as per debian, Hence this CVE is whitelisting.
+# https://security-tracker.debian.org/tracker/CVE-2021-36368
+# https://bugzilla.mindrot.org/show_bug.cgi?id=3316#c2
+# https://docs.ssh-mitm.at/trivialauth.html
+CVE_CHECK_WHITELIST += "CVE-2021-36368"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.25.1


