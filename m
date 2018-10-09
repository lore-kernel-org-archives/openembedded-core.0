Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BADD8746D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 18:35:13 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e4-v6so2943035wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=N/lMCszblNBEM4u+YL5odRD3jdOsQWyL1McKrOhMiBk=;
	b=UKuxeEOLaYRWQAqOq50a8gU+i6XHG9E4GO6u86XaBsOIdhtPKBgjVKNfeLdCBixrH1
	AMNs7Yidx/AfGc6rOlrd4pQA8cflETKy1TFNP3nN1nZXicvbJdoT7yvTiOUboIvCwP1L
	CQwnRla1vuUnRFaQn7Htc5xklT6hVdcTfxDgiiGTxfuszLnJJZiT3kuw64c2kfL4Erje
	jOf/QJ2BqDrmOphKlUT6+UQdxD0b/g6dvwQ6mG4TigPNBQbCtzYX7e2VUirSEGoEahel
	6gAGAuuJPdDvVLRZ75d6bJ4IVNuu/UYo7+BZLvNyuJWu/cFMMectnRewrIDIKHBNP/S0
	N6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=N/lMCszblNBEM4u+YL5odRD3jdOsQWyL1McKrOhMiBk=;
	b=tUmZaB0yc4JHsRro+lX3vcl/7LUpELktc9GoxWJPqbW8pRZIPEjFe0JYS3tQJAKllW
	K5v3gOqRAHet0voN4R5MGf5z779Ufj70xh/D5HWjO4yEHPuN4ey7JFCnR1sulPYwRqgq
	LrZo5Z9PcrqidLbJAmf0djDWTWwGW3G2Z1nP1npNX9dA82tmg433UWzC/42L6xjc78EI
	JZRq4v68zamukz47w2ES20L9pDyE3qWHtGQPGLjt9JGReUP9iIAk5fLtazYLdB4EHZvN
	/LvSf57zUyqABOmUMulUIwGl1dKkdrS7RbdLqvG91miMXOjyUelfMCYgt2aO8lhOV0DK
	DFzg==
X-Gm-Message-State: ABuFfoi28Txa5/muozoSlCAbVgPE0FxF5YUlARJMkhaS9Gcc1qT/KuC7
	F2HNyNvQQfN2ACerJV5N5BlLHh2N
X-Google-Smtp-Source: ACcGV62+4Xjnlq42DMUbruyZyGoWIBEEqO25OZYM6vo36VvU5MEdnQiv1wBxJ1/Y7WZkRNfDfRqb+A==
X-Received: by 2002:adf:fd4a:: with SMTP id
	h10-v6mr21615116wrs.280.1539110114251; 
	Tue, 09 Oct 2018 11:35:14 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	20-v6sm19382412wml.10.2018.10.09.11.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 11:35:13 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 20:34:56 +0200
Message-Id: <20181009183456.17540-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>,
	=?UTF-8?q?Sven=20H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>
Subject: [PATCH] populate_sdk_ext.bbclass: avoid populating tools twice
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
X-List-Received-Date: Tue, 09 Oct 2018 18:35:14 -0000

When running `bitbake -c populate_sdk_ext ...` for an image
recipe inheriting populate_sdk_qt5, `nativesdk-qemu-helper` is
deployed via `nativesdk-packagegroup-sdk-host`, which already
contains some of the tools (by name: "oe-find-native-sysroot
runqemu*").

To avoid error like:
    Configuring nativesdk-packagegroup-qt5-toolchain-host.

    NOTE: Running intercept scripts:
    NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
    NOTE: + [ True = False ]
    + qemu-x86_64 -r 3.2.0 -E LD_LIBRARY_PATH=/home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image/opt/mops/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib:/home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image/opt/mops/2.5+snapshot/sysroots/x86_64-pokysdk-linux/lib -L /home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image /home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image/opt/mops/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/nativesdk-gio-querymodules /home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image/opt/mops/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/gio/modules/

    NOTE: Executing copy_buildsystem ...
    DEBUG: Executing python function copy_buildsystem
    NOTE: Generating sstate task list...
    NOTE: Generating sstate-cache...
    NOTE: Generating sstate-cache...
    DEBUG: Python function copy_buildsystem finished
    NOTE: Executing install_tools ...
    DEBUG: Executing shell function install_tools
    Traceback (most recent call last):
      File "/home/sno/gpw-community-bsp/sources/poky/scripts/lnr", line 21, in <module>
	os.symlink(target, linkname)
    FileExistsError: [Errno 17] File exists: '../../../../layers/poky/scripts/oe-find-native-sysroot' -> '/home/sno/gpw-community-bsp/mops-yocto-platform/tmp/work/fischer-poky-linux/updatable-app-image/1.0-r0/sdk-ext/image//opt/mops/2.5+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/oe-find-native-sysroot'
    WARNING: exit code 1 from a shell command.
    DEBUG: Python function do_populate_sdk_ext finished

only add those tools unpackaged to the deployment which are
still missing.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9c31d70f2a..e30c49296d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -531,7 +531,8 @@ install_tools() {
 	scripts="devtool recipetool oe-find-native-sysroot runqemu* wic"
 	for script in $scripts; do
 		for scriptfn in `find ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath} -maxdepth 1 -executable -name "$script"`; do
-			lnr ${scriptfn} ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/`basename $scriptfn`
+			targetscriptfn="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/$(basename $scriptfn)"
+			test -e ${targetscriptfn} || lnr ${scriptfn} ${targetscriptfn}
 		done
 	done
 	# We can't use the same method as above because files in the sysroot won't exist at this point
-- 
2.17.1


