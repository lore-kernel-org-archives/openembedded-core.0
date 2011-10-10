Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDNFb-0006wI-Po
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 23:19:07 +0200
Received: by gyg8 with SMTP id 8so5874765gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=s9oNykYgMCvCVIrnHwQXGbiubWgXN2ab4GvMkqaRTMc=;
	b=joooj2DwG81rM7EdWvXDFiwqjQ/8umdnCX5R0Tx67hbmx6Sv+O2dGwONvjO+mMyNXS
	CbH9yMyMSmNUC6Wd0QSQoQ9YwFFrpPCtY19yFAXQtmU8gZ9FfUudVEtz4bdZiJty64aj
	t1Q4Bf8rI6VPTjeYRqn/4JRh2L6STwn0rIUu8=
Received: by 10.236.185.131 with SMTP id u3mr26917636yhm.52.1318281203437;
	Mon, 10 Oct 2011 14:13:23 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id o50sm12052228yhl.9.2011.10.10.14.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 14:13:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2011 14:13:05 -0700
Message-Id: <42ab3ed1bea2342af7061a93c911eced0a6d2bbb.1318281075.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318281075.git.kergoth@gmail.com>
References: <cover.1318281075.git.kergoth@gmail.com>
In-Reply-To: <cover.1318281075.git.kergoth@gmail.com>
References: <cover.1318281075.git.kergoth@gmail.com>
Subject: [PATCH 1/2, v2] autotools: fix multi-word arguments for EXTRA_OECONF
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
X-List-Received-Date: Mon, 10 Oct 2011 21:19:08 -0000

This is needed to better support things like the following (with a
multi-word BUILD_CC):

    EXTRA_OECONF += '"ac_cv_prog_CC_FOR_BUILD=${BUILD_CC}"'

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/autotools.bbclass |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a4ce851..937e2ba 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -71,10 +71,8 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		cfgcmd="${S}/configure \
-		${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		bbnote "Running $cfgcmd..."
-		$cfgcmd || bbfatal "oe_runconf failed" 
+		bbnote "Running ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
+		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
 	else
 		bbfatal "no configure script found"
 	fi
-- 
1.7.3.2.430.g208247



