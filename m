Return-Path: <kceleon@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 074417001D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 21:44:07 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id td3so129013700pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MrQJgTBOFYLkhchk6Zq4mnGyY/ExmEZpTxZPQWUsPMI=;
	b=Uj82/We/Rbj8qScQhCE0EDOs+8PVe/JBzmAxbhzf3X1TlUFgnrXdSdUQU5hN1Dv0jt
	CHXki4gSAecEXnAgealQQvqliGStBYQC5JtV9giTvjDEqH6OQVlClrqAzdJmGBgs7k7f
	OpHiKSFNcgBaeYTTa//UcAhL3gJGbExH3UCnnsqYjed6sjDLjkhd+A3KOn2xH7gR56oq
	FMKWdkyOXQr2S9G83V/a9/FO9s+wi6ZgBIXfQo+QANFHPFNppTKrsLeE2cCgRX78UgJV
	kiSIbiKR2lOqtp/73vcOzfa0U5uRDpUFuF8tHrU83Vsgi5CXl9eZDD8/3vf6mFvir14J
	p6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MrQJgTBOFYLkhchk6Zq4mnGyY/ExmEZpTxZPQWUsPMI=;
	b=BYxy/bLPnjPamOb0rvhrZVd8M8KeVe5hviOq8H3Pckk/k/8nFJN/qzpoXFEEdtpK1x
	bQMaTedu/1CDToePZbesz9glsWC3733GLrw4jVfb88R+sYTEke1qzGGrrrj1yoRfj/Fh
	RrHqOS7R9d/JgZbwu8FZkZ54XsUqLTxHKY/gujt8aCjmSTFUZ2sCSRduzZnl0FHkW326
	IlbfCzBVzVyrH8rtSsyfv8yXLDkHg1GWneORX7BWf5y8LxIIGDFAzYegPAPVcLlwVW4V
	+VdVajZ9H77ZhTMRfznvWWkRMljxq/7fGbyU+lmSZsMdQ9m0CHxI8o9v+iKpPv/h2ekf
	Pd5g==
X-Gm-Message-State: AD7BkJLCLTVcu0qUIWEq2LkoQw1BjW86J75/iy0QIY7Zc1dKDJxKjtoSnvsvpjrHlYS6aw==
X-Received: by 10.66.79.162 with SMTP id k2mr34569509pax.121.1460411048550;
	Mon, 11 Apr 2016 14:44:08 -0700 (PDT)
Received: from flax.jf.intel.com (fmdmzpr02-ext.fm.intel.com. [192.55.55.37])
	by smtp.gmail.com with ESMTPSA id
	q4sm38266579pfi.94.2016.04.11.14.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 14:44:08 -0700 (PDT)
From: noel eck <kceleon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 14:44:05 -0700
Message-Id: <1460411045-116765-1-git-send-email-kceleon@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta][patch] gcc-common.inc: String format tweak for available tunes
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
X-List-Received-Date: Mon, 11 Apr 2016 21:44:09 -0000

Small change to python string formatting for error logging.
Previously, tune and availtunes would print out at the end of
the log message.  This change allows them to print out in the
correct locations of the error string.

Signed-off-by: noel eck <kceleon@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 6f2f224..e4fd4d6 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -54,7 +54,7 @@ def get_gcc_multiarch_setting(bb, d):
 def get_tune_parameters(tune, d):
     availtunes = d.getVar('AVAILTUNES', True)
     if tune not in availtunes.split():
-        bb.error('The tune: %s is not one of the available tunes: %s', tune or None, availtunes)
+        bb.error('The tune: %s is not one of the available tunes: %s' % (tune or None, availtunes))
 
     localdata = bb.data.createCopy(d)
     override = ':tune-' + tune
-- 
2.5.0


