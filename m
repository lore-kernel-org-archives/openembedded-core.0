Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A0EC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2679.1746807450220381023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qL3IoiY0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7396f13b750so2584564b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807449; x=1747412249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn96zjXxT3J8VL78iwtCoYl0nrQyScFHpB950HXyfSc=;
        b=qL3IoiY07fwsHU84Ou4M3sIDi/HUXU50tj12WiSy+wBl+GMFLVXqIbcZIO7PzpBFPW
         yDtZO5bH5+GruuLQ9FZnQbVyRkREics/TbBWuyNLYnYLn91Up9l/NFOrbsdHqjXTQ4hr
         gifh70b/amaCY35imWQ9J+RMDHE5eAtRSwzznjQA2MEnas5mDzOg0Z+Jm7p7OTbLqE3S
         b37t4dv5hJgeEFLvE4L9/FWyFqG3KCtRTZZGCtnSf7qpgZZWXGbSH5HpndHei1g1h4Lr
         a66LNOkZ1T/3cbceS0kCgr++0EO6kVgnLbgIDOeT/9bDmCoUtBn7E2BWQTk91b4ONeGO
         p2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807449; x=1747412249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn96zjXxT3J8VL78iwtCoYl0nrQyScFHpB950HXyfSc=;
        b=JdDg4q4g+XoMlxyymAjCkW4o/GCunVvlAvAvOpGM97gFvGdlUngxvUKfdUIUQjufHo
         G9uoGXsr8tJxqXz67jETTHQU/1YkQkktToJ+0aTiPyABHRPEj0ba8zICd9cvMKw+Sm47
         yBr0XGXpHwi8hToOHPad5DIdFuQGKEYlzWcU7U63ZdX+uWPnan3G5hJVInaYFuVGmLIb
         rfyqyXKxXobViDKdw8hzhqhqF4eGqglXgcBzrOI/V42Cjyw5in6kk0q4XPVzj4dG9kjm
         yqHdys/wYhD71Gvd/UTTKn5nWVZXYFweOduISZNMAMWbrijWtLrVe4p+KunPUk89nrU7
         CFOQ==
X-Gm-Message-State: AOJu0YyhP5u+NN6I6WebbJeMN2PSco5IRm+FuYHQHo5ky+VS3l9OFl/b
	gp+bKJdNBF1IeZfsPvDqTcxfsrU8EJDn3J2tVM+M6l1RxekpGm8DT/QjGkfabYVliEGXvbdc05H
	E
X-Gm-Gg: ASbGnct9veu3AG6ICWldr34WHAzWvlNh/0SXvunOvef1uBV3RhliCYL9uH+ipgA7g4U
	A+KlVZY7Xlzdccedapca84rhnNqthoYH6gus2vo+V2zJxirN8n5L9+3bWsefqb9Js4lehFNuwaD
	y8TVCwM8tW5vxIlMw78hPUO/1WyY70gY2uPgXePYK1ZY9ExWXu+pJaLAbwFKersWPyl9eXW0PMJ
	e8OuVAGaU7cHQ8znveLFsrF7ox6Po0bpbbUeAK7gx2iqiSrRuIGSRXMp0trUEJsWyW/LnhC9gnV
	1ONL3xYk1g9a9hKJJ239bycjJzeTlZPk
X-Google-Smtp-Source: AGHT+IFTCLGKOEYbaBmsrzVNri3p5zCBpO6X3u8oS5Lr0YCZlJbJNTE1Oz4HEEq5do3uwribMh5k2w==
X-Received: by 2002:a05:6a00:2195:b0:740:a921:f6de with SMTP id d2e1a72fcca58-7423c02f244mr5544304b3a.23.1746807449430;
        Fri, 09 May 2025 09:17:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] qemu: ignore CVE-2023-1386
Date: Fri,  9 May 2025 09:16:43 -0700
Message-ID: <f7c8877395d4ec0a91cd5cf54e6c2858495746fb.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216241

From: Peter Marko <peter.marko@siemens.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

(From OE-Core rev: 6a5d9e3821246c39ec57fa483802e1bb74fca724)

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>

(Converted to old CVE_CHECK_IGNORE syntax)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bee30cd56f..cae33459e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -161,6 +161,9 @@ CVE_CHECK_IGNORE += "CVE-2023-2680"
 #       due to the rocker device not falling within the virtualization use case.
 CVE_CHECK_IGNORE += "CVE-2022-36648"
 
+# disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985
+CVE_CHECK_IGNORE += "CVE-2023-1386"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.43.0


