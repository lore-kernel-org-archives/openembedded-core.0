Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLkk-00031H-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:23:34 +0100
Received: by ggnh1 with SMTP id h1so1691309ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qU2sRqsxZSBY0eM1E8ZYIyT5486WuZbNss2+8FAFhqc=;
	b=tQRIWPRV8mzT/R8YTLJqDlo1Ymynk0s/SQw652TNPnqrsk/X+Kw9qxCft3v0Li9aTd
	U2VVmaAZmo+r3oPI/jY8vpiukvnpwuORDAbAREDuCb2pRhZ/4xuBeACwiQN2VzXaAW+3
	FxQl30Hrn2HNVdM2oMCgWGLydrajlishMALfM=
Received: by 10.42.155.136 with SMTP id u8mr19305073icw.12.1326140166338;
	Mon, 09 Jan 2012 12:16:06 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm254620546ibh.11.2012.01.09.12.16.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:16:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:40 -0800
Message-Id: <078fa2a7d93d568236448867f000b66ad50a2761.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
References: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
References: <cover.1326140011.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] autotools.bbclass: Introduce CACHED_CONFIGUREVARS
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
X-List-Received-Date: Mon, 09 Jan 2012 20:23:34 -0000

This variable is for holding the cached configure variables
to be specified in recipes. e.g.

CACHED_CONFIGUREVARS += "ac_cv_foo=yes ac_cv_bar=no"

This will make sure that the variables are not detected
by configure. This is useful in cross builds where
some features can not be detected correctly by configure
and having it as a variables gives us capability to
override it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2f462ff..5d74333 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -73,7 +73,7 @@ oe_runconf () {
 	cfgscript="${S}/configure"
 	if [ -x "$cfgscript" ] ; then
 		bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
-		$cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
+		${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" || bbfatal "oe_runconf failed"
 	else
 		bbfatal "no configure script found at $cfgscript"
 	fi
-- 
1.7.5.4



