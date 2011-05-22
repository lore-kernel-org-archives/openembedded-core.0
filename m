Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QO024-0006sY-6z
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 06:12:49 +0200
Received: by pvc30 with SMTP id 30so2250855pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 21:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bRIFH2QYKdc/c5Xmn2aVM0oggHCahSXPaMDLTujTUIw=;
	b=ECwxr4JYv5g9mJWG4ywY0enc+K4VzOTr9Zc8Y0H+bVqyTOu7niSv5/ZymYbH7LxW5B
	3mf09031ju5Z/PMLoWBH+2S8dT1ecHHkhl60AIliBUPjfjz0fDHv6+sKDJMl+R15jif6
	eGn0NvWMA33scdcQpZtKwdMWwvxt/HxtjHAjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lrXksh6JvYAqzoq7XV43Y2QihBC9TGhOQhs28ulpTxGodPeG30eyYcSB+jOkQ/iGlL
	raufb0q6sCO/XuWmdiH3HjbZvpVWMSXBB1F5gTmbcA5TvZakSpzWv5TrUn7VLDTtjGrI
	QhGx2T8yeaJD6Sw/q8p7YeD44acTcCeeMe7pA=
Received: by 10.142.170.19 with SMTP id s19mr589849wfe.401.1306037388779;
	Sat, 21 May 2011 21:09:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm3485985pbj.63.2011.05.21.21.09.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 May 2011 21:09:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2011 21:09:31 -0700
Message-Id: <c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306037150.git.raj.khem@gmail.com>
References: <cover.1306037150.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Sun, 22 May 2011 04:12:49 -0000

* Currently we are passing -jN flags to eglibc makefiles
  however eglibc uses a make variable called PARALLELMFLAGS
  to pass information about parallel build to sub-makes

* Currently make install ran without parallelism but now
  it should have parallel building flags passed to do_install
  correctly which inturn should improve build time of
  eglibc on systems using parallel build -j with values > 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 8314cb1..39972b0 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -36,4 +36,10 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ARM_INSTRUCTION_SET = "arm"
 
+# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
+# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
+EGLIBCPARALLELISM := "PARALLELMFLAGS=${PARALLEL_MAKE}"
+EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
+PARALLEL_MAKE = ""
+
 PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-- 
1.7.4.1



