Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.web08.6630.1611234481397164741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=KeXEqNaI;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=823; q=dns/txt; s=iport;
  t=1611234481; x=1612444081;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AsLwUrh0nFqT2niD3ACcinyURkS37kFc+N9fPqxjL2o=;
  b=KeXEqNaIWQqlFsnN+bBUUIXiEXa5hUHMi8GhGSjV9ekKwmTDdCz+eGRD
   VJT5n92X/lI0JDM17QS4dMICM+3Tzylq/9WLywIvt7xL42SMVUJXmYwgU
   vwDuJVdf6SjCHVUAulOcV0XJqjhdkb8YB0dj9zr2n62SHmpMKKMQZYJ1x
   I=;
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; 
   d="scan'208";a="763090990"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jan 2021 13:08:00 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 10LD80k6027573
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 21 Jan 2021 13:08:00 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 11953CC1251; Thu, 21 Jan 2021 05:08:00 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] pango: improve reproducibility
Date: Thu, 21 Jan 2021 05:07:58 -0800
Message-Id: <20210121130758.104506-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

Replace filename with basename in templates
to avoid absolute path in generated source files.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-graphics/pango/pango_1.48.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/pango/pango_1.48.0.bb b/meta/recipes-graphics/pango/pango_1.48.0.bb
index 552a44583c..a070581732 100644
--- a/meta/recipes-graphics/pango/pango_1.48.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.0.bb
@@ -35,6 +35,9 @@ GIR_MESON_OPTION = 'introspection'
 
 do_configure_prepend() {
     chmod +x ${S}/tests/*.py
+    if [ -n "$SOURCE_DATE_EPOCH" ]; then
+        find ${S} -name "*.template" -print0 | xargs -0 sed -i -e "s/@filename@/@basename@/"
+    fi
 }
 
 do_configure_prepend_toolchain-clang() {
-- 
2.26.2.Cisco

