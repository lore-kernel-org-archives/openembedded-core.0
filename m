Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rvuu8-0002hH-Le
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 19:09:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B6CC53158BB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 19:00:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9eToBAqc2su4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 19:00:51 +0100 (CET)
Received: from [172.22.22.61] (drms-590c5a35.pool.mediaWays.net [89.12.90.53])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6808E3158BB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 19:00:51 +0100 (CET)
Message-ID: <4F355B52.6050007@opendreambox.org>
Date: Fri, 10 Feb 2012 19:00:50 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] autotools.bbclass: Don't copy into non-existant directory
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
X-List-Received-Date: Fri, 10 Feb 2012 18:09:04 -0000
X-Groupsio-MsgNum: 17425
Content-Type: multipart/mixed; boundary="------------010203080104090908060907"

--------------010203080104090908060907
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

* If configure.ac contains AM_GNU_GETTEXT and po/Makefile.in.in
  doesn't exist, autotools_do_configure() copies a local
  version of Makefile.in.in to this location. If the directory
  'po' doesn't exist, the function aborts.

* This patch verifies that the directory exists before copying
  a file to it. This fixes libcddb, which uses AM_GNU_GETTEXT,
  but has no 'po' directory.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 5d74333..e22ea68 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -149,7 +149,7 @@ autotools_do_configure() {
 			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
                             # We'd call gettextize here if it wasn't so broken...
 			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
-			    if [ ! -e ${S}/po/Makefile.in.in ]; then
+			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
 			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
                             fi
 			  fi
-- 
1.7.5.4


--------------010203080104090908060907
Content-Type: text/plain;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"



--------------010203080104090908060907--
