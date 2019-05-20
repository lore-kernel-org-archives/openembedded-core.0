Return-Path: <mike@foundries.io>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAE6C7E064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:43:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a3so7130065pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i8A6QhjZP4vgFd88BTuzKP+YUpaue5UNDgHSg3ykJ8Q=;
	b=wTCBAXe0NTFgDys5YWP8+XAp1b6K+6fT397fNNQ21vRL5nLleA+kmB+nKDPpYNM03B
	Xaqm2a96abaqs07LJjUVPRcgWuOqJhKbjJBZM55qR72ScV8n/vAD4TNAsvxUSvfZP8oM
	w3KsR07cgEwSyPzpfbJcgUSFmSe2Jh7bKyJdlYNMn/iUS1K5o9D+O6GIzZCoMeQea+Dk
	5+4G6Za5FdJB4ifxcto3uVsnhAIe3/DT7jF41Fq7FGFuq7SeLtbef36D7EBVsKNRgQY8
	eHj4E2fv2droML28UP94IhZy0EXfsxVxqbxR8G3U2mvhvk44Dg2U/5pQr9OApFHODBpR
	GVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=i8A6QhjZP4vgFd88BTuzKP+YUpaue5UNDgHSg3ykJ8Q=;
	b=m293i3/ZcAEPc0AxLp39qEoimtG8jazjan5UtdU3g36UCviLSb5IXFuZRx3KFJFmIK
	rQQbY2b5M13hvf47lDFP2wfL/l4SuydH2iFDLbPakbt+S+tHRokO6irRvJFky7qY9DKM
	REnOahXoGN9j8XPcX4QSZ3K5WorceRpGxcJOdcYDpMHdxebVpWXsATauB6zWz6r11maH
	lIjBplz17C1pmiRMm2vA3vE/VaH4CLxvoZtn9IcgU+wL+hNwZ/W0tJT5Is03uL+VaD/h
	RD+Rsot7eaLJZgaCgB52CSztI2+Mf5zkJjBQXREGbBiOa9eO2+f70aQnx2t8xUxo3v7N
	/wHw==
X-Gm-Message-State: APjAAAUlWG10Iv/OkRpayjp9gw4e8ijBSuCx1uzP74+IQhtsezywRwb5
	JQpGFIztvjxNjx3uLT5znEC2NI1eUaE=
X-Google-Smtp-Source: APXvYqywsibFwQt7QbCKl7mUpwgL2+lDgche3aTCg4pMNORKr2cNIirxx0UIg1/KWeDeaiQjjk8jmw==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr54693698pfh.14.1558374188522; 
	Mon, 20 May 2019 10:43:08 -0700 (PDT)
Received: from scottml-arch.lan (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.googlemail.com with ESMTPSA id
	i12sm22470461pfd.33.2019.05.20.10.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:43:08 -0700 (PDT)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 10:42:59 -0700
Message-Id: <20190520174259.31942-1-mike@foundries.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] kernel-fitimage: generate a default conf@ entry for non-dtb images
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
X-List-Received-Date: Mon, 20 May 2019 17:43:08 -0000
Content-Transfer-Encoding: 8bit

Step 5 of fitimage_assemble() creates a series of configurations
for each kernel DTB referenced in the fitimage.  These
configurations are usually used as bootm parameters to alias items
like the kernel and ramdisk, etc.  The conf@ entries are also used
when generating signature data for verified boot.

Boards without kernel DTBs in the fitimage skip this step and no
conf@ entries are generated.  This presents a problem if the u-boot
scripts still wish to use the conf@ references for the kernel and
ramdisk.

Examples of this would be using QEMU ARM64 or RISC-V based .WIC
images with a vfat boot partition and ext4 rootfs.  The fitImage
is stored in the boot partition similar to other actual HW.
However, without the conf@ entry the boot scripts still need to
use kernel@1 and ramdisk@1 hard-coded references.

Also, a u-boot patch is currently being tested which adds signing
/ verified boot functionality for HW which doesn't use appended
u-boot DTBs.  IE: QEMU uses prior stage hand-off and Raspberry
Pi 3 uses an embedded DTB, etc.  By having the conf@ entry in the
fitImage, the entire OE signing process "just works" for testing
this new setup.

Signed-off-by: Michael Scott <mike@foundries.io>
---
 meta/classes/kernel-fitimage.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2820ff9689..8ade9eb410 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -458,6 +458,13 @@ fitimage_assemble() {
 			fi
 			i=`expr ${i} + 1`
 		done
+	else
+		# insert 1 default configuration w/o DTBs
+		if [ "x${ramdiskcount}" = "x1" ] ; then
+				fitimage_emit_section_config ${1} "${kernelcount}" "" "${ramdiskcount}" "${setupcount}" ""
+		else
+				fitimage_emit_section_config ${1} "${kernelcount}" "" "" "${setupcount}" ""
+		fi
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
-- 
2.21.0


