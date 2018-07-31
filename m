Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D45EC6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 17:05:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t25-v6so3942307wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=39kKolOxXo1VZSzs2CfPpd567IEwOgNTBAkGqgpHTwk=;
	b=OaUAjE1r9t0LSD847TcYCyO3v0gJ83oNDfhlNVtzOImqjfW0TvgupP8VRuTKfw9JYg
	cCjG2XI+odXy7BQ96PMQFIy4nKXBOQWnOLoL/A5g8M0I7sa6MN5ig60sqvPIDdPx2xXQ
	D6w2IBtiGEMPNFd2CQHg9a7N3/1/zl8aLZ91xzZrhvyyih/EqK+7rfegBZZMhojRz9Ya
	pkenr5nS3w3zb82i3iDmEMFuKoZd+GShQjEDRi1t3MBIdsJAljdz/h1d7r6vywqwxyZF
	tFPnEF5vkqRscSwRb1kK6JgkhSqrUbCskQ11+lY3EgbZRHZ65QiOhIyaCm4z7Xn8hA3y
	/0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=39kKolOxXo1VZSzs2CfPpd567IEwOgNTBAkGqgpHTwk=;
	b=X5w9m3vKbaeT63oDXKXY05PqNonpvuYAoHhdoGG9I3GJxsxgRUZWFTlkXFUQnAy4rV
	KBTSqD0jnafhxSkYXM1ukktPuG5oRk6UIGLigk1URe2GZfhy1W4PIb1bSjqcXviKzjvB
	ldT8WUa0ayCJmBkI78wooXrfufOCGBnYI5l78u3OAycgVhz7iDJrySir4VN4UXlYjzAM
	stbjoLDxFU88u2VhILVS+eBJ2tpBiOD+LFT7hQ8huy//rI/5vukRAVtmPbdflXOwJkTP
	7UeZGCf4vXDsL6DClmmCKkqvwsDsaNrIQ4NDbTLH8EOro+KRSWHMr9FahVfz4Pa+bZA9
	TlDQ==
X-Gm-Message-State: AOUpUlG9ZT+brJsDDKy8IIf9E69WMCgTh4qgRz3OJ0dpLzyEghQo7OFP
	OAZE1cy1KOLf/4Ywu4pI2ebXEnSzGxw=
X-Google-Smtp-Source: AAOMgpeqeelBQGvR9hmI48D6D0mmqQowl/PWzHKT1u2do59xynf0Fuega/EbCFDqlJxxtqFpxA9ooQ==
X-Received: by 2002:a1c:752:: with SMTP id 79-v6mr369206wmh.59.1533056744363; 
	Tue, 31 Jul 2018 10:05:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b8-v6sm13920419wrw.22.2018.07.31.10.05.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jul 2018 10:05:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 18:05:40 +0100
Message-Id: <20180731170541.13620-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] meson: don't dump full error log on failure
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
X-List-Received-Date: Tue, 31 Jul 2018 17:05:45 -0000

If the configure fails then we don't really want to see hundreds of lines of
test output (this would be similar to dumping out autoconf's config.log).  The
error includes the path of the full log if further debugging is required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 66c44e8bb23..e3b452786d8 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -101,7 +101,6 @@ CONFIGURE_FILES = "meson.build"
 meson_do_configure() {
     bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} ${EXTRA_OEMESON}; then
-        cat ${B}/meson-logs/meson-log.txt
         bbfatal_log meson failed
     fi
 }
-- 
2.11.0


