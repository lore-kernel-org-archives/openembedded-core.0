Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CADE7EF54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:49:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so4648643wma.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J+jrwkOkC+4+t8oucsbeEOp6DsKdwYGuEIgD+g3aJvY=;
	b=W1A+ZbeWuYN1yqserNTUmLVbiizL4E7pKHgJN8PI3T7niIAheSXmCHmTSNt7RsblH8
	7vnNgcHXWm1caWv/N1QHjaTSkPMLzcWMEvkk9rbNUKm5VHgJimL3RE1RljfYSgBiOXtm
	IzPNZlWguvapkmyT5kWelHhvCHHyRNlcDF1j9HFo57CzMNp9ZadBcb77tWD65jQon3UB
	SWA33tqQ+j5vSU8enkBeBuverSlgyODpC8xJ39r3kK0CimFHDaZE02bY0L79eXc72JyG
	sbV6NKKJtoDala25UHl1htPUhvWLKY34aDlu7I2cwYNvn3cBDvIplqGjVLYEJwcLQqf+
	9STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J+jrwkOkC+4+t8oucsbeEOp6DsKdwYGuEIgD+g3aJvY=;
	b=XtiUnsmsxZFEKFtpadQs/ovzU9o2VSu0bDxwRw4QOna5g1Iq+R4BidIPG6DDI4OHXj
	pnClo68o/bVOc7itGrP2KSISJ4dVI8GHQA2s7EP/Dgm4+mGMCBzWvjWhgObhUJ01+V5I
	mYIAufWeYFxW5MoW9JtEq5ceEmFJ3za7zdZnnbw42RrhqjceSTpJKs/GL0ITwZSroRUZ
	elr+ZV7v/Ny4bRn3G2qih2gDl+ZuTb0v5jhC1Y8/aIGj2NC/hUmS3ZKCZX/xJ8hCYdS/
	khSXYPR6se9MCVAMgYqIuLGybLNAHKFSv+qTZaIN4cZr4Z0fCQgtUqlOGx2O9LKlVAjY
	eRHA==
X-Gm-Message-State: APjAAAWmw7C8dM5NsCjs3cYTHCDfKOt5u8SzYIPoVORr1FW6oWwCpYT4
	Sv2AHA6oh5TmLOWSvmcVrF/e8J4QtKs=
X-Google-Smtp-Source: APXvYqxjFngXSp0IUm1WJv5WKEW0v6dKas1t7JUrqSLPFeRzb5eKJvloqcxDkbfA6+sJcq+cERQRjg==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr10198766wmi.50.1562935771589; 
	Fri, 12 Jul 2019 05:49:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l8sm14806256wrg.40.2019.07.12.05.49.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 05:49:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 13:49:26 +0100
Message-Id: <20190712124926.32150-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712124926.32150-1-ross.burton@intel.com>
References: <20190712124926.32150-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysstat:The sysstat.service in source should be installed for cron with systemd
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
X-List-Received-Date: Fri, 12 Jul 2019 12:49:31 -0000
Content-Transfer-Encoding: 8bit

From: Haiqing Bai <Haiqing.Bai@windriver.com>

The sysstat.service script in source launchs sysstat-collect and sysstat-summary
services when cron is installed with systemd. At this time, the upstream
sysstat.service must be installed.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 4e297216660..592cbf45743 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -20,6 +20,7 @@ inherit autotools-brokensep gettext systemd upstream-version-is-even
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
@@ -44,11 +45,13 @@ do_install() {
 	        install -d ${D}${sysconfdir}/tmpfiles.d
 	        echo "d ${localstatedir}/log/sa - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
-	fi
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron', 'false', 'true', d)}; then
+			install -d ${D}${systemd_unitdir}/system
+			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
+			sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+	        fi
+	fi
 }
 
 pkg_postinst_${PN} () {
-- 
2.20.1


