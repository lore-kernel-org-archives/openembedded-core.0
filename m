Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy714-0004kU-6R
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:34 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=hQijMZNfiO3yVbw7jBP8UjUiy2SP8HLFmrrYOicji8M=;
	b=k435J2zlQgvc8Sdg3CJBOMDfF/O/bArCRJBI3+gMWrBqpkvyylJ5pFp3AjRR0Zgn60
	Dx4f+OmvkS8YvP2PExX2+Is7zOe1cFSueKolqA0o5NFJIwM8DR8SmlHGcnpodkk7g7e0
	rsLQPxzWu6om0r96akJyA8R1xuM3bP2FdRYQG9fqLL7eL9szOzbwxXTNwnFLJKhl/5o6
	y8i6FVJjXKIWGA8VpUmOmfp2AvROR9H7oItML9NHDfK9m2EGuBExLHUHJ3nzzdzP0oMU
	cGUBd8aiYUCDIFWesU4qrN2MaEVhUgSTAH9bH9q7l5GP23PiR7P2wnOkFCxFG6/B+nki
	uCdA==
Received: by 10.180.79.69 with SMTP id h5mr12419436wix.6.1344196192816;
	Sun, 05 Aug 2012 12:49:52 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:52 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:38 +0200
Message-Id: <1344196136-7643-11-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlGzDtLSrvpdhP7Dk0yuCM02kji61S1hVwvOOgEQEsIyxiohXSipWCmvuZMKnssp/HqX6Xu
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/28] systemtap: use ${datadir} instead of /usr/share for packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 20:01:34 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../systemtap/systemtap-uprobes_git.bb             |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index b328e6b..0cfcbe4 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -4,7 +4,7 @@ require systemtap_git.inc
 
 DEPENDS = "systemtap virtual/kernel"
 
-PR = "r0"
+PR = "r1"
 
 # On systems without CONFIG_UTRACE, this package is empty.
 ALLOW_EMPTY_${PN} = "1"
@@ -36,7 +36,7 @@ do_compile() {
 do_install() {
 	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
 	then
-		install -d ${D}/usr/share/systemtap/runtime/uprobes/
-		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
+		install -d ${D}${datadir}/systemtap/runtime/uprobes/
+		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}${datadir}/systemtap/runtime/uprobes/
 	fi
 }
-- 
1.7.7.6



