Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
	[209.85.219.172])
	by mail.openembedded.org (Postfix) with ESMTP id C95597C121
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:44 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id y7so2430717ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7cU+sw8Ct8ZHPN7wmoPn0AU3DbsiFdlrcquUxOF1gJ0=;
	b=MnUM5/DrznVtUD2KTW0T7Wy12ld5pujrpAtsydBLILiMLJmqqTNiPnP4/Ahpuygyqj
	mrtfd8ETz3Nc2+RiHMHATCq2/6VhiVzvt++cPWZdXrQ5Acv1taLT1o4oZaUERPQIa+j5
	JAlWwmrDviXdDoDM8cGJ3fc8CJXTrk+djFr8n4tK/YSXp7zs+WcB2tCtVvdn8daQSDJL
	4mwAh1Lp8xrW27upLfCpwi1OX8Qkfr8XuQQAh9fj2PIN9Aqz2XdWRiuOk21hln8McdCa
	BxvSz+d4JyJmHwvawAyP1/9lUFyJtgtYKk3YaSiE5dAMnWufKivLQw5TX06iMURM+nIe
	hAtA==
X-Gm-Message-State: AJcUukd9NZQ4XvmsmoRWlyhtHF+/gTCBo+LlXEZMT9jlZzjCcyXOnu7w
	8S0uFs8rWO/T59V+QsnLOP2wYGL4
X-Google-Smtp-Source: ALg8bN6Q4UuYoDehOPc2CUQtz9nBLH+5RFjeFSjMlArGv0cSGWoaX2e6ftCEj8nxKDGoxkm44FPIWg==
X-Received: by 2002:a25:ce94:: with SMTP id x142mr7510274ybe.292.1547643105664;
	Wed, 16 Jan 2019 04:51:45 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:45 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:23 +0000
Message-Id: <20190116125124.20177-15-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 14/15] util-linux: let -ptest package depend on all of util-linux
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

ptest executes all the binaries, so they really need to be available
in the file system.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 47264028f2..458df5d047 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -290,7 +290,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
-- 
2.20.1


