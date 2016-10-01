Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D834771957
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f193so1170278wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0BPD0eCScB36+tk8yiiffFTSvW0VzGX6H1qk8jdmdmk=;
	b=fT9cWe0K/lGnOkWu3w5co98dC0qEYle/Qw9KGn23alJjb6LpasoMrLC9jbIvBNFEWr
	oXrvSXNfODIpwtEmL0okBO5qQe6htXXCiF2X1bVomgeWtoFRuKNk6fnRDKEdsYe+nrzU
	noyTlMB/G3JpVBX7XGBOnY8uDP8bZCOFWsS/CZ0PuOIeKeaoRpUN/Ia2UQ9cZB8KJ/Ig
	TOV9KLG36ENkoHrFz8/7UZIXDjuPDYv1Pk5Zr5asU4P+KMeoiETV6NbRWS6tZfnLEupx
	Hr8A3snqFZHEHN8p7hjt3VA1HrzzBaV06Xpt42+Wo52nhMfcSCi4J7Qq575vIekCJcz7
	4QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0BPD0eCScB36+tk8yiiffFTSvW0VzGX6H1qk8jdmdmk=;
	b=bj2XvS/XFAbC/sLk3QF6bh5mlBVyPX28bYz2V1qTWOfEP4+Jy/iialRdYvQlSAbRjU
	p269FJWrQOSQezFflCtSZOEQTjI0oqELNsnIu/OsyHGfoUZkCPljAGxc2WGAaGcJcHE4
	o8R/3b2z1VlrwT27xRupGMe8Bw5zUIFDMbZ8a1DuZSFOCSZ08wFqzpjWrmbm+4CGSf6b
	qyBdfgAVkOaKUP8bFKyBCyG1sUYzB6IcaoV8V0bfcqk7IQR3psNohptBjTdmMnWdbv/j
	TJ53wrJp4TShvprpfSFf2ZMe/p9RZ+a1tZQrpxqC60oDsjiUFSsyNmcAGAwanb+aTp6x
	bm4A==
X-Gm-Message-State: AA6/9Rk1LdvgBfPMM1EIFD2H3SgMDNyv3V6PoSB9i1K+HJRJ70QihfqihTlaz1iD8bGqJQ==
X-Received: by 10.28.7.80 with SMTP id 77mr348606wmh.28.1475290063972;
	Fri, 30 Sep 2016 19:47:43 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:43 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:55 +0200
Message-Id: <1475290031-20568-7-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 06/22] grub-efi.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:43 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/grub-efi.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 26ba8ce..17417ba 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -90,12 +90,12 @@ python build_efi_cfg() {
 
     cfile = d.getVar('GRUB_CFG', True)
     if not cfile:
-        raise bb.build.FuncFailed('Unable to read GRUB_CFG')
+        bb.fatal('Unable to read GRUB_CFG')
 
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
+        bb.fatal('Unable to open %s' % cfile)
 
     cfgfile.write('# Automatically created by OE\n')
 
@@ -114,7 +114,7 @@ python build_efi_cfg() {
 
     root = d.getVar('GRUB_ROOT', True)
     if not root:
-        raise bb.build.FuncFailed('GRUB_ROOT not defined')
+        bb.fatal('GRUB_ROOT not defined')
 
     if gfxserial == "1":
         btypes = [ [ " graphics console", "" ],
@@ -127,7 +127,7 @@ python build_efi_cfg() {
 
         overrides = localdata.getVar('OVERRIDES', True)
         if not overrides:
-            raise bb.build.FuncFailed('OVERRIDES not defined')
+            bb.fatal('OVERRIDES not defined')
 
         for btype in btypes:
             localdata.setVar('OVERRIDES', label + ':' + overrides)
-- 
2.7.4


