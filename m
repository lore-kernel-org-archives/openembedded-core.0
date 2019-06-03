Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 09C377E326
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:27:24 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id n189so8781067itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jafEHOJBr4ngMzRMrbxDMNfz3gWjXxipPsHkbWfsmXE=;
	b=REY5tdt+HbQZtmqu2CXF7uW6wOw3hP8D/i+SlsjwPuR6+ZgYImCHCi8X6kLWppZTBR
	7RP1Cb56iadlWwxPEezj0B4fwsPWiZI4EAojGzPOeM2m1goXHbz0s9320IYZ93kYmT/U
	FyldRcqUYV+UGpbKBs1latJ6bqt3fBNWIBjKeEvyQ38s+umNdDxJkzzULJa4pWNPhv1a
	OcaZ/s4SyjaTmiZGDGhVu+WI/XRUOmoeOP9BmYotX9eRfZw5Q/D4rJXbgW/bjTmG865r
	16uE/ueR6UyUFqfYrfuO7aH9o78LeVTLomAPGaVCsQefrWfssbK6tSLWz8N2m7/PLIOl
	qZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jafEHOJBr4ngMzRMrbxDMNfz3gWjXxipPsHkbWfsmXE=;
	b=m6xenu8A66m90ULdlaeK91/59BohKR9Xb3ThnlpPSs/5sHHVqdjRxleL+/LY0ZAfZF
	PQE7oxEes5LSC5YIm4W0Ti9EbUA8CYXCQf8mTKs2yyujMkSE1fSE6eI3XJCcCmRUot61
	JdVtDpCzTqIOgUJ2g6lGinI9ALpdC9f8+kZGmZpiW/trjZwh59IPenx9OFkpNyzaZB2V
	F7kZs0OK8vdtd9s1lnI+iG/XzC+cbIl8GX3AwaXLHnFuHPbb3AWwTM+bev3o9U4yK7TT
	38Nm7wBwfa/QErOjqD04ORTAyGA8ttXkkTXUgjKfFgzsZQSUSf+jGR21es1m67eIYODY
	AI7w==
X-Gm-Message-State: APjAAAXFzkm3hYh+fYKA1kAx0pOuKqH38yoa7m6vTssBnubHIb0pNZQt
	jETvF3yMLzGAFdd8xDbeTpNWsgYX
X-Google-Smtp-Source: APXvYqzzegtLL6QPnzobCD2g/7a8NYEtmI7AvsaPq7jV9AGpel2/LquhVG/u/7nzE9aGa2R4wrnSVQ==
X-Received: by 2002:a02:c918:: with SMTP id t24mr17967100jao.111.1559575645761;
	Mon, 03 Jun 2019 08:27:25 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id m7sm4893976iob.69.2019.06.03.08.27.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 08:27:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 10:27:19 -0500
Message-Id: <20190603152719.17295-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531165734.14435-1-JPEWhacker@gmail.com>
References: <20190531165734.14435-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] bash: Replace uninative loader path in ptest
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
X-List-Received-Date: Mon, 03 Jun 2019 15:27:25 -0000
Content-Transfer-Encoding: 8bit

The Makefile used for bash-ptest can pick up the path to the uninative
loader through BUILD_LDFLAGS. This includes the full path to the
uninative loader, which is not reproducible. Replace it with /bin/false.
It doesn't appear as if these native programs are used in the test
suites and if there are likely to be other problems related to building
them using the BUILD_* flags.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index dbb803ddefd..27207c38853 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -78,6 +78,7 @@ do_install_ptest () {
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${UNINATIVE_LOADER}:${base_bindir}/false:g' \
 	     ${D}${PTEST_PATH}/Makefile
 }
 
-- 
2.21.0


