Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2745961BE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:25:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id dw20so12020pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cTn/jfd7BAGVe91Xu83FWLY/qaJKDEMwhqYxRpVBJCA=;
	b=Yt3WguwK0s+gTHAajbvjHhbzxHieEk6NkXhx3K+85p49vR48W7KbpeYW4Yjv+THe2y
	K0Th/XC773Pb2ftD1JOlUyML248vASbBAShfg9TvK7nte86qT1bgmIRgmKew/gj5NM8m
	DbopTR553rTY9an2A+wuuuwlc9wXDhfatKajHNqbJ1QLP0zQkescX66CVYimGGZ+fYq8
	iFsBJiRXo2Sj7yDLcPiT6HXQkPZNdpqYE8w6mBAGOQHap9T87QCk9t0TUckW6JEIeiro
	+OC3eawcPmYrSyHl9sItai9d8Fe7Uz8sBtA9V4aaLeJSGA+1y88g9nDf1Hdo8r+XbgtU
	jTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=cTn/jfd7BAGVe91Xu83FWLY/qaJKDEMwhqYxRpVBJCA=;
	b=JHfOOcdeIv62CxENjiqXpJPFeofw8eD00i2wPnDF3bUWMpu9x1Mtjch4JBFzzwXCz1
	6geL/PMs6ViBsJYIuJP9Jy1JkdiOR7U+nsci4wYj2ST77BrCpqDKFH1POCG2Nsojvsfb
	mSAVrnQZ9pePQRPzeTWUhfs4dU+PteffRunGMtFadHzW8nWBPngovYcrQoudVgZsJzU8
	6IkinoSF2DUQGfJm7hx+LsdQanhg50yp2jhXbukx5o/lNKLTH9Rwcy5ESHa61is1tGBo
	dds4YS96jOAGuMGKgzW72yK+ZTvfcf9JUi3wqbd4pjstj2p52lSqCjvREEjQIctZMCrO
	oKSQ==
X-Gm-Message-State: ANhLgQ0Oge0CUmZSQ98YdEjJkja9rnynCXLWV/8eaVVNv6No9HsUpje1
	LsJB0PlMMs7x+Un2w8/NxOGoovOnciU=
X-Google-Smtp-Source: ADFU+vubJ80xdzHd+nCJUQhvU9jdRTspC0DA50NvUACGieaxOXGoItERkhNmtN33kKox81lV8g/Mpw==
X-Received: by 2002:a17:902:ac88:: with SMTP id
	h8mr5172919plr.256.1583965555878; 
	Wed, 11 Mar 2020 15:25:55 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	o128sm19098954pfg.5.2020.03.11.15.25.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:25:55 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 5AE582A05B0; Wed, 11 Mar 2020 15:25:54 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:25:43 -0700
Message-Id: <20200311222546.30284-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222546.30284-1-jpuhlman@mvista.com>
References: <20200311222546.30284-1-jpuhlman@mvista.com>
Subject: [PATCH 3/6] ltp: fix reproducibilty issues
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
X-List-Received-Date: Wed, 11 Mar 2020 22:25:55 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Man pages are copied in to the target filesystem from the configured
build, which leaks paths in to the work directory

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-extended/ltp/ltp_20200120.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index 5be9489a75..3e6cbc63f3 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -68,6 +68,12 @@ do_install(){
 
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+
+    # Makefile were configured in the build system
+    find ${D}${prefix} -name Makefile | xargs -n 1 sed -i \
+         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+         -e 's@[^ ]*-fmacro-prefix-map=[^ "]*@@g' \
+         -e 's@[^ ]*--sysroot=[^ "]*@@g' 
 }
 
 RDEPENDS_${PN} = "\
-- 
2.13.3


