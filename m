Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16B5CA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:24:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.20308.1757075077634264588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h8ZFJagL;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3554AC8F1F9
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 12:24:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67748606B0;
	Fri,  5 Sep 2025 12:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDAEE102F0EE5;
	Fri,  5 Sep 2025 14:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757075074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pysOqjWifEv2nkm2le9hllk/x2Vw7Ka8P99rr5vsv04=;
	b=h8ZFJagL3gTIRKRuhWYvYKWDR6//Mzn0D/4K/zWfb1Dw5Jyl3Eizs/Qhbc/r2NueiZJt/b
	FYxsB6KdRIz9zc/AZCoSvApeoENrgrgQvZOHiuorUoXklD7KFY/WZzNjjR7JVe6lWg4zYp
	uHuzHdl4UnAUrLabkVoC7rma+m/wvXOsfottOzugizIUg4pBiMT2mBypjZaYu5QJgD96Pz
	+5KqN9ERh739RCiaDlqVb7Y9SeXA1kgf7vkZ+fGVbjlm3uO5JIeEUrzQV8xLmw2LHCXFHS
	pMWdUqTApRivtcg6h5J2F0mS/HiY/DYhM+tLfTfbxdfJwetehGKC6AQ47OYfBg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Sep 2025 14:23:57 +0200
Subject: [PATCH v2 1/2] lib/configfragments: add a show-fragments command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-show-fragments-v2-1-c13ec8df9296@bootlin.com>
References: <20250905-show-fragments-v2-0-c13ec8df9296@bootlin.com>
In-Reply-To: <20250905-show-fragments-v2-0-c13ec8df9296@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0/IG2Twidh0ZCSeBPaCTJHfdVNIstbcx8Sb9OsIk7U0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoutZ+TRoHyPX7IRTLhqCEnwZ0KHPbexi+P5qfX
 n/34QFBVEuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLrWfgAKCRDRgEFAKaOo
 NrswD/0fh2kTjEWeCiI5bQ142Pq7JymtKjX60uzAVJWdG+4vAjibzynI0ZmaxxE1FCIQ46+RqvI
 jdamtRIpEvx4EOs2f/IoTpAaeb3MfcFL1dZZay568syavn6Z3RnctLQrY2ReGY0N2Yfy0ijyPw8
 da2721NCH/rlubpbTrO6LMjscfJlLNCANV+sIuXZaZHWJAhfD+4R+RLrsL7zRjhuTr90M6kJIkd
 gbhBAeJeE213U1He7ZwKYGD1trFjyyaOVeDuA0UZzaP8Mdnj64hnydLKp0PVBO5MsisLnrqaW5f
 6/uM3Ecn+zHkygLficJSslSZQj25a7YnEznr7Bylc6hybFRQTaJ/UI1EQCOlVcE+93I3+T889HJ
 lbCGsFqkxVnf9z3Jb7gSMA/SgliIxMI3pDJqOryyTRv2pLKwTR/jujCLMfd6Qz0/x7FRd9cdrTH
 M1hsoRWB9i6BtI4Eutwtb3fwf18IZN+e22nr9CJxkv/UOpGFdnk5d+930b+1ZYcAJ1xAF4TMdHJ
 /qLldRLKZ/fcqrDEQ1L5j3LkIFXiMbfLlJEu8G8EK4kGKJfhjimS7TY6aAoTEr0gEOXykJ/dy++
 6o9nvWDeUfDrMM6OY8Ub7orfUFtdsQxElOd7NlIlVWYT+BJPDTnhkoXI4w1BNYYn/NdLmj99IIx
 MTldQSwbNbAbeAw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222998

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

-- 
2.51.0


