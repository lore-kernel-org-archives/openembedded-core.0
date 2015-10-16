Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAAF276FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 02:27:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G2R5E0007773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:27:05 -0700 (PDT)
Received: from seebs-worktop (172.25.40.228) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 15 Oct 2015 19:27:04 -0700
Date: Thu, 15 Oct 2015 21:27:04 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20151015212704.77942702@seebs-worktop>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Possible patch for build issue (mostly affects mingw, but see below)
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
X-List-Received-Date: Fri, 16 Oct 2015 02:27:07 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I'd like a second opinion on this. Without this, we had very strange build
failures which ended up being using the build system g++ with the mingw
"host" (in cross-canadian land, this would be the machine the compiler will
run on) headers. On study, the issue seems to be that libcpp is now being
built for the build machine, but it's using C++ as of 5.2.0... But
EXTRA_BUILD_FLAGS does not override CXXFLAGS, only CFLAGS and LDFLAGS, so
you end up with the regular host system CFLAGS, which are the mingw ones,
being used with the build system compiler.

Without this, I couldn't build gcc 5.2 for mingw. With this (and adding
libgomp to the RUNTIMETARGET_remove_mingw32 in meta-mingw), I could.

However, I don't think this is actually mingw specific. I think that,
without this fix, *every* build ends up using the host system's CXXFLAGS
to build a build-system libcpp, instead of the build system's. It's just
that, since they're usually compatible-enough for libcpp, no one ever
noticed.

(Sending it out to the list as a plain patch because it's easier to read; if
people want a pretty formatted gcc patch for oe-core, I can do that, and I
think this one should go upstream too.)

Author: Peter Seebach <peter.seebach@windriver.com>
Date:   Wed Oct 14 17:10:10 2015 -0500

    Makefile.tpl: Also pass CXXFLAGS_FOR_BUILD
    
    When doing a FOR_BUILD thing, you have to override CFLAGS with
    CFLAGS_FOR_BUILD. And if you use C++, you also have to override
    CXXFLAGS with CXXFLAGS_FOR_BUILD, or you end up trying to use the
    mingw headers for a host build.
    
    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>

diff --git a/Makefile.in b/Makefile.in
index 36b4008..b64ef77 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -169,6 +169,7 @@ BUILD_EXPORTS = \
 # built for the build system to override those in BASE_FLAGS_TO_PASS.
 EXTRA_BUILD_FLAGS = \
 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
 
 # This is the list of directories to built for the host system.
diff --git a/Makefile.tpl b/Makefile.tpl
index 1ea1954..4f73d66 100644
--- a/Makefile.tpl
+++ b/Makefile.tpl
@@ -172,6 +172,7 @@ BUILD_EXPORTS = \
 # built for the build system to override those in BASE_FLAGS_TO_PASS.
 EXTRA_BUILD_FLAGS = \
 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
 
 # This is the list of directories to built for the host system.
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

