Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AE2CD6FF01
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:00:30 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so9799211wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=t2v4bcnXRr8eW11BzXbVVvYneBAHNkiB4EQSFfBLDrc=;
	b=VbL54+TQd/B3pYExJ/KisMfDJXz/zxRvlSbYZNd8rSdBs6946tZGmZiA+Gy5X39xbs
	dU0cKSWouOfDO3i9KbNe0KzdYiEZC6Cgszkq10eshXK2pxrDMYvcbtS51AkkFReoPPlH
	Iz6qEhxkKjjbiiliHaPxpYtzaH3uJoz0WwpMQoIhMdj+bL0xsHqsxSb4v/ADQkgmwS8J
	Arge5wxL5tKCKrDw25KD0nzDhM0SEJNtdt1R1E3jSu8EqVgLWZCYp7Oe9sctfyGBI7u7
	HJ5FiSpmhc6Hp8RvzpLGNIKvJb5R3Dc4a8B/LsuOGU38wTDaaBI+Ec9cHf4bz+Jsnoph
	lflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=t2v4bcnXRr8eW11BzXbVVvYneBAHNkiB4EQSFfBLDrc=;
	b=hXQcQipZ0AcyXQ90SNo7u50reLxtDRseAQKDgMs2WoslhUBY4ckzvr1E+OoUXrCfFs
	l0qUTMwr+6Napsmi1nd4k3odIomx6blVOwHmBh5awEwijmxyLqHaNugOMZxER36TJ4l0
	I0A3u9O/947RkG1ptzzWyXVGGtd4X83QNwSldxwxXmGpS8HRwqJ5DxlzrigMxiRrrF04
	0JcmYXmcgkt0ZTxD/Wkox61qLdERENOo3Y2qY2LYhlwNwDJFTj9bgix+BXi7NuUtF4T2
	G90QVWy9PfVCX3NSynnqJwf1cxXvScaUOiMCUm3dO1WkEcyeO/kfDcti2OdSMTUsx+Y6
	kCgA==
X-Gm-Message-State: AD7BkJKrfc1Ebs4l03+aF6AYAHoYlfJ8C6tYBNOZn8kz7orFSZOY7dkk+3kCZrvl45ojL7ne
X-Received: by 10.194.185.237 with SMTP id ff13mr12444609wjc.129.1457136030713;
	Fri, 04 Mar 2016 16:00:30 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e19sm1377105wmd.1.2016.03.04.16.00.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 16:00:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:00:28 +0000
Message-Id: <1457136028-19231-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] xmlto: ensure /bin/bash is used as bash
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
X-List-Received-Date: Sat, 05 Mar 2016 00:00:33 -0000

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


