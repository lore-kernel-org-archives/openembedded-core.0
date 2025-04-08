Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFAFC369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:41:30 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.web10.75509.1744119688511538756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 06:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=B5NQSrjz;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1u29Cc-0041PZ-6J
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Apr 2025 13:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=uezvgwcxhbKlGkaZ1MSK9SRqi/QjngQcB7syMOt8vcw=; b=B5
	NQSrjziiM8CqjQEV0SWq09SU9j+GJGsMmKez9lYb/1AR9orfHXg//mvRbzwincCaqmMK8OxH05c9s
	NcCP5325FF2yNgx6xQJNsOR0KkWKtj4oxxjngnVgwG3Iw94siWkQ9aPQbQCa+/Cb3Xs6ok8x/CfhF
	TULHvTMAWHTIQsSlO93txRTo6TB9b0hKMY/brV80OfdeTmuY/fEpZ6/gpP1rOX46ZHo+HLH8hK6L/
	k0sDR80AuT/Lms6sLNHNIjI2Z8BK+9xq17oV1pI7OUzEaMqDg9mojG2VkJdt+KSeguYepOWPFnO5W
	telhR+6gY09OTfMOGjeGRtH0SG1l4vcQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1u29Ce-00EepB-33;
	Tue, 08 Apr 2025 14:41:24 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] classes-recipe: npm: Complain immediately if npm-shrinkwrap.json is too old
Date: Tue,  8 Apr 2025 14:41:18 +0100
Message-Id: <20250408134118.1978358-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214539

From: Mike Crowe <mac@mcrowe.com>

Rather than emitting:

 Exception: KeyError: 'packages'

and a stack trace, let's fail immediately if lockfileVersion implies
that the npm-shrinkwrap.json file isn't compatible.

The documentation[1] doesn't make it clear which lockfileVersions are
guaranteed to contain "packages". I have lockfileVersion 1 files
without. Running npm 7.5.2 generates npm-shrinkwrap.json files with
lockfileVersion 2 and "packages", so I've set the minimum to be 2.

[1] https://docs.npmjs.com/cli/v7/configuring-npm/package-lock-json

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes-recipe/npm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index a73ff29be8..344e8b4bec 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -154,6 +154,9 @@ python npm_do_configure() {
         has_shrinkwrap_file = False
 
     if has_shrinkwrap_file:
+       if int(orig_shrinkwrap.get("lockfileVersion", 0)) < 2:
+           bb.fatal("%s: lockfileVersion version 2 or later is required" % orig_shrinkwrap_file)
+
        cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
        for package in orig_shrinkwrap["packages"]:
             if package != "":
-- 
2.39.5


