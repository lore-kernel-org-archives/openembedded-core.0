Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93F5C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.78405.1690740098952324677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yPdIPWNe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6873a30d02eso153167b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740098; x=1691344898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtInZUa14qkh2GR2leBQIsfJ1yHmtX7TcTVKUsy/IF4=;
        b=yPdIPWNe26hbk5M625+7YtZw8kz8JnATPBqo7MATXmkgh4E4ppvyDlxcqrzoE6Tydb
         m4n1MgIGTYpGk6rTSsJeQemMEJ+QHre3vkKiJzImjZg4lFAqKw6Ea0KQe47fd3y8ERGy
         6sd/nFkA60VC6DX8O212cfs49kV7wSt/hZDqEgUkzmdaYYOGVl8gEYEON5F/xlhplQYd
         9ei0/4RAzUD07ixXYbqOlHrU07xwqN1LD86N/W3vMidEk2a2Hbbia0faWPk+kUEHZHa6
         p6Savp/+fQwfMXeSGF4194D2vAscc1SvVASS+AluS5ms6jzLKQ5/9kVYLOw+vzcVSqh1
         9GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740098; x=1691344898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtInZUa14qkh2GR2leBQIsfJ1yHmtX7TcTVKUsy/IF4=;
        b=Dpdt/TlubeMDxdBqiR/OfugPf+PjXGPofMtnBJV8Sn+AeIGnZm8oMEPU9bjA3nYcF9
         bSJfKzcm/fAPWufL01VB4zUz7+SsmeOkTIvwztwNw5q2Twu2/+Zdou+rIqSSorhrjrD1
         HvKz7oQV2q4+qS3iZeS/2wwE2eAchSxDVQWnaJHvCJdrH66J+fwmccYdGG5xlnbFFyCN
         zPlQjxpa/dk1iCXeGqMZ2W7jsjVKz+x/dMt0/t7UF8/XBzJ3afxu3XQv8TRdz7w80A19
         TCRiKq4pL4IwD3+eub8egJ0WPbM2ThJMGOEGquE6sKU+tIm8wxlpp7ODD6qU8ZjjHOS2
         kfvA==
X-Gm-Message-State: ABy/qLb0jKYiRg0kBeOCuPiu1V7hwlAt4tMQc99BZpasPGBlCl3JuLbd
	icvLNaCLfrAbX8pykGpeR+Dp7ZQ6VmQFZQ5whF3BCA==
X-Google-Smtp-Source: APBJJlHMjmNpQYbPnwSzr8GqHzIZeNqfYYsK5ozgpMBk79pr5YEEjuDbEWcvvD112Dr+v5bRZaCVQQ==
X-Received: by 2002:a05:6a00:2296:b0:687:1be4:46e7 with SMTP id f22-20020a056a00229600b006871be446e7mr6924499pfe.9.1690740098065;
        Sun, 30 Jul 2023 11:01:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/30] mdadm: fix 07revert-inplace ptest
Date: Sun, 30 Jul 2023 08:00:44 -1000
Message-Id: <e45cf0306645e501ebde9aa3e626cb1a9d0c4d54.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185099

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Testcase 07revert-inplace fails if strace is not installed:
...
strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
tests/07revert-inplace: line 40: strace: command not found

Add strace to mdadm-ptest RDEPENDS to make sure the testcase passes even with
a core-image-minimal build.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d9386663ac52ab69812867a0823c6055aedbc18)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index af486e6d9c..aa97eef3ce 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -99,7 +99,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.34.1


