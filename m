Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B05D780B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:41:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r136so1892183wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cubn7WwWekj2NB/gdn/aZ27c8GB8VXO0e5VqIjQQQy0=;
	b=SFxw9u8jcMj1+j7caZ1v/wjejmFQXoaby6VqYsBQPqGfZ3gF/RrLYeHwDLPDTXigAa
	4BccP95cE3aEnDRQcGg8lqHUQpx9AXGXongEFPbftRuii2v2cNkLEQvWd6twJWCdSHx8
	okKbIiMRlzehfPm4+0D4iA4QufUcuBtnjGcD47d4gNnPsa1HqdVCok+su26wATUVMKbR
	llXQ4owDNWOx/d9W01VosOwa8RmchTlj79jP4O0CxlAhyXAnemEeEYSAQRBMRihyZ1TD
	FSPWRujfGVq/2+R36CIbsbkdHMojgxUeX5WoK9d7ThIt8ys7oTU3glfhlR9PO+inpqql
	gjag==
X-Gm-Message-State: AHPjjUi3uKopzXD6yuG/ke1x0NCwfrkeG/2KyCQEhJMm6wJCjPh6zCWP
	0sRxzHasrotjEqHkDohqqt09RSQC
X-Google-Smtp-Source: AOwi7QBKrjoJJ2DTcDMdD7tw38nhzXp3N1SQF8NGqkv5/j5vRro9cA4EEQewGPLSP2Gn3ltf2iBtyQ==
X-Received: by 10.28.199.13 with SMTP id x13mr3134260wmf.124.1505900520457;
	Wed, 20 Sep 2017 02:42:00 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k52sm1467558wrf.62.2017.09.20.02.41.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 02:41:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:41:54 +0100
Message-Id: <20170920094157.11340-2-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920094157.11340-1-git@andred.net>
References: <20170920094157.11340-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/5] kernel-fitimage: unbreak UBOOT_ENTRYSYMBOL support
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
X-List-Received-Date: Wed, 20 Sep 2017 09:42:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

- vmlinux is located in ${B}, not ${S}.
- parsing of nm output got broken completely in commit
  b406a89935f148779569fa3770776e009dd51f13 ("kernel-fitimage: add
  initramfs support"), commit ec755d2524fcbd9dfded23a576f25c990d405a6c
  in yocto

While at it, make awk exit on match to save a few CPU cycles.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-fitimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 6f1b7667bc..5583b4472e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -97,8 +97,8 @@ fitimage_emit_section_kernel() {
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
+		ENTRYPOINT=`${HOST_PREFIX}nm vmlinux | \
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
 	cat << EOF >> ${1}
-- 
2.14.1


