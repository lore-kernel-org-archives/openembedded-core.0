Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933DEEEAA7D
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 23:41:35 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.9676.1694734890056539335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 16:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fBsGwL2l;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1694734890;
  x=1726270890;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tiz1znOQ1mjKt3VRnmZn2txzH8Ua1p1e+yuIuYoSJPk=;
  b=fBsGwL2lXNV0R55qw/vCCfKInlu9Tpr/Pbwf6JeEFlav01f3G/bnIJfG
   ZYwiPa4ofkhTHcRUQwiKqIFcbYvH55LfgdvSutPN1gqtxPyHdGZdQaKS7
   6YEbZjFOSOT13mY9HyfK9CAljhs17e0udJoZvheSKbQ7pAroZWRPu9cPT
   yItAonE20qFGwnPVzn4F9f7Xeqp9InU+B3m3ts9e8nFwv3y09JNH8IC5E
   CoGIJ3uriKWHuSZzboxRDMsmyQKuk4psiKCpflQudSHg2mHCn93catkVP
   tpn0lauvZaXUTnCLiG6GfMAPOVJv9ze01PcVHzGd8NNUEOCmiQb3CHuno
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] libsoup-2.4: Only specify --cross-file when building for target
Date: Fri, 15 Sep 2023 01:41:21 +0200
Message-ID: <20230914234122.2604677-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 23:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187650

The soup.cross file is only created when building for target so only
tell meson to read it when it exists. This allows libsoup-2.4-native to
be built again.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 5abeced30b..a605857c60 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -40,7 +40,7 @@ do_write_config:append:class-target() {
 ntlm_auth = '${bindir}/ntlm_auth'
 EOF
 }
-EXTRA_OEMESON += "--cross-file ${WORKDIR}/soup.cross"
+EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
 
 EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
 

