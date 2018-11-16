Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id A4B856C193
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:40:42 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id e3-v6so24176722wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1mIaNF3gVCX7MF6sSjSobxRQqbTLBsEICFYLf7tIrJc=;
	b=eMxZ+u36sLC4ZmClz8UlngQSduuV+TViygOtIhYp76FBFfiuQDHWHQwV+4Z+DJfQxD
	ipvh+DXtLk68bFTWIkWuVsU9r9QW3v1YXBsKFiHUd4BmbMKYSTt9pANChRYpEqR3J6+K
	NNAL3MbYXZHlfOFti9r+bRSkmifYtYLRUwLeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1mIaNF3gVCX7MF6sSjSobxRQqbTLBsEICFYLf7tIrJc=;
	b=uREhzP+Okc+VzDKTWRqniBijO34c/bAA8XvUlEF5nk+GN4jKIBftiIXvmBTr/I0jkU
	7cozSr2a5CsmdJ6FWD61l0VNybmEFeyKQXAi9tXDp78IJxf67s409ug0yYVtK6nnggig
	6/qB+8/fecBk2Nn2cc5uYpLluCfaAh4qqCrUfj2DC4R5trwUJ06XC2cE7ZgZ/aqvzDnc
	xFJr4Gm7zCfUN5ts0ud0lw8nK1NuuaW59AQ+Pn64xyVbFt4SpkxQlYBYiEotvDo0qWH/
	aI+r9+KvJb37qiItE7VLGbKM/a3I/vFuvYUIcgeFcRr9vtLupJCupbw2QQQ9gXHawYrJ
	j83A==
X-Gm-Message-State: AA+aEWY7pkjWw8mYxazqoJI92kP+sXvMPI2bbaWmvj0OGOwUBkcaztJ6
	emGTxrwp46UATk6vFBhWMIzBodbyZgg=
X-Google-Smtp-Source: AFSGD/V0GIHG+/7UaMzGdfv9JJYs7VqEvGyMr1KjQ/otyDacIl/V15GPQV8SB0lyiJGOu6dsmTzddA==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr3338433wrv.87.1542361242927; 
	Fri, 16 Nov 2018 01:40:42 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27-v6sm24554039wro.24.2018.11.16.01.40.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:40:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 09:40:37 +0000
Message-Id: <20181116094037.4220-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
References: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] testimage: Enable autorunning of the package manager testsuites
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2018 09:40:42 -0000

Now that the hangs in httpservice are fixed we can let these tests
auto skip as appropriate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index ded72048bcc..92e56862d48 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -44,9 +44,7 @@ BASICTESTSUITE = "\
     ping date df ssh scp python perl gi ptest parselogs \
     logrotate connman systemd oe_syslog pam stap ldd xorg \
     kernelmodule gcc buildcpio buildlzip buildgalculator \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg', '', d)} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt', '', d)}"
+    dnf rpm opkg apt"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
-- 
2.17.1


