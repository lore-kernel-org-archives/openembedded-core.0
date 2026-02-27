Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC1F1048922
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 23:38:25 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.109808.1772235495928508340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 15:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=TqCx5ZiP;
 dkim=pass header.i=@valla.it header.s=default header.b=n7n2Rrum;
 spf=pass (domain: valla.it, ip: 185.56.87.10, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235496;
	 b=Eyu9Wks1rMOcnv/P6rhmlcqzWphTFXqbHJFY0Mrz/aetTnuxnVBkEkVUkbuLrjfSeB3onBbIbN
	  4hV/BzzQrKF7NEj50CL1GdLWpt4qJu0T3QTc9kn1y2ELZR7es3jD4J4U2KNU8s8ht4qsZFJT8J
	  tdBhQvRzmRgAXKhdS38W5eKoeCGhqKO19tOnC2zTnvi7o2nG4mjwW8nvcg3KohKacKwgLlE3bP
	  8P5k8p2zZdO9B3FZ3JS1edGnjLWTn7OH2cC/zR8dM855+F3Sf6QQFiIWHWQ2AsPUd2vUGs4lNu
	  ZtXnFE2maz4YxniLGjyR4OUTrfkKR+12EW+nE0ei43lGCQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com; s=arckey; t=1772235496;
	bh=j6QTdKegY4p/3gu2L1L6ahphF54TSLOeGmAkkiiq8C4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=QAgy1OKPSZNbU/TmwIV31vg1cv81zyGm7KFbND+L+bjVUh14rzT6Cml0gGFUHI826ksCO7d8g2
	  E/2/YmCCNznRepdqNpfh+KOslXwEGKfZKVwc4byesZZFOdMxuM4KcyX2OFLc/u4DFwwsO5MbbH
	  R5IU7lVp7jDXxDstfpecvyvxV8ND3/eyaw3dsLpQzV+MYLHnjG8aq/dWRhVcMEQwwCYpRo+8aK
	  h4wHUGE4Cfg1k+XKY9rza8c7kJ8lRelZ0RSJobI0aPhUqMjqG+YVQjdlAri5+VDzTJLrGgkWG7
	  56qEhfcUI8WId/J0+AMhMiUZrcysous9vfqK2fzPKomZVg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=A53LZDSOl22+4vgImFpa+kMJdBMaYLovISd8ScuB04s=; b=TqCx5ZiPWQ+ygVl9/2hpqVwCHm
	biGty9z//XviRcdcYO0urbACGuO78zgl3fjWkjdA61JVRIgqfswwFJsl58/rIf0al7pzeqnRqBHi7
	CaHKDFIjYlSnqa2sNPIhUlWTrHsUZQgzI8RG8Y0dFRxGdh7xZHrBB5b23AdUgkHrIsGc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-75sj.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PP-00000006gql-3lai
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Feb 2026 23:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=A53LZDSOl22+4vgImFpa+kMJdBMaYLovISd8ScuB04s=; b=n7n2Rrum7Ky2GcxKSp1AFh0nGl
	eL1d+afbWm4k/uLcTSlenWNUmfk9cusfO74fHHXwl2g5wWoIno5bJYQBVgmh8eqwNFnXWDYUvg/2B
	1CxjBJ2xdjrVJkVl93emQ76ybgQpbLGAXu4QWxlMwk/3itWD7vxfX7eMYjND1SPuj3OE=;
Received: from [82.57.88.19] (port=63008 helo=[192.168.178.65])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vw7PF-000000003u2-3MB1;
	Fri, 27 Feb 2026 23:38:01 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 28 Feb 2026 00:37:29 +0100
Subject: [PATCH 1/2] oe-selftest: fitimage: allow relaxed node checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-fit_loadables-v1-1-3027ec37930d@valla.it>
References: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
In-Reply-To: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
To: openembedded-core@lists.openembedded.org, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=francesco@valla.it;
 h=from:subject:message-id; bh=j6QTdKegY4p/3gu2L1L6ahphF54TSLOeGmAkkiiq8C4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJmLtG40Lf59yaaNMUnY45+nr8tdOc8tm8paN58+ULZOY
 oP4jFWPO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJbExjZDivoPru5PEzv1rW
 P75QknPm/+dT5h217NM6X1cendghLL+dkeHy+9WMhefTHrxR01sew5YnX/hPc4ntdcsPG+Mqe9s
 9bjMDAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 423ddaefd3af50818abacfe46f9ace3d
X-AntiAbuse: ID - 423ddaefd3af50818abacfe46f9ace3d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vw7PP-00000006gql-3lai-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-75sj.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 23:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232120

Add the ability to test for the existence of a property in a FIT image
node without enforcing a specific value. This allows to ensure that
properties for which a value cannot be determined (e.g.: because they
are arch- or machine-dependent) are anyhow present.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 0f2d9d17dbe6a452261566a1421cc41d10809399..2aff5c84c8fa10c43ccf008859fdb7c4958bfbe7 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -209,6 +209,7 @@ class FitImageTestCase(OESelftestTestCase):
 
         This function recursively checks if the required dictionary (`req_dict`) is a subset of the found dictionary (`found_dict`).
         It supports nested dictionaries, strings, lists, and sets as values.
+        If the value of one element in the required dictionary is None, only the presence of the key is checked.
 
         Args:
             found_dict (dict): The dictionary to search within.
@@ -224,7 +225,7 @@ class FitImageTestCase(OESelftestTestCase):
                 self.assertLessEqual(set(value), set(found_dict[key]))
             elif isinstance(value, set):
                 self.assertLessEqual(value, found_dict[key])
-            else:
+            elif value is not None:
                 self.assertEqual(value, found_dict[key])
 
     def _check_its_file(self, bb_vars, its_file_path):

-- 
2.53.0


