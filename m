Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F5DCA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 14:30:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.17398.1725201048012767734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 07:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SX0HHZeH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso37639355e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725201046; x=1725805846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy4a64j4ETEEbGovomVPRJowWJn2Ny/4R5hwepMGlIc=;
        b=SX0HHZeH6lYJr4H7Z3tJ4u2UJqE4Iusg2GB4bpXNm6XGUEE/H3ABvB2OXK5aC9SlC5
         b5XOxRycPFTlrYQR4aQaY5Zl/oCTbxolMrHaLwjvMEZkrtARFszIx4Rrhl5b7k/G0/Bw
         NQjA7sSjACBpQyXcxEs5/50c9Tnj29pBYnD8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725201046; x=1725805846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy4a64j4ETEEbGovomVPRJowWJn2Ny/4R5hwepMGlIc=;
        b=akVv7gY7Z9R7XoPzJrYDgwsrXZ+y4ueUtq72TVEwb31RIUyHoVtexFny/LTgdWRF+x
         QdPwWo061vX8jK52pdHqpDjitU00R80i+NA9+8T3DnGrnvsQPaZVgSFQqLA3viHDJyN9
         HaJ699OZK68E9ATvs4o2WQZjkIx7r00aQUH/LbZFUXCR7P1rrLGeTPeFXEcx/2s6trg2
         0wJl2VFX11FHKZNtguGfpSTbbUzFQrUW44h/2LLflcFw/fBeKHTIp8rUB7eqCikhASbO
         K7EMHwRt/yC5Ju3UkkqXeaE7kpEqOYSYWmkuE//+4V1velgozXiq7gg+UqW01PABAWAe
         D3tQ==
X-Gm-Message-State: AOJu0YxVUL0o8L0a2hlNqP64dlppbAFsezsO+haQ6HqghBlUHOaIHySi
	htOYhSWceXWwVjVxRQmVGTL91prXMEybEYoUgqGU1IWB0Hq4d9sKwoSYmlJKOKlkv/CMgoRLZbv
	t
X-Google-Smtp-Source: AGHT+IGDfqz7eNgSzE8+HKIfbSmPhoQzBuHUbZiR2719DpzsS3Y302BzRmEqrXpgKgrMNOwdawEjQw==
X-Received: by 2002:adf:e891:0:b0:368:65c7:5ffc with SMTP id ffacd0b85a97d-3749b5842f0mr8041341f8f.60.1725201045716;
        Sun, 01 Sep 2024 07:30:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d8a8:ecc:6edb:f5dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1cc8163sm3564487f8f.100.2024.09.01.07.30.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 07:30:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] sstate: Drop SSTATEPOSTINSTFUNC support
Date: Sun,  1 Sep 2024 15:30:43 +0100
Message-ID: <20240901143043.172081-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901143043.172081-1-richard.purdie@linuxfoundation.org>
References: <20240901143043.172081-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204049

This was deprecated with the introduction of postfunc support for tasks
in general and only used by buildhistory. Now that usage has been removed,
drop the code from sstate.bbclass. Any other users should be able to use
postfuncs too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 586757afbd5..f38041b735a 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -103,7 +103,6 @@ SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
-SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
 
 # Check whether sstate exists for tasks that support sstate and are in the
@@ -352,15 +351,10 @@ def sstate_install(ss, d):
         prepdir(dest)
         bb.utils.rename(src, dest)
 
-    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
-        # All hooks should run in the SSTATE_INSTDIR
-        bb.build.exec_func(postinst, d, (sstateinst,))
-
     for lock in locks:
         bb.utils.unlockfile(lock)
 
 sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX"
-sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
     from oe.gpg_sign import get_signer

