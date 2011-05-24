Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOxB8-00029J-Nf
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 21:22:06 +0200
Received: by pzk36 with SMTP id 36so3193670pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=VmIgMYSFPcX0jY1aSLNizQiDoYUsFCiH8CM7gz8xD3E=;
	b=L/isLOIXBv7AXdb48wEy8vSOLiUS2lBSoW0BXOZqTeHzNcV7yQkY0I98gyMUj84l4Y
	0jJeG6ipzKvkCB21yF7SiSfY+r7XLDHmhs9298CmrR/fxng8+TnferiA6UsXFIPpfctb
	GJ2i0FH1CiGjBMnf8Xzm+hBzbKnn6/oRwIFvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PlrCA22zHan/QlDhduOUwKFBZbHIBKKIVgKdP9deXNfgYK2PPK33Y1cbFLeTQe/+N6
	SzLeMdzpdIHyxN7tqI4aKb2t/w+1cBzfEvxlW120T6R7vmPhm1Z2c/gRtLeEKoSDFkM+
	AqToD7hGjJpamY/jfOG21/Fei2GmLaKinq6ss=
Received: by 10.68.17.7 with SMTP id k7mr3056948pbd.322.1306264744357;
	Tue, 24 May 2011 12:19:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 8sm5171308pbw.23.2011.05.24.12.19.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 12:19:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 May 2011 12:18:53 -0700
Message-Id: <0ee71fe45ec1b664287c1c277238263e3ff277ef.1306264437.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <be1050a4fddcd92e16d666b74670bb26523bb866.1306264437.git.raj.khem@gmail.com>
References: <be1050a4fddcd92e16d666b74670bb26523bb866.1306264437.git.raj.khem@gmail.com>
In-Reply-To: <cover.1306264437.git.raj.khem@gmail.com>
References: <cover.1306264437.git.raj.khem@gmail.com>
Subject: [PATCH V2 2/2] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 19:22:06 -0000

* Currently we are passing -jN or -j N flags to eglibc makefiles
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
index 8314cb1..46ffa82 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -36,4 +36,10 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ARM_INSTRUCTION_SET = "arm"
 
+# eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
+# PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
+EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
+EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
+PARALLEL_MAKE = ""
+
 PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-- 
1.7.4.1



