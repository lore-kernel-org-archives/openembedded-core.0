Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8125A6B7F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:40:49 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ez12so3292433wid.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Dg25InExkahEsJLuE1DkfBQt++cKG2jxlZ698W504Fw=;
	b=KziVo5UAdYdY7yPbdVoMn/RqYNLKQw1wRzWsM8OpOPJEgFs3RtgjDPionh8J5V5C+p
	vfNfnB+X5EliDsAFl1WCsvgwSHCMagfv2bfHwLCrgMWL8lkTiTJPjptMJxbxS/fFLP9t
	y429pExuWdoMMHuQ1ckFIC6e2QMLJWXuQp6mu2G9wfkQvqqAFMhwtTwX4DfwcF4ICahV
	qJZilISeNjBI80L7UOWiq1Evj6fOXLe6y0qQ/xQZFH+MKxjNa7khaPJ9ZuNBUEQHpS9w
	vWdKetvXh5Sg8ZnUysB2rmfqLlFlgE4R1AWdbSEX0DuATh3CqCKQfejspVQ1C/Kd6IRL
	ZkWQ==
X-Gm-Message-State: ALoCoQnm+G6YQUwJ9oH/Roc3Fb0MgL63oydQ8OPWEh4lDbyWXeClFQGy5phCYRq0RXroySXPdjLh
X-Received: by 10.180.75.115 with SMTP id b19mr4515375wiw.19.1385160048438;
	Fri, 22 Nov 2013 14:40:48 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bs15sm20181469wib.10.2013.11.22.14.40.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 14:40:47 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 23:39:43 +0100
Message-Id: <1385159983-29270-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, patches@linaro.org
Subject: [PATCH dylan & dora & master] image-mklibs: ensure sysroot is correctly set when calling gcc
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
X-List-Received-Date: Fri, 22 Nov 2013 22:40:49 -0000

[YOCTO #2519]

When getting gcc from sstate, it is possible to get a gcc with a bogus
sysroot configuration, as discussed in [1] or in [YOCTO #2519].

mklibs script will eventually call gcc, so we need to make sure that it
provides gcc with the right sysroot location.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2013-September/084159.html

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/image-mklibs.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 66b0f52..beef1b4 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -40,6 +40,7 @@ mklibs_optimize_image_doit() {
 		--ldlib ${dynamic_loader} \
 		--libdir ${baselib} \
 		--sysroot ${PKG_CONFIG_SYSROOT_DIR} \
+		--gcc-options "--sysroot=${PKG_CONFIG_SYSROOT_DIR}" \
 		--root ${IMAGE_ROOTFS} \
 		--target `echo ${TARGET_PREFIX} | sed 's/-$//' ` \
 		-d ${WORKDIR}/mklibs/dest \
-- 
1.8.4.2


