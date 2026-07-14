Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AA3C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:41 +0000 (UTC)
Received: from mailer220.gate185.sl.smtp.com (mailer220.gate185.sl.smtp.com [192.40.185.220])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7599.1784027778705622927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=IqsAKNkI;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=PBanMtea;
 spf=pass (domain: centricular.com, ip: 192.40.185.220, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.138] (unknown [10.138.12.10])
	by mtl-mta04-out1 (Halon) with ESMTP
	id 532e3645-490b-40a4-a589-8102f7369a31;
	Tue, 14 Jul 2026 10:56:15 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app-swarm-manager-3)
 with SMTP id f91fe9df-736c-4498-a352-db4da8b82898  for
 openembedded-core@lists.openembedded.org;
  Tue, 14 Jul 2026 10:55:52 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id f91fe9df-736c-4498-a352-db4da8b82898;
	Tue, 14 Jul 2026 10:55:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3417F9D32A;
	Tue, 14 Jul 2026 12:55:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1784026551; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LqJIGVUS5NA4WjcZPp/RhJOCYIfa+B4FB1HXIriN/OU=;
	b=IqsAKNkIRpUAXC1JXl05FoVH9vFcvW1G5JS+jpqFgZl8y8huHoLdb6E5n4JDuHaNE7w7ne
	oKP0aicx//0avYbT8R9F+u5IcSwIgay6JT8dbZRfTqZMxMZMpu1OdMf9orJigB3ES81PLX
	ULb/03tu3TBbIW06vmBB0dtMSH6oHNCwAH3HvEWf6YhRWTcUXK2IMXefDr21PzF0ohf1b5
	xnIHtoXfkV2QBZt6Pdx7+ruAB11Hrjor7PjHPlvBZK/EmcV7/8sDY77DLev+Bo0QXeuwhX
	4nUQ/nk5a6AZzGc3HBmH45C4XFEJ4tjOkav2xjeXjQbBOv9uxuWZABth7tlsuw==
From: Taruntej Kanakamalla <tarun@centricular.com>
To: openembedded-core@lists.openembedded.org
Cc: sebastian@centricular.com,
	nirbheek@centricular.com,
	Taruntej Kanakamalla <tarun@centricular.com>
Subject: [PATCH v5 1/2] cargo_c.bbclass: pass --libdir to cargo cinstall
Date: Tue, 14 Jul 2026 16:25:40 +0530
Message-ID: <20260714105541.2812170-1-tarun@centricular.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707081701.1525114-1-tarun@centricular.com>
References: <20260707081701.1525114-1-tarun@centricular.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: f91fe9df-736c-4498-a352-db4da8b82898
X-SMTPCOM-Message-ID: a5ac5b27-f74c-4629-8cf6-3ee60bb14541
X-SMTPCOM-Payload: 
 102_zRNlclvieHEEKOE803qWqxerEFnbXEHIFW9bwXLZSQU3-ElK7LYD67K_9VaotQabZRGpMHK0-dVimRnADnAezhgOsH4jWRJQoj7uv8j63PJtdjSDJuWQV34GFgDFjWxQixG3YpUXwZBcY7w48xbAotS4vaq7CtHzQ-MpOChNFsLOlenEq_veb_w_96P-K_2tJrJCS9mCfrooEqlQdg==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=a5ac5b27-f74c-4629-8cf6-3ee60bb14541_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=a5ac5b27-f74c-4629-8cf6-3ee60bb14541&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1784026563;
 h=feedback-id : from : to : cc : subject : date : message-id :
 in-reply-to : references : mime-version : content-transfer-encoding :
 list-unsubscribe : list-unsubscribe-post : from : to : cc : subject :
 date; bh=PR1MPr5DKMvGFt8xjCLnqSeGHrORBbaXTHYNshXRDB4=;
 b=PBanMteaIbhXlRGT4aW+EaL3DhxjmDSGUDwLAGZyuAe0e7m2MQTCL/pWyiAgZ33ObmuMN
 7Wchw8I5VSQF5TzIIPgk+0WMhlx8MPOsuKMnLHxEYlLVnjbnG0XsjPWAQEL4UqJFMDM15bs
 ddJY6i5D40MQ3Nzrj54OeM2vz1VdBPG4GrMjjVVEHFgFbAmreRI9ygsZgbHm66b3qz+WfaS
 GGeyAjpKUYpwzIOSVru/tdavUafIXEs76xdk5LldAgpGIjwZW3yIOLOelzgAwxFywnIDwiQ
 G8HclnUlhJCoVPU+MRXEsHOFm1kcrF5oXQILxcNrBl4T3VkqoagOM910R5PA==
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240881

cargo-cinstall defaults its libdir to <prefix>/lib since the class does
not pass --libdir. On configurations where ${libdir} is not
<prefix>/lib (e.g. multilib builds where baselib is lib64), the libraries
and pkg-config files get installed into <prefix>/lib, causing do_package
QA failures (installed-vs-shipped).

Pass --libdir ${libdir} explicitly so cargo-cinstall installs the files
into the correct directory.

Signed-off-by: Taruntej Kanakamalla <tarun@centricular.com>
---
 meta/classes-recipe/cargo_c.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/cargo_c.bbclass
index ef431634a2..e91ee1d9fc 100644
--- a/meta/classes-recipe/cargo_c.bbclass
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -35,6 +35,7 @@ cargo_c_do_install() {
     "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
         --destdir ${D} \
         --prefix ${prefix} \
+        --libdir ${libdir} \
         --library-type cdylib
 }
 

