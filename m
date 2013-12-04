Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3524F6DB45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 22:10:25 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2731196eek.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2tt7RheaLkJ70T1oS+PCKgCRuBziX2Q9gOPB7EvBfyM=;
	b=FfR56M5aSgGEnv2CXQyEcXjT1HmmrNtQbpE3TOe8Z3M/STtv4wh8ifXUCvY7yUbAiq
	KI2627ovI7NTEvR4lxH07wsA4a3QlYJqQ8iDHzzOkuxbaVNF4iuo5XEU5CACoi91m0Tx
	lqXvKuxfcMJN32nAp8lB8NFWMBUJLONO7hR9J+hGras6/te2y/z3kCSG20haSmErqVDU
	7ZU8icuXF5LekW1bzwOKKAPI957bZlL2e1mWGsz/BkcsiVHxhC9B5AGWR3ZCKAQaSPOS
	52e/7mZ72n3YWTwwsl67JYsGAVaEa5Rlv0QqPcfBg+7pF7y1MU+MHo68uJD2kbdJSAkW
	OxZQ==
X-Received: by 10.14.209.129 with SMTP id s1mr3877663eeo.21.1386195024471;
	Wed, 04 Dec 2013 14:10:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n1sm99205307eep.20.2013.12.04.14.10.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 14:10:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 23:10:31 +0100
Message-Id: <1386195032-18264-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
References: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] WIP: icecc.bbclass: use bb.utils.which also for 'as'
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
X-List-Received-Date: Wed, 04 Dec 2013 22:10:25 -0000

WIP: haven't properly tested it yet

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 5af764d..3c719ef 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -251,6 +251,8 @@ set_icecc_env() {
 
     ICECC_CC="${@icc_get_and_check_tool(bb, d, "gcc")}"
     ICECC_CXX="${@icc_get_and_check_tool(bb, d, "g++")}"
+    # cannot use icc_get_and_check_tool here because it assumes as without target_sys prefix
+    ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
     then
         bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
@@ -268,7 +270,7 @@ set_icecc_env() {
     ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
     if [ "`dirname "${ICECC_AS}"`" = "." ]
     then
-        ICECC_AS="`which as`"
+        ICECC_AS="${ICECC_WHICH_AS}"
     fi
 
     if [ ! -f "${ICECC_VERSION}.done" ]
-- 
1.8.4.3


