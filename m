Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EABC2A09B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:49:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61563.1767610174473282572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=JQi0rvhx;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EBAA401BA;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EC10C116D0;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767610173;
	bh=3c4rghs/a1/J0a/fdr2Q2xPSkftzboHq5wuSJ8l4CNo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JQi0rvhx+PkVTPa3yN3fpwS8JHK+Q+BJSB0C8wJhzI+73yzGvUNZaLQjNfMldDMMb
	 BSqABLa1i5NM4MW2wkLiw5gn6UcunYLX1NEfld/6FhyPNWLZokBxhCoDUb5ID5Ammw
	 VKnenmnT9X93tvsW12v2J+Jgs2yW+8IADKE1ONzQYB0r2uJ3JhS2hS89FnBTm8DOrS
	 uLGHBj3OA1E5zK6a6ihLNj7aIsZyOPgRvWDa8PDmnbYYeLdWkAObtc/8M7cCtLwgIg
	 G18MIzWMxcVlmsgos0FrS+avT0RcIEWIng65FQ/ZtjJ4WRc+NQaRz9wJR8qlHZCEMT
	 XJSUVH0GfJg3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1B4C2A06C;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Subject: [PATCH 0/4] oeqa: selftest: split and create a library
Date: Mon, 05 Jan 2026 11:49:25 +0100
Message-Id: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWXW2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNT3bTMkszcRKC4mYFlUrKZmWViUnKiElB5QVFqWmYF2Kjo2NpaAKh
 rYmlaAAAA
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, adrian.freihofer@siemens.com, 
 pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767610172; l=1173;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=3c4rghs/a1/J0a/fdr2Q2xPSkftzboHq5wuSJ8l4CNo=;
 b=xMmt4hmfoMdXDEonFldHx61j8hBrg4ti1iIFoKBMA/YBACajSiiQ7gsXwNIWkxd7vvQJcF8L3
 a9sAYq8ykYbDcyQ1XqC3hKul3reiID9XOowZXjQ/gJInpLiJYC5cFrG
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 10:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228864

Take some generic code from the fitimage selftest to create a library
oeqa.utils.fitimage than can be reused in other tests (such as sanity).

The first commit is a fix for missing spaces and the last is adds support
for rsa4096 signatures.

The two mains commit (2nd and 3rd) are organized to make the diff
easier. The 2nd looks at every generic functions ands remove unittest
relative code. While the 3rd makes the move from selftest to utils, keeping
the same architecture.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
Louis Rannou (4):
      oeqa/selftests: fitimage: fix missing spaces
      oeqa/selftests: fitimage: prepare for split
      oeqa: fitimage: split the selftest and create a generic library
      oeqa/utils: fitimage: rsa4096 signatures

 meta/lib/oeqa/selftest/cases/fitimage.py | 864 +++---------------------------
 meta/lib/oeqa/utils/fitimage.py          | 883 +++++++++++++++++++++++++++++++
 2 files changed, 961 insertions(+), 786 deletions(-)
---
base-commit: f55407185c63c895fa3c4fdf74e6e63ea9517a20
change-id: 20260105-fitimage-609bc669abca

Best regards,
-- 
Louis Rannou <louis.rannou@non.se.com>



