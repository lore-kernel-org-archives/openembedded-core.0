Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0665FC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 12:55:41 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
 by mx.groups.io with SMTP id smtpd.web10.14625.1716468933534037799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 05:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=gSHPNfpc;
 spf=pass (domain: protonmail.com, ip: 185.70.40.131, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1716468931; x=1716728131;
	bh=DSfPyDCSimMV1XCN/qCpuMutimO+AqwXcw1/lTUMSz0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gSHPNfpcyjfjpRT1dpS7BHoewRsA2+W7/s5IMtRvBcEv4ee9z5bDNZWaxsxiTDaeW
	 hcqaCjg2Hmz8IgxRoYhWqjCdDbuJc9i7VL2Ul0AtEGbYbZHSAy7a2gmyVewYNUWyLd
	 /q/mdcZJAc2mT9vGI6poTL7nBkKptnZU/UFwt0uz7lIZCRE/XgMd+BbUODn9bYi95K
	 i4sk1efX1C+7ZFmSsIwjTA7wphQeFWxaMpyczH8Z7bcy2t6r0WdvHkslFG9B9jGy1z
	 /NJ9dvvqX6+Q+5CJIYZoTNbbbvTyFcf+xBaxLyFSgHL3bQRDUAKEd92h1ddTeh+GlX
	 uJmUluyVjgnaA==
Date: Thu, 23 May 2024 12:55:25 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk
Subject: [PATCH] insane.bbclass: remove skipping of cross-compiled packages
Message-ID: <20240523125458.45955-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
X-Pm-Message-ID: 077b2fb1561fe5985ac9c3aca78ac7812bfe1775
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 12:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199790

After commit cd25e5544ca3 ("insane: use HOST_ variables, not TARGET_ to
determine the cross system"), this check is no longer necessary. The
introduction of HOST_ variables ensures architecture compatibility is
correctly checked.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/classes-global/insane.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index d6124ef121a8..b9d11d49106e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -344,11 +344,6 @@ def package_qa_check_arch(path,name,d, elf, messages):
         oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the al=
larch class, but has packaged architecture-specific binaries")
         return
=20
-    # FIXME: Cross package confuse this check, so just skip them
-    for s in ['cross', 'nativesdk', 'cross-canadian']:
-        if bb.data.inherits_class(s, d):
-            return
-
     # avoid following links to /usr/bin (e.g. on udev builds)
     # we will check the files pointed to anyway...
     if os.path.islink(path):

base-commit: 50f78cb9de68cd4317f34321dfdb06d72ce5d3c6
prerequisite-patch-id: c1ecd83bbd60a912f70347e0333a5f13b967c047
--=20
2.45.1



