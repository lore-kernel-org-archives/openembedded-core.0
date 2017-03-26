Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1893671CBF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 10:24:15 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170326102416152_0484
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 10:24:16 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=50430 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cs5LG-0006UQ-Cv for openembedded-core@lists.openembedded.org;
	Sun, 26 Mar 2017 06:24:10 -0400
Date: Sun, 26 Mar 2017 06:24:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703260622220.16304@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] autotools.bbclass: Replace "grep ... >/dev/null" with "grep -q"
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
X-List-Received-Date: Sun, 26 Mar 2017 10:24:17 -0000
Content-Type: text/plain; charset=US-ASCII


For aesthetic style reasons, use "grep -q" instead of ">/dev/null".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index d494734..ac04a07 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -193,14 +193,14 @@ autotools_do_configure() {
 		else
 			CONFIGURE_AC=configure.ac
 		fi
-		if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+		if grep -q "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC; then
+			if grep -q "sed.*POTFILES" $CONFIGURE_AC; then
 				: do nothing -- we still have an old unmodified configure.ac
 	    		else
 				bbnote Executing glib-gettextize --force --copy
 				echo "no" | glib-gettextize --force --copy
 			fi
-		elif grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+		elif grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
 			# We'd call gettextize here if it wasn't so broken...
 			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 			if [ -d ${S}/po/ ]; then
@@ -212,7 +212,7 @@ autotools_do_configure() {
 			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
 		fi
 		mkdir -p m4
-		if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+		if grep -q "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC; then
 			if ! echo "${DEPENDS}" | grep -q intltool-native; then
 				bbwarn "Missing DEPENDS on intltool-native"
 			fi

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


