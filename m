Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.32255.1613402170448917727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 07:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AcGMMQVE;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a132so96898wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 07:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PKSNfyzeOkBPc6oYhcW6ZRSRDzcKIIvPkfPzJxAMDfM=;
        b=AcGMMQVE/4bkPni576O2wM3qdWL68M+DhmBjveC2h8NXz9ghqvpWFZyF9qgxheqjjb
         c9oKWIK2CZs+K0XkKiVmPCCYejG84SAcXk82JZtc04Y+dNMHdc8Idrk69vRvsUAi+ATL
         7OIs6rpWQZNCjqzX7jCyjm3QWPw3YdwM9i6qUvtAVMFE+fsa2SglVCyK/qHJ3ZZbNk9W
         ZraPr8nIXGSf0api8u9inRp4Q+WGqcvUtdQpX7PIKKTYsHTsoc3dyXNzRV1svFmyhU8q
         hG5rmLlwdjk3IcxClTkOUvzBcyGbENtWBYWnztKn9QE0JIxTkCM0/jqyPupopK+zABdw
         iiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PKSNfyzeOkBPc6oYhcW6ZRSRDzcKIIvPkfPzJxAMDfM=;
        b=XJKUUJUCZkiH+liJVF97vXQUNBKVaIftOnBs/GSwb1noVnepATMjr0s9IJWYxfmVEA
         W96X24dKuEGIaDyMLuWZvJUkp3rNDO4jKzmo/Pdnqb6PaYEaG7IbgwODhYVzIq+9iPIO
         Xp++WQCgqZiT/WjytqKRR7m/XMIUqsTujtUI5Y8TbocsPWeKp5/+FShqgGhqY/IiO4Xa
         gWwM7MPoU2sHkihU+GCuNQ3eTAgH6mzOrz0+ccV4vUKfiXLkU/OReTZAEJe788aPOo1S
         /tojHan6hQyGs1pvg6+UX8GZf3NByZ2zCf6yatE8AOT2E75fsdPSZ4k45rUjH+MhKaEp
         dejQ==
X-Gm-Message-State: AOAM533s1zQmQVjSkR7PmrB0rdCoz/ULU6SBT1e+aAcuRN68YLjudEjx
	SvJPsn3L3QB93JF+fVV01Y47s0EuUtn0QRCP
X-Google-Smtp-Source: ABdhPJwmTJvwKd3/oXlvmmzU8XSPzF71lYjIBxeuNAo8mdhsG4ajj5RjSongW6JrXJoM4znTBmEP8A==
X-Received: by 2002:a05:600c:3589:: with SMTP id p9mr14684382wmq.18.1613402168916;
        Mon, 15 Feb 2021 07:16:08 -0800 (PST)
Return-Path: <aj.bagwell@gmail.com>
Received: from CMM-C02QQ1FRG8WL.localdomain (cpc159419-cmbg20-2-0-cust164.5-4.cable.virginm.net. [86.29.216.165])
        by smtp.gmail.com with ESMTPSA id c18sm174118wmk.0.2021.02.15.07.16.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Feb 2021 07:16:08 -0800 (PST)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-core@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [OE-core][PATCH] kernel-fitimage: fix dtbo support for fit images
Date: Mon, 15 Feb 2021 15:16:06 +0000
Message-Id: <20210215151606.46544-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

8a2f4e143 added support for u-boot boot script but missed adding the
extra parameter to fitimage_emit_section_config on the dtbo branch
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 87ed8bd892..2414870817 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -626,7 +626,7 @@ fitimage_assemble() {
 		for DTB in ${DTBS}; do
 			dtb_ext=${DTB##*.}
 			if [ "${dtb_ext}" = "dtbo" ]; then
-				fitimage_emit_section_config ${1} "" "${DTB}" "" "" "`expr ${i} = ${dtbcount}`"
+				fitimage_emit_section_config ${1} "" "${DTB}" "" "${bootscr_id}" "" "`expr ${i} = ${dtbcount}`"
 			else
 				fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
 			fi
-- 
2.24.0

