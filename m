Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RCHf5-0003JJ-2a
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 23:08:55 +0200
Received: by yxj17 with SMTP id 17so4103951yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 14:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8nrGgKdP5az3Dq5o80nUqNjooekGeuiJ22pTj6vJhOk=;
	b=xFZtk6XQ2NZmOw320QdghAbb9fzdh3N1uRfttNbx3xjGADD2dp93uRSB0+a3d+NEuT
	UEP2Xf/gE/ShXs2/1DQwG22wEZ0ADXFu3HBw1G7LMxkM8D0z0QyT4ObD1KEXDeS5jQ4A
	YR0dvzAtrsqCmMNEBtWt5UJwgkzx1sK4QFamo=
Received: by 10.236.190.193 with SMTP id e41mr12563587yhn.118.1318021397137;
	Fri, 07 Oct 2011 14:03:17 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id x65sm14662621yhg.18.2011.10.07.14.03.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 14:03:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 14:02:59 -0700
Message-Id: <bc7e830e85f9f5242e0178dee517d24cbdfc9fa3.1318021323.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
Subject: [PATCH 1/3] autotools: fix multi-word arguments for EXTRA_OECONF
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
X-List-Received-Date: Fri, 07 Oct 2011 21:08:55 -0000

This is needed to better support things like the following (with a
multi-word BUILD_CC):

    EXTRA_OECONF += '"ac_cv_prog_CC_FOR_BUILD=${BUILD_CC}"'

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/autotools.bbclass |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a4ce851..135be33 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -70,14 +70,12 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
 
 
 oe_runconf () {
-	if [ -x ${S}/configure ] ; then
-		cfgcmd="${S}/configure \
-		${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		bbnote "Running $cfgcmd..."
-		$cfgcmd || bbfatal "oe_runconf failed" 
-	else
-		bbfatal "no configure script found"
-	fi
+       if [ -x ${S}/configure ] ; then
+	       bbnote "Running ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
+	       ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
+       else
+	       bbfatal "no configure script found"
+       fi
 }
 
 autotools_do_configure() {
-- 
1.7.4.1



