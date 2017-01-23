Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB26730BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:17:19 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id c7so63468690itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8xdjas6kYkeaHx0W7aHUx67U2sgfJaE3QY1aZULSIjM=;
	b=fa9z1Dz5QzZMJ4hO4LNykwb6MzeMKYrcRPcNPGyhdbJ2g8KDwioaV7sYsHex36tz4r
	Lks3K/OpupWMJavxCa3vWpiaIr/92KUEw5E4uO/oe5xtIXsD4bgMLskJb7xI8kOy5Tvf
	GhoEx93yhYUUZmgq4JSriBgV8cmF9QWJ3gUT0AVcHk6rsco/q3MdHDbYOZCvxhHcCZRK
	DoJAcwDW+UPvrAs3BxzJWhxZL7wn3ad3/0yoNNPQIlt2fdlhPfaf929EWHeJzxiwDk0b
	HsRNXCzl+ijBC2JPX00MHlL7bZHtbNIlgaM5hOjwez7FppDzY2MJTopj7nXKmXhjNJul
	0CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8xdjas6kYkeaHx0W7aHUx67U2sgfJaE3QY1aZULSIjM=;
	b=QPKm1IzXrJZXUpMQ0I+sfLUu+HYqbeiYtbb+I0ws7JzZ26RvzzDAyyihbUhL/srX9e
	LJ+e8P6piGPKvJxX3Wer+MxiRt9jZYs/7jbdMkZBapymKH+6BCNo5bPKODov1bL8qT+f
	kXtgZ3L2dnhGmPfl0Ak4Qov4Ee2QMCh3uVJ/YNlSnweb9Of1AtPqi2a6hbfmKLt4bai8
	J2bWLGTF+WN0R3zwMuTtP0vU0CSIri7T3T54yG91PEHnb4yzwmxgxShKyk7gh6OWHWVF
	2HC9AbCFkd5IDClrLHVFinjCKQXv/zCEBgP+UQMdnzZkFqVCHVAP9DOUz5YSvoqzWuqI
	fUeQ==
X-Gm-Message-State: AIkVDXJgWgzyd/ajmVhVExBpam3KEs3fkpI1CN+8jig5ZUa8wCCgSdsaxoEI2VdcebNSVDA6
X-Received: by 10.36.65.4 with SMTP id x4mr15039645ita.69.1485181039863;
	Mon, 23 Jan 2017 06:17:19 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FC12.dip0.t-ipconnect.de.
	[93.232.252.18]) by smtp.gmail.com with ESMTPSA id
	v68sm9608633ioi.20.2017.01.23.06.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:17:18 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:17:04 +0100
Message-Id: <952d24392d5d4393b55fcbdde880807cc5a0c7f3.1485180970.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a45e50ea4fcbfdc1b4f78df0b3380d397b353cf6.1485180970.git-series.patrick.ohly@intel.com>
References: <cover.a45e50ea4fcbfdc1b4f78df0b3380d397b353cf6.1485180970.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] socat: support native compilation
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
X-List-Received-Date: Mon, 23 Jan 2017 14:17:20 -0000

This is needed for building the swtpm TPM simulator (recipe
in meta-security).

Native compilation disables tcp-wrappers by default to simplify
the build.

"nativesdk" is added just in case that someone also wants this
in an SDK.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.3.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
index 4da6d39..a579f1e 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.1.bb
@@ -29,10 +29,13 @@ EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
         ac_cv_header_bsd_libutil_h=no \
 "
 
-PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG_class-target ??= "tcp-wrappers"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 
 do_install_prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

