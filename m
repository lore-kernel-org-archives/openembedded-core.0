Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19882.1630918780816652512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bQnBuyID;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id z4so8693732wrr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M2z9uFQFwxJZkg74wGbh1k/1rPd0ACy2UDndfVctCxA=;
        b=bQnBuyIDiOyCHWPZPhyzogtGpl+4ID9O0OCkj6qgv0XtBemGd+WEBGEg+2Ivlownf9
         vE3N23ZmNRvTXVRAjJuPH3V6iVr25iNlC4tDDIg4UoQ8mjxHK6CR0VAaxEb8iXmr4qYK
         ZfZ6/dyMIpkVPtTeoOi7Zi38i8T1KW7ycJlXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M2z9uFQFwxJZkg74wGbh1k/1rPd0ACy2UDndfVctCxA=;
        b=S/3DVGQJrmZ1lQpY/gyvwJVk9jXe4IIULs+ohDjjs0K4gwZS4sGruAL+jFHklNcrkC
         X/+M5E4FnIfox5TPD3IIPtsAyTIaxGz+vyYU3rANGgBODvrxQSYLysNR4Qz5HR8uaxjh
         wIamLenLKFUhvVSWtosCvdJ47VJl0GBHJ0iYUFYybvIixJo2992vZhJkyeTduJt+S35c
         EVvX3s7jtbFtQu0lImmE+feSVK1eyNFZkqDhI6bZ4XnDoHTvkSRqlebjbDmOM3P14oz/
         F2BJzUoWlVEeMfAFsh8EIR6R1LPzDobhHqTbRdqDLqUSDjxxhaCDLQc5cDo75dv5knRI
         Xh3w==
X-Gm-Message-State: AOAM532coBu7DtdtmpXXRsClAESstyqWgW03aNa19xDWLCZjryzCIL0E
	7xeTAnodKDZGUS+shjQZy9eh1FPslTbZmQ==
X-Google-Smtp-Source: ABdhPJyQLfZJgTTx1fA8rkszOsUjeb0/rAbw84WQEXAUiHRQF8t8iKiEIEtEnkDt/5tbPg18to/Iwg==
X-Received: by 2002:a5d:58e9:: with SMTP id f9mr11765101wrd.154.1630918779267;
        Mon, 06 Sep 2021 01:59:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id j4sm7016308wrt.23.2021.09.06.01.59.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 01:59:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] utils: Drop obsolete oe_machinstall function
Date: Mon,  6 Sep 2021 09:59:38 +0100
Message-Id: <20210906085938.1073249-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function does something similar to the bitbake fetcher file search
paths and is an old remnant of how this could have once been handled. There
are no users in OE-Core and we'd always prefer the fetcher to handle this now
as it handles signatures correctly. The direct OVERRIDES reference would
likely break any user of the function. Remove it to be safe and ensure it
isn't being used anywhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index ab060195601..b4eb3d38abb 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -154,36 +154,6 @@ oe_libinstall() {
 	__runcmd cd "$olddir"
 }
 
-oe_machinstall() {
-	# Purpose: Install machine dependent files, if available
-	#          If not available, check if there is a default
-	#          If no default, just touch the destination
-	# Example:
-	#                $1  $2   $3         $4
-	# oe_machinstall -m 0644 fstab ${D}/etc/fstab
-	#
-	# TODO: Check argument number?
-	#
-	filename=`basename $3`
-	dirname=`dirname $3`
-
-	for o in `echo ${OVERRIDES} | tr ':' ' '`; do
-		if [ -e $dirname/$o/$filename ]; then
-			bbnote $dirname/$o/$filename present, installing to $4
-			install $1 $2 $dirname/$o/$filename $4
-			return
-		fi
-	done
-#	bbnote overrides specific file NOT present, trying default=$3...
-	if [ -e $3 ]; then
-		bbnote $3 present, installing to $4
-		install $1 $2 $3 $4
-	else
-		bbnote $3 NOT present, touching empty $4
-		touch $4
-	fi
-}
-
 create_cmdline_wrapper () {
 	# Create a wrapper script where commandline options are needed
 	#
-- 
2.32.0

