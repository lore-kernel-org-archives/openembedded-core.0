Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.7634.1593080526167583199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ft1Fk6he;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1325; q=dns/txt; s=axis-central1;
  t=1593080526; x=1624616526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EpYVmKIwRkqe9/GtLeZRPanOfkU9AWfxlK1ni/FVaws=;
  b=ft1Fk6hePdwq9J047cC7QAuwOA/cW/G7jHe77nTEL4uDBamJ+nhQSjsG
   pfqx/2oZBGvQ7HsxbVJe5xCSaWf2//watEWep42CEtJpr9dxSVbiIe+z/
   YUq17yikHdmSS/zz9q6NukSoOHcOqj5SKcujNiTrozxXKBvWRAfWkx+DA
   xByO2OkxSYJbuC9AENFY157YqsYvE/BfKOJCRZPGHxyypIWoYt01IUlPN
   hPmRA2WD6YyF2fhnfNWDarq8IQvU+EH2cjnu48wMDqoJ6GdDLzV0A45Qw
   yDwhBiApHEKkGEz4wjI6F2gyD8DtsHtUFUcIdftwdKgFIB/ZQsJGIIwzs
   w==;
IronPort-SDR: OWF/YGHGWDacM3l+MGcRpEt2wJdUiZr4qvGN/FJQ2C12Vf0yv1IvzdrKfIlLYjJ8aJSziYoZrO
 jl8VyoP+Op3p5HqYjdQQPll7Kqr/Ak6eIaAWpban/CnvG9MjF/fAgWbqPt/jfIwixzVru0ahpK
 o+UeSiFxw+e8B4+2D/U0MSjLtYhr7kiOlyNfMJzX9jaz0ylsBRJjTcTzguu+14uNx9PTOBzce8
 R9Svd6XFbyI1o/0b4BcXMJ3IQHa+cvLrCWPJEoHlXfCw/IJn5VBdSaNs4MsWZxDJVn3Js4F77R
 3II=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="9893879"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH v2 01/26] nopackages.bbclass: Get tasks from variable
Date: Thu, 25 Jun 2020 12:21:20 +0200
Message-ID: <20200625102145.7139-2-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625102145.7139-1-fredrigu@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Get tasks from a variable instead of having them hardcoded. This will
enable other layers to add tasks that should be deleted when nopackages
is used.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/classes/nopackages.bbclass | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f5078bd..f36666ef5f 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,12 +1,7 @@
-deltask do_package
-deltask do_package_write_rpm
-deltask do_package_write_ipk
-deltask do_package_write_deb
-deltask do_package_qa
-deltask do_packagedata
-deltask do_package_setscene
-deltask do_package_write_rpm_setscene
-deltask do_package_write_ipk_setscene
-deltask do_package_write_deb_setscene
-deltask do_package_qa_setscene
-deltask do_packagedata_setscene
+NO_PACKAGES += "do_package do_package_write_rpm do_package_write_ipk do_package_write_deb do_package_qa do_packagedata do_package_setscene do_package_write_rpm_setscene do_package_write_ipk_setscene do_package_write_deb_setscene do_package_qa_setscene do_packagedata_setscene"
+
+python () {
+    list = d.getVar("NO_PACKAGES").split()
+    for task in list:
+        bb.build.deltask(task, d)
+}
-- 
2.20.1

