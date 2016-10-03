Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA74060191
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:16:34 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id b201so84299068wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=AtuN4qv4ZS0WWRmS1T/mgYknrPqzZe4C+tP/jxClpGU=;
	b=qiQ4H2T/JYF88XG67dMUYjiaICVR8gG1C2T4olH5Rn63BvviIuSWRm5axkr+PZtAyL
	Bvhf+6Ni4q9SQ5m/eBCHbx26orw7aD04e91BmqYIIsapc3ndTcWZaNmylmAJqFpIhnMh
	vG0K5gUoaymamQtnIxdoikoTp+TN3Mj9OnLIa+R5Y8vT/i1lq1N8yvfdmfjIJ8WsOolk
	UWZhd0Rhp5a/rywtmXNjoH/UwGA/YwQQp96tUooeLx0P1EO4vl7Jzz4fU+g9ncSeXUAP
	/OfE+zUSkxYqO9tb9QnlipMDQcgc3w0MIgYL+UvOEcg7ooQYjQGxBRf91U+IHqh7YVrB
	KwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AtuN4qv4ZS0WWRmS1T/mgYknrPqzZe4C+tP/jxClpGU=;
	b=arXulxudbIWXFMnBpWNTTZhRz0CkzbM2covEfPThXsbgL5stdHa0ORrWUCDnt1F4Fm
	D+ppkk0NqITevAMT2JS59arTl/M4GSvZ2FFj/YYCgyFYNo+8pHfM5vTZtipiMk99Ax8c
	Ay/aF0vFcGlwtqpZzU7F2upXIO960q/w7IMhvCifgAY0Gm5NhW76TK2R7sR6gbetJusW
	KxxZdGOZMD6omY1Zu9h5JnPeNOolJ1OwNquM62wi+26Cins2eV2ptA3T/HG3V51zNyi2
	LvajucEQUWanGP+CZ6L9Zx6geJ4sZ5tJHWH3uToR+i6iyM5n8e0sWaADi2NFnNnixKXe
	/ydg==
X-Gm-Message-State: AA6/9RlF20wqSpmV6sRGXDNEhtn0tO6fa+/dRQLKLolPZ29qJmdQS7JVsM5fredJtlwikdXu
X-Received: by 10.194.231.99 with SMTP id tf3mr17003680wjc.61.1475504195268;
	Mon, 03 Oct 2016 07:16:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yt4sm34606312wjc.48.2016.10.03.07.16.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 07:16:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 15:16:29 +0100
Message-Id: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/4] classes/cross: set lt_cv_sys_lib_dlsearch_path_spec
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
X-List-Received-Date: Mon, 03 Oct 2016 14:16:35 -0000

This variable is used by libtool to know what paths are on the default loader
search path.  As we have modified loader paths, cross.bbclass can tell libtool
that both the sysroot libdir and the host library paths are searched, so no
RPATHs for those will be generated.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cross.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 8d1e779..01b0933 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -17,6 +17,8 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_LD_ARCH = "${BUILD_LD_ARCH}"
 HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
+export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir} /lib /lib64 /usr/lib /usr/lib64"
+
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 PACKAGE_ARCH = "${BUILD_ARCH}"
-- 
2.8.1


