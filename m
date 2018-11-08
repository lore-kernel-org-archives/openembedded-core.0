Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 205816C137
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 20:59:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w3-v6so9359551pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iFEX560iiUTsnFNAxET52PCHlzRFOEobiNh3IUJ61T4=;
	b=YIsG8FkrBhVnl5nlN5nv/puxGyZiIOePCNXdp/5StXryfUyfDxcdDA4aHxrLJIb1aL
	O5KgCnzlHmRm2huUET53ZMxigqn5UBXwdAzSNlsCzDwij45+4kDAtF7XfVGQJc0eoGqA
	juBcrSfqs7wK2JDtZTjYicm2Bmqiqi+iSX6aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iFEX560iiUTsnFNAxET52PCHlzRFOEobiNh3IUJ61T4=;
	b=h50MuiZlAjDfFLujBNscocpULvJy1x1hNv7LCLgatfOMRe3/YzRrrSO9t/GMU/Al6a
	v2v4e65iMAFKxvbtBcphZ8G1Wi+qGdpsmwnUQ9Mds9a+Ze0P9hT3326h8xQ10P1iDr2B
	nGTFnJGciVFouf+z0GRa8gD7xvl/KrqacZxPNGm2UF0/aWosa1YlXK19JFj80zZMphTo
	Tl2HfbOfPj0QBwi1nmf2FgPSTTOSiXHluz0NOY0eFZ8slbrYcH7Ej4bDteTFTikUksIj
	wxddKdMhlUpR/icaYop22KtBMAK47l9MjGpzeAmLyHbEwFc4c9W6lttIouAQz0816JCN
	ANQQ==
X-Gm-Message-State: AGRZ1gLLBU44tFxhnP+LlaSNQ+pVyneUiV/pyHCuqIe8A+noRpINWzcc
	LxgxnyY2oIICkw167bNV/idRq98/MPho5w==
X-Google-Smtp-Source: AJdET5fgfrrJ11xtQD4Ymdl7Asw02kiRJhJrjBL03pVi81VzwRp7xtpQv0kIvsIF4szvmcRUdATT4A==
X-Received: by 2002:a63:6cc:: with SMTP id 195mr5126206pgg.52.1541710746785;
	Thu, 08 Nov 2018 12:59:06 -0800 (PST)
Received: from yct-lpt.pdx.yoctoproject.org (5751f4a1.skybroadband.com.
	[87.81.244.161]) by smtp.gmail.com with ESMTPSA id
	e12-v6sm4724605pff.5.2018.11.08.12.59.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Nov 2018 12:59:06 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 12:58:40 -0800
Message-Id: <20181108205840.24972-3-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181108205840.24972-1-mhalstead@linuxfoundation.org>
References: <20181108205840.24972-1-mhalstead@linuxfoundation.org>
Cc: rpurdie@linuxfoundation.org
Subject: [PATCH 3/3] scripts/autobuilder-worker-prereq-tests: Shore up qemu testing
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
X-List-Received-Date: Thu, 08 Nov 2018 20:59:06 -0000

Check that yocto-autobuilder-helper has been cloned to the correct location.
Check that vnc is running using the same script the autobuilder does.
Set the DISPLAY enviroment variable to :1 the same way we do when building
normally.
Make the VM's serial console available so we can log in and power off allowing
the tests to continue.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index bb46c69135..358dd2beee 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -15,6 +15,12 @@
 # test buildistory git repo works?
 #
 
+if [ ! -x $HOME/yocto-autobuilder-helper/scripts/checkvnc ]; then
+    echo "$HOME/yocto-autobuilder-helper should be created."
+    exit 1
+fi
+$HOME/yocto-autobuilder-helper/scripts/checkvnc
+
 . ./oe-init-build-env > /dev/null
 if [ "$?" != "0" ]; then
     exit 1
@@ -53,12 +59,12 @@ if [ ! -e bzImage-qemux86-64.bin ]; then
 fi
 popd
 bitbake qemu-helper-native
-runqemu qemux86-64
+DISPLAY=:1 runqemu serialstdio qemux86-64
 if [ "$?" != "0" ]; then
     echo "Unable to use runqemu"
     exit 1
 fi
-runqemu qemux86-64 kvm
+DISPLAY=:1 runqemu serialstdio qemux86-64 kvm
 if [ "$?" != "0" ]; then
     echo "Unable to use runqemu with kvm"
     exit 1
-- 
2.17.2


