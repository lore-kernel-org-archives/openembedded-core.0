Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8E8605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 20:55:38 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so180418610wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 13:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NHcAqi+9rqSr7mDBSsxLMcyaHRU5hiA+3VcUhgVvrJI=;
	b=oNYyMLbiAMIJQKfGWzXsfK97RVOKzENxxFOU7QVVn7QRb2V9hZf6L+f3ChvS33/cPT
	qDsVnh8NIm6hlViD4Gh9n8gIQ3qjEYJpKvNNA5Db5XhRE2HtGRQVRmumPWjRNMiYgAoY
	c0I+b/hhAcCRtUPe1NyqPLR8heioFJUREi61Oz5DtqJ3YSNbMPjbr3eXnIu9ktPiRg/0
	D2aAG/JxanqSDYlUHq406Awbha7xZqcswlCOBYNOJlv8unCzUJyZv9ztsbvil+hqg0cB
	ZnQPEzjqXVv6Bht0o8p3w4pEqADPDtaKt5HPokPq6of1Fs9r9myE7uPqbzZjdfc6Cs/j
	R/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NHcAqi+9rqSr7mDBSsxLMcyaHRU5hiA+3VcUhgVvrJI=;
	b=LU6Jd2iUMSMKqYhBe3B79DyjJCMfHWdPFlM191nobNgLSlmi0+trEENsg2Fa0C1LDc
	ZP5dFzhRINDCzH3DDLp6iIjRZhCldW++ZfgrNZLX8ry20ojgDS6hxo/Ze4Qa9/K8Oll6
	kERTKUQR6Wp6CXOZ+eJbOIksmYBW053UduaA+u94Suwzl/gMr/D1SBU6KNma5MYVQzVo
	F6dWzmvGRiBDgXH/D9vCVihcPTXd2J4arjyOu4XfRDZEl2aqUhg6/ovFzXU+mrLniKpv
	GvpLEhyxlAvcOYjNm9l9r7L7/M0blwbk8BYnXNG+p/8ptOsSgD715FEUJqrG1ViBVp2Q
	RRhw==
X-Gm-Message-State: AD7BkJK0BA0455MwBhX3NwpxGdx/bzUo3ycfRAKgSlCpMojhHISRlg4BoLMFl7UN3SnABgfB
X-Received: by 10.28.90.68 with SMTP id o65mr21427680wmb.70.1458680138999;
	Tue, 22 Mar 2016 13:55:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	h67sm19002615wmf.15.2016.03.22.13.55.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Mar 2016 13:55:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 20:55:36 +0000
Message-Id: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] python-pygobject: use Python 2 instead of Python 3
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
X-List-Received-Date: Tue, 22 Mar 2016 20:55:40 -0000

Ideally this would be an option but that means conditional inherits.  For now
Python 2 is clearly the default Python in oe-core so switch to Python 2 instead
of 3.

This stops python3 being pulled inadvertently into builds, and appearing in
images that have ptest-pkgs installed (via dbus-test).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-pygobject_3.18.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
index e61d75c..8fe1d63 100644
--- a/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -3,9 +3,9 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
+inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
 
-DEPENDS += "python3 glib-2.0 gnome-common"
+DEPENDS += "python glib-2.0 gnome-common"
 
 SRCNAME="pygobject"
 SRC_URI = " \
@@ -20,6 +20,6 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-cairo"
+EXTRA_OECONF = "--disable-cairo --with-python=python2.7"
 
-RDEPENDS_${PN} += "python3-setuptools"
+RDEPENDS_${PN} += "python-setuptools"
-- 
2.7.0


