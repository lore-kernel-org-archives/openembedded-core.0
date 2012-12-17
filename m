Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkedL-0000NJ-SO
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:37:46 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 09:22:09 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so4410913bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=LjJC+Qla414kBwqwZyRZjgzOyemUP9V8PvfnQZJlMnY=;
	b=hcYzfxQxq4r1a70NW+rFvPX6VVhvXVcefG4WyYYKMzbSfaI8xU0J5xcGrYc/vgB/8k
	xDhLR4w1QjZu2uKtm9gArwLMpGKka3sO7coLBIkiY0Bt1BvDw+62yvePcX4VS2y/uzd+
	KjYfsDSovG3UHkcLKeFExjEnHLNsJre3Y4Ksg9VBP9ZsvtFGaCXl1nCkOUJSDd2K4Bqy
	ifh9dghTucA6gHG27TF6PjXCYz5BBT2cCX8i8t2crF9V7IbDqfrno7TeaY8AL3PELk9y
	74as42kH/TqpId7AJswBW/Z7arlOrw21pByWf4XRNJFYHF1Mst2L7ss+H2yEtKJd3X3t
	qiUQ==
X-Received: by 10.180.101.104 with SMTP id ff8mr17140109wib.11.1355764975575; 
	Mon, 17 Dec 2012 09:22:55 -0800 (PST)
X-Received: by 10.180.101.104 with SMTP id ff8mr17140088wib.11.1355764975336; 
	Mon, 17 Dec 2012 09:22:55 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm13460213wic.7.2012.12.17.09.22.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 09:22:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 17:21:11 +0000
Message-Id: <1355764871-1813-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355764871-1813-1-git-send-email-ross.burton@intel.com>
References: <1355764871-1813-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkcx2CNachALvH5xY9GrDezlo8JM25yGtGEGTUXuxuMlMvueBXyCbr9BKwZoO/NBniZT8HfbZd6xzPlK/dfwPM9O2ucg41R8lqbeiNQXZdKtTXJ6OsQkx3CQIJsQHrskJlVXYx750gxE7cgQ8vaua1XT/oRERvKBdjYGEQKo7xV6dezHkkYOfcVdSjAvZ4BcplfcjCo
Subject: [PATCH 2/2] gst-openmax: fix build with newer GLib
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
X-List-Received-Date: Mon, 17 Dec 2012 17:37:46 -0000

The new GLib deprecated some threading API, but gst-openmax wasn't detecting
release vs development at all so assuming development, and thus building with
-Werror.  Set the variable that the configure script is assuming to exist, so
that -Werror isn't used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index 76c8135..af482ed 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -11,9 +11,13 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/gst-openmax-${PV}.ta
 
 inherit autotools
 
+# Tell configure that this isn't a development snapshot so we don't want
+# -Werror (hopefully fixed in 0.10.2)
+export GST_CVS="no"
+
 EXTRA_OECONF += "--disable-valgrind"
 
-PR = "r3"
+PR = "r4"
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/libgstomx.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/libgstomx.la"
-- 
1.7.10



