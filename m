Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF98770C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:27:31 +0000 (UTC)
Received: by igbif5 with SMTP id if5so28293759igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=ALfs3Ns63LBrEhYw2P6nfMqx9C+XqBgWaY6EulrnnIA=;
	b=gsl6Fk6bFFfWRQ5HT7UxF+4v9QSRP2rsh1jnCS+fEJ6GP1OUwvX8w4Tx+pdpjLPywE
	cUFFdDW1nFT0LHNHseogRC7/OkKZoYL9E09ExoMvV34d/OF6jXJPwrSbC0n/ZLOJkUsr
	F36L+5mzraSGC/cQmFFENX1+XmI79gPAOfLkk+VSuNdYdOVpJ/J662/5NQH8j47/c1Sx
	RKdSczIDqu0x6/UwQtvegZA7VmtAXi1iy2IMIAkuBvLnsBCLheBBe926PW3xDVCorrNv
	iGvW5qI7o7NnxnoJoXMvxuGo0NSacnlPXDJOh6Gh4AcFyrAD0Xfoi/62H+VoPv1A4Ixi
	0PFQ==
X-Gm-Message-State: ALoCoQnR+z4UqZwuSrirzCL3KOyGnGa+oEfjEN3cEG3iB6bj/rbfUgJCH//qixSUhXeJ14BhMdTU
X-Received: by 10.50.50.9 with SMTP id y9mr6428014ign.14.1444850851642;
	Wed, 14 Oct 2015 12:27:31 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	o142sm4219582ioe.17.2015.10.14.12.27.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 12:27:31 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 15:27:53 -0400
Message-Id: <1444850873-21026-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] classes/base: provide hints on PACKAGECONFIG error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 19:27:33 -0000

Commit 771f89498c introduces an error message that is very rarely hit and
when it is, it is usually easy to trace the root cause very quickly.  The
information provided in the error message isn't enough to lead you back to
the actual failure, however, so expand upon it a bit, pinpointing the
specific package and flag that fails.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta/classes/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f078001..d711ae4 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -391,7 +391,8 @@ python () {
             items = flagval.split(",")
             num = len(items)
             if num > 4:
-                bb.error("Only enable,disable,depend,rdepend can be specified!")
+                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend can be specified!"
+                    % (d.getVar('PN', True), flag))
 
             if flag in pkgconfig:
                 if num >= 3 and items[2]:
-- 
1.9.1


