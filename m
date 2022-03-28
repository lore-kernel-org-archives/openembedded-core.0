Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BBDC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 18:07:13 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.2.1648490832703405633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=knmDmw3C;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so29290pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=knmDmw3C9646DjtaYkf9uia8CFoi3FAUHQHSoPxXjUq42BOrSpgt9fxjvAJzIkwpJ5
         qkwvKaLAuoSodO+oAFL1G8lFoy3Cbt+slKMLDm3GiKaOKEa4AxD2EV4XF5qDdZIxuJkv
         nhyDnRrbAUf8S7oI+9fdctrW7IhQodVUXUQtfEQoT8f4Sqz8HIDXncLqB/x8E3BuD/gZ
         vJYcPceQaFIY8mBw/06bTDTWa1wmgv4Qe476yavIfnmuMJv2uBYQR7zaY3qMRm2psVde
         zwRSZh8osb0GjjC27wLdOojbQE0b1WbIh7YN1WOFH4AHROONkjDoiJg67Hxoyart4eOx
         tB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvwQqElRiM3abY1umKoCWnKC5J1cL0J2YX/zw5aeFiI=;
        b=3St34RXfH6xjO0kl0ETWq2ZXTrYdXDdfsbhvImp/fCXUxMnpxXhFw8sO0KYm+KGYMq
         w4u0SS7vj4wq35++ghUYG+13R/iqVcRk0MCT3T+Xh1bLx2eL3jbdmYJhPIE/uzKDV0zN
         LNkvOh/fVqebqk7MWnTUGcQFSfEFMDwQpYpKtri9pEG6qVkVljwZMEQJSJmj38GuZKh1
         ULWx4Ff/ppvgweDhXro+qLxYRA8uACDSTHt2wX/XsKdP8lUeaMxe6WM1Gljcomz4x79v
         K+kimt6n/CJI2mnfZ+xsWQak0+u+z3uV958X+ZXENzV/0HoFKoxSZy0Ff2qQ1fbDOwS0
         rRcA==
X-Gm-Message-State: AOAM533MozTxFzbGTWEpwGst+VoWEW4xsrhjrV+DXD1tYR0YYOMbsq7l
	YcpNTu9FO/yH+zJiwjjog9DqvIh4tUA=
X-Google-Smtp-Source: 
 ABdhPJxNU/9dxjk+Vsw0TGjo+vhwlCbGNzVlbgb8lzpC1IVRr3HumkUwGeWVbAzo3thzOSTJIte5SQ==
X-Received: by 2002:a17:903:32ce:b0:154:4a39:294d with SMTP id
 i14-20020a17090332ce00b001544a39294dmr26712420plr.48.1648490832016;
        Mon, 28 Mar 2022 11:07:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 nu16-20020a17090b1b1000b001c77c6a391csm174982pjb.26.2022.03.28.11.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 11:07:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] go: Disable pie in cgo for mips
Date: Mon, 28 Mar 2022 11:07:06 -0700
Message-Id: <20220328180707.3565916-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328180707.3565916-1-raj.khem@gmail.com>
References: <20220328180707.3565916-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 18:07:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163719

This overcomes the linking errors e.g.
| /usr/lib/go/src/cmd/go/internal/base/base.go:110:(.text+0x60fef8): relocation R_MIPS_26 against `a local symbol' cannot be used when making a shared object; recompile with -fPIC         | /usr/lib/go/src/cmd/go/internal/base/base.go:110:(.text+0x60ff0c): relocation R_MIPS_HI16 against `a local symbol' cannot be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.bb
index a492d7e64a1..98977673ee4 100644
--- a/meta/recipes-devtools/go/go_1.18.bb
+++ b/meta/recipes-devtools/go/go_1.18.bb
@@ -3,6 +3,8 @@ require go-target.inc
 
 inherit linuxloader
 
+CGO_LDFLAGS:append:mips = " -no-pie"
+
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
-- 
2.35.1


