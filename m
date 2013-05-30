Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1F760991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 16:58:26 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id j13so472610wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ahxi9J8y/PNYPOdtRaRoB7hABgXRiZN+3CmRMvY8PcE=;
	b=JVi3HJJXxVD7qCOPIbhjqezfEIKtxHyqjPozHZljSgpvT+cxcF6hBAR2/r/SCDcVzv
	GZB0fiknL3Kv6D+lj2AHlfMlINwuqZdsfD9fL1D0d2KwRzZB7vNnoFpkUvroCm0106q1
	5N1uiMpO7lQOTBiM+5twFn6MHO+7tONgt0Ell/EGt/21CRqXrFWBKPeVEvtpY6YrDZo/
	8leGsldKC7WM3YJ0erw3hau9J942XnVVNZOofjbQReFR7xL2NT946cSm/GqW71ysIkP4
	XilMOyNYB3RFQe++KOfv3Q7wzwGn0PFOXIPqjTW1R+kaJRGgK1Rp7wHkKV8ebRiPSM0d
	gN/w==
X-Received: by 10.180.126.97 with SMTP id mx1mr5565337wib.57.1369933106300;
	Thu, 30 May 2013 09:58:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dj7sm39213425wib.6.2013.05.30.09.58.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 09:58:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 17:55:10 +0100
Message-Id: <1369932910-5557-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkc5We4J51byNINP9MAOwol4VOsQK70DkVItyCgkke84k/HKH4iAwlzVNzdDGRCUixmgmsO
Subject: [PATCH] utils.bbclass: ensure $0 is correct in wrapper scripts
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
X-List-Received-Date: Thu, 30 May 2013 16:58:26 -0000

Some packages (eg mesa) will invoke a tool with --version and do string matches
on the output (i.e. mesa does $LEX --version |grep "^flex ").  This doesn't work
with the combination of wrapper scripts and binaries that use $0 as they output
"flex.real".

Luckily bash's exec lets you set $0.  As we want to use this we can't use env,
but using export appears to work just as well.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/utils.bbclass |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index be0a25a..cf8893f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -261,9 +261,9 @@ create_cmdline_wrapper () {
 	mv $cmd $cmd.real
 	cmdname=`basename $cmd`.real
 	cat <<END >$cmd
-#!/bin/sh
+#!/bin/bash
 realpath=\`readlink -fn \$0\`
-exec \`dirname \$realpath\`/$cmdname $@ "\$@"
+exec -a $cmd \`dirname \$realpath\`/$cmdname $@ "\$@"
 END
 	chmod +x $cmd
 }
@@ -284,9 +284,10 @@ create_wrapper () {
 	mv $cmd $cmd.real
 	cmdname=`basename $cmd`.real
 	cat <<END >$cmd
-#!/bin/sh
+#!/bin/bash
 realpath=\`readlink -fn \$0\`
-exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
+export $@
+exec -a $cmd \`dirname \$realpath\`/$cmdname "\$@"
 END
 	chmod +x $cmd
 }
-- 
1.7.10.4


