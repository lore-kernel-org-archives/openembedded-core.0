Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD087BD94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 15:25:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s12so4477252wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Na77Npn4BM6FDoR2D0LPANrLnydSd1eaoRNqeuENVWM=;
	b=p5+gZjJ2gBpMcbacXOLMVpuIlAPXduzJ2gQKtVw84xL0wpAt4yMhILdZanD4RVG/Qp
	d4hZ7dJ4PM26nNJQAMcWqfEiuWURnD9XKs7h0W2vuHMKyArLgU8tkWdA0PJATRwXtOFJ
	Jw+rZ8VnFOiTUVKviy2Ku6G7Hh40WXA0X6BT8Rn6snCcKpnRFsKQG3MkcxLNzFTkDoZM
	SZ/6SZtekFbUO86mntjIIiguSMpOVxBAYOcZN8/H7SLWQIwXtHJSoaTQlh2dfgKU/N2f
	Uh+H+73fLF985FumbHcdTWEk4iBQLGagBd0k0yQI0f/S2dd/zd4kZzYHoCYD1Dat9+qI
	zPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Na77Npn4BM6FDoR2D0LPANrLnydSd1eaoRNqeuENVWM=;
	b=jwVk7OEgJ1idaH4c1bNLdvWPETSBI5o/ithL//RdrMRonbV6kd7ZQfUL6ZiMIaDHy6
	/jqH96nnbYAGOBUQoGk1l/gGt0loJo/rukvc4Jq/xNDOltkOWa61mg6VfnVMCo+qhDVE
	jUbYP0xWjXYzbgo5vfN/pLHK4JfZRjl3rXED/JEYRxAGlgiaEHL6+2j6YB9Rp6nPPDHp
	MgdUPMJ99w5SEEC4YbFvMAfSlOn2G1anXih7QljktnuW9IaLGqQAy1tSuogB1AKvVHoI
	5YoBfItIFImlNm0pCXnFez/krzjC5xMZN5MKkxvD7CzLiGutbiDp5NA8dFY/VKHVBXs9
	BwYA==
X-Gm-Message-State: AJcUukcVcKzHx6aBpCGU8QVGh3thUKjwoZXr/Divr6jZOXuiv9OTnuj3
	la79DueN9nSu8kY/mZr0690aujvBp4E=
X-Google-Smtp-Source: ALg8bN5uJSUBn1wd3KJyJHvtqFw+OP8T5Q4o6XxlLijnwQThgRJ8fJwK6H+HbSDKSDI9KfgfLstmxA==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr1746896wrr.201.1546961138735; 
	Tue, 08 Jan 2019 07:25:38 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v4sm10316825wme.6.2019.01.08.07.25.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 07:25:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 16:25:29 +0100
Message-Id: <20190108152529.55111-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190108152529.55111-1-alex.kanavin@gmail.com>
References: <20190108152529.55111-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] openssh: use tarballs instead of git
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
X-List-Received-Date: Tue, 08 Jan 2019 15:25:38 -0000

This was change to git recently to obtain openssl 1.1 compatible pre-release code
(before 7.9 was out), however tarballs are preferred, and with them upstream version
checks work (openssh uses a weird git tag scheme).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../openssh/{openssh_7.9p1+git.bb => openssh_7.9p1.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_7.9p1+git.bb => openssh_7.9p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb
rename to meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index d79ffe19710..2a23f64b894 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1+git.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 DEPENDS = "zlib openssl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
+SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
            file://sshd_config \
            file://ssh_config \
            file://init \
@@ -25,13 +25,11 @@ SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
+SRC_URI[md5sum] = "c6af50b7a474d04726a5aa747a5dce8f"
+SRC_URI[sha256sum] = "6b4b3ba2253d84ed3771c8050728d597c91cfce898713beb7b64a305b6f11aad"
 
 PAM_SRC_URI = "file://sshd"
 
-SRCREV = "aede1c34243a6f7feae2fb2cb686ade5f9be6f3d"
-
-S = "${WORKDIR}/git"
-
 inherit useradd update-rc.d update-alternatives systemd
 
 USERADD_PACKAGES = "${PN}-sshd"
-- 
2.17.1


