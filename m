Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84069C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 01:06:38 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web12.641.1637111197871154781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 17:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 0F3A628026F; Tue, 16 Nov 2021 17:08:42 -0800 (PST)
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 96DC32800A5
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 17:08:41 -0800 (PST)
Date: Tue, 16 Nov 2021 17:06:34 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory.bbclass: fix regression from FILES_INFO changes
Message-ID: <20211117010634.GI13720@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 01:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158374

Started getting a stack trace during packagedata task for a
recipe that built fine in hardknott

 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: 'meta/classes/buildhistory.bbclass', lineno: 313, function: buildhistory_emit_pkghistory
     0309:            pkginfo.filevars[filevar] = localdata.getVar(filevar) or ""
     0310:
     0311:        # Gather information about packaged files
     0312:        val = localdata.getVar('FILES_INFO') or ''
 *** 0313:        dictval = json.loads(val)
     0314:        filelist = list(dictval.keys())
     0315:        filelist.sort()
     0316:        pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])
 ...
 Exception: json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

which turns out to mean FILES_INFO is undefined for the main package built by
this recipe (FILES_INFO lookup for other packages such as -dev seemed to work fine).

Tracked the regression down to this commit:
    package/scripts: Fix FILES_INFO handling
    OE-Core rev: a1190903e0a61a12c9854c96af918ae8d12c6327

If buildhistory.bbclass uses the same per-package syntax to read
FILES_INFO as package.bbclass uses now when setting it, then
this regression goes away.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 7c44fec2d1..99300ab431 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -309,7 +309,7 @@ python buildhistory_emit_pkghistory() {
             pkginfo.filevars[filevar] = localdata.getVar(filevar) or ""
 
         # Gather information about packaged files
-        val = localdata.getVar('FILES_INFO') or ''
+        val = localdata.getVar('FILES_INFO:%s' % pkg) or ''
         dictval = json.loads(val)
         filelist = list(dictval.keys())
         filelist.sort()
-- 
2.20.1


