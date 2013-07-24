Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 21A5460842
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 11:58:33 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ey16so332426wid.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 04:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ImWzvtfWQGLoThfxEnfMt3oC6pTtIlTDt3J0H0WzewI=;
	b=T4Uwt9aREBAd0agUq2QVL5prd8eTGT+nHJFEE21ml5563MfFnFzd6fCQE4BtPUgtOa
	8HBVOwhExnhrVFHZbsfmyO5T34L/a9EsrnUJBRz3Gb9pFbdQcoadOQi0JLTsXuShdKye
	nkpBpGnd6SuHJlIRDYEZtNZ+QaOBjRBQttl0/XkOp3UVr5JK3zRJNOh8XmBlSmsL5fwv
	fnG/FTLNm9H47ikg4IQuWSfZ+BcTBK+b/1qhbMUuXmqQg0qhF6YRpGAqdhPjVRilIj7M
	Bgim3XWpffnXSRxkpMtBbj9B6mpeUyHJBR8/zN/LFGTgmycw2zW4i2OqFCRmcvjh3s4v
	IsUA==
X-Received: by 10.180.14.105 with SMTP id o9mr2428169wic.30.1374667113526;
	Wed, 24 Jul 2013 04:58:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id r8sm4798049wiz.5.2013.07.24.04.58.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 04:58:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 12:54:46 +0100
Message-Id: <1374666886-30003-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlLJuE833f6LoeaCIDlk7ZlPY1suSHqgBYiumsrTCcuvhJgqielQ/QWgTFqFavSFqLGvLof
Subject: [PATCH] sanity.bbclass: mention version when erroring on LCONF_VERSION mismatch
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
X-List-Received-Date: Wed, 24 Jul 2013 11:58:35 -0000

If someone is using a Poky release but not the Poky distribution they'll get a
bblayers.conf generated from meta-yocto's template with a LCONF_VERSION that
doesn't necessarily match LAYER_CONF_VERSION (default in sanity.conf), as Poky
overrides LAYER_CONF_VERSION to cater for the meta-yocto split.  The resulting
error message will tell them to compare bblayers.conf with bblayers.conf.sample,
but they're identical.

By explicitly refering to the required and actual versions this situation is
hopefully clearer.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index a505a5d..08ab1b7 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -401,7 +401,7 @@ def sanity_check_conffiles(status, d):
                 status.reparse = True
                 break
         if not status.reparse:
-            status.addresult("Your version of bblayers.conf was generated from an older/newer version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n")
+            status.addresult("Your version of bblayers.conf has the wrong LCONF_VERSION (has %s, expecting %s).\nPlease compare the your file against bblayers.conf.sample and merge any changes before continuing.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n" % (current_lconf, lconf_version))
 
     # If we have a site.conf, check it's valid
     if check_conf_exists("conf/site.conf", d):
-- 
1.7.10.4


