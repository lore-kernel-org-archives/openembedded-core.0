Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7190AEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 03:49:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11.1689911372013569699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 20:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=Jcd4ctvS;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7621240002;
	Fri, 21 Jul 2023 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1689911370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpgWn3sKURXH3fbnwa00nOBPiGQahw9+zI6DSdtzT74=;
	b=Jcd4ctvSdB+Edrx5ky7bZhXmmvR1QElR9dXAGF2gvdeJmXZV/63PdRzYA2RZv17OvzB4+k
	E3SrUTmV4x7gx862UUkgDJnLxyoDpu5B2fQk9pblakNhyMHVSgBUfY4xhPzyyYGbEYwGZK
	N8t/wxBYm1TMNwe21gvrj6UE8HaWJHavfHO+w0ImO+fKMI7N9WHecdzAhobjI4DCJezzhT
	+ue4LMLxNDJTp6OhxYNxMKcon4Q3Mdh65FtEUqngwrT6WOgDPVtntXK8hdCUsxYxmnM6Zc
	HIVo3w27YqWkLJZJn+RL997BwF23G1N8WdUbQwQUmxVjfBLD1ALNcWDYw0WFsA==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 2/2] curl: Refine ptest perl RDEPENDS
Date: Thu, 20 Jul 2023 20:42:40 -0700
Message-ID: <20230721034240.729396-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721034240.729396-1-robert.joslyn@redrectangle.org>
References: <20230721034240.729396-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: robert.joslyn@redrectangle.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 03:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184665

RDEPEND on the specific perl modules required for the tests rather than
the perl-modules meta package.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl_8.2.0.bb | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.2.0.bb b/meta/recipes-support/curl/curl_8.2.0.bb
index 69597440f9..9c16d3d515 100644
--- a/meta/recipes-support/curl/curl_8.2.0.bb
+++ b/meta/recipes-support/curl/curl_8.2.0.bb
@@ -100,8 +100,23 @@ do_install_ptest() {
 	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
 }
 
-RDEPENDS:${PN}-ptest += "bash perl-modules perl-module-time-hires perl-module-digest-md5 \
-                         perl-module-digest perl-module-ipc-open2"
+RDEPENDS:${PN}-ptest += " \
+	bash \
+	perl-module-b \
+	perl-module-base \
+	perl-module-cwd \
+	perl-module-digest \
+	perl-module-digest-md5 \
+	perl-module-file-basename \
+	perl-module-file-spec \
+	perl-module-file-temp \
+	perl-module-io-socket \
+	perl-module-ipc-open2 \
+	perl-module-list-util \
+	perl-module-memoize \
+	perl-module-storable \
+	perl-module-time-hires \
+"
 
 PACKAGES =+ "lib${BPN}"
 
-- 
2.41.0


