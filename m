Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 057C174666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 16:17:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3DGHbNJ013211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 13 Apr 2018 17:17:38 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f71OL-0002L6-Gm; Fri, 13 Apr 2018 17:17:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 17:17:36 +0100
Message-Id: <1523636256-8954-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: [PATCH] bitbake.conf: Set and export TZ envvar to UTC
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
X-List-Received-Date: Fri, 13 Apr 2018 16:17:39 -0000

We just ran into an issue where tar failed to build on one server setup
but built everywhere else just fine.

It was running makeinfo to regenerate some docs files and makeinfo was too
old for the host it was running on. There was no dependency on makeinfo-native
as it was not meant to be regenerating the docs.

It was being regenerated as a date from a timestamp used in the docs
was different in Asian timezones than in the other timezones our builds
were being tested in.

I added an entry to https://wiki.yoctoproject.org/wiki/TipsAndTricks/
about how this was debugged.

As such, lets default to setting and exporting TZ to 'UTC' as was already
pioneered by the reproducibile builds work. This makes the builds
deterministic.

[YOCTO #12665]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build_simple.bbclass | 1 -
 meta/conf/bitbake.conf                         | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index dd11cd9..8a60dee 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -4,7 +4,6 @@ BUILD_REPRODUCIBLE_BINARIES = "1"
 
 export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
-export TZ = 'UTC'
 export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 60590e2..ec3207c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -539,6 +539,7 @@ export MAKE = "make"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = ""
 export LC_ALL = "en_US.UTF-8"
+export TZ = 'UTC'
 
 ##################################################################
 # Patch handling.
-- 
2.7.4


