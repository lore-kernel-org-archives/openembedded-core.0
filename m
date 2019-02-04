Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79EF87C28A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:06:08 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a20so10693982edc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+9ekmWOVEKfnVZlXLEOmOHMs243JuEz5sxg+bpxpRjI=;
	b=oUwmCI9pZXHiqx1Z0UuoDsJmcjxXYg42UTMflfTpwOokEjHDan8XsZwLStnqbU6xf+
	o16KySsaBK18iHLO1k+haqO5s+HlyV/9iBllt6tsWSwOhKYT5nGxqKwkhJB31uw229LW
	CdgSpfPgIierRP6DDArZigofMS2HkEBDMMrgunvVPXImwPUPoJXb39fkLdBRaWmIxDsr
	WNlSzLjhqRTED6mFnzBRuSdR3WvXlJdNKIEyx7r25Ka/xEYP0GckyXftad+VYxoYKekG
	PmMmWHV9C5MYP+PGnqkuYWTDbS7ioP/zpvHL0eBkihYqqQGaTMoexyE6S63ZGpGStmpe
	jolA==
X-Gm-Message-State: AJcUukfL0wQ2vrXvIi7YyHhZzJwR5ymBj8vkL/9EXDOvBTUv2epSe1D5
	tGiRASyIP6h5hpcH9ahLkRa4+6Uv
X-Google-Smtp-Source: ALg8bN6n/saNslGEhIb5L4lphr5rVgszuyt5/FupqCYBzNNTvvFLHa/xfIc3h60OSY463Aaywv0ywQ==
X-Received: by 2002:aa7:de06:: with SMTP id h6mr48818134edv.137.1549274769283; 
	Mon, 04 Feb 2019 02:06:09 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.06.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:06:08 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:51 +0000
Message-Id: <20190204100552.25880-11-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 10/11] util-linux: let -ptest package depend on all of util-linux
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:09 -0000
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
index 49f6ad3f16..78a4d6151c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -300,7 +300,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
-- 
2.20.1


