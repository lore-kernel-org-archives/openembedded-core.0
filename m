Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5480F6102F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 13:26:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so2354402wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qycOnFdNMuvW5/q3nvagpsH33kTm3Zg0qxcVyZfrUxc=;
	b=poQqR0YHAJkmedEjK+fcYLk/jOMGNAAH8xQN0LAyNxda6e9AoMKt+NM8DwR+/MHB0H
	OeI/HcHI3qf3/4qtCQGI44jpNrwqdfiNlWyfwYGqG+httG+C9qcY/lauGNhoOJvASD/v
	SIvRqey7E/1OkOSaHvDM86lSiGnybvPWZZYjxSaVxYiQzE2YIk40c1UcE65LeqY0hOjy
	KcIUth3hkAYrw9g2kyT1Ys+2LmrQwa6MQKXKfadMYUA8oZZYFQqCTqBqVQJ2f38Fa2OV
	zyzUsUw7SrZbgb9iK2iwPj07B7L90QM9UnvXqm7LhjcTBXmP1BLMSI5ktxyhLQXl1bQr
	y5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qycOnFdNMuvW5/q3nvagpsH33kTm3Zg0qxcVyZfrUxc=;
	b=pIq97hMAsMAUvATTl/bVaZvUP7Kfqc9KqGMfSmoqRI/UU3BopM7sGfCmgqsVsSjDF7
	mwMwKzZVzVMzZNrmBZ4NENzrhhlb+so4+AbIXDnD5AWDkwJCHXHx4F2maPADtU2uO1aJ
	puzSoqYQ5pcEjmGmuyT7opskXme8R2UvZ6CwiBM4Kqt4Ck/l5rX2uZOC82dAMRl9BjWZ
	EgiLLCxOVQs5kApTSi3U/Qq/Cyypiz6krmme07zgKv0SLwcuiUTH7r2E44ph3cCtvATm
	9s1xDoPPCJUtVjxQvjyM4GwiSev8e2xy6oABLvkg49WXtBK1zMB9fQr516X4yvJ3cry4
	49AA==
X-Gm-Message-State: APjAAAV4iOmSJA9KCz5/iR8CB1arNQx13mrEZaNgvJvJvHLhq/k29Yyn
	nC8TXY5US+qYFrNDXr+PKaLprdnR
X-Google-Smtp-Source: APXvYqzuETE2OGAOn7JJDnzZRtxcq/FeJwoMuoQWOKWSbhD0pfLs4qI62VKSXb9aUNL8F5KcMcWBzA==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr16316246wrk.249.1581514001574;
	Wed, 12 Feb 2020 05:26:41 -0800 (PST)
Received: from localhost.localdomain ([195.89.163.130])
	by smtp.gmail.com with ESMTPSA id l6sm641840wrn.26.2020.02.12.05.26.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 05:26:39 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 13:26:36 +0000
Message-Id: <20200212132636.63599-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] kernel-fitimage: Handle overlays in EXTERNAL_KERNEL_DEVICETREE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2020 13:26:41 -0000

When using EXTERNAL_KERNEL_DEVICETREE, collect DTB overlays too (*.dtbo)
as well as iterating down into sub-directories so using the behaviour
for naming which matches KERNEL_DEVICETREE.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- ensure that the order of dtb/dtbo files in the generated fitimage is
  reproducible.

 meta/classes/kernel-fitimage.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index ec18a3d69921..72b05ff8d1dd 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -391,11 +391,10 @@ fitimage_assemble() {
 
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
-		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
-			DTB=`basename ${DTBFILE}`
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
 			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
-			fitimage_emit_section_dtb ${1} ${DTB} ${DTBFILE}
+			fitimage_emit_section_dtb ${1} ${DTB} "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
 		done
 	fi
 
-- 
2.17.1


