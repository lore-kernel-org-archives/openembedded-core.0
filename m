Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 703057DBBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:52:23 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r71so3131325iod.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MVik/o08dDV4fh2WDuw/TZyZxJE1qxF+BRmeVeUh2wc=;
	b=JhRpwlYXGokolyyIfnwToja+LN6NME/4doquzu37oE2QQnAf2y2Z53SpK89PqJWaV8
	ADL6zIoy5cVR+ba1eQudUJEXmwtdHHEWnaiwL+SOcB71UkygGdV0ikG7wNb10zalfQAd
	v1CKUQz3eJKLUq8YzIv5X1gIcQQ2yL5CcNhnfkJMaDlB8Tiifx6+K89Uxb33tWFvPigR
	K+9M8xVSI/I/DY27XLfM2hOFoa+ngkDXOhB4wVKVlS9jcF5sHidoKnYJwJutv6wyYiWZ
	+iC079sgGAZSG6Nlll82LM978S+f5VW/JqondTUMyeNCjpuo8SUzXlmMRNRC3OPqzG3v
	tpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MVik/o08dDV4fh2WDuw/TZyZxJE1qxF+BRmeVeUh2wc=;
	b=LpTmybYLuhOk92gzDWtg7V2E84v33lYUKb0Sh/m2d0ZWDoWt6ocRr6uRGQrSTwiq9Z
	EjE2bjSHTtq6fHb7cWhu05GKE1jzO1PcB6egYZu8a6LyPtUqHZET7ENqNGq9gLcqOxfF
	TnDAz05vPndw6r5b4M1y4m6d1BwcDi86lnJ+BaL6iVHEx7O+Y6durfkpeOFZcvk+BhWO
	rUWq9DFtoOhyN2moJa4U3Kh3nMNLmUMEmOh1M4j2Flwt3IJNZbPpBGvSn6HHFpW+OD+h
	t12NBw5+KZ2bfNFbL8IpAJixXsYTrUuQ3E4jZm1aizOWRLXXi35k3EZv70HJfdeH5SEr
	4PiA==
X-Gm-Message-State: APjAAAXWX4m9MCR3+mb004Bt3ERCNJtPaQMsqSGEtMG7bunHT2nICnJo
	USWeRWbRYl5UBI+RzuKt2EKISy9cb2w=
X-Google-Smtp-Source: APXvYqxKsyt1dXLIXRG1DPVNK8cDU2sucipwUoX2ZGTs0A03ovDJWWdxKyiABRiKxNwR8kojbLQUeQ==
X-Received: by 2002:a5d:9d0a:: with SMTP id j10mr25345430ioj.196.1556290344340;
	Fri, 26 Apr 2019 07:52:24 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id t24sm4625947ioc.1.2019.04.26.07.52.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:52:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 26 Apr 2019 10:52:17 -0400
Message-Id: <dcc94e7788184894ed34e61f1d5ac81b69a320c0.1556289910.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1556289910.git.bruce.ashfield@gmail.com>
References: <cover.1556289910.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/5.0: integrate TCP timeout / hang fix
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
X-List-Received-Date: Fri, 26 Apr 2019 14:52:23 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following fix:

[
    tcp: fix issues relaed to implement coalescing on backlog queue

    As was discussed on -netdev, there's an issue with TCP timeouts and
    hangs due to new features introduced in the 5.0 kernel:

      https://www.spinics.net/lists/netdev/msg562928.html

    This is a temporary commit to widely test the proposed solution. It
    will be dropped when an official patch makes mainline.
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 07fa910ee8..ef3f0a0e1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04585fb29f99725a27acb96fc25efa0a55a62a8a"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine ?= "a3309af7ab77156bd8d731df3a97126d3d897916"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index c1084f2bb9..206e6c348d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e265300362d7004e3b57bb5cbcfc65fb469b9ce9"
-SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine_qemuarm ?= "d905ae925fc4a60d63f45e1922163da683d8a3bc"
+SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 01269dda27..f34cc7b9db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ed9d11e2c8ebbfe056420cb89c2e5d02836496ce"
-SRCREV_machine_qemuarm64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemumips ?= "40a729c3b0683d0875f8d6ad7353e6e429c7afc2"
-SRCREV_machine_qemuppc ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemux86 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemux86-64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_machine_qemumips64 ?= "437d99225c689f3f192bb834e4d649ea0467ac87"
-SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
+SRCREV_machine_qemuarm ?= "17c4b7e9db4d17aa713c85d0c3d2d84af962864a"
+SRCREV_machine_qemuarm64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemumips ?= "e5c23fb31438dab373a50afc40f6e4ab0c568485"
+SRCREV_machine_qemuppc ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemux86 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemux86-64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_machine_qemumips64 ?= "743d799797ad6828472087e1da8c67fdab87bf75"
+SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
+SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


