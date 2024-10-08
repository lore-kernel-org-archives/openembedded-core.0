Return-Path: <katariina.lounento@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37EBCED270
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 06:33:39 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.24])
 by mx.groups.io with SMTP id smtpd.web10.2782.1728369215678686277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 23:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=xEYIq5lm;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.24, mailfrom: hlounent@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WPOtYIAECFO0yvUoHFKhma04sZMLgHdhS+tJ0IILDFQ=; b=xEYIq5lmfNhca2v1cGR5SOG6zV
	hcpYdsQNjtsTXoJehnNhTnGvg5yqF7ePYgM41qPcdEYuOQisz4FiHu0B24uK7IChPPOuasPj9GqPi
	+riUuqsp/kYmSeWe8myMMD3clGZ5KKsfs+YZ552YINrrGe0YfQRFn32WPNhBAWCGF2CSbA3vxXZPg
	6DWPabqgFDp6OIAMWCfN0/EY8iWaa/8nxRXWwPHUJXH1Lzg/Nvk3G4Bggp7eu859lf9LIKVOrfObH
	cjZU8TkmxxbZPefnCHM12pGqNZPlY9Z3dSkrUjCLPd4OURS7QWhI318Otf+AoXpN6V/6rScfUUAqJ
	tJwHzHdQ==;
Received: from 85-156-80-235.elisa-laajakaista.fi ([85.156.80.235] helo=hel-pw07200h.corp.vaisala.com)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <katariina.lounento@vaisala.com>)
	id 1sy3mn-005aAe-08;
	Tue, 08 Oct 2024 09:33:33 +0300
From: katariina.lounento@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Katariina Lounento <katariina.lounento@vaisala.com>
Subject: [PATCH] patchtest: add "Inactive-Upstream"
Date: Tue,  8 Oct 2024 09:33:25 +0300
Message-ID: <20241008063325.62462-1-katariina.lounento@vaisala.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 85.156.80.235
X-SA-Exim-Mail-From: katariina.lounento@vaisala.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 06:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205282

From: Katariina Lounento <katariina.lounento@vaisala.com>

The list of valid statuses (`upstream_status_literal_valid_status`) was
missing "Inactive-Upstream", which caused patchtest to fail the test
test_patch.TestPatch.test_upstream_status_presence_format for patches
containing lines like:

    +Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]

with the error:

    FAIL: test Upstream-Status presence: Upstream-Status is in incorrect format (test_patch.TestPatch.test_upstream_status_presence_format)

"Inactive-Upstream" is documented in the Yocto Project and OpenEmbedded
Contributor Guide [1]:

    Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]

        The upstream is no longer available. This typically means a
        defunct project where no activity has happened for a long time —
        measured in years. To make that judgement, it is recommended to
        look at not only when the last release happened, but also when
        the last commit happened, and whether newly made bug reports and
        merge requests since that time receive no reaction. It is also
        recommended to add to the patch description any relevant links
        where the inactivity can be clearly seen.

`upstream_status_nonliteral_valid_status` only seems to be used in
logging and the value was copied verbatim from the aforementioned
documentation.

After this change all upstream status options documented in [1] are
covered.

[1] https://docs.yoctoproject.org/5.0.3/contributor-guide/recipe-style-guide.html#patch-upstream-status

Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
---
 meta/lib/patchtest/patchtest_patterns.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/patchtest_patterns.py b/meta/lib/patchtest/patchtest_patterns.py
index 8c2e192fc9..10d23ab77f 100644
--- a/meta/lib/patchtest/patchtest_patterns.py
+++ b/meta/lib/patchtest/patchtest_patterns.py
@@ -83,8 +83,8 @@ patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_
 
 # upstream-status
 
-upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
-upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
+upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted", "Inactive-Upstream"]
+upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]", "Inactive-Upstream [lastcommit: when (and/or) lastrelease: when]"]
 
 upstream_status_valid_status = pyparsing.Or(
     [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
-- 
2.46.2


