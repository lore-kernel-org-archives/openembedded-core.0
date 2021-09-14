Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.1502.1631643085694938220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 11:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ZIaR6Gg0;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631643086;
  x=1663179086;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+aZod+MhIKNJvZRzEeC7BUOlxiguNKy99dlRaSqfov4=;
  b=ZIaR6Gg0iok6tsNtrwbkilu0sE2hkWQqdbPwWjQ8CNH4a6aGnNBS4731
   uGj3vEWDTqsVlG2ZrXGp65oKnxTnacael8Al/r4rlW191rX6e4sT5QdV5
   jWmFly3rD+ouIubSZNYU5Ls2e9lf5gb/BBhYyeBN00ji9AQmQZ39fVFuU
   bPtxQsPT6EiH1PZvL2cdW7Fi+UzRFLjC8UYM9wOiG0RVmhg7M3cV7ZlcH
   FNQ+oYg/9ElmAdQ7ysVpcZOmJmPPNtiLZ8MNPNO+/9MWtegSaLW6Z7HsN
   eWISX+XQBk6XRyykBQ1J1SkR3391ltJ94LINVlUtpugnARPtlDuvQ+2Ht
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] create-spdx.bbclass: Search all license directories for licenses
Date: Tue, 14 Sep 2021 20:11:15 +0200
Message-ID: <20210914181115.28873-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Before, even if the code was seemingly written to search through all
licenses in ${COMMON_LICENSE_DIR} and ${LICENSE_PATH}, it would
actually bail out after only searching ${COMMON_LICENSE_DIR} due to
the exception handling.

Also refrain from using f-strings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/create-spdx.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index db85677d4c..3c73c21c04 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -67,6 +67,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
         extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
         extracted_info.name = name
         extracted_info.licenseId = ident
+        extracted_info.extractedText = None
 
         if name == "PD":
             # Special-case this.
@@ -78,10 +79,12 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                     with (Path(directory) / name).open(errors="replace") as f:
                         extracted_info.extractedText = f.read()
                         break
-                except Exception as e:
-                    # Error out, as the license was in available_licenses so
-                    # should be on disk somewhere.
-                    bb.error(f"Cannot find text for license {name}: {e}")
+                except FileNotFoundError:
+                    pass
+            if extracted_info.extractedText is None:
+                # Error out, as the license was in available_licenses so should
+                # be on disk somewhere.
+                bb.error("Cannot find text for license %s" % name)
         else:
             # If it's not SPDX, or PD, or in available licenses, then NO_GENERIC_LICENSE must be set
             filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
@@ -90,7 +93,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                 with open(filename, errors="replace") as f:
                     extracted_info.extractedText = f.read()
             else:
-                bb.error(f"Cannot find any text for license {name}")
+                bb.error("Cannot find any text for license %s" % name)
 
         extracted[name] = extracted_info
         document.hasExtractedLicensingInfos.append(extracted_info)
