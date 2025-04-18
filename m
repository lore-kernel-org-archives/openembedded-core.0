Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB30C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:35:18 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11737.1744983317730523743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 06:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z/Jxwwko;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 853FA43995;
	Fri, 18 Apr 2025 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744983315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=94qFwi8366DcORULruZqCJSoAyY6jBXkcRJh7AkDKFc=;
	b=Z/JxwwkoN5PysLpw1PDQS4TsVifVdp8/oNXa89v85al9pRlipdkNC1T2RbqHt56dPrlk5V
	GzfAKrrTZLcX8JNEYPMt/6c2nV/8X3Py8/C8rQzFNQ0IwTH94C1OHUaD6luHOEbreWzAvt
	5reClCCyKC1If9AxSvy6V/x+iSfN1G5g/qgFWXZLPpHKP2tsQwe8oskFCYQYBuid0qKyOe
	L0CREkuPI2YP2BEQ6qX009SDYQ2NWJ4P64gWk/1uYnb3u89m9iZi5PrE6Ti/fG1fdX3wQp
	FdBWd9j3iCdhDKsxuK7KWL6t9xszGexU6lmPmGCySQsPRwa3bg9ehoIP0Awe0g==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v2] send-error-report: improve debugging
Date: Fri, 18 Apr 2025 15:35:04 +0200
Message-ID: <20250418133504.932848-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnheptdfgjeekkeehgfegkeeffffhjeevffehudevkedttdfgleejteffieegieevueefnecuffhomhgrihhnpeguvggsuhhgfhhrvghsphhonhhsvggtohhnthgvnhhtvgdrrhgvrggunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeigphhsudefqdduudeihehgjedrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 13:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215131

From: Thomas Perrot <thomas.perrot@bootlin.com>

- add a debug mode
- print the request and the response when an error occurs.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---

Changes in version 2:
- Drop the redundant checks

scripts/send-error-report | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index cfbcaa52cbc3..9ea7160f52c4 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -6,6 +6,7 @@
 # Copyright (C) 2013 Intel Corporation
 # Author: Andreea Proca <andreea.b.proca@intel.com>
 # Author: Michael Wood <michael.g.wood@intel.com>
+# Author: Thomas Perrot <thomas.perrot@bootlin.com>
 #
 # SPDX-License-Identifier: GPL-2.0-only
 #
@@ -22,7 +23,7 @@ scripts_lib_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'li
 sys.path.insert(0, scripts_lib_path)
 import argparse_oe

-version = "0.3"
+version = "0.4"

 log = logging.getLogger("send-error-report")
 logging.basicConfig(format='%(levelname)s: %(message)s')
@@ -140,14 +141,21 @@ def send_data(data, args):
         url = args.protocol+args.server+"/ClientPost/"

     req = urllib.request.Request(url, data=data, headers=headers)
+
+    log.debug(f"Request URL: {url}")
+    log.debug(f"Request Headers: {headers}")
+    log.debug(f"Request Data: {data.decode('utf-8')}")
+
     try:
         response = urllib.request.urlopen(req)
     except urllib.error.HTTPError as e:
-        logging.error(str(e))
+        log.error(f"HTTP Error {e.code}: {e.reason}")
+        log.debug(f"Response Content: {e.read().decode('utf-8')}")
         sys.exit(1)

-    print(response.read().decode('utf-8'))
-
+    log.debug(f"Response Status: {response.status}")
+    log.debug(f"Response Headers: {response.getheaders()}")
+    log.info(response.read().decode('utf-8'))

 if __name__ == '__main__':
     arg_parse = argparse_oe.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
@@ -195,13 +203,20 @@ if __name__ == '__main__':
                            dest="protocol",
                            action="store_const", const="http://", default="https://")

-
+    arg_parse.add_argument("-d",
+                           "--debug",
+                           help="Enable debug mode to print request/response details",
+                           action="store_true")

     args = arg_parse.parse_args()

     if (args.json == False):
         print("Preparing to send errors to: "+args.server)

+    # Enable debugging if requested
+    if args.debug:
+        log.setLevel(logging.DEBUG)
+
     data = prepare_data(args)
     send_data(data, args)

--
2.49.0

