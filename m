Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7999A6D48F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:33:37 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id c11so6779966wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fQeVQuTpL3m8g6q5Rxx13ZpJEhTkcek7KDbh91tliA8=;
	b=TkogThFQobR6a8b6RU5/EaLbKiYe/ByV6J2u4GfhfFBclMJi71Nim+PjOVbTJrW15E
	CNIzqJx5fQ+rptfJBKgf45T+V9KW9NkGThWq6usAuod0Nwjb8/6fygT3QFW2A0zsKPjb
	sn7mrvuFwuwWRpZYAVWDcYBCGcuyaiYWjpvu4yEwzgJn6+krpbfrJNA5hUQ3HN23+k97
	ztxl+dJ205GgUZhS4Tf2mM+t/97s0uHam9FZ4Qg4bHKhi6hCw5wCPRuk3SRVjM0VwnxG
	DVAzwOE3hcXbCPMAMUSiRwsMFxNO4thB2pQzuhk1JHsyLbRRFhxT+InirczLHyiboPVC
	3IvA==
X-Gm-Message-State: ALoCoQmKvcjk6/HDQWbd5Q95sZYtkn4/RWV5v2ZyD5Q4zpD3xZFRIBIQcMSd2FQxXi8iU1q2o4b4
X-Received: by 10.180.24.137 with SMTP id u9mr5183116wif.5.1382970818999;
	Mon, 28 Oct 2013 07:33:38 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.71.threembb.co.uk.
	[188.29.164.71])
	by mx.google.com with ESMTPSA id fr4sm36349149wib.0.2013.10.28.07.33.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 07:33:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:33:15 +0000
Message-Id: <1382970798-13574-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] xorg-lib-common: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 14:33:37 -0000

This include adds configure options globally but not all X libraries support
them, so to avoid unknown-configure-option warnings add them to the whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 98e1416..07b0373 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -17,6 +17,9 @@ EXTRA_OECONF = "--disable-specs --without-groff --without-ps2pdf --without-fop -
 EXTRA_OECONF_append_libc-glibc = " --disable-malloc0returnsnull"
 EXTRA_OECONF_append_libc-uclibc = " --enable-malloc0returnsnull"
 
+UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0returnsnull \
+                                --disable-specs --without-groff --without-ps2pdf --without-fop --without-xmlto"
+
 python () {
         whitelist = [ "pixman", "libpciaccess" ]
         if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
-- 
1.7.10.4


