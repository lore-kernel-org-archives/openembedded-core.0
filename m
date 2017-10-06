Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B8BE878265
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:24 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z1so11202005wre.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=t8aqpN6rIBYJkYAioynKYj/cwRmGPzyC2MRnidz/lus=;
	b=d2fK+J4O+g+eSQlCRxDGwaYhmuhNvFWybRJ4tx+Lha6JGBlzqK/XdV7LLpmVAMdnGZ
	5fqW9rEJpFKCa4xRjMeeNSnup86hu4b6AsRJsHA4KuyyAmBm2Hhgw5dUkcgEzNFYyCts
	wfBCmUtvL3weblubhXwi4BqaBbamZIzJMU6uds8tPBLlWI2/TR4C82AmkCv16zQVIPgs
	DjzngKli2gAmnFscc5fz8OOmvrkdb626+DsuI3FChs868eTd9ipgLj6WsL+/cLVDp+Yo
	URqvj7OWLmYpbKqJCjGEYiN50FBISZ8N2mzSh5+E3fNChF585nEdEt8gOAqC39lkoMYy
	vOZQ==
X-Gm-Message-State: AMCzsaVLOMxl8XWv7jbjH39/bKq6oAEqlXXPH1nGvCd1chSh8okl2wpL
	RZg8D9k92tVFFY/5LNXBfGmc8Io5
X-Google-Smtp-Source: AOwi7QADZqlRVIbJvBu/uT8B+dXbwkpotXxsqHtnZwgwwtrY1LkkqL+nlTjwogKYDpLvNx4k2HPcdw==
X-Received: by 10.223.172.129 with SMTP id o1mr1847414wrc.135.1507292005699;
	Fri, 06 Oct 2017 05:13:25 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:56 +0100
Message-Id: <20171006121259.5817-15-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 14/17] kernel-uboot: support compressed kernel on MIPS
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

MIPS generates vmlinuz.bin when compression in the kernel build is
enabled, including any necessary objcopy so we can leverage that
and skip our manual invocation of objcopy here. We just have to
put the file into the right place for the rest of the build to
find it.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 00bc7682473c2558d72ba42c182f8e3bd445f8af)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-uboot.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 868e97d7a7..87f02654fa 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,13 +3,19 @@ uboot_prep_kimage() {
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
+	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
+		rm -f linux.bin
+		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
+		vmlinux_path=""
+		linux_suffix=""
+		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
 		linux_suffix=".gz"
 		linux_comp="gzip"
 	fi
 
-	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
 
 	if [ "${linux_comp}" != "none" ] ; then
 		gzip -9 linux.bin
-- 
2.14.2


