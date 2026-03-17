Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD894FF6E65
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86396.1773779362022009906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MyjPEEgb;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so547778a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779360; x=1774384160; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxNOiQrtri0gvL/UQlYM81yjRHmRExKpl7ZFOwXlvjY=;
        b=MyjPEEgb+0HuUriVNp4nlqyV8+ZRMwQuijTrbPt/73bcejMBF/C7XYW6S6M8bTC7SP
         i5EV5rZ6ByJD+3S9XWqNK9WpUNYPoi7SkNEyM/nF7yCmgZWPLt9adg8QOp491HoQ0R+/
         01Khcqcyww0t/SZQlORjdS0z2Va+bsAKeZd0es3NXmN4UJlj7f+29qSEcV1VGZRZ27NY
         n+suRpD5EjfSR1oFwje9/CH2wjslTaVWe/2FtPqYWzUaOPuZpEGB6DpD6+eWyts2m8ri
         CyuJnSEoPDzGlNbhX9q7W+A9J8ywh2aH7G85SdZFKaNbZau6RmcamqYaa0tv/y5nvjCP
         RtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779360; x=1774384160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxNOiQrtri0gvL/UQlYM81yjRHmRExKpl7ZFOwXlvjY=;
        b=BrmmLVJZ+v0LP+3gcRZ0LAmeMdY9XGU0aT6Pt9+vCfje55Kb7THVNVAWfbCW6CFgjC
         iVvKUyP+n0dKVBbxF++mEbQiAZ2FjHJyjhoYZE8OCam8NlUqx3OxYe1AbFio5J7LJ3q5
         ujLjpQjDXUcEp8EUFdjbec0fd8OmReyzDPDzeJH/Fsymy+vbW6Cs9EhU+f3d27Cl769g
         sIB1CVKdvYO2w9UH6BHwbiKcKWhNrVL9MDaVbdZHVtmQboeVFJijWyH+/ZogSizQvI3h
         bGbk5RL4vKfThlujBjfhNa/jKshHKT0mU+HpmqB/DpBNiSnrOeDUHmZaHB8TYcjmf7cJ
         E9XQ==
X-Gm-Message-State: AOJu0YzkJPbOlsrhQa41kxYW4GeeRbm67pJBzVt+WMDMZHDlhkGOcT1i
	NZpxZNf/qkHjWwmnVdY5oflR0+G9+sDzLqCdNaPhvEvhp/wgHRKeRYeo
X-Gm-Gg: ATEYQzyw5LfZkJ27WtG/jXWQPX2uoYgG28vJ9j+APxDBs4lBmu2l5nAg6f1UpkV9n2u
	cBCuKRgzr2Jjh37Iadixj7Vnwh1MAm30WjPWxOEwpaMt0tb8HrxV3TowPTgOiflguCEwmgmf/Xf
	nyxlWG7hfq/t+FrOoWDli/NndoCKGJbCjzFqwX0IVyQGCOTZ4enqhf/hJObjYlBkgA9MtbLmT5Z
	MmI07aZaMDG1K/Q7TgtVmpFN3/qvPOCZNQTxSJhsWkQcUEWOIdI5MdX5PTyxaeLXO4O3tNc8+gX
	nlpMSMpNj5ccxhRB4BGbDWDIfEm0eC6FlscZwup30oB3oRzI2NB9SthKX15vog4v2i4Pq61Q6Ne
	qcbYTCDs0x7sW9kb8x89Iq2Agiq0GDjFfQJ4Zu5zPFgjf7EGKODqvbLO0398qxJHUXaHvO6G2yq
	FG33oIVyhkzKnnc2W+h9hR1Hb8fqbQkRibQo1f0gPwWJ0BcPZ3hIpaC2FynQycGEM=
X-Received: by 2002:aa7:c510:0:b0:660:335:4e30 with SMTP id 4fb4d7f45d1cf-66707bf6f38mr2127675a12.4.1773779360323;
        Tue, 17 Mar 2026 13:29:20 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:19 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:04 +0100
Subject: [PATCH v3 05/13] no-gplv3.inc: Convert confusing appends to
 override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-5-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233340

While in this case `CORE_IMAGE_EXTRA_INSTALL::pn-* +=` wouldn't result
in any unwanted override, there is no guarantee there won't be a change,
which would be hidden by this override. To avoid any surprises in the
future let's use `:append:pn-* =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/conf/distro/include/no-gplv3.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index 705e05319a..2034204035 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -18,9 +18,9 @@ PACKAGECONFIG:remove:pn-bluez5 = "readline"
 # dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which pulls in rpm-build which pulls in bash
 # so install rpm but not dnf
 IMAGE_FEATURES:remove:pn-core-image-weston = "package-management"
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-weston = " rpm"
 IMAGE_FEATURES:remove:pn-core-image-full-cmdline = "package-management"
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline += "rpm"
+CORE_IMAGE_EXTRA_INSTALL:append:pn-core-image-full-cmdline = " rpm"
 
 # matchbox-terminal depends on vte, which is gpl3
 CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"

-- 
2.53.0


