Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A8DCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:59 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.9218.1760038310220665889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iTpMeiHu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1342357b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038309; x=1760643109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Exg5rOXbOi6iCBQDIQtdZV1E87A7LQvpjhnU/raAGU8=;
        b=iTpMeiHupgMQWcyS+gjf98o/3e1KQS5Gjfe32qePryvkZdC6Ic773RE/32tp082Yuw
         duaTQXCH/N3DVQq1b5LuuD4MBJdIf1o00qWLzufTmuv59nBfuASpYCegQQsnaylwZ6on
         KibHHvfWj/UFgVGnJn6bbiswNMIxI2J+aysAL/qfFxgUiA4bwO5YzSDOpdTjF29IFUG3
         FFISbEas7tsFlm1MWWIQyLHsKdFjoTfVXs8qIRP38aG2DWiftDi+QMvz1ne3KIPwox9L
         /Mv2aqoszWh5mTixB55w+3p+MNwiaDMy7BO0S6W/2KK0EgAhL8VmynOE+EZc+Gr6gM1M
         mHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038309; x=1760643109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Exg5rOXbOi6iCBQDIQtdZV1E87A7LQvpjhnU/raAGU8=;
        b=FqDEdg9xyEt7JopuPlyGxBfFBnk5MlexJJBpJz/N/qHUZgTRFPy+62nSgaZamoufNk
         UInZQ/hVrG5yEosLVRjNwIPcFKdUimWPzttqdulR1qeAjgNsOm9vng0klg+pVKjbvbTK
         Ven29uZy/9o+ySJafYgWqx4mjOMp2TjyQkRKukyfNWbdjaHkhHT/UiL5IUHQr98byueB
         KXxhmC2tTNEvY1nSJlLzu6CdzkXYvGsTkgi28kdINoX0wjM+4XEfQJ4ZY8k1q+wIXNsM
         6j5WjceSR6jUgaDNNTm2rNICWBu6+VZGnaQqpiVQDXDCWDzV8Nm8QJZ54CLH8nSuUJBc
         bIcQ==
X-Gm-Message-State: AOJu0YyTz2a/WgZWOEZ6IxxVfzDqgdFpx+59Pph0G4j5oO9ZA76O3YQ7
	0mEj8foR8NutQdFuQBHBmr7Lo7V5yAnT40uwU0PrRUPeyWoi8kBYlWdEWaDUgAmqEORB4MhExqa
	f26vG
X-Gm-Gg: ASbGnctHCodsjVblZ5o2L2N7mSxNOeoVe3TAhnjWjCzdGog/OBZuhL3yIIE01JBy0jW
	x6JDlm/lRWBqh35L52JwunJBtfjWNFu7DAX92ub63OrK52YjeG4NDmyfBxeLkoAvmIXdVXyeFN7
	wTqlc/Nj3I/e4bYuLwZAoyTvdL+9dNfKMKVDxKnz/sK3m3nbXwe+wffF7i7PZIs+0rCuwdNUo4l
	uVtCN5HM20LkXwbKifH0G5SL/jee9i8r1x5cq8ZTEQAdFQ2sGC4292bIewEzPEf719ZpyaNkuLy
	0iST3PIEeVEnGrZSzZSVp3nGgsVEmqRzwhYDpPMzxgEzMZ8LrfGp9Usg/Y/P0edtQeVqmgGz56t
	TfqV9csmXWcAyArPbQNkLJQ6sRzt/iSyzKE8z4Q==
X-Google-Smtp-Source: AGHT+IET7pxPhPvZSfgquS2E7jZRMN0tqb67vZ02eoZoCbk4lKK3RTFsPpiwX1i3adWFE1BjH8/8rA==
X-Received: by 2002:a05:6a00:1d08:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-79231afd0fdmr14799703b3a.9.1760038309275;
        Thu, 09 Oct 2025 12:31:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/24] p11-kit: backport fix for handle USE_NLS from master
Date: Thu,  9 Oct 2025 12:31:05 -0700
Message-ID: <c621612a12cdbf5c89279b69e28d0e3a0b5d0a86.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224640

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Disable NLS in the build when USE_NLS is off.

(From OE-Core rev: b94798ecd535956ef4565663710ea9a701ff21ed)

This change corresponds to upstream eeb3974472429a99a724f324dc8a63e435741f68
from master .
Since the p11-kit version are different between master & kirkstone
applied the patch manually

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 72b446204a..62aca0cfee 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
+EXTRA_OEMESON:append = " -Dnls=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'}"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES:${PN} += " \
-- 
2.43.0


