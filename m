Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.7507.1625584377708841763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 08:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=l6LKQgqf;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1m0mkp-0001Hl-4L; Tue, 06 Jul 2021 17:12:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zTo4RffjATDi5vVSb5VdQdk8PS7Fgi4vdHaXXMk1UOg=; b=l6LKQgqfmnFr/anD/FmQSFI+8N
	XaV8mUTp6ezNod4hTvjYB6HXQdmfXzbdqn+8nDJCibfmPWXAWZan4wq5HwxCz3WklRMGbmPv7oYqL
	1m+RZnhOMtAgEDB1yAQF6DEm/4y1AvZB27dA5l2U4llC1dKKbqg4gNHvQBZGM9/YYI5LFZfi5StCu
	AeT4C/iufrWGUatUnKEIDjxr6lXFy14+LvR0hTJ/22b/Wb594fIMMSSVX+cjF0LeI5efVsM9QcMM1
	R8syrp3DSAtBq5sstKNGlzYkutP9FICp1CG9JAkRIDFJFSd/+bT211e/MpplQOYGRte1S0B9McUbF
	NyfDeezA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1m0mkl-0005x3-63; Tue, 06 Jul 2021 17:12:53 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] tzdata: Allow controlling zoneinfo binary format
Date: Tue,  6 Jul 2021 17:12:40 +0200
Message-Id: <20210706151240.238438-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: dda648b1d3e643e91fd1a0320e0a0c7d
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210706151253Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

tzcode 2020b changed the default format from "-b fat" to "-b slim".
Allow external control for the binary format.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index f8443110d5..09145e1ed0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -19,13 +19,17 @@ TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
         "
 # pacificnew 
 
+# "slim" is the default since 2020b
+# "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql
+ZIC_FMT ?= "slim"
+
 do_compile () {
         for zone in ${TZONES}; do \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
                 ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
                 ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
+            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
                 ${S}/${zone} ; \
         done
 }
-- 
2.31.1

