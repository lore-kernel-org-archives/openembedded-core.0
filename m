Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8E872600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 23:57:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 25 Oct 2016 16:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,548,1473145200"; d="scan'208";a="1050140255"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga001.jf.intel.com with ESMTP; 25 Oct 2016 16:57:57 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 16:59:27 -0700
Message-Id: <f43feb2283048aa01ae19eb79620961c38de5699.1477439714.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1477439714.git.brian.avery@intel.com>
References: <cover.1477439714.git.brian.avery@intel.com>
Subject: [PATCH 1/1] This is a backport from master of 2 consecutive fixes.
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
X-List-Received-Date: Tue, 25 Oct 2016 23:57:55 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

First fix commit:
1100af93cb07caf24d568c039d52fb0c80714c30
Second fix commit:
b7b2e348716161deb21c9864ac5caa5f1df1fa9c

The error these commits fix can prevent Eclipse debugging on
certain target configurations.

* base-files: Add shell test quoting

  tty can return "not a tt" which results in warnings when /etc/profile
  is executed.

  (From OE-Core rev: eed586dd238efe859442b21b425f04e262bcdb2b)

  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

* base-files: fix profile error under < /dev/null

  Previous attempts to constrain execution of `resize` to only TTYs did
  not properly handle situations when `tty` would return the string "not a
  tty". The symptom is "/etc/profile: line 34: test: too many arguments".
  Fix this by utilizing the exit code of `tty`. Also use `case` instead of
  `cut` to eliminate a subshell.

  (From OE-Core rev: e67637e4472ff3a1e2801b84ee3d69d4e14b9efc)

  Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
  Signed-off-by: Ross Burton <ross.burton@intel.com>
  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/recipes-core/base-files/base-files/profile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index ba1b9ba..1f02e52 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -28,10 +28,12 @@ if [ -d /etc/profile.d ]; then
   unset i
 fi
 
-if [ -x /usr/bin/resize ];then
+if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
-  test `tty | cut -c1-8` = "/dev/tty" && resize >/dev/null
+  case "$termpath" in
+  /dev/tty*) resize >/dev/null
+  esac
 fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
-- 
1.9.1


