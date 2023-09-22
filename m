Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADB5CD4F3F
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.16019.1695367498120251523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gouObW6M;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ad8a33fd0dso211440466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367496; x=1695972296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+aWNBM2hNRuSUJ9TAUcGXUOK33ySJOT6mxIIInFfeE=;
        b=gouObW6MSxJ/W3BBj8BviYf8c42acQXOErnP3kIBpFFkPYnrEA1BGvhTmIq3QaLmZo
         PdvK3u7F+nq1zpbgUZJFb3aKquNixiIrTUWH2oYOc5Qa8h6cBM2hjZFErYm7W4ZkHh/4
         lC3rpyaK3Z3h53ynLz546RtsdpIX/Uo1aUwJq1F+1+3Pr9jagakQnBBknrPXy5tvkwdr
         QnmJJg3ZwwYSNYQ8P7Da/RtxPAqjEtTurcFAs/i//TxFX4UK7SFwYXqh40gBEUz21Y+2
         29ezFjTRMD+TpzAVUmbn4ClYsNmpJOd6aD6fgh+OE9idgh01oD1/V/sdJ8fC4KiQepor
         N1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367496; x=1695972296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+aWNBM2hNRuSUJ9TAUcGXUOK33ySJOT6mxIIInFfeE=;
        b=aVFa5W92L3g2UyXaI1NBPoIZ2SgtZ7FJbiqBkTMw58yXpMLTRDzss9JAf3SRqALDos
         l2y4SvKBmZXtxl5ao4+3uAQ0zTFAZ6Rc/FqV4PpHVYhwmW6Uq2zuPSbmtZaZ1vBr7BcM
         rUga+hRXrRAbtklE6OhIPh+fVCnKS9s84c7s3jDZGQjOppQzzmA7dhKxDxxZxdgYO9zZ
         wiUO57WAfmN+t/eU0VOoJvpQWWeoD1eq1Nwa7qor18IDD7uusgyy3V6ANF+q12vze5vK
         6SeKse7aTMPflQ8VWlQK68cHKwF3lyDsp04o28GsVFTSY3fptb0X+JtGSNqEtyvuLhOr
         Okig==
X-Gm-Message-State: AOJu0YyusDCNmiFb6dyaaiP94fSzP3zzbOgz+PEySpkeBp0LZAul3ecz
	y4fv1ImA8jLcTbKSn9z2WM0SYO4sgaw=
X-Google-Smtp-Source: AGHT+IHBa0/2FJ6mjwuK1EKrYTH4gfx8bpk2AzoRYrD4fIXI2uXCDFZtMQVcHFVb2U8hC9vf93SgkQ==
X-Received: by 2002:a17:907:778c:b0:9ae:3cf3:7da with SMTP id ky12-20020a170907778c00b009ae3cf307damr6888147ejc.13.1695367496533;
        Fri, 22 Sep 2023 00:24:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/40] sqlite3: upgrade 3.43.0 -> 3.43.1
Date: Fri, 22 Sep 2023 09:24:26 +0200
Message-Id: <20230922072431.1481743-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188077

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.43.0.bb => sqlite3_3.43.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.0.bb => sqlite3_3.43.1.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.0.bb b/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.1.bb
index 84644a09e67..93146358c70 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1"
+SRC_URI[sha256sum] = "39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.30.2


