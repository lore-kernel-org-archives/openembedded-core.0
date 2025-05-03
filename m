Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0F9C3ABAA
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 18:57:33 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.16514.1746298645673242231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 11:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N5y0B2ZX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202505031857236c928bdd9b2fb9e749-xszjht@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202505031857236c928bdd9b2fb9e749
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 May 2025 20:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8V0HpW7kdwjxhwayJdWUd4xLM0GS0AA/8mHdcly8Ilw=;
 b=N5y0B2ZXIb6ZZzu+fF0UAzB+muvy8ZJEJpiGcinYBriZ+vjxjOWvm2/EsKYrZYtBzrOaOj
 o+28XcUfVY6MyuhgLtiQsoF4AI0Zx6v0UbHOJ4PQBhGgPvwYFtcIvqNLD/tktlogVXw+YFqh
 QSxAFgyUhWdLtwer9JwNOD+tVdZ4B/gy9fkatb0kEnQq/9fxEI1XaD0wZJaiKwSgJQsWDsVV
 UhwSrF8eLrMV5FDfIXGlh/nXGmofLj10puUlcrgQtP+rvfAsvU1S/117ifBH3U9zj3yyjSl6
 U7g83YmCpigpLtLlPIuokHTrJPn1xLu6RTZ9iDPOvHcMhTWDrkNC2sEg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/2] ghostscript: ignore CVE-2024-29507
Date: Sat,  3 May 2025 20:56:35 +0200
Message-Id: <20250503185635.686386-2-peter.marko@siemens.com>
In-Reply-To: <20250503185635.686386-1-peter.marko@siemens.com>
References: <20250503185635.686386-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 18:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215937

From: Peter Marko <peter.marko@siemens.com>

Fix for this CVE is [3] (per [1] and [2]).
It fixes cidfsubstfont handling which is not present in 9.55.0 yet.
It was introduced (as cidsubstpath) in 9.56.0 via [4] and later modified
to cidfsubstfont in [5].
Since this recipe has version 9.55.0, mark it as not affected yet.

[1] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=7745dbe24514710b0cfba925e608e607dee9eb0f
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-29507
[3] https://security-tracker.debian.org/tracker/CVE-2024-29507
[4] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=82efed6cae8b0f2a3d10593b21083be1e7b1ab23
[5] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=4422012f6b40f0627d3527dba92f3a1ba30017d3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index fd0506f438..e872fbe88c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -25,7 +25,7 @@ CVE_CHECK_IGNORE += "CVE-2013-6629"
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 # Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
-CVE_CHECK_IGNORE += "CVE-2025-27833"
+CVE_CHECK_IGNORE += "CVE-2024-29507 CVE-2025-27833"
 # Only impacts codepaths relevant for Windows builds
 CVE_CHECK_IGNORE += "CVE-2025-27837"
 

