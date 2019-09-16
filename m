Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC167D3BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k3qHITToUVtFqhMwGXUDHr0U4MATH0T6g7/2snL+4ao=;
	b=UxopDxff/+POujhDOwtZW9EM8+
	Xh8rGCT827TRIQ7KSf/ZfO5IOc8Bw7Tkjkx0PngCssWycJ/qvQIzdyitKXeE8qqfZEc8XsbLRCnWV
	rB5P5Y9fvSs9LkSYVNohP7mfaBJdR7DVZGt2YY9twV0eqqfUIcPq3qOkTjpxeYbN0TyZ02jRVQgd9
	Y4I70oYANd77h0PwQA1IREaB2eq9g8DIB4Nm4vXN+aHRNjWSu9yJiM997M3WT/lSqaXd3njVwzzgK
	tuQwwIG/VNXXwB340nJtU5zVczCs4kfv917h0e6xRqfkmsdFSBv88IHePPUCZBaLnrcwCDn4ddVz6
	f5TkX55w==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1i9lFP-0001Sm-L6; Mon, 16 Sep 2019 10:16:31 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1i9lFF-000214-Fx; Mon, 16 Sep 2019 10:16:21 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 10:16:16 +0300
Message-Id: <1568618176-5365-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-Rspam-Score: 1.2 (+)
X-Rspam-Report: Action: no action Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: MIME_GOOD(-0.10)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: IP_SCORE(-0.10) Symbol: RCPT_COUNT_TWO(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID: 1568618176-5365-1-git-send-email-mikko.rapeli@bmw.de
X-Rspam-Bar: +
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 1/2] busybox.inc: handle empty DEBUG_PREFIX_MAP
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
X-List-Received-Date: Mon, 16 Sep 2019 07:16:31 -0000

DEBUG_PREFIX_MAP can be empty if e.g. old clang
toolchain doesn't support the default poky values for gcc.

Fixes build failure:

ERROR: Logfile of failure stored in: /home/builder/src/base/build/tmp/work/aarch64-poky-linux/busybox/1.31.0-r
0/temp/log.do_configure.14451
Log data follows:
| DEBUG: Executing shell function do_configure
| sed: -e expression #1, char 0: no previous regular expression
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/builder/src/base/build/tmp/work/aarch64-poky-linux/busybox/1.31.0-r0/temp/run.do_configure.14451' failed with exit code 1:
| sed: -e expression #1, char 0: no previous regular expression
| WARNING: exit code 1 from a shell command.
|

This log entry is really useless for debugging problems so
add "set -x" to the configure script so that details can be seen
if something isn't working.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-core/busybox/busybox.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 49165d7..956ccca 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -128,7 +128,9 @@ do_prepare_config () {
 		${S}/.config.oe-tmp > ${S}/.config
 	fi
 	sed -i 's/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"/CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"/' ${S}/.config
-	sed -i 's|${DEBUG_PREFIX_MAP}||g' ${S}/.config
+	if [ -n "${DEBUG_PREFIX_MAP}" ]; then
+		sed -i 's|${DEBUG_PREFIX_MAP}||g' ${S}/.config
+	fi
 }
 
 # returns all the elements from the src uri that are .cfg files
@@ -142,6 +144,7 @@ def find_cfgs(d):
     return sources_list
 
 do_configure () {
+	set -x
 	do_prepare_config
 	merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
 	cml1_do_configure
-- 
1.9.1


