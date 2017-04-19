Return-Path: <gordon.lack@dsl.pipex.com>
X-Greylist: delayed 490 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Apr 2017 18:18:56 UTC
Received: from mk-outbound-1.mail.uk.tiscali.com (smtp-out-mk-1.talktalk.net
	[212.74.114.9])
	by mail.openembedded.org (Postfix) with ESMTP id BAB6F719AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 18:18:56 +0000 (UTC)
Received: from parent.lacknet ([2.96.246.162]) by smtp.talktalk.net with SMTP
	id 0u2edIBc1GpV60u2sdw7VV; Wed, 19 Apr 2017 19:09:38 +0100
X-Originating-IP: [2.96.246.162]
X-Spam: 0
X-OAuthority: v=2.2 cv=GK5KKaFK c=1 sm=1 tr=0 a=t/Q46d21BiBJ3qyeBz4f7Q==:117
	a=t/Q46d21BiBJ3qyeBz4f7Q==:17 a=FrvpURYbAAAA:8 a=UJ5Y5Z__AAAA:8
	a=JwLDqlGP4vU130QbBUsA:9 a=q9XAqBm_DPlNHEqhwt7j:22
	a=-nuATAkMhhWPdIrRzIKU:22
From: Gordon Lack <gordon.lack@dsl.pipex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:10:31 +0100
Message-Id: <1492625431-5515-1-git-send-email-gordon.lack@dsl.pipex.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfAHzz58LBLJM7adUW8WpdN+cqoVypHePIxngqV+/W5tBGa3HYwpZSW0wvFHuB6LNArgcttZguFt2Yqp9ncKMcfSNQf26fIRRmyKfPbTMe1S3xknrCMhy
	+E93RRoVj+tnIDXIbYbvYbVagj0f/dk/E0YXKgiXFTKdoA5R57sAwtaR6Iq0KbkIEQAVoH26xbcVtrEd8dwj3ezgk4yeKNuDksK6psf1lOiTEutDfEpHPbyW
	KtMbNyryT0kYI2rlWCWG7g==
Subject: [PATCH] Add files via upload
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
X-List-Received-Date: Wed, 19 Apr 2017 18:18:57 -0000

From: original-birdman <gordon.lack@dsl.pipex.com>

The built curl is used during the builds, and any download using an https link (e.g. from github) requires the certificates, so these must be installed before curl is available.
(Actually, absolute links get installed, so you also need to be using a build system with the relevant certs in place but this will be true).
This was breaking stb-kodi builds on openViX.
---
 meta/recipes-support/curl/curl_7.53.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.53.1.bb b/meta/recipes-support/curl/curl_7.53.1.bb
index bc78ffb..c953591 100644
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


