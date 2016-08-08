Return-Path: <brian.avery@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 86B3E77142
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 03:42:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 07 Aug 2016 20:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,487,1464678000"; d="scan'208";a="1031481291"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2016 20:42:06 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 20:43:24 -0700
Message-Id: <fb600061ac4e973335ea017d65fba7ac7a9918f1.1470627445.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
References: <238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
In-Reply-To: <cover.1470627445.git.brian.avery@intel.com>
References: <cover.1470627445.git.brian.avery@intel.com>
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIIDIvMl0gYmFzZS1maWxlczogcmVzdHJpY3QgcmVzaXplIHRvIHJ1biBvbiBzZXJpYWwgY29uc29sZXMgb25seSBpbiBwcm9maWxlIOKUgsK3?=
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
X-List-Received-Date: Mon, 08 Aug 2016 03:42:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We don't need/wan't to run resize on an ssh connection. It's useless and
it breaks the Eclipse SSH debug connection. So, we added a check.

YOCTO #9362

Signed-off-by: bavery <brian.avery@intel.com>
---
 recipes-core/base-files/base-files/profile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-core/base-files/base-files/profile b/recipes-core/base-files/base-files/profile
index e98e786..ba1b9ba 100644
--- a/recipes-core/base-files/base-files/profile
+++ b/recipes-core/base-files/base-files/profile
@@ -6,7 +6,7 @@ EDITOR="vi"			# needed for packages like cron, git-commit
 test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
 
 if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
-	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html 
+	TZ="UTC"		# Time Zone. Look at http://theory.uwinnipeg.ca/gnu/glibc/libc_303.html
 				# for an explanation of how to set this to your local timezone.
 	export TZ
 fi
@@ -29,10 +29,11 @@ if [ -d /etc/profile.d ]; then
 fi
 
 if [ -x /usr/bin/resize ];then
-  /usr/bin/resize >/dev/null
+  # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
+  # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
+  test `tty | cut -c1-8` = "/dev/tty" && resize >/dev/null
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
 umask 022
-
-- 
1.9.1


