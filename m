Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BFFEEAA7A
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 23:41:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9677.1694734890111464262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 16:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CwRv4SLr;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1694734890;
  x=1726270890;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=n+HwwLFo383FhLQvzC/SV4lSX9cKgwqxviRBVPSzp10=;
  b=CwRv4SLrDb6aNroseRMgtGBWP4UDEE3W1w8whFrqVXQ9kxD0vSC/6fwD
   WSr9lyEZtAmxzOnSrivsP+VIytlN+LHo5ZCpkh316WMIfq+lWwWACHWFi
   00rmUeX23XNz1xL5y6EZ+hgekTHruMvarbkYcZ4EPi5rhUmiMe+p4oBIz
   JK9GZBiX7NOwZBSfQ3iOZKEkUxUs+///jxjCG91+NEoLT9lQ140aPQs8I
   0e4xwGyDpdkcEGTpWacOXdG07KPG/X+aCJJTEV9DUC4FQTRtLYnW8H38L
   aV3OF1S/QrogeSfZEWC6Ki3nT3D+hLjHwmaLOnqcDzGd2s6Buawm2dbw+
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] libsoup: Only specify --cross-file when building for target
Date: Fri, 15 Sep 2023 01:41:22 +0200
Message-ID: <20230914234122.2604677-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230914234122.2604677-1-pkj@axis.com>
References: <20230914234122.2604677-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 23:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187649

The soup.cross file is only created when building for target so only
tell meson to read it when it exists. This allows libsoup-native to be
built again.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libsoup/libsoup_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup_3.4.2.bb b/meta/recipes-support/libsoup/libsoup_3.4.2.bb
index ad86c890a1..3996ae6836 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.2.bb
@@ -37,7 +37,7 @@ do_write_config:append:class-target() {
 ntlm_auth = '${bindir}/ntlm_auth'
 EOF
 }
-EXTRA_OEMESON += "--cross-file ${WORKDIR}/soup.cross"
+EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
 
 EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
 # Disable the test suites

