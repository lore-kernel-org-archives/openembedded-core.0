Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05096CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 09:05:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17377.1779181537413369358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=VwUivyHT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-456497-2026051909053451cbe136940002070e-xuf1r9@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026051909053451cbe136940002070e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 19 May 2026 11:05:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fhJctb443GFUU2DSOHrC4RfMLLeU7F1Sx5wxN1xIfiQ=;
 b=VwUivyHTYdX9Az9pnfTFf+H2K2eW9ZV7x1AZNTSQ8jIKvxOc20TA700OaB9CYOgsr5xurf
 tB8GokBwnYJ5twFnNn9zvgIr5cNXax4O61ReaK7uEXmWmfXXykzqd0hNDycWg/aOzTmV1pZU
 MC2SGmaDsx8Np/TqF+9JrpnnXwK7RRnIRCC9qVjGkm+Ow9hsF+PWUJqueUf6mc7aVCDa1kYa
 3J9m1mWgkKDh+jnecDJSh3U5z5C4bbeP/Oxe/vbe74M0mzeEcbyrhXMPhsmRMzCfQHJ8lb6T
 C0jwPkps2RPKvpx/T+dIFxvNO6rYmH5Ezrargb2lO/vTiSs2OHI3N7fQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] initramfs-framework: replace eval-based bootparam parser
Date: Tue, 19 May 2026 11:04:51 +0200
Message-ID: <20260519090517.1201609-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 09:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237294

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The bootparam parsing loop uses "eval" to set shell variables from
kernel command line parameters.  Since eval interprets its argument as
shell code, a crafted boot parameter such as:

  rootdelay=1";command;"

would be executed as arbitrary shell code during early init.

Replace the eval-based parser with a single sed invocation that
tokenizes /proc/cmdline (respecting double-quoted values) and feeds the
result to a while-read loop that uses only "export" for variable
assignment, which never interprets the value as code.

The sed script works as follows:
- Split the line at unquoted spaces into one token per line.  The regex
  treats sequences of non-space/non-quote chars, balanced "..." pairs,
  and lone " (for mid-value quotes) as atomic units that are never split.
- Strip outer quotes from whole-param-quoted tokens ("param=val").
- Strip balanced quotes around parameter values (key="val" -> key=val).
- Replace . and - with _ in parameter names (the key part before =),
  iterating until none remain.
- Print each processed token and loop (P/D).

Additional benefits:
- Whitespace inside quoted values is now preserved exactly as specified
  (the for-loop word-splitting collapsed multiple spaces)
- Reduced from 3+ sed/cut invocations per parameter to a single sed
  process for the entire command line

Co-developed-by: GitHub Copilot (Claude)
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../initrdscripts/initramfs-framework/init    | 61 ++++++++-----------
 1 file changed, 24 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 67590ad765..97ec62e2da 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -92,43 +92,30 @@ if [ -d $EFI_DIR ];then
 fi
 
 # populate bootparam environment
-for p in `cat /proc/cmdline`; do
-	if [ -n "$quoted" ]; then
-		p_rstripped=${p%\"}
-		value="$value $p_rstripped"
-		if [ "$p_rstripped" != "$p" ]; then
-			# End of a opt="word1 word2..." parameter 
-			eval "bootparam_${quoted}=\"${value}\""
-			unset quoted
-		fi
-		continue
-	fi
-
-	opt=`echo $p | cut -d'=' -f1`
-	opt=`echo $opt | sed -e 'y/.-/__/'`
-	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
-		# opt parameter
-		eval "bootparam_${opt}=true"
-	else
-		value="`echo $p | cut -d'=' -f2-`"	# Option value
-		value_lstripped=${value#\"}
-		value_rstripped=${value%\"}
-
-		if [ "$value_lstripped" != "$value" ] && [ "$value_rstripped" != "$value" ]; then
-			# opt="value" parameter
-			eval "bootparam_${opt}=${value_lstripped%\"}"
-			continue
-		fi
-
-		if [ "$value_lstripped" != "$value" ]; then
-			# Start of a opt="word1 word2..." parameter 
-			quoted=${opt}
-			value=${value_lstripped}
-			continue
-		fi
-		eval "bootparam_${opt}=\"${value}\""
-	fi
-done
+while IFS= read -r token; do
+	case "$token" in
+	*=*)
+		opt="${token%%=*}"
+		value="${token#*=}"
+		;;
+	*)
+		opt="$token"
+		value="true"
+		;;
+	esac
+	export "bootparam_${opt}=${value}"
+done <<EOF
+$(sed -E '
+s/^(([^ "]*|"[^"]*"|")*) +/\1\
+/
+s/^"(.*)"$/\1/
+s/^([^=]*)="(.*)"/\1=\2/
+:k
+s/^([^=.-]*)[.-]/\1_/
+tk
+P
+D' /proc/cmdline)
+EOF
 
 # use /dev with devtmpfs
 if grep -q devtmpfs /proc/filesystems; then
-- 
2.52.0


