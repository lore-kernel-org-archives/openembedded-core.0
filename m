Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C7BC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 05:32:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.16673.1751434344480813134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 22:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUDB401M;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167b30so37363805ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751434344; x=1752039144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=NUDB401MxDsSCl3I3Wlo/dnl3FogM9JbO16LtZ0/yg2yPzWPEhlNV/JAaLm6g6q8PE
         1tigcTEXe4U9rPNaQQ1bCpnmpknzQ1Xi8zPzRgk57GENZN1Ebz2i/ITHvnZi5+6ZZMT/
         0t4kCmZ8xdm4UP5gSfzO4FRl3ME8dt1EAj0sdBvvpP+7weun5hMIMRV7svJ/p6/dxKaL
         ajem/x9MDyCwx/IagPYLJ3RAlkYX0eW84D5d4A1eZrpSB1ntnxvup0hjhIfgfhONugKc
         fGsH003MwGIFh7nJJSAKrcThzedEDCET26EY7mnKJBEMaSC5riQ+FUyOlaM8uL4QUX/h
         ZITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434344; x=1752039144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=Iiioh5dQYHk3W16iT9u1EaPjiQdUeOVNJT2CxB/BzkJxyM0B4GvihBG1nK7lu0nE2z
         g5ha3AHaVLymZ0CMjz3oGBRsAhSAgGb2nwNxmD+nsUBrynpPFGSF/y9j2GYfiAnLhc1p
         6OdAcszX+wvlXZ3XrOYqukl992XIZB8LgRQDlnmekIyMPIcSHMVdP+gAnrLoJE/3xqNe
         d6ofqklMGeHdX/5iTLUmt+jHnwJFZT/ZgThfGK5+9DMlY+REOvLXoc8CL+hWWOmVmz5V
         yNKfyz2lCI9gbLCw1eWeQ7YZg2AX9YU+6KR7PDWkJYOn/ihx1AfGVB79sQ9YyzZD6tCF
         +PMg==
X-Gm-Message-State: AOJu0YxnIyvoxrbQNQVD2Sdq2CgaMc8ksOrvMtf7jf/Wk4FNbtRP62x8
	pW7MAnFOEmf6Tuo+1VS5/SnksvrwFnYc5NeHLeoWMuymTuYHCgkDxaCvjCXy8pSi
X-Gm-Gg: ASbGncunfQRv5HAcRmdVJGyJKQMYEz1vUQAYTBE5pxl2gCJHo0qgEE1St/a+MdHrcOu
	aKwk+RjRjwT5/mKrUpyZ2c5c5RFaH5PZ1QMaHwgXXg/smEAh0QLUVgfGhq73pxl2uZRCIqeN466
	mwjc3RaNwSV3N4xrsDOy35s30yB4ZJwfQ+9tDidqxMkD4rZIzPa/MItcRTVrVaXUuIGx/Nnti6G
	LGcsohf10shnhtDUneB01ysdc6fGpNnby4ENBc6RAo+yQoRVzKAhI37DTLFX63USHnRgswbQYh5
	5tyl4V8JOm1jqNac+okJ7cd9kINKlKBeVCPkOlp07SRbFaXCGYt4EA==
X-Google-Smtp-Source: AGHT+IEbJlVh6LXgCMUe9upYR7r4ibGpomoL7xeAr4GlSk0lOJtil+fPzWt1BNbXHN/1x7IS+lBN+g==
X-Received: by 2002:a17:902:e787:b0:235:6f7:b918 with SMTP id d9443c01a7336-23c6e55206emr22683505ad.28.1751434343581;
        Tue, 01 Jul 2025 22:32:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm120125985ad.37.2025.07.01.22.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:32:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 2/5] base.bbclass: Deferred inherit native toolchain class
Date: Tue,  1 Jul 2025 22:32:17 -0700
Message-ID: <20250702053220.4104358-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702053220.4104358-1-raj.khem@gmail.com>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219775

use TOOLCHAIN_NATIVE variable for selecting native compiler

Default it to PREFERRED_TOOLCHAIN_NATIVE, a recipe which wants
to enforce a toolchain can do so with

for cross toolchains ( e.g. target, nativesdk )

TOOLCHAIN = "gcc"

For native

TOOLCHAIN_NATIVE = "gcc"

This helps build native recipe with clang as native compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..6be1f5c2df2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -30,8 +30,9 @@ PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
 PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
+TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 
-inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

