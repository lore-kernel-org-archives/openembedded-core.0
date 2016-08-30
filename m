Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 484266057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:20:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so3383131wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kDGY2awzLaeVN0kpWS8wJUh3Nst7yYCHSijAyE+Y8Bw=;
	b=kQrXmcjcuVVOgHYyylWQkUzHMe/nNHUvG8oGG2u36gUqitlhs+5pHbJX0xzMUWqvSF
	l1VBDuoHdwPd23G9w3qDdvU6ev6XJyYJxGEeexElRzyVi2idkWrJB/1p2dej+KpcO7Gt
	JjdgD+DSLdHKOna7tmxw4tXXaiGkTXKiBju9etc640CqXVKxbFAYepamz5OyBmJKE7mC
	H6e8A5NlCiflCsuDJJnYsRUuyQRuLgKTrwEzODz/MhBaoc2L9OsCWoFueH+U5H/eGe29
	YttCXcJ9WMDtW9FMj9bXAdintCPkJivui+7z54V7kPuRWSbQU/GR9S1k2AIhV/AjXDVi
	9ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kDGY2awzLaeVN0kpWS8wJUh3Nst7yYCHSijAyE+Y8Bw=;
	b=PBpH5+0l2Lk49DlZ5OuwRfRndy51SuMTn1TtmgBFWV4q3+9UchQOZ3t6vfjRQ502T5
	tPfFOSqDHIbqNTBFhUf2VlztcXlYPZNfyX++bP7IHevHcFUofSiAHpnmFnKXjmgafM2l
	jnMmt3P5SP4Fe/PPDqFAQtnJs9igtVR76cO9JYnApaqjq48Z9pBLM2SK0rtui69X0Ofj
	XtyZYC153uy42mLlfkuMFNyeEHdbM0QoADu2oTbuGRbYSAFs+dIOXaq9qf1z6mxxTXfo
	KeMkF+IL/9mda59pnRVYflsUmhv5OFxcwtk4pnK71YxgMrnJUuFcXt9FffUKV2dohNvm
	G2Sg==
X-Gm-Message-State: AE9vXwOX6cx0QVwByjckRcNNeMYnSce9C4R1QI61esu3HG8CxmTnjehl3CyHxXy7mLMrTw==
X-Received: by 10.28.129.145 with SMTP id c139mr4218099wmd.102.1472566800737; 
	Tue, 30 Aug 2016 07:20:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	kq2sm39772875wjc.41.2016.08.30.07.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 07:19:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 16:19:58 +0200
Message-Id: <20160830141958.13775-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160823131840.dkxlcyn3rrfe35cu@jama>
References: <20160823131840.dkxlcyn3rrfe35cu@jama>
Subject: [PATCH] base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only in autotools.bbclass
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
X-List-Received-Date: Tue, 30 Aug 2016 14:20:00 -0000

* recipes which don't inherit autotools or cmake bbclass and want to
  use the configure options from PACKAGECONFIG need to handle
  PACKAGECONFIG_CONFARGS themselves.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/autotools.bbclass | 2 ++
 meta/classes/base.bbclass      | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 076899c..47a0190 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -131,6 +131,8 @@ autotools_postconfigure(){
 
 EXTRACONFFUNCS ??= ""
 
+EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
+
 do_configure[prefuncs] += "autotools_preconfigure autotools_copy_aclocals ${EXTRACONFFUNCS}"
 do_configure[postfuncs] += "autotools_postconfigure"
 
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 79edfe5..a31a53f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -431,12 +431,6 @@ python () {
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('PACKAGECONFIG_CONFARGS', extraconf)
 
-        # TODO: once all recipes/classes abusing EXTRA_OECONF
-        # to get PACKAGECONFIG options are fixed to use PACKAGECONFIG_CONFARGS
-        # move this appendVar to autotools.bbclass.
-        if not bb.data.inherits_class('cmake', d):
-            appendVar('EXTRA_OECONF', extraconf)
-
     pn = d.getVar('PN', True)
     license = d.getVar('LICENSE', True)
     if license == "INVALID":
-- 
2.9.2


