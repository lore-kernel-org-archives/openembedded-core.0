Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E8BD5AE4E
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:08 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2860.1765620002511788899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U/udA5+D;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297e239baecso13599745ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620002; x=1766224802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAVMnrbBg2/Y3MHp5gefxST46+Ib4dHEnRoKLpzVWIc=;
        b=U/udA5+De9YfWkhNHWFD1p6zPIw+5JQri1Y61bOoAOk0A//v/lPE/Um4MlGdw6s+VF
         xSOZx6r73VWuWXeaMSqqWOAYIM40OaRgb5Zg/os5QGvhqi6DwszZ/xvWHVdiF4ZnGmv0
         MGJquKr+xkDbxWHPc6pmhamm/MF4hHwiaSyr+v3Toga5sadQk4TPTNQjhvikM72FDWlY
         Hmn2GNJ24RymBJnWTKdHqon2WMUixawQ0XAyCzxiZthkCdOr9+9gro1iIGlnaYaamoX4
         1hiXDtNtr3B9ftv9I9Hv44+OWrAIqlUBWPkWbjwrCj+qsmQylcoKyhvBiaPXxeA0IRfy
         Hd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620002; x=1766224802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAVMnrbBg2/Y3MHp5gefxST46+Ib4dHEnRoKLpzVWIc=;
        b=Gjua7cvtMpzpV7Zam39x49XLlN6/0FoE18P5D0xaU2v/OHbFpL+fQXt33Io+LmUJn8
         oJrkDA7p29WC5lkrXfaxx9Nhe2+w1qw+XHrMhrhAqbdOf9X2H1/ZPSHY48275uTqdYIz
         CBqTx38BAJ1aoVNkFOw5Ta25L7QIqc3GVjrlYVDUSPqhCmnOSsW7gIlR2JqrzTD9cuf/
         GDDWcA5ZLFSfmreBsvNPXHgAsT0oCyHRdBbBGlrX+w59nlla1Vocze9siChFeap7X3Uu
         BaOsPYmgy3DIWtCbe4k/FrEu9wzpjB9gNt1vfSsuM2zUbXYNUXyCm/Vh4jILuSpWzTJN
         Iz+g==
X-Gm-Message-State: AOJu0YwLmcEgHNCp3pi+nMK1MnnAoPACxop199CblfR8zjA/6RDOAoBh
	mZu7JnqaC0d5/3X1GnKOwk8IQu/FYnnCRODUR8zKouYzmQNZ7OSms1rEfPLE4Edw
X-Gm-Gg: AY/fxX5vEKKSZVvjx/378WwzrAvditscJm1oCH2SbMBnTtWymKwKmIwwnlrBtcupw+M
	+cqIuHmHi9uNRCycj790Y3/LuQVTV8/qv6omJZfwGhnCUYpBwvQG5JEZnrIsi29od0NAxhMpOIa
	crzJxrB5lpCRrQDqYCn4n1PkZOvRm00VqQ4R72QDOvbljAHR9+6082BkTsI+hDsnz0+QmCkoYDv
	YMkZuZNWSgwhC/CPwTWZx11TwOQE/iZ8321/ITmNqP+qmW+K+85RTn7yQ350ykUyGJBtbFUrH0o
	s+tUj+Q5Fry+xrCp21nzOMxSs3+QVQtlF8V9xsOjHeYnx7dwDngNn336K69uYE8bG9awhmUyHG3
	Tg+rodww+bG/ZQL6n4iJbeEediHFd4LPh3LzZ5RdCqbnw+hyBjruZlf4Jem1f0HOGeSYP23Qtrb
	gGz3Ln8pv33pps7/ijXKFlCvzq
X-Google-Smtp-Source: AGHT+IGG7UFlH7nq/HzTTZGiR5Ec+LusWv2HWDW7J6yQ5FgWjYC6k6D2RM5l6EWadKezFXLs+6rmxQ==
X-Received: by 2002:a17:903:32c1:b0:29d:67f8:38b5 with SMTP id d9443c01a7336-29eee9f2bf1mr86499565ad.3.1765620001737;
        Sat, 13 Dec 2025 02:00:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo@foundries.io>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 09/67] uki.bbclass: use basename for dtbs available via KERNEL_DEVICETREE
Date: Sat, 13 Dec 2025 15:28:33 +0530
Message-ID: <20251213095931.2571498-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227627

From: Ricardo Salveti <ricardo@foundries.io>

Device-tree files set via KERNEL_DEVICETREE are deployed without any
vendor sub-directory (e.g. arm/juno.dtb gets deployed as juno.dtb).

Same is also done in kernel-fit-image.bbclass.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 27a7fbb767c0a25b34a03cae90320908f8ade8de)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/classes-recipe/uki.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index fedff222c6..a2b1c8a82d 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -152,7 +152,9 @@ python do_uki() {
     # dtb
     if d.getVar('KERNEL_DEVICETREE'):
         for dtb in d.getVar('KERNEL_DEVICETREE').split():
-            dtb_path = "%s/%s" % (deploy_dir_image, dtb)
+            # DTBs are without sub-directories in deploy_dir
+            dtb_name = os.path.basename(dtb)
+            dtb_path = "%s/%s" % (deploy_dir_image, dtb_name)
             if not os.path.exists(dtb_path):
                 bb.fatal(f"ERROR: cannot find {dtb_path}.")
             ukify_cmd += " --devicetree %s" % (dtb_path)

