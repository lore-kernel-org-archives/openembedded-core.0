Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 12A4460248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 17:49:27 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id x3so63700616pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 10:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7VQRRxbyHeQBIot5PsrFw3N42I5WQE+HT4se8RChrXo=;
	b=VFQ59p6aTVi3BHmeZEN7RpnKzxdvMlT2H2cvvFeqlti8ZBbCxjsUDy2RBg8c3m7w8b
	FsqAsbJuHNNbMnhc5CRGuOpucb5ogpRK6o34KI5TQp+BlJgXtt1/Vyw9+h5WmOR0dukd
	qc6uw5JXvOO4XgF+PSQw1qCJPTmLN4CA2sgwFGEIdjrcUXRkJYOjmKTL4o+5zZEfraqX
	cAa9mo3pNqBAR/jVY4mJOnHKZ8UWkAd3EFc5Z2m0iroNSwUG/29/Vof4CDvTz2IlR4JG
	mH4yz8R6eqNLygWAAPh6QTN4npXj52WfhCk5YP/QBWaYFgCdkIijEqy8LyTNVNwUF0ld
	odqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7VQRRxbyHeQBIot5PsrFw3N42I5WQE+HT4se8RChrXo=;
	b=bvEkEAPkV74eW7hKxdBiXvBidiBuNI9dqphUU2MNIPSVvXmyyYYwhBUbzqYyT1fiwu
	ceGiigEeSoO+DQ5/78sqs3gTeXL5W7vWfg/Cs9GADz8kwDFgyCSlnooeh6KCWx3rtNYq
	jaIpOvZvNA0foHffUB6IS8w65ytkWhdoeU8UqMpLaVOGs5/4ESoY/ndpO//uuy8VMaJ2
	L6EDN+XzohjRbvjHEu3da9JUc2eflSMSNdQLCuI/wNRNMaOFUWyYuDanLCr52dE+4KoJ
	b23f4Gji95meSmrBMmmGKZ3KMDe4baKIQaeDUHFAyYyHcvq798K0ndAB5AlB1hFOMKsQ
	o0ZQ==
X-Gm-Message-State: AD7BkJLrQcrv5sS9XSRDuuXczdFALgtWCLA6kFVkYIXZwzOdpg4Fu5TmppcyESxLv9vr0w==
X-Received: by 10.98.34.216 with SMTP id p85mr14547403pfj.45.1458841768352;
	Thu, 24 Mar 2016 10:49:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id e1sm11540793pas.1.2016.03.24.10.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 10:49:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 10:49:22 -0700
Message-Id: <1458841762-9002-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] oe-buildenv-internal: simplify derivation of BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 24 Mar 2016 17:49:28 -0000

Use 'sort --unique' to combine the two lists and remove duplicates.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 scripts/oe-buildenv-internal | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 8eee008..be212f2 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -110,29 +110,12 @@ unset BITBAKEDIR newpath
 export BUILDDIR
 export PATH
 
-add_extrawhite() {
-    # If the current shell is zsh, then temporarily set it to emulate sh in this
-    # function so that the for and case statements below work as expected.
-    [ -z "$ZSH_NAME" ] || emulate -L sh
-
-    local extrawhite="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
+BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
 
-    local var
-    for var in $extrawhite; do
-        case " $BB_ENV_EXTRAWHITE " in
-            *[[:blank:]]$var[[:blank:]]*)
-                ;;
-            *)
-                BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE:+$BB_ENV_EXTRAWHITE }$var"
-                ;;
-        esac
-    done
-}
-
-add_extrawhite
-unset -f add_extrawhite
+BB_ENV_EXTRAWHITE=$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | sed 's/ /\n/g' | LC_ALL=C sort --unique)
+
 export BB_ENV_EXTRAWHITE
-- 
1.9.1


