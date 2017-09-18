Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob20.registeredsite.com (atl4mhob20.registeredsite.com
	[209.17.115.114])
	by mail.openembedded.org (Postfix) with ESMTP id 04C4471C9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:39:31 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.211])
	by atl4mhob20.registeredsite.com (8.14.4/8.14.4) with ESMTP id
	v8I8dVhd034386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:39:31 -0400
Received: (qmail 19648 invoked by uid 0); 18 Sep 2017 08:39:31 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 18 Sep 2017 08:39:30 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 10:39:26 +0200
Message-Id: <1505723966-17120-2-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/2] base-files: profile: Make the "resize" command have the intended effect
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
X-List-Received-Date: Mon, 18 Sep 2017 08:39:32 -0000

The "resize" command outputs shell script to be evaluated. The proper way
to use it is to do:
  eval `resize`
This sets the related environment variables COLUMNS and ROWS so that a vi
invokation uses the proper dimensions. Without the "eval" part, running
vi still gives a garbled screen when the dimensions aren't 80x25.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index b5b533c..36bd35f 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,7 +26,7 @@ fi
 # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
 # tries do use ssh
 case $(tty 2>/dev/null) in
-	/dev/tty[A-z]*) resize >/dev/null;;
+	/dev/tty[A-z]*) eval `resize` ;;
 esac
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
-- 
1.9.1


