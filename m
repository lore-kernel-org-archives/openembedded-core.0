Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 947B978265
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i124so7195002wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kTQZ9TanDpfQlTIe40oHdfm8dWsgM4thDS9dCKvEJyI=;
	b=By3eo/inCSbmgFoHlaThPHDv1zQMmydSVO9fjeJ6YXwc9p4rgcV/xr8MY1a85etSNv
	XyK3pdq0z9ee8UDcRXiv1vyxaFjVm97kqnBsYnrVajI9VxSw1Muf+XxSP2mptBRE2oRf
	RWgHDLZtem7c3TRe2TlzIp+BgNAW7scs3WXGeGa3ATNy2bmHcV0a5ZYyk0VAFAQHTPEQ
	t+p3/800uyJ4uVL/uJD5G7qMaRbyjLB+UxR0CvaBrb1K7QzlJUsTK2k5/Bpd30NqTGJE
	FCVFHw1pufkxjN4EqGYa3dTEDpMsCxcLroH4Qxe3x/m6DsdzkB92Ner3bGBhR73omw5w
	VT8w==
X-Gm-Message-State: AMCzsaUiJsdDvFrpmdpGtMWfyC2towlgw9gx0FFS0c7r7nmq2i+M5rb8
	tF1yB69rYTnsAi81KKtXwNe7apEV
X-Google-Smtp-Source: AOwi7QDkRTEHg4mbfX+5zQU9bI7G/acOSev/kzcS8aZHjsYY9uFYVAkv98DH7dwu+yA/ovzwrbMStw==
X-Received: by 10.28.170.208 with SMTP id t199mr1720992wme.4.1507292003406;
	Fri, 06 Oct 2017 05:13:23 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:22 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:54 +0100
Message-Id: <20171006121259.5817-13-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 12/17] kernel-fitimage: unbreak UBOOT_ENTRYSYMBOL support
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:23 -0000
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
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 9d2ec9c046c4a9c6a842d28133d40639f5a65297)
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
2.14.2


