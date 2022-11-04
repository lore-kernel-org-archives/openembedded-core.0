Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF58C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 16:28:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.177.1667579310305420415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 09:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34F5B1FB;
	Fri,  4 Nov 2022 09:28:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 818D33F5A1;
	Fri,  4 Nov 2022 09:28:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] insane: add codeload.github.com to src-uri-bad check
Date: Fri,  4 Nov 2022 16:28:25 +0000
Message-Id: <20221104162825.3644472-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 16:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172724

GitHub redirects /archive/ URLs to codeload.github.com, a dedicated
service for caching git archives:

$ wget -v https://github.com/unicode-org/icu/archive/refs/tags/release-72=
-1.zip
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/unicode-org/icu/zip/refs/tags/relea=
se-72-1 [following]

This is not the case for uploaded artifacts:

$ wget -v https://github.com/unicode-org/icu/releases/download/release-72=
-1/icu4c-72_1-data-bin-l.zip.asc
HTTP request sent, awaiting response... 302 Found
Location: https://objects.githubusercontent.com/github-production-release=
-asset-2e65be/49244766/... [following]

Check for codeload.github.com URLs in the src-uri-bad check in case
the SRC_URI contains this final URL, and not the public URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index dc46857a194..df2c40c3c5d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1346,7 +1346,7 @@ def unpack_check_src_uri(pn, d):
=20
     for url in d.getVar("SRC_URI").split():
         # Search for github and gitlab URLs that pull unstable archives =
(comment for future greppers)
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url) or "//co=
deload.github.com/" in url:
             oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable=
 GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
=20
 python do_qa_unpack() {
--=20
2.34.1


