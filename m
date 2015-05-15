Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2653C7403A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 16:48:54 +0000 (UTC)
Received: by wgbhc8 with SMTP id hc8so85871852wgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 09:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vo6rEwxhMwCP9zdZI/qVtccftGDj82MfkiGwm1XlJE4=;
	b=HoguGXAM1Yl+aR0VHHyt8un6iozEBoOJSm+uTGJbJzqzyh8TIml87ad09IahjiAjtr
	r7S8B2EeZKH45eDC5+5KfldiQHhFVA4YNhid3eZPy7cXrWFAhkD37nAJxP6juD+xY7Yo
	bghibFnLxX6OwCZXlllv9G6x7LNK1SrFgRkC5oqNxFNyLpkyrLKCJ/oteFntI8+eH4dB
	hIP1WulW+arQU/KgfVACo1px+awlwcd27zCX0WpqdJw40/79re4ME27r3eOOaz+C9Jil
	2SGkw1Rfmt7qK/E2iwzoGH9E3fuaMdPmaDE7VK92ySnUVTXk/LRD/tZPjZ9PE2WtfV4m
	Cw6w==
X-Gm-Message-State: ALoCoQmPQR/QQo+U4e8b3C2AMrT0BPxhEQmZ09c+NmW69HWasyPCeUhfC66GdzCVjZVRX0wHN+CC
X-Received: by 10.194.172.72 with SMTP id ba8mr20093182wjc.136.1431708535630; 
	Fri, 15 May 2015 09:48:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z12sm3289322wjw.39.2015.05.15.09.48.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 May 2015 09:48:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 May 2015 17:42:08 +0100
Message-Id: <1431708129-17569-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2 1/2] autoconf: simplify perl location forcing logic
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
X-List-Received-Date: Fri, 15 May 2015 16:48:55 -0000

Instead of letting configure find the host's perl and then use a complicated sed
to replace it at install time, simply pre-seed the configure logic with the path
we want to use.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 8b00fbd..78b77e8 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -32,20 +32,12 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 
 inherit autotools texinfo
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+
 do_configure() {
 	oe_runconf
 }
 
 do_install_append() {
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


