Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBgC4-0001Yn-77
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 08:13:00 +0200
Received: by obblz20 with SMTP id lz20so2111514obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vxiY5Kq590AOFqWhCb6W1peds/PW8CIW7a723Xv3GJo=;
	b=yUtU0lnoyMru8BL2aGzG26VE/6y6wcbWYzNfiCgsn3kTUP7R8PkbkN6psyxhO3miGn
	Pz3Si+0DqeleW2hN31X10MedVzvQGuYj858i8cNNwaJ237v5hlGheMTKzdGlQE8s/Lra
	st7I3GGAq3PX/qz/2lfBFMgbhqWGCUQ1B42mr5iI5yKNPBPGzsO5UEHUdEPCFD0JRKxy
	YVRh7iIpcUmZ00aOkML178LnPTDZb9VzDv4pYc9e1E8g61bu5k+9CPVMOcW7F9e27NKP
	4jCRsY1RgFWHj1PFvVIcwnGE1R3bTg7OZToXfGxhzoUS/8IjeOda/VixBLrKKriTV9YJ
	C4RQ==
Received: by 10.60.12.35 with SMTP id v3mr21343635oeb.13.1347429628136;
	Tue, 11 Sep 2012 23:00:28 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id k8sm15262335oeh.9.2012.09.11.23.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 23:00:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 22:59:14 -0700
Message-Id: <1347429555-32159-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] runqemu: Explicitly specify MACHINE when calling bitbake
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
X-List-Received-Date: Wed, 12 Sep 2012 06:13:00 -0000

When using runqemu with distros outside oe-core then
MACHINE may not be there in local.conf so use the one
thats available in environment of runqemu which is actually
the correct one.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a3c3509..e843946 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -281,7 +281,7 @@ setup_tmpdir() {
             exit 1; }
 
         # We have bitbake in PATH, get OE_TMPDIR from bitbake
-        OE_TMPDIR=`bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
+        OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
         if [ -z "$OE_TMPDIR" ]; then
             echo "Error: this script needs to be run from your build directory,"
             echo "or you need to explicitly set OE_TMPDIR in your environment"
-- 
1.7.9.5



