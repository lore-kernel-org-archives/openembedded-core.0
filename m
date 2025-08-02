Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB948C88CB9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:13:12 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.6138.1754169185685723317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=f/DDeTb/;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.181, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4af156685e2so9707031cf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754169184; x=1754773984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=f/DDeTb/AHvssV6LfinuxHgPJfxVryIp+LJZWlWTHqYx1jdPH0Le9W6ZX/F3MeUCIz
         iy9ssIe4Mm5Nuz1I47Q+8OrJQwJV6hOOUh6nMWHIKwwwlZgvdgPv3h0aE2/np2CbDgt9
         9ovl6xW8K+AFxpKn4O9coPNkzNXn+/nnIbf3deYxLTZYsJ02xwF6SP8nszriiNp9WQMK
         V2yffrrYgUA5OJTkKVvHsQY7kxwuPhaD7JxWELrXQP1yBwZIT5TejY2fy8ECj/1J68O8
         OizkHCojSGCTfNucWiVBuipmSvnHB+o+ugz+z+jXSxex2sBGBtCaWBAhWoFzdwtD5smf
         JDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754169184; x=1754773984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=VBFckOgNxz/ltXTYxooRgMyB6o2SMc8HdJ+KPNFxQob0Ly2ao+/UIbVtTyuy8SV5a6
         h1qeOxJ3/DXO2zW7AaTAvHF+yNzqDPg4nlMej/slEPNG5bDlyAhyTG0iq47BwLis70WP
         Mxn1wKtZ3LcsJlQEw+7K1iCBaJgUBYk7PzTtNcZg1T+Qfn0ACZsYaOGNLjk3PUUd0sd3
         pGG68gec49IYjHwwmc11IyKJPbQceO79oyZuwUXjoram7zVmfVe8zNGOIzavlTMnNvYc
         FXoRvSs7QCxKsF2kN+f/VX9nMFBx5b3AKwYRZAajo8LKwaAtdlK/c/Sy+DR+hZWisDe9
         +FYg==
X-Gm-Message-State: AOJu0YxlSEa8aimpB0o0KQSY/vqp8qyVKs3jFQ/l7AJBNi7uTILzqUxI
	SdjhdDp2Im3j9tYyyMYgnxiXErrsrWD6r8yKlwtmPYelVf2N/cvJm/xkNJGZdc2z2jgCldf4/PC
	qJPLdd7NWJg==
X-Gm-Gg: ASbGncuPUjH8G3p92+GFckv/iqm/HdL9m4Au1zSnxom6Ijb/rqdWwzMM7i/nPZjuS9g
	RpJhF4cYCHveK1Yk2DnVXP3aE61pKUHNxMaW2/yjeeAyiNE2u6US32YZ+pLkhYIINsy65rqG8K2
	+OlqvKvtzus1CdY7fYm+aki1xW601sa7gvGvDgjxqgcM7pN32N9U3tMOxYZj/evTdFmoyTqUaBu
	W4mudx5f9QQ8KjRJHsSjM1TPYwKG8rfIO23dsmny3xbwD3YJpc3dDKOxs1cZvweFY3H72+PFZVm
	Keh7Ubem2r4sFHgZmCVL+cEn+yrJSaoo7B4W0NpsWLAPM9u8z3aRGLu8UXsR83vAlG49KDXbBJ5
	uf7AKV9onruSB2mrqVOSFBxC89JY=
X-Google-Smtp-Source: AGHT+IFUv+zdqwSGZ/AlKPuNanEm0kPETb7SScOpXHXL8tw6Gy8bXBuZSCeFg9bO1s0rL1JpoHQLPA==
X-Received: by 2002:ac8:7d43:0:b0:494:9d34:fca5 with SMTP id d75a77b69052e-4af110a5885mr73880771cf.13.1754169184279;
        Sat, 02 Aug 2025 14:13:04 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af230d8a21sm4955651cf.51.2025.08.02.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:13:03 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 1/2] cmake.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 17:13:17 -0400
Message-ID: <20250802211319.20060-2-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802211319.20060-1-anakin@childerhose.ca>
References: <20250802211319.20060-1-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221389

cmake.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 1488d744d4..2da4a9a6c5 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit compile_commands
+
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
-- 
2.50.1


