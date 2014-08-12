Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5479E70C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 13:00:10 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so9843707wgh.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 06:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yLqMbXhMKJnPjgWd/AiCf+eKDs2F/QLdjn0NyJrNgGY=;
	b=AxAx0jD6iOfWvDzxBpQ+Y+YZQZMltU+j0Jzi1To/gvbBhUtXXhdgG4gJd62i+13OCp
	EgZjLlKIkEedkDIO58oKzcSyupqsTLDKfRq9319GDIflz+SL9RNFJLLl0LhHvEVDqJNX
	/bBdrJ55L4JTSIVZnw4E7+orrQxqwJDl7HtqHjTcMeZ7FpiipaIi2C2KBMi7gZcgJ3TM
	KCmyHNyEe2ex/uqerSW9XnyTZgjs/tAdnh4PMzH8NEXpRLEBWSPXqv2T5JmkwbcU+3UH
	XFZCOJEnuD++bGpD9TAcT4/zoSi0AZCAWhNtMhrGjsGSZLP2+2IgyVvb005Zm1qpTi7W
	bwXQ==
X-Gm-Message-State: ALoCoQm7u9S+io6OC6VYTrdu9iRb7Gk0bd4tJBYFz3gtmFB+FPUbe2jD75wrFgQjJUC21+iFwnlt
X-Received: by 10.194.206.67 with SMTP id lm3mr5113597wjc.70.1407848410939;
	Tue, 12 Aug 2014 06:00:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fv10sm55984251wic.23.2014.08.12.06.00.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 06:00:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:00:05 +0100
Message-Id: <1407848405-348-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] avahi: unset FILES_avahi to avoid packaging files there
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
X-List-Received-Date: Tue, 12 Aug 2014 13:00:12 -0000

The main avahi recipe doesn't package anything into ${PN}.  If a library is
enabled but not put into a separate package it ends up in ${PN} and all the
packages are renamed using it's soname - ie libdns-sd-daemon.

Avoid this by clearing FILES_avahi so extra files are unpackaged instead of
creating a new package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3318f40..4a68f6a 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -73,6 +73,9 @@ do_configure_prepend() {
 
 PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
+# As avahi doesn't put any files into PN, clear the files list to avoid problems
+# if extra libraries appear.
+FILES_avahi = ""
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp/*/avahi-autoipd \
-- 
1.7.10.4


