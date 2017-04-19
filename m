Return-Path: <gordon.lack@dsl.pipex.com>
Received: from mk-outbound-2.mail.uk.tiscali.com (smtp-out-mk-2.talktalk.net
	[212.74.114.22])
	by mail.openembedded.org (Postfix) with ESMTP id 2327D719A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 22:58:08 +0000 (UTC)
Received: from parent.lacknet ([2.96.246.162]) by smtp.talktalk.net with SMTP
	id 0yS9dAycEAEri0ySFdX0Pe; Wed, 19 Apr 2017 23:52:07 +0100
X-Originating-IP: [2.96.246.162]
X-Spam: 0
X-OAuthority: v=2.2 cv=UuIhDK4B c=1 sm=1 tr=0 a=t/Q46d21BiBJ3qyeBz4f7Q==:117
	a=t/Q46d21BiBJ3qyeBz4f7Q==:17 a=FrvpURYbAAAA:8 a=UJ5Y5Z__AAAA:8
	a=JwLDqlGP4vU130QbBUsA:9 a=q9XAqBm_DPlNHEqhwt7j:22
	a=-nuATAkMhhWPdIrRzIKU:22
From: Gordon Lack <gordon.lack@dsl.pipex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 23:57:57 +0100
Message-Id: <1492642677-31256-1-git-send-email-gordon.lack@dsl.pipex.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfA4dePnQpJ/h0uUPgSAw3KNLiqeKP9GNkT8fJGfE6p6EDuwsnLIJmxOF6mD0ZBDBNWT8IEsjLDcYLzOLt1mh+se5y1YeicmtIdbahVL5riszq2AVLvv4
	c7L72fgx9Xu+w9z5xyKheqprSbx9tbuWxEoFnFKhS9MWalSIqMXvNoBSQiS/jmgoS7EyaaHsvhidxxxhyqQxof3A3jMxX1c8bDaJ78/TLXpsciiOu94Vms8P
	InlUGKbEtVI/sbRileLs7Q==
Subject: [PATCH] curl: Add certificates dependency to curl build.
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
X-List-Received-Date: Wed, 19 Apr 2017 22:58:09 -0000

The built curl is used during the builds, and any download using an https link (e.g. from github) requires the certificates, so these must be installed before curl is available.
This was breaking stb-kodi builds on openViX.
(Actually, absolute links get installed, so you also need to be using a build system with the relevant certs in place but this will be true, and anyway is a separate issue).

Signed-off-by: Gordon Lack <gordon.lack@dsl.pipex.com>
---
 meta/recipes-support/curl/curl_7.53.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.53.1.bb b/meta/recipes-support/curl/curl_7.53.1.bb
index bc78ffb..8fc9e87 100644
--- a/meta/recipes-support/curl/curl_7.53.1.bb
+++ b/meta/recipes-support/curl/curl_7.53.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
+DEPENDS = "ca-certificates" 
+
 # curl likes to set -g0 in CFLAGS, so we stop it
 # from mucking around with debug options
 #
-- 
2.7.4


