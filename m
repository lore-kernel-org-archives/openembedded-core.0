Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 138A47CC05
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:50:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z84so4309179wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HaCzeZw3c1D+oQsUxk5YoVmx/2qELeifbtQqgzFpzp4=;
	b=KDN5Zh9GRyz2OKOYOmOpxd65lYEDbd801wq4hGH5Q6KzTcrvLl/FMbgR3hEOs140mj
	FAibfUzL/dUBCMNhy2tDrXL12vkVFSDgB4t8xtB8qjUjHPRLKBviM0/72c9qVKfJ5yVl
	fXziHxu4MoSDjll1EVDUMMDGrwWwqSw3mzbQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HaCzeZw3c1D+oQsUxk5YoVmx/2qELeifbtQqgzFpzp4=;
	b=apVLMDcbAFcC3Aum79+bVy01PvwFQWLIeTx804q/LfQBPiRbrHSi10tXKuhT4bt8ib
	wJficgXeoR7Pq0rOg3s1VogIfD7ekICZX2gCD2CYsPoJcl4Wug1NNxfbyaGvKVhhliq6
	xjLfApuDLK3WWgceL2gISMjlPdnjoRLHAsDvCt4PFmW9poxWsJidxxkzCypwxU1L6eED
	CR1xSUrC/3o2RVwsh6f2Gm48gvUw0dcO/wzHw9Mmhn4eGYT9q3NUX1jr4Y8qkxoG/ZGD
	j1NmNeCo/QpbBQjpC/NBJX4e9rAUjo7cki35vokojBzcvfPnxA+IIoJG2PlIagkVpFfx
	6WGg==
X-Gm-Message-State: AHQUAuaZoI8ON1pvgRGZAdjTO27bjj9dCi4+zfPPW3klg3haEn0WB8Cb
	HrHQJFbtGOgeNdDJo8vxiU5Pa/0Bizw=
X-Google-Smtp-Source: AHgI3IZFZiuR+v4PPrMNnKh92uQLXktAeMpdCfB0xHDIfmTT/TpbOZynBEJIqka2n+lzk2Jy0OxniQ==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr5152553wme.9.1550929831203; 
	Sat, 23 Feb 2019 05:50:31 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a62sm3662658wmf.47.2019.02.23.05.50.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 05:50:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 13:50:29 +0000
Message-Id: <20190223135029.15553-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] kernel: Ensure an initramdfs is added if configured
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
X-List-Received-Date: Sat, 23 Feb 2019 13:50:31 -0000
Content-Transfer-Encoding: 8bit

If ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio does not exist,
nor any of the compressed variants, nothing is copied to kernel build's
./usr directory.

The code does not fail, but silently proceeds without a bundled initramfs.

Change to fail and tell the user something is wrong.

[YOCTO #12909]

(Patch by Leon Woestenberg)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c0889bd3ee4..a5b1df1b0dc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -224,9 +224,11 @@ copy_initramfs() {
 				break
 				;;
 			esac
+			break
 		fi
 	done
-	echo "Finished copy of initramfs into ./usr"
+	# Verify that the above loop found a initramfs, fail otherwise
+	[ -f ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio ] && echo "Finished copy of initramfs into ./usr" || die "Could not find any ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio{.gz|.lz4|.lzo|.lzma|.xz) for bundling; INITRAMFS_IMAGE_NAME might be wrong."
 }
 
 do_bundle_initramfs () {
-- 
2.20.1


