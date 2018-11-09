Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD3926C205
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f1-v6so3893770wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Uc2xGwjnjZGEUpyawU9pzmBoErvNNbQU59hRfz2/M9w=;
	b=VhubPe86aEpKP+hpMkRsP+Xppvv2csPogit1A9hkoN5w0byTbU4NfoMCAPiSEKVXGe
	LPhae2kCLK7q1m8sOqrgg/jvvoiAGjBMZEEandU2UMtJgZhxZtga6kPPtrxp7L30a5OU
	9DgHOw9Cs+VREkPd3BUB8PRR5i2cYIWTqhkQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uc2xGwjnjZGEUpyawU9pzmBoErvNNbQU59hRfz2/M9w=;
	b=Y6ceLU+Mvmjmos4v1keYaYw+gXZ7Hn0q2IKu/38T7qqSzJF+mkjml3eD8fr98m/CPv
	Fx1t6xrLcUy9V89g70SpU1yAIxCyT4QpSSVcSSX0TTKzHrqdbp6yr1iWO2XNE9eTjUjW
	3udC1T9fuPrqRrsOKC8TY38ysRjc2QwxCb7VLVKPMAHfdpSherVt+3XxA+Jmh8w4A+mT
	9aB9ZJSv9tMqQOiyBJkb+G4aFuJC1CrOxJaKQomLGZclEbeGshZAxLsisnShMqH7m6uB
	5y1xKgFYKthvnHwWwTqpEH3bw/9RiKYXE/U3q8iVxRrCpIRgZ7V6PTtJkdXiYAsHIBiJ
	kTFQ==
X-Gm-Message-State: AGRZ1gKBuu7HEmi4sV7/GYvGHIznfnNlmNLxS5NA5rkPZ+p/Gum87t6+
	Sf5hjNAU0gwkqEPmrw/OrDbEHr78RbE=
X-Google-Smtp-Source: AJdET5fSdTOzTJwOkj3Xy8Ghvqnmp5223tEaamS4gIEKo5P9ua1/qrBMG1Q0aUksgqJai62NAfQ4Qw==
X-Received: by 2002:a1c:d78b:: with SMTP id
	o133-v6mr1971484wmg.38.1541773756750; 
	Fri, 09 Nov 2018 06:29:16 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:03 +0000
Message-Id: <20181109142912.23102-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/12] distcc: Handle upstream branch deletion for old releases
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:17 -0000

distcc upstream dropped the 3.2 branch which we reference in older project releases
the revisions are there, just the branch is not. In order to be able to continue
to build those old releases, adjust any mirror tarball to contain the missing branch.
We have updated the  newer point releases but the previous tags were failing to build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/distcc/distcc_3.3.2.bb | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.2.bb b/meta/recipes-devtools/distcc/distcc_3.3.2.bb
index 0d069631653..a93604bc471 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.2.bb
@@ -69,3 +69,27 @@ FILES_${PN} = " ${sysconfdir} \
 		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
+
+
+#
+# distcc upstream dropped the 3.2 branch which we reference in older project releases
+# the revisions are there, just the branch is not. In order to be able to continue
+# to build those old releases, adjust any mirror tarball to contain the missing branch
+#
+fixup_distcc_mirror_tarball () {
+	TBALL=${DL_DIR}/git2_github.com.distcc.distcc.git.tar.gz
+	if [ -f $TBALL ]; then
+		TDIR=`mktemp -d`
+		cd $TDIR
+		tar -xzf $TBALL
+		set +e
+		git rev-parse --verify 3.2
+		if [ "$?" != "0" ]; then
+			git branch 3.2 d8b18df3e9dcbe4f092bed565835d3975e99432c
+			tar -czf $TBALL *
+		fi
+		set -e
+		rm -rf $TDIR/*
+	fi
+}
+do_fetch[postfuncs] += "fixup_distcc_mirror_tarball"
-- 
2.17.1


