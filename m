Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B819AC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 10:37:39 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web11.124945.1683023849486171091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 03:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=sM38prUj;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=kZa0uRG5JNHeGLFucjwRCxDzZyC0A1aMfIkCnyYJ2f0=;
	b=sM38prUjgPbMClewOnv83oNWvC/swXJaen+mpy5pXLLEoghB2cf7tr6ajCVQAU7IIqMsCVOgeXdRN
	 LFkHifQIo9zVM86iHqxEjTYJmmsmzJf7mWskwMi54bf1+TRm2jt2yrJxmdupBiPQupxlFsySCMJXuC
	 Yl7WErlyPDaGGA4AFKaxSZl7yA3SFifzDzrYtXEKDrBJfE8KF4IVtJeUet+CIf9F/RNjSYNigddqWL
	 NUPrPIOoEEQOD99X/eWA1la2sVUGd/mj4OsOhI87dUQlFKciPqxcoy+5IdgKWJ3Mlyw32wkS5iVJTW
	 WDT5MZqzZYGwdiX+WAqxDy/JsHT4YHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=kZa0uRG5JNHeGLFucjwRCxDzZyC0A1aMfIkCnyYJ2f0=;
	b=hNPa3yjNovACH7gstDvgzpH7lDmvxXB+sCnlkfrP1zbtYhBvm7YJteyntORTrZ7MwyN5LZ59j2Yng
	 oxo0b8jDw==
X-HalOne-ID: 520c51f1-e8d5-11ed-b6cd-231b2edd0ed2
Received: from arn-pbergin-l1.. (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay5 (Halon) with ESMTPSA
	id 520c51f1-e8d5-11ed-b6cd-231b2edd0ed2;
	Tue, 02 May 2023 10:37:26 +0000 (UTC)
From: peter@berginkonsult.se
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter.bergin@windriver.com>,
	Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] update-alternatives.bbclass: fix old override syntax
Date: Tue,  2 May 2023 12:37:20 +0200
Message-Id: <20230502103720.2536952-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:37:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180723

From: Peter Bergin <peter.bergin@windriver.com>

Function 'gen_updatealternativesvardeps' still used old override
syntax when fetching variable flags. Update to use ':' instead to match
recipe meta data. This was found by review and no real issue encountered
but it is a bug that affects variable dependencies and can affect rebuilds
as task hashes might not be accurate.

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/classes-recipe/update-alternatives.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 36a7497fec..b153e1b297 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -86,10 +86,10 @@ def gen_updatealternativesvardeps(d):
 
     for p in pkgs:
         for v in vars:
-            for flag in sorted((d.getVarFlags("%s_%s" % (v,p)) or {}).keys()):
+            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or {}).keys()):
                 if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
                     continue
-                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
+                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s:%s' % (v,p), flag, False)))
 
 def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
-- 
2.34.1


