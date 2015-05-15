Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D3CB273FC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:44:05 +0000 (UTC)
Received: by wghe15 with SMTP id e15so5564490wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cRb2h2vRrHmWwO5ENLVD1ccUC8ga2plHSwcCmyGyUrc=;
	b=AYpXpSyzq3XK/z/3eJy3A0YR3jF4KN8NrSBwv5FBzZPdBkW55EnvVI/MaQEN3BTcZq
	SifGV0l6SRwzr/rnfsbU45dVd4L4lTnkNtEHlGDviqi0XaXzvSu2HXwrH94PnqcOggFM
	1Twcdit2tj/leMkZPDoAgwC3b8WY25IyjqsOGkRgjTlJCyIc5M/g/b5hiWl1Rh52REBi
	VPZZusLaxG2vMhcdRzKd4Qpgy7dd79cyr/chEZNKSPf5CfQJSw7UtcfIZWt9gRAchCkO
	10RPnlVvYpvQhmP/tqUrgLitVCmorZnyG7iswQtChA9BoClYE9daihsFskKE9A4ZmbW8
	JA5Q==
X-Gm-Message-State: ALoCoQk2K6O3bmApxQEXKHU3ayVEZQwB54DI8FKbPh1TOUZ7P5Bwh1AvXBd/y4bnNdZ03KZNSxB+
X-Received: by 10.180.100.101 with SMTP id ex5mr36086958wib.13.1431708245914; 
	Fri, 15 May 2015 09:44:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ha4sm4081168wib.0.2015.05.15.09.44.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 May 2015 09:44:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 17:39:50 +0100
Message-Id: <1431707991-16826-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] autoconf: simplify perl location forcing logic
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
X-List-Received-Date: Fri, 15 May 2015 16:44:06 -0000

Instead of letting configure find the host's perl and then use a complicated sed
to replace it at install time, simply pre-seed the configure logic with the path
we want to use.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 8b00fbd..fb5de2f 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -32,20 +32,12 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 
 inherit autotools texinfo
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+
 do_configure() {
 	oe_runconf
 }
 
-do_install_append() {
+Xdo_install_append() {
     rm -rf ${D}${datadir}/emacs
-
-    # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-    # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-    for i in autoheader autom4te autoreconf autoscan autoupdate ifnames; do
-        if [ -f ${D}${bindir}/$i ]; then
-            sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/perl,' \
-            -e 's,exec .*/bin/perl \(.*\) exec .*/bin/perl \(.*\),exec ${USRBINPATH}/perl \1 exec ${USRBINPATH}/perl \2,' \
-            ${D}${bindir}/$i
-        fi
-    done
-} 
+}
-- 
2.1.4


