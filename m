Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 908A673695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:09 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id zy2so4801264pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sf8yQLPYIroJkYr1zfYutbKjuq1G3CNT4UxNrWFE0AA=;
	b=mVS8wo8IsPaNPsbwrBssFe9O1Zs2ygSBR+c5oph/a6baSVHpAAqZ3j+PchjVD3zVme
	ir7PGaslNUtRbgjq0J57H2E2OqSCfYS54NiyOhVExAgZwcTYThzL6NLEQLcOaKZruiaF
	UcbLOVfzFZ3e+xi+hu5WE2N/Eq6fkDd6FvRiOeR7QYPrzYaFwEyDSmwcioElJyIcURBt
	6R/CTN2T6K4CIfmRYdekybUCpsi3YfXZ/hafz/6IPhWW99In+l6UVSWqvHJpmc7kvshc
	e3JfoOy1LDD3hXW/LaXPjlJD2zYVs1Fy6yAaP85EOev/62srITV4xhrTyqOBcfEMhwLK
	phXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=sf8yQLPYIroJkYr1zfYutbKjuq1G3CNT4UxNrWFE0AA=;
	b=e02Mo+jPYyWNRKKDWT1WPf7K1RA9/rbkMEH6MrKYf4VfTRIW2IwO4YHafCSdEad5RH
	uY5hOybyj0zsV4pr7ru+CMdyahfa/kBcllKji4KIUV7Sb8TjUUzGVzHiAS9N04ESQG+h
	yIK7kOZY1o++JcU6EjZx5IHGKRkTBtVyC9rKd5EMhwtavMWxtX6AOqMWrS/UKnhNPMaM
	4dzPCtpl6hhpZBT0qzO4SMniwEbbd88mzqGIKoQi1TXQfoTA6n9jXAwIeH3CjOFzdqvf
	HRN+NkyPpbQMqvFmgEB1ljqOiw3vNgdQCEaJIXXCeiIH+7w6sS4IWQDdtXNaMW+GVa0I
	kJOw==
X-Gm-Message-State: AOPr4FV0U70LC25klPANXKJYBvzWznDG9ADCWfK/qtpCI4t/UyHuYj/6pHp4sE3xom/sWA==
X-Received: by 10.66.33.1 with SMTP id n1mr6770102pai.65.1462988170486;
	Wed, 11 May 2016 10:36:10 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:20 -0700
Message-Id: <32524eeef8dd3331bc014fd20a63d0f389774710.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 17/42] libc-common.bbclass: Use sed instead of grep
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
X-List-Received-Date: Wed, 11 May 2016 17:36:10 -0000

Squash two install cmds into one
Replace grep with sed substitution logic, optimizes
away mv cmd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-common.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index bbc8016..11b0065 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -4,14 +4,12 @@ do_install() {
 		h=`echo $r|sed -e's,\.x$,.h,'`
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
 	done
-	install -d ${D}/${sysconfdir}/ 
-	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
+	install -Dm 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/ld.so.conf
 	install -d ${D}${localedir}
 	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
 	# get rid of some broken files...
 	for i in ${GLIBC_BROKEN_LOCALES}; do
-		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
-		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
+		sed -i "/$i/d" ${WORKDIR}/SUPPORTED
 	done
 	rm -f ${D}${sysconfdir}/rpc
 	rm -rf ${D}${datadir}/zoneinfo
-- 
2.8.2


