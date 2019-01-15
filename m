Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
	[209.85.219.178])
	by mail.openembedded.org (Postfix) with ESMTP id BB6E17C137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:46 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id y7so1109958ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tUlgrUNc7O2FnIj9mkPQJQC7LN3vD6rJuZnXWCx506g=;
	b=Di2Va4vpXqG1Jd9NF3Kz3uyF8QbXjgkYYsPcmrQfswHwikZxGc4VS1upeS8RvGvcSW
	2/x76vhfKqVZKJx+Mg21rjPRo/xQh9IlV3cDfk0SK4YvkS7sXgX4wqOhAUePtHAqP7MP
	XFsTM4DFAIG3e94F1PH5lVHkUsWMdWxs2syx3JzbmLotE/5RHv5hFeGtaSRQ9TMzjDLu
	toiXIOn0JlUhwkEcsxnRGCyMNgXwMtOrccwkDAaSFaN6Fksv5nFluScnnZAHcLGx4hW2
	aaIIXbKN5mU/k8gaJKdbU5NHpUI4gf/E3xwdMyfp8pn2DVNNjd/S1ufWmhNl3qAg93dn
	SnQw==
X-Gm-Message-State: AJcUukdMpQXvq5BWwnOpZU1E3omJLl7HvAuEL6LL+ogyFoGsdlnxVrRy
	2itg7wYryjCEvbBbS2Y06G3D3zBC
X-Google-Smtp-Source: ALg8bN7xqFR5xkFnwiVGYr/mfPrN0z89/4rwe66tUkcLmZAr8HJ55QXv4YJ9Don4WimgC5eMiycENg==
X-Received: by 2002:a25:2389:: with SMTP id j131mr3471487ybj.20.1547563547568; 
	Tue, 15 Jan 2019 06:45:47 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:47 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:24 +0000
Message-Id: <20190115144525.29388-15-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 14/15] util-linux: let -ptest package depend on all of util-linux
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:47 -0000
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
index 6ff947a34a..641b4486d7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -287,7 +287,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
-- 
2.20.1


