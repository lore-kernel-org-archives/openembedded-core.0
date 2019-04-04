Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id B173A7D401
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 05:49:41 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w24so601942plp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 22:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TopGRm0NI3mUh3Cu3LGIAHTqGrpTiCglTsFZ02ryCpA=;
	b=Tc/Q+euE6dKedbUTgrhrtAu0OQJTimaCl2c1f54bS+ANcQBwlsIqztKC3NG+sz/If4
	ml10HpPlHROGTQ+/k1yhH5vOE611bK/h3cWCGm4hWZtkgcmhrwsyE6jfSPDZwa0B9q6d
	ZDUAq3U17Fpio0S0MrJxeM78cbOE5j5MPJoSsjaBhbVNINld8M8/dQ1M/lLJFDR4yt+N
	pXfIlBJPis0A1U1g7lkj+aL6j4QM2DmDHCpw6wZWWyeqzmPUJu+OVvo8abJN0u3nig/3
	lq1JNkk0y/ub+J/A+z9OzoO9W+ITQ7dreVj53K01l8CutxVl0swcnZWv4y1VOuATImMy
	s2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TopGRm0NI3mUh3Cu3LGIAHTqGrpTiCglTsFZ02ryCpA=;
	b=F4ZS8Zy1elz/vAUEKBgbM+Bd49I8bhBIusbHnmlFzkQhKI8IemCCL94D6T05tO9QOX
	hUdAoPQv003NsMAfyW8UhTSUsI3M4cX+y63BR4A7C+DAy5oPs4LP9mGnGn2/dqjT6lPp
	yYpVp8BCvsf9LFGW4nvy75wXt+6senQ0Wqi481wfiaY7KNOFeSuXLXJKv692ManN/OZ1
	sciwtYLh//bK1+V9RxW8YDfJ1C0eM8eqcOi09o6RN+QynoGCzFPzUQWnF5FHYQYhiGD9
	m8xLL1iPVyL8o6yUNWgv7MgEWskFDQYt51UVCnPyMaZFnjfN+Wy7QD3NkXtecXYPHDLa
	qUKg==
X-Gm-Message-State: APjAAAUQ6uzBZBeSuU/A+BTQstv837BQjP8EbuUkDlArRkdYXd+DPnp0
	NaWqbs0iVHOjPT1G4gOtZ4XmMIUTNdM=
X-Google-Smtp-Source: APXvYqzAaNLVxmtpkdZ2ifIArJrVC51rLp3XFf1UeAcap6oEdJ7Lk7bZbUTIg4jd47EI8mzSmepYwg==
X-Received: by 2002:a17:902:b715:: with SMTP id
	d21mr4469171pls.103.1554356982061; 
	Wed, 03 Apr 2019 22:49:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dcf4])
	by smtp.gmail.com with ESMTPSA id
	w23sm17260666pgj.72.2019.04.03.22.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 22:49:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 22:49:32 -0700
Message-Id: <20190404054932.38231-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libgcc: Create linux-musleabihf and linux-gnueabihf symlinks
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
X-List-Received-Date: Thu, 04 Apr 2019 05:49:41 -0000
Content-Transfer-Encoding: 8bit

When we have hard-float ABI enabled, certain tools e.g. llvm/clang
expects the hf version of tuples for crt files from libgcc, therefore
create a symlink to help the cause.

This makes clang work with hard-float defaults on target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/libgcc.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index e4e0c48007..e008d14f36 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -11,6 +11,13 @@ do_install_append_class-target () {
 		esac
 		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
 	fi
+	if [ -n "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}" ]; then
+		case "${TARGET_OS}" in
+			"linux-musleabi") extra_target_os="linux-musleabihf";;
+			"linux-gnueabi") extra_target_os="linux-gnueabihf";;
+		esac
+		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+	fi
 }
 
 PACKAGES = "\
-- 
2.21.0


