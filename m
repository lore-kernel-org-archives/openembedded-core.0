Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDEA72F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:15 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id k91so73103477ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dxmp9X2A+sklMSgsnHzWkZPvXBbsOpN80ho+tpCo6z8=;
	b=WWX2M3Lsedr0k19dmmkAt+G9g5Dtik9NQGs9Qq0SvQzwzB3mDxKQqP0+aDhhvxImIK
	sp6DDFF7s+c1lNoapbcfo5G+kR+FDH37ma5HRu7uhnonjqVA6rvxTcgB7bqV0OgjTvB8
	gHsMlQkkE3qij64wDRO2nPhR2Ev3+Rb812qVkWkZgq0rIt6zc0AMb667nyi9VvOmTfTa
	ojXFetUmZscBi1ra7VK4iXI6tvUGbfzZVSccA5o3yKGRNOR4AxMl4P5yf15rXywQ41J4
	I4fngCUcBti5lUbsz1h8macXhAtVIiz9YPOYnnab+tqnrAtgpa6Ac9WAC2OrLsdMsbYG
	jQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=dxmp9X2A+sklMSgsnHzWkZPvXBbsOpN80ho+tpCo6z8=;
	b=FspZtW+4eRhGmlFR7TUPPSomaDGcEJdpybMKREJWRE7v/AhPuGibjmheRxzTFN2t2b
	ywYTS8ENvsVISMgp5zeu4unC/x6ANhCO+gPajWDW4hYsDbMzYwZElYU97cg29sdC581I
	1HDAbX6v9YTwH2Sj9yxUa0OSEMJxQAmEZkZ89JiTGoAfMsq/tZkCIeDS318om4E0g4Wk
	B8GRB3+UjAkKvjX3ASBFHRRhzhmoLPo6duzsV7eKYcuE9XgoznPU6OczfmK4lNF55Rsk
	pmcPKb53bqafguvY8uw7fcCU934VSZvmNd6IpWgD2fIcpymiPrZgHrj4dpC0FxIvrdAN
	8LoA==
X-Gm-Message-State: AODbwcCg5MYx31o+7gcsMzrT+VOmlJ30k/rxgFCrWHIWXmrMh+TNluxy
	HdMm8jQFqRHl4OBs
X-Received: by 10.107.142.86 with SMTP id q83mr5735473iod.195.1494854836590;
	Mon, 15 May 2017 06:27:16 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:15 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:26:59 +0200
Message-Id: <959a64e7a7c9f5d523c3b349bc7b48d243a36ee9.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
Subject: [RFC][PATCH 2/6] basefiles: warn about non-production DISTRO_FEATURES in motd
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
X-List-Received-Date: Mon, 15 May 2017 13:27:15 -0000

The default motd is created at build-time by the basefiles recipes.
When the entire distro is built in a way that is unsuitable for
production, we can warn about that here.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ca7bf06..eff70a0 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -127,6 +127,17 @@ do_install () {
 	install -m 0644 ${WORKDIR}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
+	non_production="${@ ' '.join(set(d.getVar('DISTRO_FEATURES').split()).intersection((d.getVar('DISTRO_FEATURES_NON_PRODUCTION') or '').split()))}"
+	if [ "$non_production" ]; then
+		cat >>${D}${sysconfdir}/motd <<EOF
+******************************************************************
+*** This distro was built using these non-production features: ***
+*** `printf "%-58s" "$non_production"` ***
+*** Do not use this distro and its images in production.       ***
+******************************************************************
+
+EOF
+	fi
 
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
-- 
git-series 0.9.1

