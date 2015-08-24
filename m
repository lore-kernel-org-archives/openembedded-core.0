Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C77D076B7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:33 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so33370662pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=E83auPMMpIb8wZAr02QoAPmYWGId64G5cgI11Z9/piU=;
	b=lNtuodrTP/QeOmijvugzLSYjXQQUDcICH3gWvRkk11qyk/YlA24Ce5eTlxyCq44+A5
	8NXyMc8iv35BkCnNZzqtZTN+6paNlqfREr1Mm/Ge4qi9DiJxkRIRAhtLYoG2Bmx280X9
	m+f98AH9Qg3hRAkBrvSmuiwba7nCFkzDrasum7OIwsz2wECpndmcuRAmX/jMtMfXJjl2
	vkH3kK2HFUC5fY/52lBznR0EQOeaUjA3DPE+iVYGt1phFsMgi3WF27jXQ/xnHQC5/KZs
	2Ck7W3UdgUkH2TJ4Mw8NwR+7i8gLbaNNLkn2bj7RacDVRRsxSwiB+QJJgm+esLcQNr34
	M6pg==
X-Received: by 10.68.113.37 with SMTP id iv5mr50377970pbb.104.1440454773917;
	Mon, 24 Aug 2015 15:19:33 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cr6sm7550698pdb.17.2015.08.24.15.19.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:17 -0700
Message-Id: <abe7d04e95068f758d80a58158ae77213c982881.1440454290.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454290.git.chris_larson@mentor.com>
References: <cover.1440454290.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] image.bbclass: add rootfs_check_host_user_contaminated
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:34 -0000

From: Christopher Larson <chris_larson@mentor.com>

This function is intended to be used in ROOTFS_POSTPROCESS_COMMAND, and checks
for any paths outside of /home which are owned by the user running bitbake.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ff2ed0d..d1cd9fd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -458,6 +458,20 @@ rootfs_trim_schemas () {
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


