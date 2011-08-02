Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qo496-0007Ug-N7
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 03:51:48 +0200
Received: by pzk1 with SMTP id 1so12349011pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 18:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rE6G5WMRJiY9USRbd/SwsWiOqANopw6ZSX30Ewy149s=;
	b=ScofV2YvXrmOzGm53RYNO007ONhiz04wlnz+hdYmTIHWUWn6qy9NqQzHwaRMhaG/LY
	MvPsiPeTUSsVB2MetPI+5HjEeHxIbFBQv/oh+YAneQc/dulRhcdxrmkIpGFLbhd1BPca
	2UcrwQpxrE5ILKNE0RjsUskZUl11nVrw5yWis=
Received: by 10.68.30.39 with SMTP id p7mr6522826pbh.362.1312249646939;
	Mon, 01 Aug 2011 18:47:26 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b4sm6172321pba.11.2011.08.01.18.47.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 18:47:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 18:47:13 -0700
Message-Id: <1312249633-23675-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] scripts/runqemu: grep for line beginning with TMPDIR
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
X-List-Received-Date: Tue, 02 Aug 2011 01:51:49 -0000

Currently the grep regexp matches any occurance of
'TMPDIR=' but if you have another variable defined
e.g. OE_BUILD_TMPDIR=xxx then that gets picked up
too.

$ bitbake -e | grep TMPDIR=\"
TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc"
OE_BUILD_TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x"

So we become a bit more stringent and look for
line starting with TMPDIR

$ bitbake -e | grep ^TMPDIR=\"
TMPDIR="/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc"

make sure that it greps
only TMPDIR=xxx occurance and not values of other variables
whose names happens to end with TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dacaf7c..9611c64 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -271,7 +271,7 @@ setup_tmpdir() {
             exit 1; }
 
         # We have bitbake in PATH, get TMPDIR from bitbake
-        TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
         if [ -z "$TMPDIR" ]; then
             echo "Error: this script needs to be run from your build directory,"
             echo "or you need to explicitly set TMPDIR in your environment"
-- 
1.7.4.1



