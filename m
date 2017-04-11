Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7938771CAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:21:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i5so10865710pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=C4Er7jwTmid1hE0FkyWfaZk4z5Qa8ifFNX8YP0nSeHM=;
	b=Y1kbg4jF5Ezf8YLsRZWNJDKsGT7N1IZHo5i80zklcn3r4MgwEMvlFjLskSDhoD/9YU
	PmUr0tMffmGxNr3QVL0yp7yu80v8s6HBY0qtLoWcNRvvp6ues2wuWZURm0TS9b8X4SU+
	S+YDZHb0S0oYuu5uyp/K3zjZy7e3cTupsGbkp4+gKIVHrwbWxS1dionu0yNeAtEZats8
	pRvWrFZcOi3D5mSiAGwqsNB2ocIqmCArMO1aiFAEw/yxIRPfHh1Ot0sJL0IL8OfBcjI+
	U/wZ+7yu5U2KX9wFiiXyMwA1WCZhybug7hIH0+Yr+8c80mkSdZaZIsl8r/Px8LI5odfN
	GmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=C4Er7jwTmid1hE0FkyWfaZk4z5Qa8ifFNX8YP0nSeHM=;
	b=D1jTkDqHvfvmv2x6EekRXchvZOWh90hu3tRRC8SYZjK9eHDAlFTmVG8AYKSFfhFxjZ
	rT7LXveBRct42JGID6O/PgcXCBATgKgqbLD38VvtmwGETurC8BKFIl5O8IFI7JelAwaa
	b2V8BogJbyS15TfVhxtqBWxsFUa+W01WtPb3sru2Nex4s+ZHjMXbppiNBhCK2/X/Rbtg
	AEaJF5lDBaqJaKxDLPwdPF7R4AETTWIGNejgdcw9/rlJdQEQKzwZM9K2Xt0SuavdLtYu
	7WUs0bHPUhViZDM7W5fU6sYBzOt8ob9vqGhLa3c+DRHAkHnOfLOGZ2rIO/fXm40FT+fh
	Wtzg==
X-Gm-Message-State: AFeK/H0L4UGZ/+ondrxyRGJgbmKp/af8H1tXyr8l8bEZG0TtOtpHpcpipksh2TvJvIX8sA==
X-Received: by 10.98.67.89 with SMTP id q86mr59012489pfa.237.1491920496687;
	Tue, 11 Apr 2017 07:21:36 -0700 (PDT)
Received: from [127.0.1.1] (CPE-123-211-196-155.lnse4.woo.bigpond.net.au.
	[123.211.196.155]) by smtp.gmail.com with ESMTPSA id
	f84sm31075248pfa.127.2017.04.11.07.21.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 07:21:36 -0700 (PDT)
Date: Wed, 12 Apr 2017 00:21:26 +1000
Message-Id: <20170411142126.8557-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] busybox: In defconfig enable ASH_CMDCMD for built-in 'command'
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
X-List-Received-Date: Tue, 11 Apr 2017 14:21:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

It is common for *ash shells to have 'command' available as a built-in
function. POSIX 2008 also documents the availability of this command.

Additionally the /etc/profile of base-files requires this command to be
available as of commit e77cdb7611 ("base-files: profile: Do not assume
that the tty command exists"). If it is not available the following
message is output during login on a image using busybox.

    -sh: command: not found

It however should be noted that tcsh and csh do not provide 'command'
(built-in or otherwise).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f649738120..8803b52ac6 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1014,7 +1014,7 @@ CONFIG_ASH_BUILTIN_ECHO=y
 CONFIG_ASH_BUILTIN_PRINTF=y
 CONFIG_ASH_BUILTIN_TEST=y
 CONFIG_ASH_HELP=y
-# CONFIG_ASH_CMDCMD is not set
+CONFIG_ASH_CMDCMD=y
 # CONFIG_ASH_MAIL is not set
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
-- 
2.11.0


