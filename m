Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (unknown [209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56EF16FC5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:27 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id ma3so12545766pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Rs+6tAdgn1FCZqH+eAx3fD4dUcEfWfFk8Xt6v7vcVb0=;
	b=KXeK6WKuaWQMmphBmHXaD0MUNfjynKCtxld7l0LmqafftCuDd2sPDbXEmhC6b1OoKO
	hWW6/QC9DFQuzAHjznL7EcBfEIhUO5S80CyWapoRSOAc0Z02q1C5t0FSmiI2+bBtRg9J
	CC7JC4pi+NgP9OO+0BVt3binRfbXW9Q9unz/Br+GphSTwHdOM+guithLJiHQaX3tgyQl
	P4t7vbw1+Q/OXxjO14sVxHWWNS3UB7QOSSaPi4gcEj9QVovWlMMMCWyeXegB2+0P0yB2
	hSgZAaV9LhpCh9rJKqPVphs9ZCaRr/IbP2bLJSnGTi3EFgPr0lHzOwiK+IcB5qwlq8gL
	UgrA==
X-Received: by 10.68.137.193 with SMTP id qk1mr5909233pbb.155.1401346708711;
	Wed, 28 May 2014 23:58:28 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:03 -0700
Message-Id: <9150294f6056c7a0f2a9ad8aa950a3eca06de52d.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] multilib_header: Do not install mutlilib headers for musl
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
X-List-Received-Date: Thu, 29 May 2014 06:58:27 -0000

musl is not multilib and this creates trouble. eg. when
util-linux probes for ncurses it does not find it because
ncurses has installed the multilibbed header and this
header includes bits/wordsize.h and this header does not
exist on musl systems. If and when musl adds multilib
support we will revisit it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/multilib_header.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
index 4d049a8..5ee0a2d 100644
--- a/meta/classes/multilib_header.bbclass
+++ b/meta/classes/multilib_header.bbclass
@@ -6,6 +6,13 @@ inherit siteinfo
 # all of the ABI variants for that given architecture.
 #
 oe_multilib_header() {
+
+	case ${HOST_OS} in
+	*-musl*)
+		return
+		;;
+	*)
+	esac
         # We use
         # For ARM: We don't support multilib builds.
         # For MIPS: "n32" is a special case, which needs to be
-- 
1.9.3


