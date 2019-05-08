Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F04A67DDBA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:40:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r4so11225622wro.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DNpcP986id228eE9VVIFwcEm0wIeByahaDK6nfaMEo0=;
	b=FzQE26cQI9Tbbi0wZQPPg41oXOS+cSglVdMHhCDxE721EdpanZn7iAKYNJjOhhHaPQ
	IyQjnxiLNsdag6Z6J5wvFtZ9IDJ79euMgJYW7kycnQe1wDlbInJyB3/oB+uoszM8jA9a
	hJjBlharcclpD784XEgs6nCEYNmpwMDkE5TiauP7P2ch5tEOooN+wASaJZBBy0pgFnjE
	llmPpOWmFQN4ahSeo0yRUTXXnCVfdlvJ5LCROgM3F51lMQCha+zIrgavXHNolY15clry
	5cBu7mXoYu2IbZ8udytcUDOLjxd1qh0YGVoa172sC4R1OfLDGf4L1rNIpm2XXTEDzEV9
	dpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DNpcP986id228eE9VVIFwcEm0wIeByahaDK6nfaMEo0=;
	b=easIBX0g0enEWliDSgmySlZnkXsSMcwZBccSmLlzG2w6pwGJFSjsmXNhyZ+pK2WFDY
	WNr4T18rmYrHau+iQg+cToCaezF8IFpTkcJMxdaJtzSR9E9Ja877HCYSkQdqI2J6NuX8
	Xd2qOleLx5shujw0aLPUof1wcNInenz2x994Da92RO3OeucRV2tgqKZjwCLrPZgRzU23
	cr0stjb0qHM5pgnav5D0O6ypehOQH7kKhwrh6DHfAraGTE7U6SVmnZpGOo6+Q5m89t7a
	cDh6KSHbuRHdQdm2dJndIHZog5473H6Vyl9DdHpbzG5KwvEc54nlhdP5z8Dst3kJAd1q
	KXaQ==
X-Gm-Message-State: APjAAAULzbD/35DJyX+SLGwmsogblloGvqxcfckOJFYd/I+3yh00m8ly
	tDXyn/GV7Zm6aDJaIiA9zb1X8tWsVlE=
X-Google-Smtp-Source: APXvYqzK7iYrxggJ29Buy1U8+z/Z0m+d3R1OgmLxLH6moiPljgEKtFjB9diKoja1tOrmxSWxv4dPug==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr12260691wrn.191.1557312027442; 
	Wed, 08 May 2019 03:40:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q2sm21242517wrd.48.2019.05.08.03.40.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:40:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:40:24 +0100
Message-Id: <20190508104024.26159-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] patch: add minver and maxver parameters
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
X-List-Received-Date: Wed, 08 May 2019 10:40:27 -0000

Add minver/maxver parameters to limit patch application by comparing PV.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/patch.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f43cf047c06..91624e26ddb 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -847,6 +847,7 @@ def src_patches(d, all=False, expand=True):
 
 
 def should_apply(parm, d):
+    import bb.utils
     if "mindate" in parm or "maxdate" in parm:
         pn = d.getVar('PN')
         srcdate = d.getVar('SRCDATE_%s' % pn)
@@ -883,5 +884,15 @@ def should_apply(parm, d):
         if srcrev and parm["notrev"] in srcrev:
             return False, "doesn't apply to revision"
 
+    if "maxver" in parm:
+        pv = d.getVar('PV')
+        if bb.utils.vercmp_string_op(pv, parm["maxver"], ">"):
+            return False, "applies to earlier version"
+
+    if "minver" in parm:
+        pv = d.getVar('PV')
+        if bb.utils.vercmp_string_op(pv, parm["minver"], "<"):
+            return False, "applies to later version"
+
     return True, None
 
-- 
2.11.0


