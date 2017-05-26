Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 087927826C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 16:13:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id d127so25009439wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6LXqBYLIYUJLBfEIyQg9RtFZk3dtS53OSlNSHjT2/Rw=;
	b=CgmjHoCflMjRIfB/8KYHTZSi8s6gHq3nNvJ+fTXfbz8aujEGqAe+YwoesRY0gacuzd
	qROyWsHusRGCf6LZHupOzp0Q9r5Rh9Y6MvJTS535MGdUdMNOS4TB4xbEO2Lxxg2PTDYe
	jNrN2cO2BYIuey8WVTO9Avrn9/4Dgy8RouxQ7WzMgfuYKSeusZBcL8sc4SC1U2KA1tRk
	lbxHs/36oPENDss2CKO2UURs3OxaK4A78OEMmzX6pgy9abooj+M3DXVkKexUIFQLtJEN
	UT0raJQuYBE+BZZckjn6LQVqrWNt4wghGuDo7gpgSvYsYAfb6XR9k9r6HHoFWm1TJXJY
	8WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6LXqBYLIYUJLBfEIyQg9RtFZk3dtS53OSlNSHjT2/Rw=;
	b=LFDPZjscn0AcyUau7f5Hn6lYt9qe1eIBSVbcSZSjgcffB9FcUe2Vc0Ux5Sj6RZEK/s
	F7OZWEmpJ7DsBpoFSFbubNAxAI+BVlAan/wnIKoEV6qIY+RtwD/VCi0ldXJdtahkKt+K
	qv+uT329F6H6MRHBWb0Gvmza5Jj9z3l4QedEZtS3xXgH6Dem1BjFYVtMz4i8eiTBwUQG
	9rbKozvD0MHYhYPwvOG6A7VbykiT76TnsokEAR3ZurQ/kwbFzmJgzkWV5z68Iw4HmWfg
	3PqwOOukzi0DMuPDjzJTNOqJ18qJLcSOYkjdugZSvHW4s5nNAPYqJPt/V4OM9FsSClIV
	sg8g==
X-Gm-Message-State: AODbwcDlqnbAz73qFcNyksQbvBAl7aQs1h9HdwgParupCQmCiIEDOI88
	AtZJH13VIskhhPG74oA=
X-Received: by 10.28.169.81 with SMTP id s78mr2833295wme.93.1495815233307;
	Fri, 26 May 2017 09:13:53 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q203sm11208716wme.0.2017.05.26.09.13.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 09:13:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 17:13:49 +0100
Message-Id: <1495815229-10309-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] kconfig-frontends: fix another build race
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
X-List-Received-Date: Fri, 26 May 2017 16:13:55 -0000

It is possible that frontends/kconfig is written to by sed before frontends/
exists, so add a mkdir to ensure the directory always exits.

[ YOCTO #11574 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
index a06a547..a11186e 100644
--- a/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
+++ b/meta/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
@@ -21,6 +21,10 @@ diff --git a/Makefile.am b/Makefile.am
 index c8e96ef..1baa110 100644
 --- a/Makefile.am
 +++ b/Makefile.am
+@@ -173,2 +173,3 @@ bin_SCRIPTS += frontends/kconfig
+ frontends/kconfig: frontends/kconfig.in
++	$(MKDIR_P) $(@D)
+ 	$(AM_V_GEN)$(SED) -e 's/@KCFG_LIST@/$(kcfg_list)/g' \
 @@ -348,6 +348,7 @@ EXTRA_DIST += \
  	utils/kconfig-tweak.in.patch
  
-- 
2.8.1


