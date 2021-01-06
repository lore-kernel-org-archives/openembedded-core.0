Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web08.8977.1609944498228982940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 06:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=FLT8AfzQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=908; q=dns/txt; s=iport;
  t=1609944498; x=1611154098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sDazRpGXswDVy0AFk/dV23d8iqWkmVNmPXUMgIxwFQw=;
  b=FLT8AfzQ1QAjlUmaPpb5oM2F58jjHWm+lhly34CgedsXNRL3YWjOLBV8
   v5akFD81VNihAllcnON8w0MxaCjHjrSI4+RJ/WeWPSAPnooptt/1vv3oX
   4xh258BkSdaHh7uR8wGM1BfgYfqdGS23hXWeFWiY+Pbdz29OYeL7GFHZX
   E=;
X-IronPort-AV: E=Sophos;i="5.78,480,1599523200"; 
   d="scan'208";a="639872349"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Jan 2021 14:48:17 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 106EmGCD024738
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 6 Jan 2021 14:48:17 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 7487BCC1251; Wed,  6 Jan 2021 06:48:16 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [meta-oe][PATCH] libsmi: set awk as target path
Date: Wed,  6 Jan 2021 06:48:13 -0800
Message-Id: <20210106144813.50036-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Content-Transfer-Encoding: 8bit

smistrip contains absolute path and prevent to
create reproducible builds. smistrip should use
target awk not host one, so override path.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 98cc63eb3..212b1e797 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "wget"
 
 inherit autotools
 
-EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget"
+EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install_append () {
     install -d ${D}${sysconfdir}
-- 
2.26.2.Cisco

