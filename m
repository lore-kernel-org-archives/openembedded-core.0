Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9826760B22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:04:05 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b1so11200273pgm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MiYV2wf+ZuodElvXz5lTnZAnKYRo5KxSTsHXCtVFJWA=;
	b=SnLe1KFwsPkY3Wg6B29NM1moMjs8DzN37YMZeira2MJstRNcKK0sW33FxEdswT7xIC
	xcDjl4A9PKYMUrGKBPDEaDynyKgWKqqsy+K/QYdc9Rco7JwA6I/cagSONMSXotM4bDAL
	rNferQlPchpEYcgzlnyK4TGZrV76BIxo+BLW0RL5dzBw2/bnq+h4CsScmTm/p5Jy87b5
	DVhjn7uzo4OWlzapgYxAnL786lVxyacg7LCr+OjgaviUczQqDZLMOZcLffG4FqEMjCqJ
	jHms9JXqEoUoaqYqje9I2VM3KTqXPjhLGnz0dU+1J2VfWLJJtTslp3Kxo88xv9VidTMZ
	A9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MiYV2wf+ZuodElvXz5lTnZAnKYRo5KxSTsHXCtVFJWA=;
	b=SZCXaih3j9dHaZC09Q8pxFntEOnl5lG6FS4khVcPN8E2vt7Nn1WnSzyCYsOZkK487l
	TcjED4zyHbyea5HDayET/AtUNTcy8ClGVFmmC2mRSZWO535Oby7TBVzgaiB5B/dZDwN4
	bA1llDiA+JFimOz1On44GaL++YFpn3BroIpvsLw1nqsqeR2hvwsLXw349WxeiXPo7vjT
	9PCPQCK+5/w7Cf1gg+CHG15C5eU5nqiK3urmeMX3Qw3yrMj50lFs0Ya0TFi+sz9V9WM0
	P3C9ZYnPpoT4HqMnOC6wzYVJVAuPwkL8TOnvEV7ECFyQ+L4rjj58bOFqIs87cDvRCCVw
	ihYQ==
X-Gm-Message-State: ANhLgQ2a5sO3dzhoo2P9nXLdeXVmNESfvj1Bi7+Hqew3jRvGREk6+oX5
	tdFjhRwmkrbvLAP3czmsYIE510qzLk4=
X-Google-Smtp-Source: ADFU+vtpG9cM7brxKpjxE/sqt8KqY7BFwggg7OUTvYJkumtj6ROs//sg9wdrAchveQ84Uc8Xg+kxjA==
X-Received: by 2002:aa7:9f93:: with SMTP id z19mr3826451pfr.187.1584428646010; 
	Tue, 17 Mar 2020 00:04:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	jz19sm1754331pjb.48.2020.03.17.00.04.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 00:04:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:04:16 -0700
Message-Id: <20200317070417.1250936-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317070417.1250936-1-raj.khem@gmail.com>
References: <20200317070417.1250936-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] linuxloader: Add get_musl_loader_arch function
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
X-List-Received-Date: Tue, 17 Mar 2020 07:04:05 -0000
Content-Transfer-Encoding: 8bit

get_musl_loader_arch returns the arch part of ldso for musl, this is
used in get_musl_loader() as well as independently usable, which is
needed for multilib support in musl. Musl stores all ldso in /lib
be it multilib or not, therefore do not use base_libdir instead directly
use /lib

[YOCTO #11971]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index e2876cec7a..ec0e0556dd 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -1,27 +1,31 @@
-def get_musl_loader(d):
+def get_musl_loader_arch(d):
     import re
-    dynamic_loader = None
+    ldso_arch = None
 
     targetarch = d.getVar("TARGET_ARCH")
     if targetarch.startswith("microblaze"):
-        dynamic_loader = "${base_libdir}/ld-musl-microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}.so.1"
+        ldso_arch = "microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}"
     elif targetarch.startswith("mips"):
-        dynamic_loader = "${base_libdir}/ld-musl-mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+        ldso_arch = "mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
     elif targetarch == "powerpc":
-        dynamic_loader = "${base_libdir}/ld-musl-powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+        ldso_arch = "powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
     elif targetarch == "powerpc64":
-        dynamic_loader = "${base_libdir}/ld-musl-powerpc64.so.1"
+        ldso_arch = "powerpc64"
     elif targetarch == "x86_64":
-        dynamic_loader = "${base_libdir}/ld-musl-x86_64.so.1"
+        ldso_arch = "x86_64"
     elif re.search("i.86", targetarch):
-        dynamic_loader = "${base_libdir}/ld-musl-i386.so.1"
+        ldso_arch = "i386"
     elif targetarch.startswith("arm"):
-        dynamic_loader = "${base_libdir}/ld-musl-arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}.so.1"
+        ldso_arch = "arm${ARMPKGSFX_ENDIAN}${ARMPKGSFX_EABI}"
     elif targetarch.startswith("aarch64"):
-        dynamic_loader = "${base_libdir}/ld-musl-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
+        ldso_arch = "aarch64${ARMPKGSFX_ENDIAN_64}"
     elif targetarch.startswith("riscv64"):
-        dynamic_loader = "${base_libdir}/ld-musl-riscv64${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}.so.1"
-    return dynamic_loader
+        ldso_arch = "riscv64${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
+    return ldso_arch
+
+def get_musl_loader(d):
+    import re
+    return "/lib/ld-musl-" + get_musl_loader_arch(d) + ".so.1"
 
 def get_glibc_loader(d):
     import re
@@ -62,4 +66,5 @@ def get_linuxloader(d):
 
 get_linuxloader[vardepvalue] = "${@get_linuxloader(d)}"
 get_musl_loader[vardepvalue] = "${@get_musl_loader(d)}"
+get_musl_loader_arch[vardepvalue] = "${@get_musl_loader_arch(d)}"
 get_glibc_loader[vardepvalue] = "${@get_glibc_loader(d)}"
-- 
2.25.1


