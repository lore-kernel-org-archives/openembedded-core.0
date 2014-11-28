Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 09C6472051
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 15:36:51 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so9164985wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 07:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zx4DDi1wN6TfD3X+BSjlD3cVZ24fc/DChFd8sXhckKk=;
	b=fQNF3jG8DZb9N+DreIZ9U6aUlnEJZjSNevhilTOANT2IDOKKFCBcn4g76hygDDcdO1
	soSqy9AV3xV5ygHyFOvMtKuY3bG6CWVV/xKy1Fv8iN35al5eLhgW05pEfUuHDeRvZyp+
	ocM4NfsEjJoNMZoq9HG10TLpc/AuNdpz0T3sBrchg0yv4G7JZ/0HV7To+oZKP1QnLNt4
	CPUCn9jq2fZTKYmyRyJu//JSyroiBPWDSrIj8PB2uSBOc+pT6CEx2N6o2eBOphT67Csv
	49vKcelNCrhbEnKkY4OwAnuO1ShUwqv6u1+JGCVAGlRJP9Cho50IyfYShNo4Koj1nTPf
	cBaw==
X-Gm-Message-State: ALoCoQn4IrT51RHL1oTnVt7sR1E1qEWltJAmox/uTDg9oA3snsN4Q+WKE+eNzxeeJ32eGaX8fDxK
X-Received: by 10.180.73.206 with SMTP id n14mr38797872wiv.60.1417189011551;
	Fri, 28 Nov 2014 07:36:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id k5sm8124094wjn.1.2014.11.28.07.36.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 07:36:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Nov 2014 15:36:29 +0000
Message-Id: <1417188989-30734-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bash: use EXTRA_AUTORECONF to disable autoheader
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
X-List-Received-Date: Fri, 28 Nov 2014 15:36:56 -0000

Disable autoheader by setting EXTRA_AUTORECONF to --exclude=autoheader instead
of setting AUTOHEADER to true.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bash/bash.inc |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d35d25c..89ec07a 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -8,6 +8,7 @@ inherit autotools-brokensep gettext texinfo update-alternatives ptest
 
 PARALLEL_MAKE = ""
 
+EXTRA_AUTORECONF = "--exclude=autoheader"
 EXTRA_OECONF = "--enable-job-control"
 
 ALTERNATIVE_${PN} = "sh"
@@ -15,8 +16,6 @@ ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] = "${base_bindir}/bash"
 ALTERNATIVE_PRIORITY = "100"
 
-export AUTOHEADER = "true"
-
 RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make"
-- 
1.7.10.4


