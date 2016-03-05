Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4A96FFCC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:12:09 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n186so11952323wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=t2v4bcnXRr8eW11BzXbVVvYneBAHNkiB4EQSFfBLDrc=;
	b=R5B5EYSk054w4aLSqaJ9FyI745IqbpjdV5+0u+IS+DhcNBfWuNHXJ04FewiIDAjZt9
	FXPnfpNbzPUfQAKZKQyFm4dS3EYUt7oaSW1EOq0wQj7Ipx39bkECxh55aG0k03Xj5xyg
	dAnLDEHfKDXyhGVYYen0Vj2MKWkGimNHdba2d4ep0XKsC7ZaLw1xo9wZR6tpMiWHsq0p
	AkO+3ACdNENLrjuiKy2QrCXKsL35+EySyLaqFXyn44ireLo7IrIccbiWm9RW1exJJDvX
	TCxZ2bGEuQWlVwabtlYbVwh8A/HE361GmO05A1Dbm0WLwQIjW3wfAELkj8Q2bNtmxAH+
	cCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=t2v4bcnXRr8eW11BzXbVVvYneBAHNkiB4EQSFfBLDrc=;
	b=GsxcbKVygyY0w39ngJbMaxn/hmachhmr0/kH15Zi9kvLNLTXTWiy5iNLptoUK9fS3E
	Dr7/SFvvsAziOur7me3fD15FH72pDSXuYoMLIl6RxuKPQP5/6ZOG/SpJDznmMzLGaNuB
	E6Y7rfIOtdNcz2nZYBXe6IgFxggebXi8pHkZ+95bPkfYu3DubVorpptyzAmcUkaN7vQT
	H2nh8xtCTM+P0mjPwNMltjqWJpHPF09tTiXjyZUfNwuEcayLLZThuvMY66VmU5HDaaAs
	PYxDiyttoRVcifnGb3Hj6iThrjK6En88iwozEH0TBc31M6PUUq8pQFKQMw47+9zraa7F
	nY/A==
X-Gm-Message-State: AD7BkJJI4d2DEwSRyqUpt+vwID7o30nZ7xsSUXihNDehPmVdk0GFrKXtllMIKF0tr1/EeiTL
X-Received: by 10.28.215.79 with SMTP id o76mr1282389wmg.95.1457136729820;
	Fri, 04 Mar 2016 16:12:09 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	hx10sm5638075wjb.25.2016.03.04.16.12.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 16:12:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:12:03 +0000
Message-Id: <1457136723-19606-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
References: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] xmlto: ensure /bin/bash is used as bash
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
X-List-Received-Date: Sat, 05 Mar 2016 00:12:09 -0000

The xmlto script uses bashisms and checks at configure time to find a bash
binary.  If the build host has /bin/sh as bash then this gets detected, which
causes problems in native builds if the sstate is then shared to a machine with
/bin/sh as dash.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 514f527..54438ef 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -27,7 +27,7 @@ RDEPENDS_${PN}_append_class-target = " \
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF_append = " XMLLINT=xmllint XSLTPROC=xsltproc"
+EXTRA_OECONF_append = " BASH=/bin/bash XMLLINT=xmllint XSLTPROC=xsltproc"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/xml/
-- 
2.7.0


