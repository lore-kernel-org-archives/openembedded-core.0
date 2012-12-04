Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfhaK-0000l3-CN
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 02:46:08 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1371814eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kvt9R/lUGCtrF6ljXGNj1MeNVIF7dZb5Jap3/TB4H34=;
	b=LFKYA2oU4mT8q5LWkYW40/tw7SE5Oi/cQcFqQTZjXdO2G9QhfeVn1PfxMxBSdYWWwT
	pV/ctD2BPFQkpu1N6WcjfXxTf3L/n2hY3uo157RU0JYqOSfcLa5a10LjzAWvTBynZPGV
	3n+jdJ4DF3ohmeXNKsg/qfdHn8OhEcOr6WB2HTH8kbtM/kCp0m514wLfG0WMTbuNCY36
	7LMPJlS7TGP2+9T9e7PPMKx//p7ZmJ9CbmACwUu4C7+X+bhQeN8VsOcHLoVjTjGtXZvx
	T5f3lcp+bgLsFkjSVCIpun7Orhv9DrM8sBMpj/HIj/XcUsUQhhn+bmFslYfv5KRqWWR7
	yPkQ==
Received: by 10.14.177.1 with SMTP id c1mr42474043eem.8.1354584708819;
	Mon, 03 Dec 2012 17:31:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm34690649eep.15.2012.12.03.17.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:31:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:31:13 +0100
Message-Id: <509e905d32aa3e307e66f777c6636e3ca9374a13.1354584580.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354584580.git.Martin.Jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] util-linux: use u-a for eject
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 01:46:08 -0000

* 2.22.1 now builds eject which conflicts with eject from eject recipe in meta-oe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       | 3 ++-
 meta/recipes-core/util-linux/util-linux_2.22.1.bb | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 058f06f..30d80e5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -136,7 +136,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more reset mkswap blockdev pivot_root"
 ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
-ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump"
+ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject"
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
 ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
@@ -147,6 +147,7 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
+ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
 # There seems to be problem, atleast on nslu2, with these, untill they are
 # fixed the busybox ones have higher priority
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.1.bb b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
index c72634d..0177bba 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.8.0



