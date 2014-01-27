Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4037F6E7E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:45:06 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id w62so5252080wes.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=56lbDPcy5tuJvdkzOT7bfiF+3YAbDOtZQAAZ96Pr/08=;
	b=qusNgyW+1ZQh1U958m5USZIMhLaRGSjzCVVtK+2gxNHmlmZFQB6psb4mG7WVP8Ha9M
	AmlzrVQJDEdsDxqKyCxXt590st/IwRoysK/Zg6UcxAfFvdSaFFbdLtIIXPdAp1HMjyDT
	AEWf7px8RAQViQhevlDwjdrURNY55TFRijSVazi/iUtq3yeBDkZd5UZydeXMGWtLRc5I
	Ecb1b2ksnV7kTZe/UWhnkoTKLK+of1Xy4X4rQ3rHEl/O9tR6iY5plWWzKPDLtwh221zq
	/O75YhMZEhfF+ROKWiBi4lZnogJJkP6LvJYvdd+dlm5txvsRvoDCK6UX6/B+2IS++q5Y
	rWUA==
X-Received: by 10.194.178.135 with SMTP id cy7mr20187364wjc.21.1390826706853; 
	Mon, 27 Jan 2014 04:45:06 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83]) by mx.google.com with ESMTPSA id
	bj3sm24967750wjb.14.2014.01.27.04.45.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Jan 2014 04:45:06 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2014 12:44:55 +0000
Message-Id: <1390826695-5067-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.3
Cc: Saul Wold <saul.wold@intel.com>
Subject: [PATCH] [NEEDS TESTING] opkg: Fix add-exclude.patch
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
X-List-Received-Date: Mon, 27 Jan 2014 12:45:06 -0000

The case statement for ARGS_OPT_ADD_EXCLUDE added to the argument handling
switch statement in opkg was missing a "break;" at the end, so it was falling
through into the handler for ARGS_OPT_NOACTION. Thus when "--add-exclude" was
specified on the command line it was as if "--noaction" was also being
specified. This appears to be the root cause of YP bug 5311.

This patch should fix that behaviour and that bug.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>
---

This patch needs testing against the cases where PACKAGE_EXCLUDE was failing, I
haven't been able to test this myself beyond checking that opkg still builds
with it applied. Saul and Mark initially discussed the bug with me so they're
probably better placed to test it, I'm just sending this as a bump as the bug
has been outstanding for a long time now.

 meta/recipes-devtools/opkg/opkg/add-exclude.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index 8489058..506de7b 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -99,6 +99,7 @@ Index: trunk/src/opkg-cl.c
 +				conf->exclude_list = realloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
 +				conf->exclude_list[conf->exclude_count - 1] = tuple;
 +			}
++			break;
  		case ARGS_OPT_NOACTION:
  			conf->noaction = 1;
  			break;
-- 
1.8.5.3


