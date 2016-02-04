Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DF75660670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:23:00 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so12210465wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Cq1FGxsPEz0mRBr4pVcurSu0S7/HrLjuWEiJvf3C00Y=;
	b=c7lRYXoFW1lZcH1ik4R8xmIrFIJ/e13raIGHOFwRmmucjMax3sHfQW+SwvwFbjdoQ4
	uVDyZOoJfleOPYgJWozemVkppU53INpcS3b1CSJD7XVIjsQc7hrjlfH8mCZvOuQ8Xur9
	hKefqki2DqTy6dHc+rwRgUPlYRDWtySqoWvT+85S5Kq4vPGaIuh7EzZxa3+YjD8YparM
	rMnOmoz4/ww3ZMssHYLxeq+mk122oVeLF3ONMSgRWYythVAhqtCPyEkY/LBQPr0nloGE
	7efb/TlklM9G/XyXjQl7mpiWD35AdBEU1J5JYdrJODpf94rFDY96fsJfZCffMeJ8wt1S
	meKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Cq1FGxsPEz0mRBr4pVcurSu0S7/HrLjuWEiJvf3C00Y=;
	b=PKRUZP/xlkv6TC7WNztm2SoNWIFNXLrj3VW3uyF57OBKFNcoJRgdZZOLEThugm3J5e
	vyhJmpCVyp8ZSyPvhaG9NbBgEL+Z2wRAcdyzghQ9VfL2mAcCplFXEd4Vb/cscBr9YNfq
	dq1kByS9MkXek2Es671LeuFBtmbSHhZtELrkCR0VoEgt5wU0QXtSeYq4PfajSflFKyHe
	/GIG6xa58LvLrVbi7esaGZIAHpI0X9qUa4/ihAI+PH4hTnFLINLzyMOoahZ1o0+snCm4
	6TxiRlfFrAerpqVel5uBOt6ADXjHNOqaW0agNceV6c0JoNNcGCPxsSzyocxCpDYztO6I
	CFWw==
X-Gm-Message-State: AG10YORdmYflAXNYtmntnhKtRzAk/Zshfl2oP2IG3BPeB9cLtwMgibrhLO56A+D/2EPoFOeB
X-Received: by 10.28.6.213 with SMTP id 204mr11166677wmg.47.1454602981188;
	Thu, 04 Feb 2016 08:23:01 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i2sm11951507wjx.42.2016.02.04.08.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 08:23:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:22:49 +0000
Message-Id: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/4] syslinux: remove LDFLAGS manipulation
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
X-List-Received-Date: Thu, 04 Feb 2016 16:23:03 -0000

syslinux appears to be using gcc to link instead of LD directly now, so we can
remove the manipulation of LDFLAGS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.03.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
index 51d5474..ab8a51a 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
@@ -37,8 +37,6 @@ EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
 	DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
 "
-# syslinux uses $LD for linking, strip `-Wl,' so it can work
-export LDFLAGS = "`echo $LDFLAGS | sed 's/-Wl,//g'`"
 
 do_configure() {
 	# drop win32 targets or build fails
-- 
2.7.0


