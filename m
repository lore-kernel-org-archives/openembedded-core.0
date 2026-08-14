Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E155BC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:49:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14757.1786718967809109187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DVP+Byq/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8BAF1A160A
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEBA16046D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14D7511C4EE19;
	Fri, 14 Aug 2026 16:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786718965; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m9ugy61PmRca0hjnR/tgs3LPUm27lCX5dngBWCUoEmE=;
	b=DVP+Byq/64dnsjn9cCxBIq/PzBmyAsIph+OlKxVAn9OjSUjXZHaDstAA7hORgDJ/9zj02B
	xw2DA10+ygqsJRmyKClKK46YqSFK0MGqxEY9KSiuz1lWvtSnpKL8L7bOal/7RWLLsuZt79
	4ICCHQBq88yYXapb6p110FsX+8JeYFDGMFvwso5l8S6gk+balJYm8UPriE6o8dc4Chv8hE
	4TUJV5X8RIayZFqwRL8fga6T9McF1aXZufEOBlPidx/joPR3BrboNrhNHZoVLk+bKpU5RE
	tGrrOe/xXqVRUSA13C7KPUSAJSLvKIEf8idrmOnTj+g0CRtl5waTZq7iBChV3g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 14 Aug 2026 16:48:52 +0200
Subject: [PATCH 2/2] sudo: Ignore hardcoded home paths in QA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-mathieu-sudo-home-v1-2-d6c8251de9f4@bootlin.com>
References: <20260814-mathieu-sudo-home-v1-0-d6c8251de9f4@bootlin.com>
In-Reply-To: <20260814-mathieu-sudo-home-v1-0-d6c8251de9f4@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786718955; l=578;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=MdLjrHAZW8OBBO+U/uHIeQaqM+Y2kNxaO4lflgNBfj4=;
 b=z5MCey0dkMBiyp1BQLwVat07v4f9Df7UKJ5uJdimW/UrW0AciPLLf9dMiVnhjqmz8C3pQO0f3
 Ebs+6QjMhe9CFTyAUzwNn3hr4Y4VoWcQ4+WUgGmdh1CuE0JT2s8ZBzS
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 14:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243456

The changelog contains the "/home/buildroot/autobuild/" string.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-extended/sudo/sudo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index e46934171810..05cae03a36ae 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -48,3 +48,4 @@ do_install:prepend (){
 }
 
 CVE_VERSION_SUFFIX = "patch"
+OEQA_BUILDPATHS_SKIP = "/home/buildroot"

-- 
2.47.3


