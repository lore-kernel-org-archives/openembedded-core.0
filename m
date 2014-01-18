Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id DB7466E7C0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:37 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so2585505eek.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rsNzT+oD7iesiN7Vrww+eThlIrqCoW79wScXI2JZQVw=;
	b=dAVRfsxKqN22v65QUQLvbVr2V2lgkPVb0ow00xpyIlEv7Cmd1UXtNzKFDVEvNaq/6A
	Cf6QDK98TtN0HcdZV45vALhK/KDdsRlqlfTPMTvkaBsZapPCI4B5LVfi04cO5jV+1KgR
	X5+5lMPewmFpcweJtDRtLtOJ2BW/SYXUHct8vWzfNjml34tpyTUQk4h4ZpA6p7TqcH8h
	1B/yJQJuWdf1KpaZnnlTx4bb75wEOxS4tPF2xkb3XYNLUNPFU55iFH6pnv4X6R6Oxpbz
	sVaZ7YmAzC32U4WHEaFtzcqZk2WPN7XHPfh/d4V9ilCsjX/fHCodZLiOGQw1KPu7pVIT
	hZNA==
X-Received: by 10.15.98.196 with SMTP id bj44mr1915646eeb.75.1390053698631;
	Sat, 18 Jan 2014 06:01:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm35500806eew.18.2014.01.18.06.01.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:52 +0100
Message-Id: <d01a3581b2e5ebb57479ffd5c19fa0433dadb4cf.1390052402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] icecc: use bb.utils.which also for 'as'
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:38 -0000

* it was introduced in
  commit 3a842ec52e7d010767b13bdcb5629ac07b3ee9e7
  Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
  Date:   Fri Sep 16 10:55:16 2011 +0400
  Subject: icecc.bbclass: replace with updated version

  without any explanation in which case
    ${ICECC_CC} -print-prog-name=as
  is returning as in current working directory, but will keep old
  behavior just in case

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 5af764d..054e25c 100644
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
@@ -266,9 +268,12 @@ set_icecc_env() {
     fi
 
     ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
+    # for target recipes should return something like:
+    # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
+    # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
     if [ "`dirname "${ICECC_AS}"`" = "." ]
     then
-        ICECC_AS="`which as`"
+        ICECC_AS="${ICECC_WHICH_AS}"
     fi
 
     if [ ! -f "${ICECC_VERSION}.done" ]
-- 
1.8.5.2


