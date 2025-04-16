Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD98AC369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 10:02:03 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.15546.1744797718200059378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 03:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NuZyv6q5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EC6743163;
	Wed, 16 Apr 2025 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744797716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0FvZuq/bVz4gObCREWHycxk8lVh/ptpaDgWfFXWeheM=;
	b=NuZyv6q50IOj8D6SVMJ2GSBKbMc6g0esrQPj001bvjuIbDglr19DuW+nzaV9zGts2Oy+gf
	hoLNU0l5le9hpXLaSjppO94Kquqkqe1pmAyS5WS2tkVV9KxEXaeYJ/i3LIK+GkwHO+zFe9
	SBxKI8jkXanyp8ZPUSqGPURilOVlkBWnijTbhw3GJ2GjIy8H0arflMZYE9ACUUVTrYX0Sy
	i5ROxfSwIcGu2W0CQv2jmVUz4hOgB2Fh/sNN4AaOzJd5RLVIlzWEv+ciWunvbyc6A4dIRv
	inndiDz3PkLgD4FCn8EiCKemffFEY7XHsq4b7BneJiszyTZXI480EeOTDUBVLw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] send-error-report: improve debugging
Date: Wed, 16 Apr 2025 12:01:49 +0200
Message-ID: <20250416100149.274800-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnheptdfgjeekkeehgfegkeeffffhjeevffehudevkedttdfgleejteffieegieevueefnecuffhomhgrihhnpeguvggsuhhgfhhrvghsphhonhhsvggtohhnthgvnhhtvgdrrhgvrggunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeigphhsudefqdduudeihehgjedrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214986

From: Thomas Perrot <thomas.perrot@bootlin.com>

- add a debug mode
- print the request and the response when an error occurs.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 scripts/send-error-report | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index cfbcaa52cbc3..cdc1dfc5613a 100755
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
@@ -140,13 +141,25 @@ def send_data(data, args):
         url = args.protocol+args.server+"/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
+
+    if args.debug:
+        log.debug(f"Request URL: {url}")
+        log.debug(f"Request Headers: {headers}")
+        log.debug(f"Request Data: {data.decode('utf-8')}")
+
     try:
         response = urllib.request.urlopen(req)
     except urllib.error.HTTPError as e:
-        logging.error(str(e))
+        log.error(f"HTTP Error {e.code}: {e.reason}")
+        log.debug(f"Response Content: {e.read().decode('utf-8')}")
         sys.exit(1)
 
-    print(response.read().decode('utf-8'))
+    if args.debug:
+        log.debug(f"Response Status: {response.status}")
+        log.debug(f"Response Headers: {response.getheaders()}")
+        log.debug(f"Response Content: {response.read().decode('utf-8')}")
+    else:
+        print(response.read().decode('utf-8'))
 
 
 if __name__ == '__main__':
@@ -195,13 +208,20 @@ if __name__ == '__main__':
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


