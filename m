Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web08.11327.1621955836059522053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 08:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=UhU1pFIb;
 spf=pass (domain: foss.st.com, ip: 185.132.182.106, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PF7x1D026792
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HTc42U5tea7MQJ9eRq7DDTBIxDyoLqg1tj4FrxkXDgc=;
 b=UhU1pFIbQJX5YGjqTsbA8Vdi2ZjtK7VRE2UH3ZEVUg4QccMg7LZQIGlCQA/bQJmacwYl
 DPar9tvSio0isjKWGkFDlOAoAFs6e/d0aw0aF+tVATHKq5pF8q2IcAQWLbEZfKbBhS2E
 KgLjpEAKXAkUuvJhGgUWDgjpkfwKJZ/QKXfWl05w9OzpxUKZGtrQ0dFezUzHlaOHkEb2
 wMsakqXUU1j0z76SPYZKcOA0Beitz2yUt7F5B00m1OPjJav12yRjT5mFHg+EpCoXI6We
 BJoHSyn8cbD3XUt46AoFRStXbuC9tJ04Vf1510HKR4ptcMJCohmRpQ2+7Xfj9v9fSoyz gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38r9wggcny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BBD310002A
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E207230D0D
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:12 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May 2021 17:17:11
 +0200
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Subject: [hardknott][PATCH 1/2] glib-2.0: use python3targetconfig
Date: Tue, 25 May 2021 17:17:08 +0200
Message-ID: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_07:2021-05-25,2021-05-25 signatures=0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Meson request to have a valid python, meson-log indicate that
issue come from:
ModuleNotFoundError: No module named '_sysconfigdata'

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 71777bc459..1b513654d8 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -29,6 +29,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 LEAD_SONAME = "libglib-2.0.*"
 
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages
+inherit python3targetconfig
 
 DEPENDS_append_class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-- 
2.25.1

