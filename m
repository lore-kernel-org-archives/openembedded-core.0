Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833EDD5AE5E
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:21 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.64158.1730950697111932887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xbxr3Ozg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so455634a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950696; x=1731555496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpnrF7DbjPXCVwT9oERqCmWHPHl9zb5oOn80hkJTT2E=;
        b=xbxr3Ozgwf3uymrpwQ7Czp3eSx8Kkayrgs7KYZehD+Xud/SZR8cgCvW46LNO2fmOdV
         tNOnbPD5LnoWg+4HVhdnpxMNrz3uvuihzYcm0p7boMUsjS4fP5CrylQ3q62x/kUkdsbz
         0UdpbZpIDwlxm5VCI/5L8M71vO2kAM7mmqH+YiQ73puV4YbnQ4Hcp2Ym7JiUrWkgUu1O
         pZqRlOb3soiifDBlG2bu1ZO6lpPWeUzDCXsIbzNp2Ea5pvHQuB0B4ayoD7tJKzUkk279
         qqThZbw1bRyEOgILxoLqwbQgy3IPKdJwn61RvB2rxpze/SDf1bkm7p4V9orn/9Ef9D0n
         6CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950696; x=1731555496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpnrF7DbjPXCVwT9oERqCmWHPHl9zb5oOn80hkJTT2E=;
        b=MxfaT7EAUHl1Wopv4RJVcAzCsdG1U60eZRuRBOmcXdCbFhjv4IincG8Iw/tVo9U2Qk
         V0dhCCYssO0QrRmXE8uC/FaUjBpw8wzFY6dYAcSFAJPF9V/RKYemySUWssV1tUnUkEe8
         inqeqoPX3P7AaiA54u5S72yq8k0ebFI2DFTEpImdZEe8qcdqmhWH4SFwOUHSvVlEzkk0
         yPdF7CcIOj4E2vBJcsquynTFO+HVY9VU0+49MX+zc2OKrwKbY916L6mtmLDEID5/pDvt
         nHcNCOvSPahJ7QYer7IfFgvWIuHOFCar9kQ3r6B/CFNoybE5glEuh06Xhbv1uvJjHiU3
         7uoQ==
X-Gm-Message-State: AOJu0Yw0+Z/NMepE/wva6NCs8wq+c9qBM4c3wfgO6fSru0v5WUWnzos1
	72skwd59i69l/hPtm1K7PQu50fn7JoqaTH56BnJUkH2QtzfGMLciES7prs6Eh6m7Qjm+DCtTbuy
	X
X-Google-Smtp-Source: AGHT+IFrMU8QIBspsWZ4caN3e1AfpbW2j8WzXNWZpUVs47nFe9vI56TGkHqQlY3Ac22WQKbQpGMGQw==
X-Received: by 2002:a05:6a20:4c9b:b0:1d9:3b81:cdd3 with SMTP id adf61e73a8af0-1d9a83ab2d9mr44593242637.1.1730950696419;
        Wed, 06 Nov 2024 19:38:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] e2fsprogs: removed 'sed -u' option
Date: Wed,  6 Nov 2024 19:37:49 -0800
Message-Id: <5b3b290baa0a83f493b7ca25d5ffa5ff279bcc69.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206827

From: Aditya Tayade <Aditya.Tayade@kpit.com>

In embedded box, sed might be provided another providers like Busybox,
hence use generic options whenever possible.
/bin/sed -> /etc/alternatives/sed
/etc/alternatives/sed -> /bin/busybox.nosuid

Here used 'sed -u' option is not necessary, hence removed it.

Fixes below error:
sed: invalid option -- 'u'

Also added 'set -eux' option which halts execution of the script
on any failures.

Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07caee1829d2a61bc018fe0e37ecd482922179ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 279923db8e..1857a17189 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,7 +1,8 @@
 #!/bin/sh
 
+set -eux
 cd ./test
-SKIP_SLOW_TESTS=yes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+SKIP_SLOW_TESTS=yes ./test_script | sed -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
 rm -rf /var/volatile/tmp/*e2fsprogs*
 rm -f tmp-*
 rm -f *.tmp
-- 
2.34.1


