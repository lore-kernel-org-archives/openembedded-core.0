Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 878AB77029
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:45 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e65so142597376pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=340fvUQlt7JhS1xtRQYOSmeEWrk+1Lhk/hDO+7PQpi0=;
	b=mrsynXrvA1O6BXqsXcm2z0jwxRmI5Ehha7/W6AvWpoYpmZoSpVtSMBx7ER80k94NAP
	Nk9e4lJ9j8AgJmi/TPgxJXUfKT/v0bpaeT5IkLQX67+feSTo+DdCyN7KuZAojtIMwlWW
	ysQEVLsawx0YvKtQXvXVlkaArht9Xjwyu/OnsLpKbAqXOmbyGqgzYmNI0EGRumHBvF6I
	YQ1XALyD2nrq7ZMInHsaX9Y5TkhklT0/AoLap3xuNalf16vztGMJxGugFIX8Z3iytCcH
	jgq74bRx+4wpnZmA+8At8R5l7D8ttizxxgP5M3oPT8PE4RH+OtbDRB7aTO0PGkZ5Jsb+
	F+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=340fvUQlt7JhS1xtRQYOSmeEWrk+1Lhk/hDO+7PQpi0=;
	b=TwPPp+bpOSFHwFQxJReCoA7bBiQ8l/ye2UIgBE/dkhixEN9Ws1EIrZIy4nNJ0GtWT+
	m/LzQ4PhujnIoT4ggU/7yQmh/svU8QFDyN6q02FgkKnhH/1Cm+yyJB3fLVdKLcyIPHmV
	J1kk+kXmCnco+9Q4SvSzg5d3icsvlZ18rghYwo1LmbHtaS3+zwCnhILJBHeSQ/tj7kHR
	pbjvnENjMkGZWDuCaAt8Jxrrx6ebT4C9hT9l1LwgqrfKzPRG2+ezoKnGwqTY84zDbLAU
	Zha7Uig6twMneWheVIoZLWMpzJMRHZpZNJcZ8DMkDKC1Benm923Df6yT1aFEE7VfylH7
	0WNw==
X-Gm-Message-State: ALoCoQkCv4u9O0xzkOBFVZQ945zh33oRg8fqJ+b6uZPeRvpQzH0BjplRKp3vPVVYxAYvFFRiDfw8DtYhcxsUCfCSVg1ZNo1plg==
X-Received: by 10.98.69.93 with SMTP id s90mr28172442pfa.77.1453030666268;
	Sun, 17 Jan 2016 03:37:46 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:24 -0800
Message-Id: <a430918d3d3c0fe58d3cc8ea3d8178e3980c571e.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 51/73] db: Use cross libtool
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:45 -0000

db is not reconfigured like usual autotools based components so it
generates its own libtool, and this libtool is not equipped to do cross
builds, e.g. when building using clang on musl, it misdirects linker to
use libstdc++.so from build host instead of target, the reason being it
does not understand sysroot.

Use cross libtool instead to build the target versions

Fixes errors like below

| libtool: link: arm-oe-linux-musleabi-ranlib .libs/libdb-6.0.a
|
/a/builder/mnt/build-oe/tmp-musl/sysroots/x86_64-linux/usr/bin/arm-oe-linux-musleabi/arm-oe-linux-musleabi-ld:
error: /usr/lib/libstdc++.so: incompatible target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 1 +
 meta/recipes-support/db/db_6.0.30.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index e8b814e..3dc1da5 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -76,6 +76,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
+EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index db9f0ab..eac84b8 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -83,6 +83,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
+EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
-- 
2.7.0


