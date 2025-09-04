Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9666BCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 13:18:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.39030.1756991882182394439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 06:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TZYuiAdc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0B9F94E40C5F
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 13:18:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D395E606BB;
	Thu,  4 Sep 2025 13:17:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4B851C22DB57;
	Thu,  4 Sep 2025 15:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756991879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lOmR1eX9dVpE34VrEZSHF0cOGb+wxP0CP5GGsPr6xEE=;
	b=TZYuiAdcm3jQjlo3XOlepO1Q4+ZIhlqgynIBoHLaDkSt20uoxzAxWXKTkssWUrGu3h2puc
	2P+mA2RBfA0E5Z1cMpu6jhlE6Ur614Dox6vAAcO4qTx0ibkWe1jMkGlnNV9oHwgMVRamh3
	Zdlmy7xo2g5ql+Cpd+6nhZU2zfY6qV2UWm/NqlstwQ3nZvZ4zVXa/jjuruEXJRWfDMRRZv
	o3z2btgJg9M+VPkLug6urTBBv6h37jB97v5OEloYTfdpEI7LdZCEmIl6ohkSdQU7FoI0Ub
	OKuKYGv/E+OjqVvSyxSHbafC5XJZuD8J4iw7ok8v5d9RQeYPimzzGZrBC5iwUg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Sep 2025 15:17:50 +0200
Subject: [PATCH] lib/configfragments: add a show-fragments command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-show-fragments-v1-1-ff41f5a75959@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAH6RuWgC/yXMTQ5AMBBA4avIrDVpGwRXEYtiykiUdPwl4u6K5
 bd47wJGT8hQRhd43IlpdgEqjqAdjOtRUBcMWupUFjIRPMyHsN70E7qVhUqkzY3SWWoUhGjxaOn
 8hlX9m7dmxHZ9L3DfDwz8mm9yAAAA
X-Change-ID: 20250904-show-fragments-140f8a1265a1
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2946;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YZRMo+dFRJ5HeO2PmS6hkS7UZLMdNbjkFaZvoOmxROY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBouZGFZqMYg+OG8T656dT3fSrdtYvfxVM4ra5ft
 HTJNnxcLGeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLmRhQAKCRDRgEFAKaOo
 NsVMEACDBD3P/OOQY06SxQU4fNGmtL8j/Mlg47ZvknkFag39zWwmIDJ6E1jpRDheDvWov4ErenJ
 6cjwL7AAOfquhyIgP6lx4m70IA7WTkIHFWXCeaKH+btkMEXqOQGQHQZRqfAosbS1qr1BmLpOaQ5
 DWo80jViRczHNo5Z7fHClUxlMYPuxUF/faECMZGDL90EaQ3xFNj8UZeWTg1D53f0CNM5+WKAxBa
 dtPbBCdrkdVbLeHZ6WBrTd3m8Zi50iLDmJSQiLd/qgpR54PqsoqXas3JewLrcTi4IHmH9yGZcU1
 fPW3C5vRulXbhzwoAQJDxNnI30hq976yC0aocl0858GrqVbzTw+M7BChmRg63eSROiEPuwuZRlZ
 tL7oafGaEbP0xxSqlLwapY9Fm+fOoHgoU4o1l7plBeHUM4Bh6P/UU99EL6BI1cpI2Uwiqrzl0os
 l2P+wzANyFuLCDemSobkORago9kBQJ0OgBq7Jk4qOhnCr45GbHa3oXOCuiU3qsBb0xDgJN1xKRZ
 OuzGFSS/jwv58sF2nkt64ToaYoJIFaQq7Hkg33a/qfAkbOt1gwsHqsnumhB97GiaGsDEHU8WHYP
 Bj4EmTjckAdxSBKAOaVH9VEZBL6JhMQX0e5p1W0SEbMXpLw01kLohsxuCCHMiuDklehdxkTV6h7
 wARypFkuh2VzesQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 13:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222927

We can print information on fragments (name, location, description,
etc.), but not their content.

Add a show-fragment command to do that. It can be used as follows:

  $ bitbake-config-build show-fragment core/yocto/sstate-mirror-cdn

And prints:

  .../meta/conf/fragments/yocto/sstate-mirror-cdn.conf:

  BB_CONF_FRAGMENT_SUMMARY = "Use prebuilt sstate artifacts for standard Yocto build configurations."
  BB_CONF_FRAGMENT_DESCRIPTION = "The Yocto Project has prebuilt artefacts available for standard build configurations. \
  ...

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 61c33ac316..fce3301bac 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -156,6 +156,18 @@ class ConfigFragmentsPlugin(LayerPlugin):
         if modified:
             print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
 
+    def do_show_fragment(self, args):
+        """ Show the content of a fragment """
+        for layername, layerdata in self.discover_fragments().items():
+            fragments = layerdata['fragments']
+            for fragment in fragments:
+                if fragment['name'] == args.fragmentname:
+                    print(f"{fragment['path']}:")
+                    print()
+                    with open(fragment['path']) as fd:
+                        print(fd.read())
+                    return
+
     def do_disable_all_fragments(self, args):
         """ Disable all fragments in the local build configuration """
         def disable_all_helper(varname, origvalue, op, newlines):
@@ -181,5 +193,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
         parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
         parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
 
+        parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
+        parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')
+
         parser_disable_all = self.add_command(sp, 'disable-all-fragments', self.do_disable_all_fragments, parserecipes=False)
         parser_disable_all.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))

---
base-commit: 0a849dc7edeecb6c16a8a0fe347015d6d85e9dfd
change-id: 20250904-show-fragments-140f8a1265a1

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


