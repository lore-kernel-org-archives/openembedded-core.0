Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDA17F421
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:39 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q21so2337030pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=AOaMQCM0J/ViXzRWuubskONZbztqkcBchFuG4e4cnoJ5McGkKZlcKitNMyvVM79+SB
	Xt8er/RUhaiXVkac1D+aTfeG654su+4lPWseF04InIsboJT7Ch1jldlF5cOpsaco1kpC
	EVMLAzfcZxGvLQpQW4fDx56o/yk61W4vj0wSR/901WV32GXB6H1nEW5MGsnujh4ZSWJq
	mxnToh6s1FGie3baEZYUhq5XqSjDLXHKLgRR0rNHB6WQuHEGAdd7WKiBmNKmbf6CRVJn
	LZt12kWHcJFBk+VpHy/ZI01SvaklUAxsn+cIdJzM/lGPPsCxXihqF48xnlVVlntc3kOb
	eFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eUthZrTjpLjld+E3kjiQNxNY284z5Qh/gYW7uFklMjk=;
	b=VyAua8hn19U3TqrEicle0oSp1Mbhty3MDZs7TN7DXbz+YGgGydqUP0kw/ZRIWcqMNd
	yp6iOBmc9GjQgtTyrNDaWADWcIB7EmtQ4sz5dtpFfWQ9WFR66qhOWxRCpvzmk5YEvTFj
	rwKntXZ7QlixfKzVju4jOY48Ow1Iwtw3DgrT3OT7aX6Uy0iHAxoycihs9Hzf5VIjJPom
	LGC8XaCWKvNWIlIdL1wfu+mRGFZRWoH4Fcmqk6cLcnxnqCpcL5Ij8ly94TRGZOTcxMvg
	RwbBcWYY62QHRCf/l2CJjf9WrjEASJxoVE9DOhkw8D5H+WTcJDMVYIOq11At9z/n0uYx
	W2QA==
X-Gm-Message-State: APjAAAVI04BRhRnzkutxp4IWZjp5yhlxYakcjp5S7conB20ybySYrUuy
	32p747Hzbu1xt/RBfOGI9MoGXKCw
X-Google-Smtp-Source: APXvYqwmnoH3On/6CC3eQCSLwG4ZTcjlP9u1L2AHgdoYrTnLD8177a3IvJCPzYRshp5QPbV3/jaLUQ==
X-Received: by 2002:a63:29c7:: with SMTP id
	p190mr20805879pgp.124.1567348600201; 
	Sun, 01 Sep 2019 07:36:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:54 -0700
Message-Id: <412676ac26ac78cfb42997f0d39174e62e2c6462.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 16/43] rng-tools: fix very long shutdown delay with systemd
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:39 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

The systemd service file has DefaultDependencies=no but is not
properly configured to also stop the unit. Because of this the unit
keep running after shutdown but systemd still waits for it to finish to
then later resort to a hard kill. All this take 1m30s with the default
configuration.

To fix this problem add the missing Before=shutdown.target and
Conflicts=shutdown.target to have systemd stop the unit on shutdown.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index f0355db..5c8253b 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -2,7 +2,8 @@
 Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
-Before=sysinit.target
+Before=sysinit.target shutdown.target
+Conflicts=shutdown.target
 
 [Service]
 ExecStart=@SBINDIR@/rngd -f -r /dev/hwrng
-- 
2.7.4


