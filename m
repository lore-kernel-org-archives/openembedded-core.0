Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FDFC3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 17:16:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.531.1692983806973400537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 10:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=phKHKQZv;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1692983808;
  x=1724519808;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rHLWH5F0HVexF4KWBOK4zzC6xTUDPcxYLZgKtEEhWEs=;
  b=phKHKQZvuN+T5yVl8igeVj09Ym+XUHBa8JmrC3IwwCsMdbpZ9Y8zU4Qw
   MAArzIZSgWcx7mUhDCF2Q+OgacvzoubJa1a/nN0piM/NEDtchrOPyRH9m
   m/gqAnoFC19DMJoNfWnHI0QFpQcK7f4OIIIlMcrIb41uvM6jFmcD0TUgz
   BRN7GHOOE2DJhIZlCSTvXVVizveCPxXpfP48ERelm1FWdX/cDsn1ywcej
   xvuc0vFx7MwymXBEyvWsxqZucr1YIaMqF8WvMC+RMYKTjWpMqnWagzgFo
   F9RCMgJSZLfVyXi16zkO0aO2yIFHO9drpY4F9LR1yuKVEeo6/8Y6xbbvA
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] base.bbclass: Do not fail during parsing if ${SRCREV} does not exist
Date: Fri, 25 Aug 2023 19:16:25 +0200
Message-ID: <20230825171625.1213968-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 17:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186722

After commit a8e7b0f932 (base/package: Move source revision information
from PV to PKGV) was integrated, having a recipe with a SRCREV that
currently cannot be fetched would lead to an exception during parsing.
Catch that exception and instead raise bb.parse.SkipRecipe. That way
the parsing continues as it should. Instead you now get a meaningful
error if you try build a recipe with a SRCREV that cannot be fetched,
e.g.:

  ERROR: Nothing PROVIDES 'psplash'
  psplash was skipped: Fetcher failure: Unable to resolve 'unknown-ref'
  in upstream git repository in git ls-remote output for
  git.yoctoproject.org/psplash

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/base.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 7c774d250f..fb55a6eee9 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -131,7 +131,13 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
 python fetcher_hashes_dummyfunc() {
     return
 }
-fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
+fetcher_hashes_dummyfunc[vardepvalue] = "${@validate_hashvalue(d)}"
+
+def validate_hashvalue(d):
+    try:
+        bb.fetch.get_hashvalue(d)
+    except bb.fetch2.FetchError as e:
+        raise bb.parse.SkipRecipe(e)
 
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"

