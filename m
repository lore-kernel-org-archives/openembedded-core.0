Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E2D697197E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:41:58 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g50so1163317wra.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HGOfIwKS9v48fLFKX4br+yYyall0NBM1zN5K1EJ66Ws=;
	b=kab+1FVhjXuZX1pWeHo8SBPH/hgEILv/cN9oP+EXJTvnRh/3pxqiKtseltop+7flOr
	vwtApxy9TJIFwg9GwJPJLKAZsFAoRmcZprsmk0IgwP9Fx+9QZzpqqiWXYEd7OkJyKg8Q
	/2vpnXqAYZewxwXO3CIItWaXEsd3TuesJiluhIWtuGxVjfwj1izmzvoylF+yp2aW0CVD
	3XEXuGKWlpFubV44UBfVEX08Dl6jF7ESUGvO2U5sY67AF54LCjwaqZmELOvoIpVQAirm
	Jd2CxmPJmmjQT7/OJD1UnYfkqeEsESZAO/0etbqb8XKuXqYykK86FPU3ijar/+9sJdJg
	O2fQ==
X-Gm-Message-State: AHPjjUhl6GLv1+E5jYwstAw38x5Km4a3qoBM//v4xosq04Eo7DL/xJBB
	CJ1B28P2DtJ9iNHXPm4sAxOKsAcE
X-Google-Smtp-Source: AOwi7QAw3NxrUcfdLJ96LxEP5AAArTIt7BX+hQJ+yex7n3ggw8TNFYDxyNNBAVnsSy01pAXtliyFAQ==
X-Received: by 10.223.168.105 with SMTP id l96mr4163910wrc.248.1505900519408; 
	Wed, 20 Sep 2017 02:41:59 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k52sm1467558wrf.62.2017.09.20.02.41.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 02:41:58 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:41:53 +0100
Message-Id: <20170920094157.11340-1-git@andred.net>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 1/5] kernel-fitimage: sanitize dtb section name (unbreak MIPS)
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
X-List-Received-Date: Wed, 20 Sep 2017 09:41:59 -0000
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
2.14.1


