Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYmll-0006wu-J6 for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 00:53:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAENdPKl013027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 23:39:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12861-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 23:39:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAENdIUY013002
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 23:39:19 GMT
Message-ID: <1352936359.3709.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2012 23:39:19 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Bump version number to deal with layout fixes
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
X-List-Received-Date: Wed, 14 Nov 2012 23:53:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


The recent proceeding sstate directory layout fixes made the code do
what it was originally intended to do, as can be clearly seen from the
code. Unfortunately this changed the contents and layout of the sstate
files themselves since the bug was leading to a directory prefix being
missing.

This is now resulting in chaotic messages on the console since things
are getting confused with the two different layouts. The simplest way to
resolve this is to bump the version number, hence moving the new layout
into its own new namespace.

Its worth noting that whilst the failure messages are scary, the failure
mode is relatively harmless since it will just fall back to building the
data rather than installing from sstate.

Usually I'd give more notice of a change like this but under the
circumstances, I'm just going to push this in to resolve the failures
people are seeing. Initially I thought the problem was limited to
some of the -cross packages and therefore of low impact but that is
clearly not the case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c1925b2..cfda40d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "2"
+SSTATE_VERSION = "3"
 
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"




