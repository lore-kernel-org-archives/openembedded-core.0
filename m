Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D3D5A65CD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 06:46:07 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so486284wiw.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 23:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7FzdWe0TwhjesgTIFTjM0kYT3Ifsh7N2MyxFHv96ixw=;
	b=Po2M8JbsyfZ7VtHaJROBDXFWSHLxAJ8/czFigtAgCsjDc+0xKlNSFbS4hNvOI/nwwH
	BOEMwYnZuXJMdZgVipvcewKr0IgDy1E/bK3sPMXehhQAy4iH650kmlOF922s6Kf93mzv
	d5ESWzuObcXXMCiDlZAzExiWu6Nh8sZ6awtREld8PtPz365BM0w5uV4EX5ZgKRXPrUgS
	j7xN5mBodKxuJIX6/aH2GeVc6o5warpaQrL3B8M3oGQi4bAcyH4I7eLznMtS8TkfeAGL
	9MtVocAsCuu0z/RqEYAVrwvimwh5PY6wsjv0MO1OkXljxJ7wKsw7zK127kTSyGiPlut9
	kADA==
X-Gm-Message-State: ALoCoQn5+yNJ4rWi0ET2jAXsx/03Cp/dS1k+IJl0TvubCMTpo4pUlijT07XBRAfHW6WUAWYdJPhl
X-Received: by 10.180.14.5 with SMTP id l5mr2012448wic.50.1407480368410;
	Thu, 07 Aug 2014 23:46:08 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	fb12sm15111096wjc.43.2014.08.07.23.46.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 23:46:07 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 08:46:03 +0200
Message-Id: <1407480363-29145-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] kexec-tools: reinstate 'kexec-tools' package
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
X-List-Received-Date: Fri, 08 Aug 2014 06:46:08 -0000

The vmcore commit emptied out ${PN} leading to things like:

	Collected errors:
	 * opkg_install_cmd: Cannot install package kexec-tools.

Let's do the right thing and make ${PN} an empty meta-package that drags in all tools like people expect it to do.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
index 1bb7e9f..f0ece0d 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "dde5c38be39882c6c91f0129647349c4e1943b077d3020af1970b481ee
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
+
 FILES_kexec = "${sbindir}/kexec"
 FILES_kdump = "${sbindir}/kdump"
 FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
-- 
1.9.3


