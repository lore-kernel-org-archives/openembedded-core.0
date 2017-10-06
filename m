Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 78DFA7823F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z1so11201935wre.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H1v/g6J1s5ApxRe6eOvPFSreTP+JCvaJGzSSyESmpWs=;
	b=t5WQtnBLlXPMfU7EXvFackIwp8wq8x4DyGpTaquDMoehXeP/IZ+NH1S7zzhGSqoB9o
	iIyDzLWsd1HBV6GoWqwXn8YXTptPHjp11pu033tGzhHOCPVnf4T4KEEXfXSi79rXNm3b
	ULErKU4pIWfvVIE9hYAb1y4L7LN+B9a7TTrBz/l82pvsOy7h8QDO2br9y/fSmCySxhh4
	baZmeric92lVxMUm2ZDq/g/0wYKx50UZI/Cu+vG0lqTHobbFFpBdpYrC4GM090xMZTDu
	9Ts6flvatwxO2B/+PDm/IwchEBuEfWiApPBW0QGeEx8VjuZQlbZCocHiOFuMPPwx74Qj
	7zPA==
X-Gm-Message-State: AMCzsaWipo+glSwk9ytErAfn2qTJ0dmWDZ4ILanCz+0hklYHTyv3MHH8
	2h1KpFFcj3ry7E0oSfpZf9JFMVkS
X-Google-Smtp-Source: AOwi7QBr3c/0pPnz6y1Ly1gtpJ2xDAB7qsXNYmu+zpU63Z3QTzi0esMv/LMAcJxSKIFD1ilOaoNUFA==
X-Received: by 10.223.146.37 with SMTP id 34mr1822445wrj.79.1507292002245;
	Fri, 06 Oct 2017 05:13:22 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:21 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:53 +0100
Message-Id: <20171006121259.5817-12-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 11/17] kernel-fitimage: sanitize dtb section name (unbreak MIPS)
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

We can't build fitImages for MIPS any more:
| Error: fit-image.its:21.27-28 syntax error
| FATAL ERROR: Unable to parse input tree
| uboot-mkimage: Can't read arch/mips/boot/fitImage.tmp: Invalid argument

Since commit cd2ed7f80b555add07795cc0cbaee866e6c193a3
("kernel-fitimage: dtb sections named by their filenames
and one config section for each dtb"), commit
1ec405ef5df82884c8997878bbe6c66d924b5127 in yocto, dtb
sections are named by the DTB filename, but the filename
can legally be in a subdirectory below
arch/$arch/boot/dts/, and on MIPS all DTBs are actually
in a subdirectory.

If so, mkimage fails with the above error message.

Unbreak this by replacing the offending character
(directory separator /)

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 335fc50cf54e47db4e3d5c35a9846484faf0270f)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47316..6f1b7667bc 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -351,6 +351,7 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
 
+			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
 			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
 		done
-- 
2.14.2


