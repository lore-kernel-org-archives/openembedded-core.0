Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC3460B2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 21:55:32 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id h8so21652pgs.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QPK2wd+0Wi7JJJa71eiY3R6cAHjC2IEKYmaFKFgH55w=;
	b=UIScAWD78L+TYGhs4U8uK8P4uaj65TfQa2BYhgU27uD0tC0+TjhDy6V8lUqAVuYgvc
	IW9VsE39F+w584TUs3g8/EZg8Gg8k1FnZ60+WQswvrrqXNrmQZRdwy8R3Zzi1zUp7l32
	bztvv+p6MtWeJVdTn7M/Ukl+fQBr0TBIMUwNd/PgmBxmNuesRon6izSTNPCBZx3GYJQk
	gMp4e8OS8CoKV9cUcrbevYgQScJ30b1Ei74Xi8GeV/+SeJY3hmOiIe/L8t0hrk7M0DhO
	G4Elpb9H5G/M80fS4lSe1OIkexStBKzyX4wrHlVoJpXcXl3XStv3cE1L1yJDN9LWzl+X
	CKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QPK2wd+0Wi7JJJa71eiY3R6cAHjC2IEKYmaFKFgH55w=;
	b=OZgI5HkfdRY9NSDPVXtNnRtVs02z9lhGJzrIURc8q5lCXWlySyxVdKCiTN+skMOGSE
	2M8AIRDsQb+sTu9KKS0+KQgVAtbM2nB4HBJeQA1fvVt4jheDbvjAmjYfZmQrS6IofbRK
	UgmFdVC34xXtzaKj2xoQIYCqRz8KS4rG5vnXH0diHI0hVNII+tMKAGTlfD7PtQEHojqj
	4C//iTE0u27vPyzeMS8TVazJYP5C48apqZCWfnjsL452a8g6p7KSXSeTRFmaq3/auavL
	BZWm1Pv5Cv+8LY5+9+L/05jjRf58p0+L0VNI9qr0k2Fqc3nwEUaYbCIGAeUNZMyfU4T9
	0xog==
X-Gm-Message-State: ANhLgQ3V3GnztcZJwLvnZqcodgmrPEhPJYM0cEVFH8uVfcH/3NCu2Gd3
	teDlaWWRIPDnBtSVVFOSif5sey2d
X-Google-Smtp-Source: ADFU+vu5J/c0ZAktGjxUdH/msYF+122o6Az7Oyy9lAyopc6XH3NXMXL7Aj+wf37a0O4qDPfNBBXUYg==
X-Received: by 2002:a62:a206:: with SMTP id m6mr24802131pff.254.1583877333423; 
	Tue, 10 Mar 2020 14:55:33 -0700 (PDT)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	v29sm48712867pgc.72.2020.03.10.14.55.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 14:55:32 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 14:55:13 -0700
Message-Id: <20200310215513.13900-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] image-prelink: remove assumption of sysconfdir presence
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
X-List-Received-Date: Tue, 10 Mar 2020 21:55:33 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

If sysconfdir is not present in the image filesystem then the temporary
creation of a prelink.conf will fail. Fix this by creating sysconfdir
temporarily if needed beforehand and then remove any directories that
were created afterwards.

fixes: OpenXT OXT-1751

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 meta/classes/image-prelink.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 04dd57c940..ebf6e6d7ee 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -17,6 +17,16 @@ prelink_image () {
 	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
 	echo "Size before prelinking $pre_prelink_size."
 
+	# The filesystem may not contain sysconfdir so establish what is present
+	# to enable cleanup after temporary creation of sysconfdir if needed
+	presentdir="${IMAGE_ROOTFS}${sysconfdir}"
+	while [ "${IMAGE_ROOTFS}" != "${presentdir}" ] ; do
+		[ ! -d "${presentdir}" ] || break
+		presentdir=`dirname "${presentdir}"`
+	done
+
+	mkdir -p "${IMAGE_ROOTFS}${sysconfdir}"
+
 	# We need a prelink conf on the filesystem, add one if it's missing
 	if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf ]; then
 		cp ${STAGING_ETCDIR_NATIVE}/prelink.conf \
@@ -59,6 +69,13 @@ prelink_image () {
 		rm $ldsoconf
 	fi
 
+	# Remove any directories temporarily created for sysconfdir
+	cleanupdir="${IMAGE_ROOTFS}${sysconfdir}"
+	while [ "${presentdir}" != "${cleanupdir}" ] ; do
+		rmdir "${cleanupdir}"
+		cleanupdir=`dirname ${cleanupdir}`
+	done
+
 	pre_prelink_size=`du -ks ${IMAGE_ROOTFS} | awk '{size = $1 ; print size }'`
 	echo "Size after prelinking $pre_prelink_size."
 }
-- 
2.17.1


