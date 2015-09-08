Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id D1C3276FD5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:09 +0000 (UTC)
Received: by qgev79 with SMTP id v79so96463029qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fn1nOcE67L2etOuHyobo19cXBezz0aO8slyynYKLWPE=;
	b=qFVERa6Hf5Q1Ztg2zUufzSvUsqzZzwp9/U3/IaoiF9rPKAimf6dZF9G8B4h4FrUlr7
	3BDQWW4LdRH+5e/SugWbYVf4Hu3gPB8DkTznnr6NdL2clFxvgSu0KVBhEzJR1zCMseBa
	W6+1x+a9/GyWmVb8nfNLY3EOsxxt9Mi89QmTVbifc26BmV/xzmZ/HMgKs6ftcjfwQOza
	KMAyM1wR0oJ3bj51BEZFRPOlEYsS2ytlTQCIpXjIuEnUQkenEgx8R0Y0W4X0Eq2SNTz2
	McHFDOrVHNEXVu+kZVCob3QDQCB25iJWXW/D+fl+c5phBuM68+UdDvDh/mLp+HqQNjpc
	MFtw==
X-Received: by 10.140.238.195 with SMTP id j186mr41020932qhc.21.1441753689921; 
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:53 +0000
Message-Id: <aa6154e75d8013fee81a5eae73c0d40388455572.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 13/16] sudo: Disable rsize_t deliberately
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:10 -0000

gcc does not have it but clang does, problem happens when host compiler
is gcc and cross compiler is clang, because autoconf detects it with
clang and slaps it to host compiler as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
index 93b9bb4..6b3cd6d 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
@@ -15,6 +15,7 @@ DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
 EXTRA_OECONF += " \
+             ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
              "
-- 
2.5.1


