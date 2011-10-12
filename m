Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDzAV-0001QH-Vg for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:48:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDnJXc005972 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YLyMDVADeybf
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:19 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDnG0k005960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:42:33 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426962.23801.168.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] autotools: Enhance gettext handling to better work with SCM versions of code
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
X-List-Received-Date: Wed, 12 Oct 2011 13:48:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we pull SCM based code using gettext, Makefile.in.in in the
po directory can be missing. We therefore need to add this if
its not already present. We could use gettextize if it wasn't
so broken (for example requiring user input on stdin and installing
way more files that we ever care about such as the m4 files).

We also have a problem if a recipe sets a different AUX dir, for
now fix this by allowing recipes to specify when this is being done
using the AUTOTOOLS_AUXDIR variable. Ultimately we could likely
figure this out automatically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index a4ce851..0413322 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -80,6 +80,8 @@ oe_runconf () {
 	fi
 }
 
+AUTOTOOLS_AUXDIR ?= "${S}"
+
 autotools_do_configure() {
 	case ${PN} in
 	autoconf*)
@@ -144,7 +146,11 @@ autotools_do_configure() {
 			      echo "no" | glib-gettextize --force --copy
 			    fi
 			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+                            # We'd call gettextize here if it wasn't so broken...
+			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
+			    if [ ! -e ${S}/po/Makefile.in.in ]; then
+			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+                            fi
 			  fi
 			fi
 			fi




