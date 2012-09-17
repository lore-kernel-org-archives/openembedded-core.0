Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJY-0003JM-KC
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:36 +0200
Received: by wibhn17 with SMTP id hn17so1899814wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=BDU2GIKq17dTtcsA3rPjZc0JB1d1JJN+N6lk3zRwVKw=;
	b=Qn7Rg2bc1nNJmG6FDt+SiPKlkvbZKIf7U3iluNkzlcqkzavEK0AdtPL9fUISYAlyT5
	Q3e+MIDYlLyk66gC9dy+TmGm+fk3NZrrphhB2ewGy0Lj24/+HulPREjhnT/Wy3d3TSoN
	YXXoDIWPF7oho1b6mFt4kVJmcZ26J2wZj/foOWQ8tYJOiY74V8ZghAqZ0fHKUwmYNyzH
	M2KV83wAxmgJILoGdFty0hz2Kc99gjEHwcBKR/pENHzCVKesxqtDsq1MZSR82jjXpaPz
	LN7e08gECh3p/KHbGvU/acM3bZJB7r2WgZ5uYG3xN9duMpoYzRDw+gapPmR+y8o+YpLA
	GN2A==
Received: by 10.180.86.3 with SMTP id l3mr15734339wiz.16.1347883677882;
	Mon, 17 Sep 2012 05:07:57 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.07.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:07:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:28 +0200
Message-Id: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQn0govyqfeMbiXQiEI8OYyrLBv6LIlWPjMyjsksWwLf5ZsPM6OoGCUdixxiioGmT7IU/aoN
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 01/10] pulseaudio: disable tcpwrap by default
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:36 -0000

From: Saul Wold <sgw@linux.intel.com>

This ensures that tcpwrapper usage is always disabled, this was
inconsistent because it would test for libwrap and sometimes enable
and sometimes not.

This ensures consistent build reproducibility.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a653af5..a2f0d9f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -31,6 +31,7 @@ EXTRA_OECONF = "\
 		--without-hal \
 		--disable-hal \
 		--disable-orc \
+		--enable-tcpwrap=no \
 		--with-access-group=audio \
 "
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index fd61149..d2ed3c8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.7.6



