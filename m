Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyRFy-00083B-83
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 19:10:36 +0100
Received: from mail-lb0-f200.google.com ([209.85.217.200])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 09:55:00 -0800
Received: by mail-lb0-f200.google.com with SMTP id k6so5907693lbo.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 09:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=cLKbo+KZiim3RCYj4J2yGvSHJYhsYJzQrmHd6aFiTOw=;
	b=a1Hk3i6t4rjF4BphWiKMJzLDMAaAkRu89aQLhuJHowOZYE27nQKCIqIR2z6Ikzdjqk
	/5RHJzy670Hy/cKTdHUIL06tui37SZQP5jqKHepVkCQuVliKijxsZqykQDltAtL96w/u
	FqdZMg8t0kdGWPmG6vZdnTYtGvfRvIZXO8XkaM5BBOjMeCQiCaC9bN5eCd6Eg90yv/E0
	UeLPdK6JduBBOQQlP0mF1rzg4DbX8fzP0k+5ICeeoIJrgWPa4WKL8Vg743gCc6FPBglR
	9zUh4Jtlu+06bonjG6OzcWtO1cKkpw0obdHJyWmji6WRCUOYQK4+Ri0gMNxwEDUKzBcj
	5a/Q==
X-Received: by 10.180.80.230 with SMTP id u6mr4537375wix.20.1359050097521;
	Thu, 24 Jan 2013 09:54:57 -0800 (PST)
X-Received: by 10.180.80.230 with SMTP id u6mr4537369wix.20.1359050097463;
	Thu, 24 Jan 2013 09:54:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm3681314wib.5.2013.01.24.09.54.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 09:54:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 17:52:56 +0000
Message-Id: <6d174abd95de70a59f54ca28c965ca72933a3ce7.1359049755.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
In-Reply-To: <cover.1359049755.git.ross.burton@intel.com>
References: <cover.1359049755.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl8AP59IYCJJCB7RQHcceShlfACcz6r3196v07H2HZEfb6k3NO5p7WX2QsNLeNi4V2fGPmolU53pAaZ1HpryQmVqrKMaQMMT+TB0BEZ35uz1jbAvoWpURNpzbrrfwZWghhqAQL1/It2dqlfmTRr1q4KoXIi4TmlrgLfgT7Uf2wIsTWl+wS4Rm+2Vc8IlsloWHKSYQvd
Subject: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Thu, 24 Jan 2013 18:10:37 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Backfilling DISTRO_FEATURES and MACHINE_FEATURES with _append statements happens
too late to use those variables with conditional inherits, like this:

inherit ${@base_contains('DISTRO_FEATURES','sysvinit','update-rc.d_real','',d)}

Instead, do the backfilling at ConfigParse time so that it happens earlier in
the parse, which results in that inherit behaving as expected when sysvinit was
backfilled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    2 ++
 meta/conf/bitbake.conf    |    3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b427a5e..dafded3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -314,6 +314,8 @@ python base_eventhandler() {
         generate_git_config(e)
         pkgarch_mapping(e.data)
         preferred_ml_updates(e.data)
+        e.data.appendVar('DISTRO_FEATURES', oe.utils.features_backfill("DISTRO_FEATURES", e.data))
+        e.data.appendVar('MACHINE_FEATURES', oe.utils.features_backfill("MACHINE_FEATURES", e.data))
 
     if isinstance(e, bb.event.BuildStarted):
         statuslines = []
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 607fb70..13a3ff9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -739,10 +739,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
-DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
-
 MACHINE_FEATURES_BACKFILL = "rtc"
-MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
-- 
1.7.10.4



