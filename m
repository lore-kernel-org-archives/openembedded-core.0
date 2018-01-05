Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A42AA77AA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 13:06:12 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w107so4294836wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 05:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kLpVZgvMK4NsczZuil/UKy3qych2W+hFXMRerBkhsJw=;
	b=XDAbP8L6G0vKliHfq+xxO5NR92/CGvzJWqCxkJQv5dYzZgbUcev8nzRiX7NokTYqIM
	tZcBsRIo6NH7DjXJWFNkIFwYjfHGwLZtRBD147nupZMW53lpoZdE5eOXrrMnN4mjLpE2
	yw+2p1+GyhlUCFl0H6aajZH50YiSZKge0OrCRGjn266whiJYI9dn0oaPNxHzmafDtz0Z
	8UpXKL+icvHsIp+s/ikcG882GKaX2U0UyBxc21BmtxazfiLwSY92hGJ1xfSHT/a1igrs
	i3pKrzYfdXDgB2j026IDDumY8bgyCXuQIHTw9UupImUzIw0Y/x0eCk6RyyB7MbS3tbKJ
	fk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kLpVZgvMK4NsczZuil/UKy3qych2W+hFXMRerBkhsJw=;
	b=knMsqzk/7Z8siu9VdLJ/67C7g9AAtm1Y0fu1xAsRmNyz5C2A/Nm0oeUpTHGm94Oe+H
	DDpMpOIfTxqXFCeP2n4Ueo9mOFu8LqT6WYQjucNE8zHbXi+HYX2sE3siuHCt1IbaNsYk
	r2NSFAw196e5JPQBsOmqHMWrI8Hd1fyXG9cNo3s03kZFOrpAtoOuNzpsXV2tXi+G99G7
	u5VtRvDU2LW+Sil4Ve9DqOo/5N336FTTLER7RTTNaf8rjqpLShhj7OnvPtvc5XI23iYH
	8uJApxHjZji1Om6IPCPj0Kc+V0Dg38+xVUotAdAgeRqbaFInRorIysW8sm2vsFpq+5NG
	SV8g==
X-Gm-Message-State: AKGB3mKT+Coj0V53lw5zCPLMnbsdCNMpS44E1G3Wt9VXKeANlwmbLJun
	8Ew6ohzTG/36UneW14AuFh5V0fs1
X-Google-Smtp-Source: ACJfBov4zWcDxXjHudI22LcZaWuIh7FFL2smesc4AEUWUvq/0I2eZAmqKHc+kvtNlm0mlUfw3kotrA==
X-Received: by 10.223.200.144 with SMTP id k16mr2965808wrh.209.1515157572993; 
	Fri, 05 Jan 2018 05:06:12 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 90sm4281639wrp.39.2018.01.05.05.06.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 05:06:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 13:06:08 +0000
Message-Id: <20180105130608.5207-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gst-validate: disable gtk-doc API documentation
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
X-List-Received-Date: Fri, 05 Jan 2018 13:06:12 -0000

When the gtk-doc API documentation is enabled (via the api-documentation DISTRO_FEATURE, typically) this recipe fails to build:

  WORKDIR/build/docs/validate/gst-validate-scan: line 117:
  WORKDIR/build/docs/validate/.libs/lt-gst-validate-scan:
  No such file or directory

Forcibly disable the gtk-doc for now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
index f662467dfba..d2dbb418453 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
@@ -16,3 +16,8 @@ RRECOMMENDS_${PN} = "git"
 FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
 
 inherit pkgconfig gettext autotools gobject-introspection gtk-doc
+
+# With gtk-doc enabled this recipe fails to build, so forcibly disable it:
+# WORKDIR/build/docs/validate/gst-validate-scan: line 117:
+# WORKDIR/build/docs/validate/.libs/lt-gst-validate-scan: No such file or directory
+GTKDOC_ENABLED = "False"
-- 
2.11.0


