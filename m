Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E5FDD7318B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:39:17 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l126so150447766wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 05:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=J/2kT+qg7O5sZ6RyIoAwYCRQ+hw7/MBGC1+KgQ5LaAA=;
	b=U508KRHo8ftTkHvzuEwMKlRr7DKJi2NJ4jcO1vA7OLrSBH2PMSquUzuDkDWqv42OMN
	fWYr/GjBNCL0a6g8/vOdACvdBSA23ikyTa7rZlffj7tz4eEVPNCq7hIRQFhYR6PI7SPz
	o0zBXox7kLdI95v/bDlBJqkTWgWti4hO/Y2cAOC55ppCY/osYBKIRIgQ2FqKuz8a7SzA
	mz8+XOcpUkz1OrWbzVW3hHUq3udeut886QzUIgwsKVi405EJ2B35+nZr82++DdwgkjIb
	NWND5Ub1JQUt6ohAQDepTRSfoZyX1Iw+QSgFG6qBPH+LN9pjzc3uMbU/eYAm5onKFKEO
	dj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=J/2kT+qg7O5sZ6RyIoAwYCRQ+hw7/MBGC1+KgQ5LaAA=;
	b=kvB6Sw1K9NYEzP9zMvXP+v07wPF4dciOCx71Y+MAk2Um7Edwj+tl8TdjUEJV5lwe6x
	bJi0mhCF3SMICjTF+kTne+WmpR4B/hVJos5UPLH/mzd+8LjJ4glHtuIYq1n1rNqX4g0i
	N6nJ0lmI6CxqUNMyOiky4olTdPHKCx47z2ew2BM3HQ4Pn8uX7piVfXYWfNN4FrsjV3tq
	1ESjrpQmlYnGCyTEIHhsXBt4h3W1O95TVY0iA2uBcNINnHwvC2DUQdJ4LSwwpgCgea/N
	osM3I+GCaBu7fqAQZCIH2aJVqGiFXU3jrP3aAMHrKMB0pq4sY1Se+2b0QhmpVPP6FQvq
	jRqQ==
X-Gm-Message-State: ALoCoQkFVoSqumcWpXz7raHwdmgivgS6i4G9VKPCPssbMp+arQlrQcS6CLzMsVvsOcwonFfg8Iqvc+upMBEeyQrlShWcY5CUMw==
X-Received: by 10.194.104.130 with SMTP id ge2mr33910366wjb.111.1450877957987; 
	Wed, 23 Dec 2015 05:39:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w80sm8006661wme.17.2015.12.23.05.39.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Dec 2015 05:39:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2015 13:39:12 +0000
Message-Id: <1450877952-28148-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] xorg-lib: allow native building without x11 DISTRO_FEATURES
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
X-List-Received-Date: Wed, 23 Dec 2015 13:39:19 -0000

The Xorg libraries use REQUIRED_DISTRO_FEATURES to stop building on
distributions without the x11 feature but this stops people building native
tooling that uses libX11, such as libsdl-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb    | 1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
index 4372be1..0856c19 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
@@ -29,6 +29,7 @@ inherit autotools pkgconfig distro_features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES_class-native = ""
 
 python populate_packages_prepend () {
     do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 09df010..6f4e444 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -24,3 +24,4 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
 "
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
+REQUIRED_DISTRO_FEATURES_class-native = ""
-- 
2.6.4


