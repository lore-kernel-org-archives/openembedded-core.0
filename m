Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CED8C6379F
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 11:25:38 +0000 (UTC)
Received: from a11-80.smtp-out.amazonses.com (a11-80.smtp-out.amazonses.com [54.240.11.80])
 by mx.groups.io with SMTP id smtpd.web10.30901.1676805928632083079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 03:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=TFuT/MBg;
 spf=pass (domain: amazonses.com, ip: 54.240.11.80, mailfrom: 01000186696bf2e3-78a89905-8c53-4de2-a2bf-6b54caf38550-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676805927;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=Y/7sXDSDm25yQDkw4b9gjnape3+Ves9iakOv3SOjmNw=;
	b=TFuT/MBgZ8UityW6lQWiRaAohg3nnIY9ZGSGxX4wW3hPFC8z/zxxqSq6+uJvAIGz
	gWaCsPwxVC7gAyVQO+li7nuIt8UUAgcFCkfYLtdW9psI4gQUZhjwWDDh/uRCLbvCA1x
	AiaQi1LCQG0s6pxD9jG+veHFnaFg5CJB5ImOGqmM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676805927;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=Y/7sXDSDm25yQDkw4b9gjnape3+Ves9iakOv3SOjmNw=;
	b=gregtoV8RV3VTP4BCPzoLwzcOKdCLSKgIB8Lnoc5lrdCO9ZPw+XEjX0BiZ4enLuK
	QW8CcPbR0EZ5npR5ZG+R2/bUfLv2nvGYp8jFk1u/0MflYhlat4SzB5p/fQkAQXbSJVT
	npl7kJY1s5pL64lSJmnNJUVnIcFDH/gvNZm2pOts=
Subject: [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe to use
 docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
Date: Sun, 19 Feb 2023 11:25:27 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <20230219112522.3391653-1-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRFTceYTVX42QQdWyqJeuPsKmTg==
Thread-Topic: [PATCH] [YOCTO #13270] Refactor the docbook-xml recipe to use
 docbook.org packages rather than hacked up debian package
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1676805926
Message-ID: <01000186696bf2e3-78a89905-8c53-4de2-a2bf-6b54caf38550-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.19-54.240.11.80
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177324




The docbook-xml recipe was pulling a package from upstream debian
[YOCTO #13270]. The upstream debian provides a set number of versioned
packages. Refactored recipe to pull the versioned packages instead
from docbook.org. Organized unpacks in a way to reuse existing install
code to reduce potential runtime impact.

Signed-off-by: Richard Elberger <rich@richelberger.com>





