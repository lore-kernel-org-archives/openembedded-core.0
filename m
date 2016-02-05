Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4C083770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 11:47:40 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g62so44562967wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LiGF0z2ihp1Yw+Hv5V5sxIYp4a2n87NZGeT0kGWe04E=;
	b=c2Ckqj+ls7ISp/upSat9gQ7Q4tFYfD7ofWPwp9gkoYqlbF33BGraEtbK2M7uP79bSh
	eO+NSNQW87FA9F4NRBGzvsrf5+4qyw+5fFlCF3JvwLZtniGdoYgVwfnhsTziyRIOJDdR
	jizHJN83Gg7CsaAIZgizxam3F/e1E2HfQA2EEFAVMqE402eb2QC26e43We6X7FR8jvI/
	pEnEJg5T8t0Bjz0uyw5WVzi/sjGkkKzv/s8CWJitw09+1LUavvNFitt/IcV2R8OcMxid
	JyKXeCy553G34rA39+OnAOTcqfWb1SHGEYC72Iw5vlwKi21kr46d1iEMcuNB4nhhHrMM
	LE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LiGF0z2ihp1Yw+Hv5V5sxIYp4a2n87NZGeT0kGWe04E=;
	b=ho7eGe4rUGP/uFtJx34mP0qfad/mLIv5mDqGZSs7H0wBZFvVpEu+ydfaTFYDOACJni
	ClywYs2zCX4qwMDQ538azppy2b/0z7z9fqkLiO6SqYgHj7WTVD2Zv/kpYxLCfiLW2Fc9
	S1J4WKMAUh7fDCulC1NO5YAdhwbmYB6fFJNnj37uIPTdDfVCn+cpg5H07UstCgKeLmlE
	1gt8FzwnJfeD46GcPXGKZbRREiirl53G52JZ2Vx0B2HWBnS7V6/jKtCYqcFKtgrOZBIa
	USHzEA/DPvuvH5XFVnbGwo3Kh4zpooh8KjAMbjgygOHiCgjDpFeCm64GZo6Q1KrA5MSX
	Px8w==
X-Gm-Message-State: AG10YORmwf77kPZHvQXcyPDYp9zXUn1Xoww4vAdJCXMNyBkh18WwvzDc8a+cqSUWs4sGdIV+
X-Received: by 10.194.5.227 with SMTP id v3mr16078319wjv.59.1454672861297;
	Fri, 05 Feb 2016 03:47:41 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm15459046wjb.20.2016.02.05.03.47.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 03:47:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:47:36 +0000
Message-Id: <1454672856-13680-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
References: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] glib-2.0: use the system libpcre
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
X-List-Received-Date: Fri, 05 Feb 2016 11:47:43 -0000

Instead of using the internal copy of libpcre, use one that we build.  Note that
this requires libpcre enables Unicode properties.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index dc88d19..7a6a4ce 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -31,6 +31,9 @@ inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even
 
 S = "${WORKDIR}/glib-${PV}"
 
+PACKAGECONFIG ??= "system-pcre"
+PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
+
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
 PRINTF = "--enable-included-printf=no"
-- 
2.7.0


