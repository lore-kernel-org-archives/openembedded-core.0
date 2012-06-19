Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SgtFM-0005Np-SF
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 09:53:08 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so4054639wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=l1bPynfpf/YdP7sHnB9ZyMr7n8RjVVIj4x6EJptVLzI=;
	b=AsrFQL6wipxwWpf3U4Zis33OKm098c2si6H5SBEhj144lAwLAjO0jvRCjPmjqXJVqT
	r/IOA5mD9emvwTqdEI34G+vu4QhxlmyNbVf6yy7l2t723YsBEK1Y37Zt83lYJP9iN9r/
	NC4iD2a/yu7I1SgLqycohzcbT3bN2lIz55de+0S3/HZnIvFrAVxRtdjtM13nH4oViUy6
	neAL+VX3BfQzGPMvGAtj8Upr6xxgvYfHPlipuexnqVGDq3pFSqlIXsHVLKfXnmzi1YF1
	j9jwztdfY6/v9JpQ4rdKAhRq8YxSR0GFhv531Uxy8eK+leeKOL0W99CjewWprMTT5o1m
	OOAQ==
Received: by 10.216.212.157 with SMTP id y29mr10589275weo.146.1340091747964;
	Tue, 19 Jun 2012 00:42:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j4sm30809314wiz.1.2012.06.19.00.42.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 00:42:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 09:42:10 +0200
Message-Id: <1340091730-5993-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
References: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
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
X-List-Received-Date: Tue, 19 Jun 2012 07:53:09 -0000

* without this, kernel upgrades where KERNEL_VERSION is changed
  e.g. 3.4.2 -> 3.4.3 generate .dep for running 3.4.2 and after reboot user ends
  up without any module loaded to make it worse after reboot nothing is upgraded
  to trigger another kernel(-module) postinst to generate .dep for now running 3.4.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 116e10b..a455164 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -271,13 +271,13 @@ fi
 if [ -n "$D" ]; then
 	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 fi
 }
 
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
-- 
1.7.8.6



