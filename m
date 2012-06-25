Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sj5WX-00085Y-1z
	for Openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 11:23:57 +0200
Received: from puchatek.dom (87-206-60-144.dynamic.chello.pl [87.206.60.144])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 03F8BD232B;
	Mon, 25 Jun 2012 11:13:09 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2012 11:13:03 +0200
Message-Id: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lighttpd: fix FastCGI configuration for PHP
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
X-List-Received-Date: Mon, 25 Jun 2012 09:23:57 -0000

/usr/local/bin/php was set as PHP interpreter so lighttpd failed to run.
Also uncommented FastCGI configuration block to make mod_fastcgi
enablement easier for user.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/lighttpd/files/lighttpd.conf |   16 ++++++++--------
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.conf b/meta/recipes-extended/lighttpd/files/lighttpd.conf
index 3342470..0838da8 100644
--- a/meta/recipes-extended/lighttpd/files/lighttpd.conf
+++ b/meta/recipes-extended/lighttpd/files/lighttpd.conf
@@ -211,14 +211,14 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #### fastcgi module
 ## read fastcgi.txt for more info
 ## for PHP don't forget to set cgi.fix_pathinfo = 1 in the php.ini
-#fastcgi.server             = ( ".php" =>
-#                               ( "localhost" =>
-#                                 (
-#                                   "socket" => "/tmp/php-fastcgi.socket",
-#                                   "bin-path" => "/usr/local/bin/php"
-#                                 )
-#                               )
-#                            )
+fastcgi.server             = ( ".php" =>
+                               ( "localhost" =>
+                                 (
+                                   "socket" => "/tmp/php-fastcgi.socket",
+                                   "bin-path" => "/usr/bin/php-cgi"
+                                 )
+                               )
+                            )
 
 #### CGI module
 #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
index 161c0d9..99b359c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
-- 
1.7.10.4



