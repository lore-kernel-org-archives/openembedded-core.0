Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1Sf2dM-0003so-SJ
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 07:30:17 +0200
Received: by dalh21 with SMTP id h21so2030949dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 22:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=rsn8NS1oEL2D5YQTQlGej5X89jIqsMsJenk7E2dacWY=;
	b=SgZW5cSs/iv1iK5UsDljUe7t53gUtppj2X9OGaQwVfKlf5p0ck4I3EmIKR3hMBMNAa
	lHmxDNpTjQlMUcn5kbclys7bFWGeJdzkPw14kgKo4S76wqXmICAVjhC+o7ABo2oIsWHh
	feWDZH5aTZWbrROC6M+jNk4hjiPYXosZGwFcU/oF5zcgrIFemtUBHqKXxdWV35tPoIk5
	e0n7tzAAOBkQBDawyKrsJ2o02IqvJyxiCOBy4phguW7ErdJnu8bS3l/P+p91vnELIDHs
	yGJwXYb9If5qmnFaidBhMnCpwrDSrjokkEIb96HkyZphado6xTXonG7QDmEQ8vmu1skr
	MU1Q==
Received: by 10.68.228.136 with SMTP id si8mr3694574pbc.159.1339651179173;
	Wed, 13 Jun 2012 22:19:39 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id ol1sm8241578pbb.25.2012.06.13.22.19.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jun 2012 22:19:38 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Yocto Project <yocto@yoctoproject.org>
Date: Wed, 13 Jun 2012 22:19:32 -0700
Message-Id: <3b44305edae36265295087fb5f31d22d660599b8.1339650859.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339650859.git.dvhart@linux.intel.com>
References: <cover.1339650859.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1339650859.git.dvhart@linux.intel.com>
References: <cover.1339650859.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmLwFwL99x6Mp1isjemV8iat0/wifrG06diFn0NoWZ631RoyvvvJRfUxESg+ykOGUPBXUhF
Cc: Darren Hart <dvhart@linux.intel.com>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] busybox: Add setsid and cttyhack for tiny DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 05:30:17 -0000

When building very small systems, it can be useful to spawn
a shell from a simple init script, rather than a full System V Init
process. This requires the shell be the session leader and be able to
open the controlling terminal if it is to have job control.

Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this for distros
defining the "tiny" DISTRO_FEATURE.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: OE Core <openembedded-core@lists.openembedded.org>
---
 meta/recipes-core/busybox/busybox.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5b83d32..d07ba7e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -57,6 +57,8 @@ def features_to_busybox_settings(d):
 	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
 	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
 	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	busybox_cfg('tiny', distro_features, 'CONFIG_SETSID', cnf, rem)
+	busybox_cfg('tiny', distro_features, 'CONFIG_CTTYHACK', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_uclibc_settings(d)}
-- 
1.7.5.4



