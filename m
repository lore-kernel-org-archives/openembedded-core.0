Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3C87C199
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 09:22:59 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id u89-v6so15004779lje.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DvHDPyQV96Bs+efnnLywe8E7L9oppP8b8qSjUnzchg4=;
	b=PHvS9j3gAsU8gwVYT/NXHfVgqdZuLMV2VhX54gu128LyVy2rR6XOnDpxwlo0992W+7
	fKSXcPczAz1QsoaEIOaH1+J5iB1+lOHBNeQ7iKxfuAAVxZA3PRJxFersZTxlIVGJM3ZU
	d3wmATLxECDWyptc8YWahRSufC4DZY3vxjMW0pOFOiIdYmDWaE4hU1H1KeOASM5uqglb
	fI5PHZY/TdutLowZKEJn3WvhOL7Jd3c+5Hr07DIK1tGEAWRBSBSs+SHF9GLGgSNtkRQz
	nkuLHBO985rJJwsqujmmL7CPd+/zYRr/8DGJVhvm2NjsdHPIcmmhGajOba/U1R8olKXj
	V9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DvHDPyQV96Bs+efnnLywe8E7L9oppP8b8qSjUnzchg4=;
	b=XDj+kucTD/xXKp/0asxihyUzCvnKZVQV0cgs8U1OrK1K62MblPeursj4tgSB27UqeN
	JexVOj7XfuGIpXpgaifrVVYJ4K2q0/4i29S/7JOAUS+MJ2oeFGK8N9FUyZC8MulmFD9z
	uZqukNZuf+cgoIw998pPe69uA9KpkZ60XeyZz1GV3L+PwwDI9e/ZpAOxjISIxCtdu2lA
	+s2BEVLXg6lMIRqrIFuP5zDTzGEVbFPH17F/tpYLveLN/4H557EH6jBmL5r3b03gDL9K
	7zqeMjbAimIRGqiYji82cGZQc5+VUxxeJivHvEfSa6qQk00paLWXL9D9nuzEK4nC+EVr
	gdOw==
X-Gm-Message-State: AJcUukevU1TFj1hgvOwN/KPcgQD2DxEaHJDsegZuWcSAlRFiUDfd4+Yk
	RiZnGLMADCVdjT6X9r5Sc50xnye8
X-Google-Smtp-Source: ALg8bN77o1/RJgytbGt0bOZc3Kyg+tMg+hfkdKcuhFx3Y1697d/jimpLBpQME2a1RBdfnV0v5K0MuA==
X-Received: by 2002:a2e:3a04:: with SMTP id h4-v6mr9981509lja.81.1547284980024;
	Sat, 12 Jan 2019 01:23:00 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	q11sm14933726lfc.92.2019.01.12.01.22.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 01:22:59 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 11:22:48 +0200
Message-Id: <1547284970-20783-3-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
References: <1547284970-20783-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 2/4] systemd: Use arch overrides instead of machine
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
X-List-Received-Date: Sat, 12 Jan 2019 09:22:59 -0000

With custom BSP and build with musl we still affected by undefined
reference to stack-protector specific functions.

Use arch overrides instead of machine to ensure fix applied to entire
architecture instead of custom machine like qemux86 and qemuppc.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 0f1fa27..2e11d71 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -66,9 +66,9 @@ SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
                file://0022-Use-if-instead-of-ifdef-for-ENABLE_GSHADOW.patch \
                "
 
-# Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
-SRC_URI_append_libc-musl_qemux86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
-SRC_URI_append_libc-musl_qemuppc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
+# Workaround undefined reference to `__stack_chk_fail_local' on x86 and powerpc for musl
+SRC_URI_append_libc-musl_x86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
+SRC_URI_append_libc-musl_powerpc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
 
 PAM_PLUGINS = " \
     pam-plugin-unix \
-- 
2.7.4


