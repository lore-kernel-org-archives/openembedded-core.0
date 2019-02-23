Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 90E0B7C679
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:56:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f14so5295288wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g7idj4r0qcCSkA7UqGuO3l08WMHKiHvRo7wiqVTAdEk=;
	b=T38z8aiNcAqyzSVacIUZYFHDGfULmdd5CtKuxAg0amqbgDMe5xua+vzB61Pd1qVWvj
	qjpWejI9Z4Ab5gSiNhB0Omz+o6hmq9fI8peC91n6Pm2fheckESm1D3cgzlm5vqzPa6vD
	3LituwX3+VHantVat5w0usrlaJTGL7+K5+a9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g7idj4r0qcCSkA7UqGuO3l08WMHKiHvRo7wiqVTAdEk=;
	b=KwgD2ouBFug12VwWYkSoxCiqPQdvJUX6pCHvJYzzv3GVg48C0X4Qon6KMI12NamZrc
	buE3x7P2IoOqfWmwveled3pTpFacLBiaC6RE4m2L4NL+/1uXTAD/T3nwpzU2Bi9MfcKp
	Oudr7666x/OBP7rTKj7HBU3ytflq49jauOv0WpR65X6U1xYrExX0KxoqxXR6W3o7XVdK
	KacpcB4KvGMGk+B+tNHhCWo33NjgfPaqaibUqVD9Up50A7xLsyAHInljy0UhFY6AcqOn
	wICDaSCuG8xFvEWlBq/BLrWpHIGtawAVnKtRqobKq6kZPOz140fWQ7tXUs1Aw4xyOTsX
	JD1w==
X-Gm-Message-State: AHQUAubprkIybZitdhh9WfradeUM51HAqO4LUbJqBpTOu0bA9Lll/9KV
	mpPSYL88T4zgDpFo0rilW3VQ7vK/uq0=
X-Google-Smtp-Source: AHgI3IaZ2N1SPNXdnBKToJDqImYlXpZBWNkgjDmWCgMH+IAiAciWz8DbTNEg9VVZ/9z3VpLIodmK5Q==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr6514821wro.18.1550930169902; 
	Sat, 23 Feb 2019 05:56:09 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b3sm8942421wme.27.2019.02.23.05.56.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 05:56:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 13:56:08 +0000
Message-Id: <20190223135608.19253-1-richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 23 Feb 2019 13:56:09 -0000
Content-Transfer-Encoding: 8bit

If ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.cpio does not exist,
nor any of the compressed variants, nothing is copied to kernel build's
./usr directory.

The code does not fail, but silently proceeds without a bundled initramfs.

Change to fail and tell the user something is wrong.

Also, if an initramfs is found, contrary to the comments, it does not stop
at the first uncompressed/compressed cpio image found. Instead it keeps
processing all so the last is used. Fix this to behave as per the comments.

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


