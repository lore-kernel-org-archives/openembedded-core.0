Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18C687BF2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:40 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id n21so8528266ywd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iwr8i+X3FUoa1i1yIZ7NoaQwhAoG+ErLnp9qB7RZGz8=;
	b=YtIrm9bOB+TDqwNk5KmhK8D0TfKfrBH25F1YmwYn2JYTUZ8g3HYwIyvAChEtNkT7SH
	5RxHrbc81skQMLuqPg8pqeIEpSQUhacAK+/wgxjmoRjVHFzBHSYI1yHvQZP/x1N9t5k2
	MUqn7z/9c9u2L22oQYNoKf9NjWKBqMoGDleWs1xJfq0hvmwqoKRU5g8gYdAeLnVwNWqV
	0evRb54FfOtKhic+cZQMmkXHRXlO0ZrkgmFSjoEaSaDfpw6bORiX0bWaKtHr5VRX7DYg
	iGM8U/iHO9MOnx8A9j3/NTAQZWDLZGIDNGR97iaLKmZzGQw0b7k7zY3VgzuzUiZXlt24
	mg6A==
X-Gm-Message-State: AJcUukckbnPpdxZ5M9I21ax8fzBFM6zQVFkG1lCAFScfk9FJj35A1Zr+
	lCURu4U2z20v8j4br71YWXaNkFwj
X-Google-Smtp-Source: ALg8bN6sKMaQ6qTeoE0ZRS4tX5ryumieXmuyaRVsktLKApkY7MXGX+cbYrQyIZz7Hehg4W4NJFgDFw==
X-Received: by 2002:a81:4787:: with SMTP id u129mr22583862ywa.80.1547470601744;
	Mon, 14 Jan 2019 04:56:41 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:41 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:21 +0000
Message-Id: <20190114125632.4780-2-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 01/12] util-linux: simplify version upgrades (MAJOR_VERSION)
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

There doesn't appear to be a need to manually and
explicitly specificy the major version (for the
download URL), it can be deduced easily from PV.

Do so.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc       | 3 ++-
 meta/recipes-core/util-linux/util-linux_2.32.1.bb | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b5f77f7b6b..a1702da5b4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -24,7 +24,8 @@ DEPENDS = "zlib ncurses virtual/crypt"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
 PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index c909836cbb..b0492afff3 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -1,4 +1,3 @@
-MAJOR_VERSION = "2.32"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
-- 
2.20.1


