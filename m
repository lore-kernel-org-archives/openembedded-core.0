Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C421673958
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:31:58 +0000 (UTC)
Received: by iecrd18 with SMTP id rd18so15058790iec.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGvTKoUyoeHmdWXL3UahbfIMNWd8+DDDIkhmmijnvOE=;
	b=X/5Htawvr/fHZ0RxL14akhN05TUJzPlILAUMMcaFKe8oieEY9EWpXyMwt0OcvonWkz
	5Yu2zDrlTm+by95IfJb5oiztYbjMsCxwTg9UJIgtBT9SNuGsPPr94N1EEEUHA3ezkp59
	rz7kMOSQvr/5eahiE9J/ceErlWCVximR9xIqAd2rnrRbbE/5U4m6/inFct5o3pIRaBml
	UGlrWft3zyJiVFuuHFTti2KBj/W3eEMRoPwUPsl4q+bquGmGaI3o7PegE7pYM0eAfFcZ
	jnmlf2c6yfoDR890EgMnb88CuTPAW/gew9vQq8h0OuiAqj71FdH+vwqgr36vbvaBsimI
	2low==
X-Gm-Message-State: ALoCoQlSaygEIpmLPndTGVNR6pHf6rzD4CM1RLcFphrjdVGTS1qe5WiGokEHb6gdbjYYyaXxpOq/
X-Received: by 10.43.16.196 with SMTP id pz4mr29067850icb.69.1425925920086;
	Mon, 09 Mar 2015 11:32:00 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.31.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:31:59 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:14 +0530
Message-Id: <1425925876-9663-4-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core v1 PATCH 3/5] bootimg: Skip iso image build for aarch64
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
X-List-Received-Date: Mon, 09 Mar 2015 18:31:59 -0000

To generate bootable ISO image the x86 architecture uses syslinux package (syslinux/isolinux.bin).
We have already skip the syslinux package for aarch64.  Hence skip the iso image build for aarch64.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/bootimg.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index ed7b32f..d8c2a59 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -265,7 +265,11 @@ python do_bootimg() {
     if d.getVar("EFI", True) == "1":
         bb.build.exec_func('build_efi_cfg', d)
     bb.build.exec_func('build_hddimg', d)
-    bb.build.exec_func('build_iso', d)
+
+    if d.getVar('TARGET_ARCH', True) == "aarch64":
+            return
+    else:
+            bb.build.exec_func('build_iso', d)
 }
 
 IMAGE_TYPEDEP_iso = "ext3"
-- 
1.7.9.5


