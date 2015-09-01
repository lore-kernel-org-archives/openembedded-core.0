Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DBA2D77010
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:23:15 +0000 (UTC)
Received: by wibz8 with SMTP id z8so46776207wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rjvG8XezJven1ArSo/T6Wbl8Fem8p583mq0rm61/hyY=;
	b=oAisNYaRiAA85TQ72Pt7ajK6BFzI80e84/7jn0B9NND4M77ZpqK7Mp7RgG0oiNAUn8
	ZLrdfR6yEt2uXRaQLhf/iI/vjtbTo3YR7rPp/0DFBfgekvJScrYxVV6TgzSV+LCdC/A7
	0A1gJarRujqzDuWgGlfrWQhHoQkcK5d2bijgw+twGW1mWJvDhwE9STdJLPuX13TONiuk
	dw9aJtuHYNQuIuTCSQun4Uux2sTdViowiqFHQUZdH87nDijQdcdt2wxGgsZ2RJ0oOhuS
	/NjpeSljGYS5YWA370okcJQmfbKeDsV+cY9LQjGWWNgHGdKvIXCVgrEW1HBI4/rPZRTj
	HYbA==
X-Received: by 10.180.205.194 with SMTP id li2mr379242wic.59.1441146194698;
	Tue, 01 Sep 2015 15:23:14 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id c3sm29264439wja.3.2015.09.01.15.23.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 15:23:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 15:23:04 -0700
Message-Id: <77832718908d3648caee6472d3a3661f1d59a701.1441145177.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <a3ec49e286110440a69f0cd3b7fd5dee7ba4ae07.1441145177.git.chris_larson@mentor.com>
References: <a3ec49e286110440a69f0cd3b7fd5dee7ba4ae07.1441145177.git.chris_larson@mentor.com>
In-Reply-To: <cover.1441145177.git.chris_larson@mentor.com>
References: <cover.1441145177.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/3] image.bbclass: add rootfs_check_host_user_contaminated
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
X-List-Received-Date: Tue, 01 Sep 2015 22:23:16 -0000

From: Christopher Larson <chris_larson@mentor.com>

This function is intended to be used in ROOTFS_POSTPROCESS_COMMAND, and checks
for any paths outside of /home which are owned by the user running bitbake.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4e66535..fc7d64d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -460,6 +460,20 @@ rootfs_trim_schemas () {
 	done
 }
 
+rootfs_check_host_user_contaminated () {
+	contaminated="${WORKDIR}/host-user-contaminated.txt"
+	HOST_USER_UID="$(PSEUDO_UNLOAD=1 id -u)"
+	HOST_USER_GID="$(PSEUDO_UNLOAD=1 id -g)"
+
+	find "${IMAGE_ROOTFS}" -wholename "${IMAGE_ROOTFS}/home" -prune \
+	    -user "$HOST_USER_UID" -o -group "$HOST_USER_GID" >"$contaminated"
+
+	if [ -s "$contaminated" ]; then
+		echo "WARNING: Paths in the rootfs are owned by the same user or group as the user running bitbake. See the logfile for the specific paths."
+		cat "$contaminated" | sed "s,^,  ,"
+	fi
+}
+
 # Make any absolute links in a sysroot relative
 rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
-- 
2.2.1


