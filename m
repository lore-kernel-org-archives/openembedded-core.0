Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE437C0D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id x30so1690388edx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KnEjl6n4K1mULh3CUHUOYlgwKmjHZok0FPIhfzJH5ZY=;
	b=mtcBncbLeDjzCjG4AdFt1WcaS1B5RodDcDLT1yeoMOuocbTcHqdcpxWeM8XST7c1eB
	OV76KVliaKbc1NKbLirClVFf/wqIEhIadHJjolech9dFfPQQ1Mnh2bInxhd7kfW2jJDh
	+snMeFjfy/vT5TiR+3WKwZ3HTAIp6n3T7rjSQZoLfRrrf+gw2lqKcCrku8NNIFVvU6Bw
	Jfga6JR9F+JEB97cUddCaSeEDGmXx+QZg2MEPt5yDoVllf5Xag/2hi0xG+cZRYc8hujf
	ylVtvtdtOZYvSEn0owsr/N2F5ppW2gahiRmyCUD9hxICFqCHDqWsQWEOhSaAoK4Yr12Z
	SwTA==
X-Gm-Message-State: AHQUAuaK/APxxrMH6x+5gnq+fYye3Xcxsdkjy2wNrII2StjiZywaKmlu
	3KC84pM6tPn+tnpHH3It4fWDEKz3
X-Google-Smtp-Source: AHgI3IZFSSmvrHaIf67hbCaNytwnVkzyometYskznI52M4bj2bqjdE5bm+22ivhaJAqLcw99Wdms5w==
X-Received: by 2002:a17:906:6b11:: with SMTP id
	q17mr1665213ejr.241.1549333978795; 
	Mon, 04 Feb 2019 18:32:58 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:57 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:40 +0000
Message-Id: <20190205023241.29707-13-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 12/13] util-linux: let -ptest package depend on all of util-linux
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:58 -0000
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
index bbb28c3da0..93aa3e407c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -306,7 +306,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
-- 
2.20.1


