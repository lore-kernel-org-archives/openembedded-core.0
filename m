Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A24B7C7A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:02:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u8so5755178wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HXZpIboPua53m2nFK6ldQVsVsQI8hX7t1dzE2xRf+vA=;
	b=Ys5Je6V1GNfE4fycp/BLRBqqqDeZ6BMeEvHwZzHgPgofq2qaFJYLAB6vEBqbyj8+I4
	i7RNVItgxh2s2FQXMP0SQKbp3gf34vZT2A/sO/hexZrpd6NfddGUshkUXI/ezoCtXRR1
	gD0ENuDIKQyoZF3oKw1JTxSkMl4HybeO7Wo+Z9BtvJ7UDItOyaLEyBhKko1ZyR8qA0e1
	aS/NFFRtW2lDBDgvPQ6VbRWsmHdkWaLgIiIx+51XhH07pguuKqz2MZRJqsLlUe/aHyaN
	wyMtzGmS4oIxbSmXINm0E3rPaoNsnH6LIHVFg4MdSbj4DLu5iTNhnpnm+Ny5cUOjyGzZ
	3jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HXZpIboPua53m2nFK6ldQVsVsQI8hX7t1dzE2xRf+vA=;
	b=ZjOQJuz0gai9W1YUISWdn1J+Wzgv/PCjHF1ZhiuPAe4nXbDv1SW4ctikHmixH2XhCi
	iK655KeknTOHHSUjHlgyPsqUCB/mQuJHx/BcLzWSeZGFTf5/vuiNTqA8SxelUy7JqM08
	Vinh5HSceRlVEcjq3IP2m7b7zj/a22+/0U26PcyTvzlNLfOUzhOC5Gks+aSSMbl/i4L+
	QbnpjDFDgAfwG4VQc6JK4zZAx4HHAsl1aHsjnahIA0l0407sT5MBSnDqwAlmRZvwBUfh
	soIeVWL/yp9S4gPUa1qhT92bHZZsbNoGWYuZayp0zG/pbbgmfr0MndL9WchukkZwPzgt
	MdPw==
X-Gm-Message-State: APjAAAWkb1vPvPS5Kia/KwrG0qakPDQQM4dMukZkgye3k2dQ5DZigmxl
	3BlHWt2OE6XKFzs5T12ETQSjsZvb
X-Google-Smtp-Source: APXvYqxmJ3jsjpCLjYyeKxDMY26WhnijHHvZlM9tYAWv6JFxUGtJBXTwRL54YvM2oANRy0Cdk3W0sw==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr3138304wme.125.1561107721988; 
	Fri, 21 Jun 2019 02:02:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r4sm1568952wrv.34.2019.06.21.02.02.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Jun 2019 02:02:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 09:02:10 +0000
Message-Id: <20190621090210.254-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621083230.GA1512@jama>
References: <20190621083230.GA1512@jama>
Subject: [PATCH] gcc-runtime.inc: create the correct directory before creating the symlinks in it
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
X-List-Received-Date: Fri, 21 Jun 2019 09:02:02 -0000

* since
  commit b071a1a209556158bcfcc20e3c8bd4b15373767c
  Author: Changqing Li <changqing.li@windriver.com>
  Date:   Tue Jun 18 15:46:56 2019 +0800

    gcc-runtime: fix C++ header mapping for n32/x32 tune

  gcc-runtime.do_install is failing with:

  ln: failed to create symbolic link 'work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-gnueabi/bits': No such file or directory
  WARNING: exit code 1 from a shell command.
  ERROR: Function failed: do_install (log file is located at work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31049)

  There is only empty directory without the -gnueabi suffix:
  work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux/

  and

  work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oemllib32-linux-gnueabi/
  bits  ext

* make sure to create correct directory (with -${TARGET_OS suffix instead of -linux suffix)
  before creating the symlinks in it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ba767e1a38..a5c2600d7f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -114,7 +114,7 @@ do_install_append_class-target () {
 			ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 		fi
 	elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
-		mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
+		mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
 		ln -s ../${TARGET_SYS}/bits ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
 		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
 	fi
-- 
2.17.1


