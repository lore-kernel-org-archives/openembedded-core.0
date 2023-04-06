Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7304EC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 13:07:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.157740.1680786438387614288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 06:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PJbsqCQU;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680786439;
  x=1712322439;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qp0KtbA1TcY5QJmhrR+wf2kyQcwO5nB0vM6rSQeFSJM=;
  b=PJbsqCQUtxAgnmCGJGVemhyHJQL+f1G9tZSIipsjDnKTUqjAWsVj7m8A
   MBmfMS3MdgWDg+JkyPsatt5TVkZ+R3H9s8mpCPFibopLXJYYAGp8dREiL
   cMIrHANZW9BYvDMDvfyC9fb7hT+qxOwkcRYUfZFm3bv13RFOIILmNTzUX
   znsfFB1hR3n5K+RJpjQM+Wpd6G6D8vDZ1b0qPZI0gfSsXuh419j9Lowav
   Hq9uvojceJEjJsSIGFI4tNML7WyMrMy8X2hwCiFy2/scQOeZALF1t/i3U
   mFs3wazsUvY9PpYaumxbF8BTMRfflckS+t8Zkn/KWl0SVN9QEyareG00q
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] cargo-update-recipe-crates.bbclass: Do not add name=  to crate:// URIs
Date: Thu, 6 Apr 2023 15:07:11 +0200
Message-ID: <20230406130711.2168872-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 13:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179774

With the recent change to the crate fetcher, which automatically sets
the name for each crate to be versioned, there is no longer a need to
explicitly set the name= parameter for each URI. This also results in
generated files that are compatible with the crate fetcher in Kirkstone
and Langdale.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Correct a typo in the commit message

 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 322b4e4d79..8980137d02 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -43,7 +43,7 @@ def get_crates(f):
     cksum_list = ''
     for c in crates_candidates:
         rename = "%s-%s" % (c['name'], c['version'])
-        c_list += '\n    crate://crates.io/%s/%s;name=%s \\\' % (c['name'], c['version'], rename)
+        c_list += '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['version'])
         if 'checksum' in c:
             cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, c['checksum'])
 

