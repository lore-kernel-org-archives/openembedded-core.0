Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQz9-0003op-2G
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:58:15 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1388561pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zz9slaFP+C4SQtr2N03Idp/9vDseT2VerRmHRRUn9Ok=;
	b=IF6A+yjVwc0eKzvoNmoIFIVaCGZqIDxnV07qAeHEFoZ+LFISBkvL+6uFNdl5NZOz4X
	kShX3mc7xJYOHq9JXn3YvmOp4XAVQXy4MgcPNYRFu2hLSc5tXOEPRJo/Y7NVMbpVLwtg
	Wh56DOz6r31msAnqTTZrjGCEig4CC2WLyEd4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PWS/Z2LWhnKBbq6x0Zsveg1yuFLjh93EH0fLH+q6AQnUM4b9yKqJ48YMEu45SAZqLw
	+twW4GRjkmAKAnpfmB4d523Ag0ISzJVY25IK7Nn6S0LcLjMZDoD9jrQwq8VPUsvKDCD9
	WNEu2h98cMIsvzeZCDH+TD4M8FDngprQETvJo=
Received: by 10.68.55.163 with SMTP id t3mr6736718pbp.281.1303757747640;
	Mon, 25 Apr 2011 11:55:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o4sm3195066pbl.98.2011.04.25.11.55.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:55:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:55:42 -0700
Message-Id: <416b4a9aa5805d1c84d0c75d5fd460831ce8e100.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 17/17] alsa-utils_1.0.23.bb: Fix compilation for uclibc targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 18:58:15 -0000

Use libc-uclibc override to cover all uclibc cases

inherit gettext class instead of adding gettext to DEPENDS directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
index 46283cc..46b96ae 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb
@@ -5,11 +5,11 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
-DEPENDS = "alsa-lib ncurses gettext"
+DEPENDS = "alsa-lib ncurses"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://ncursesfix.patch;patch=1 "
+           file://ncursesfix.patch"
 
 SRC_URI[md5sum] = "cb0cf46029ac9549cf3a31bff6a4f4e1"
 SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666a1f7b0"
@@ -19,10 +19,9 @@ SRC_URI[sha256sum] = "b7d05e915e25f8540ad151c6dd558cf0fc1e9bb0ee23052d531c983666
 # please close bug and remove this comment when properly fixed
 #
 EXTRA_OECONF = "--disable-xmlto"
-EXTRA_OECONF_linux-uclibc = "--disable-nls"
-EXTRA_OECONF_linux-uclibcgnueabi = "--disable-nls"
+EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
-inherit autotools
+inherit autotools gettext
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depend on them.
-- 
1.7.4.1



