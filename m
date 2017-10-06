Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF4367826A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:23 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y44so6121190wry.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tZ5UqzDKcoYeh9cCHJWvK5c3tnzi4VL7y5XUcNX2O/4=;
	b=lUFyfcytQYR9XsbteJ4BXU2VXGpjLtYZnkffu/nRdGX9T2rZ07u+2pEM0eMfnAo46E
	jJ6DDeS/PeGUwnl+uH4aV5rpWkEmI6ZZwynabBm4/6mUL+sAcFHWN5SR3zMQVsM3uknq
	DJjf5hGLmYkYEumIqh7D0uAwKHY7K+L8RqCYc1TMXosU6M4dLU5l2hbeJCC17mur2c7P
	huXpZOVYlyN2qhcJwaFSFhwcJi7hep5Wcyt1uiiMVqagcaTjEUE65xB44e+grGFKlu58
	ouK036jfIRRINpBny6gYd33XSIXu7lzBuLncnyrZfJ1wc3NLzzmIWl3ctDHVJMFVLnbC
	e7kw==
X-Gm-Message-State: AMCzsaXW0AqhU2k0pDW9I1GzUauKzK21W6sZi6KriwyULPqhZe+vYanY
	VJS9BfVOKUvfU7cKXVhjXS8KPMHd
X-Google-Smtp-Source: AOwi7QCD2HsaLtPmRvV6HbAU3Qdz42nw/lDFzifpkljEzVOh69WldNWe1/oE6ALPzJe39vi9d1ygMg==
X-Received: by 10.223.133.147 with SMTP id 19mr1804385wrt.184.1507292004468;
	Fri, 06 Oct 2017 05:13:24 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:23 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:55 +0100
Message-Id: <20171006121259.5817-14-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 13/17] kernel-uimage: optimise UBOOT_ENTRYSYMBOL support
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This is the remaining local change to a fix similar to
commit e0b4f018d1c2 ("kernel-uimage.bbclass: Fix up
generation of uImage from vmlinux"):

Make awk exit on match to save a few CPU cycles so as
to make this similar to kernel-fitimage.bbclass

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 614e8be7a89a2f2113fa40b11e7a05b9e8155f6a)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-uimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 7c026abf0b..1d8656e76e 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -27,7 +27,7 @@ do_uboot_mkimage() {
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
 	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
-- 
2.14.2


