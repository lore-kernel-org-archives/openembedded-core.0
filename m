Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D6EC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 17:57:12 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.2569.1754589422668376190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 10:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XQH21tN4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250807175658398919beb206f3cdf7-r9pw5e@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250807175658398919beb206f3cdf7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 07 Aug 2025 19:56:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AycKPFSAJ6SNqxEkFgfkEVL9Nam63YinxOe9Kbxaz70=;
 b=XQH21tN4pwcafOgD0HlLATCmWelH1uYvo7kPr2ZCUuInowEN0eFdLMuPVOjjjw3QBhUlvZ
 79WbcudJ4iIOMDB++xZDuwtf9nRusAVEhdLLPY6PmQF1CngT1gbi777ojH5dyRHgZCrM+t/F
 GeJAcVpUrt0GhIJXpKv9jebct9RfsZub5DVvivuUCVgEG9IFbVmTU2ydCYPxXhYVyZEIzJ2r
 ixZePJ8UKya/3HfMbS4Qfa7Ly8SLgPt+QJYOzZASC5hC+VoLY2bl0D9oWhXsMPFMndqOkS8F
 M8Dl7T8txo6Wc9L73hECpG7MnFG9OHkX6KHlxc/pkBND9RtI7zdACIeg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] gnutls: upgrade 3.8.9 -> 3.8.10
Date: Thu,  7 Aug 2025 19:56:11 +0200
Message-Id: <20250807175611.14487-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 17:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221573

From: Gyorgy Sarvari <skandigraun@gmail.com>

Skip compress-cert-conf test when running ptests, because it requires
gnutls to be compiled with brotli PACKAGECONFIG, however brotli is not
part of oe-core.

Changelog: https://gitlab.com/gnutls/gnutls/-/blob/master/NEWS

(From OE-Core rev: 2ad41436acdc5f37803ade51c98ae0dc06103e45)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
This fixes 4 CVEs
  CVE-2025-6395
  CVE-2025-32988
  CVE-2025-32989
  CVE-2025-32990

 meta/recipes-support/gnutls/gnutls/run-ptest                    | 1 +
 .../gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb}                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
index 17e26eae70..b7827e1358 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -37,6 +37,7 @@ is_disallowed() {
 # currently not exported to target.
 
 test_disallowlist=""
+test_disallowlist="${test_disallowlist} compress-cert-conf"
 test_disallowlist="${test_disallowlist} dtls-stress"
 test_disallowlist="${test_disallowlist} handshake-large-cert"
 test_disallowlist="${test_disallowlist} id-on-xmppAddr"
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.9.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.10.bb
index f2b7ac7bb8..600f23683e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
+SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

