Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C745779547
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:08:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id m15-v6so10955875qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=PHN9hRxIvBNn6VtyrzK8RwAr2pfUeZlrNCPf2qcQGW0=;
	b=T8rPXFX/DWoalo1E6Qh69BepjtYVMgn6W776pTDc8rC/znKAIdQU+flbiBHrfUkBeH
	4mbGYYzSNSQFxKwfxhBQ2BfsY+94puq34f9n7BjyS954+dO32mf36GTgKeQSCVuiGhsr
	WUqOJ+GRVSRZy1h0JrLRys3qu1zVnnlMykO52RHBzbgJfPiU5z4WEloku4XASqlrMqW8
	nHefoLv4Qm+mIaTjFzELdoXgOToUmE/p3k8XnhnM/A191ToRTrVQ/NmJAQH0pclchCIa
	CFO2SJUOsQ0qtQ2CGhsnvdcdpW3nxWTdlmia/NiPsFitah7SWrfOwqRXU1tHFBu0uDfn
	5YKw==
X-Gm-Message-State: ABuFfogRZsAYMG4lAAE6j0i0Phai+I4TwhrFvTeZGIZ/7ws5roaSUjha
	ZUphv48M/K+N+mrSov5BDt3Nxcld71M=
X-Google-Smtp-Source: ACcGV63VTRu3s5cYTdWphX80e22WJ+19Gt5N6eLKvUn52QsklRf8WLhTuKnx2zyVl6cqegzcW2gMHg==
X-Received: by 2002:a05:6214:1108:: with SMTP id
	e8mr4238794qvs.194.1537967339240; 
	Wed, 26 Sep 2018 06:08:59 -0700 (PDT)
Received: from localhost.localdomain ([181.220.65.41])
	by smtp.gmail.com with ESMTPSA id
	a13-v6sm2714889qkg.94.2018.09.26.06.08.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Sep 2018 06:08:58 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 26 Sep 2018 10:08:53 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2018 10:08:52 -0300
Message-Id: <20180926130852.16208-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] util-linux: Fix packaging of util-linux-unshare
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
X-List-Received-Date: Wed, 26 Sep 2018 13:08:59 -0000
Content-Transfer-Encoding: 8bit

Below commit has added the unshare to alternatives but did not fix the
packaging of the changed file.

,----[ Offending commit ]
| commit 147da8fe7458a38598845958cb358bb094eba57b
| Author: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
| Date:   Thu Jul 5 11:57:19 2018 +0300
|
|     util-linux.inc: add fallocate & unshare to alternatives
|
|     These binaries can be provided by busybox triggering a conflict in
|     do_rootfs so update-alternatives needs to know about them to properly
|     create the symlinks.
|
|     Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
|     Signed-off-by: Ross Burton <ross.burton@intel.com>
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 9d52ed935f..c2e02e847a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -113,7 +113,7 @@ FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
 FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
 
 FILES_util-linux-switch-root = "${base_sbindir}/switch_root.${BPN}"
-FILES_util-linux-unshare = "${bindir}/unshare"
+FILES_util-linux-unshare = "${bindir}/unshare.${BPN}"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
-- 
2.19.0


