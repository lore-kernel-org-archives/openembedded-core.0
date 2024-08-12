Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22CAC52D7D
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 15:14:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.48879.1723475652755627629
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U6FhWxZg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BECB4240006;
	Mon, 12 Aug 2024 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723475650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R6uxiqNEljMdL2bKpxUedDKO5ipvy9ZF3N2AKcQhsZA=;
	b=U6FhWxZgxQrPdp+lEK7v+fMy56XBe5innOSSlTDAUF9pYdp8oAhx7g7PzGHZl3wU91Gf46
	TvMhgVtbX422UTFK+L/rRWPO7/P4Zl5qyHO3US3omaz5WXXKzUyHdjO5JWD8Nqv61ccxah
	pn3absZwccWwq5eExuNit8PzSYT36eakkVnfL5xQnQ+VUSokUBagEcyYKfX/ZCKAeAU895
	8zvsQZHz7QLAaRm3IvaowJHyBJbwK5fBfOFWLylBfBzxRNU4IAjbdC+hWaivqxCimj9Vux
	Wpt87UDfE9awoSB7vqkcSfG58HZETkfX+fFlT4ienMJ9KZC+Tepn54J2+U6WXQ==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/2] oeqa/postactions: save ptests artifacts as archive on host
Date: Mon, 12 Aug 2024 17:14:02 +0200
Message-ID: <20240812151404.134030-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203227

Hello,

on any ptest failure, testimage build a list of artifacts to retrieve from
the target under test, create an archive and pull the corresponding raw
stream onto the controlling host (eg: autobuilder), which uncompresses it
immediately.
This small series follows a request to keep those artifacts compressed
instead of uncompressing them on the host.

The first commit is kind of unrelated and fixes a trivial issue spotted
during some tests. The second commit makes sure that artifacts are kept
in a compressed archive on the host.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>

Alexis Lothoré (2):
  oeqa/postactions: fix exception handling
  oeqa/postactions: do not uncompress retrieved archive on host

 meta/lib/oeqa/utils/postactions.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.46.0


