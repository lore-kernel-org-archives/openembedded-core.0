Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 03CCF7CE4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:45:39 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id w18so5017383itj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=u99w5iViXhBPvVJnFh5Py9JkDG8vEI9uNr/0T0EUmXo=;
	b=RlVpOiDhqbinzqBoKm+6B+JHCgrXQAbBOpLhDaIcHB1WIQWASNhX7HoZgAAxYDdwfh
	zfuHe7qRIIGG4sW1d4g+lDZ5kqY7SSZrUkMbV1pfLwIrCoF7MovHJl2tn13Ly9TDxVQU
	XVV37ZvBpa4afqzNWZeTa5kBoxdeFgfzALhEh1U7HnxdCDUbyySqbRENRS43pmIeHVLY
	6qLbKt2YmaF8YpO77KrVULXpIkIV1pjIqOX3BNKCovCisiwEbufWBr1ByKkgpk06XeTe
	aJShMzd1FierI7N0JlJfTx5LBQMwsFo8W5QbReiFd+CPaVodn3pijhWHDmjYu9Gr1FFV
	K+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u99w5iViXhBPvVJnFh5Py9JkDG8vEI9uNr/0T0EUmXo=;
	b=UySTDPIETduUPKA7yFeNVm4YcayalVw2ylO+NZ+SNT6TOQE9mV5Mjmqq82ux1eFe/h
	TDDdHu7M7NTFB3Zdjn1BXnCVSnJ1Ru+1dhxytSrgYv1gODdNAyPI0Sac6S3PD2atBqRi
	gd6bq/434J4/FehCj71xl/1s37/pgmCEx5zDqpMxOzZ9C7myVNN2XZzBa4uK5ulotLZe
	OJDTDjoCsZnjm7jd1gDLgEcBXTX0AB7oweHt593xZ6pGEGSSkdGqYl+QjN+AtAnzKK/V
	VVQy64MOgAVmCcovqVlvNGQHqDGdNHj9wZxmw2BTqUCOWZWDzTbbDVVkQiPElhcfwljL
	IDPw==
X-Gm-Message-State: APjAAAUdmwTubEhpNf3t0QA2SVw2o+/IF1wZdxLWYzwiqobTI97htlNY
	4ZVOXmaD4YVYwAC/XF8wz+w=
X-Google-Smtp-Source: APXvYqxqzP5XHJK+ETCwLJRXoaL4v0APInVDMqrdmUIWcC5jO13OB3BCRrIYNdNPUkhfMyZICGH6aw==
X-Received: by 2002:a02:924e:: with SMTP id y14mr7849776jag.113.1552275940860; 
	Sun, 10 Mar 2019 20:45:40 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	u197sm7612963itb.9.2019.03.10.20.45.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:45:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 10 Mar 2019 23:45:37 -0400
Message-Id: <20190311034537.7190-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190311034537.7190-1-bruce.ashfield@gmail.com>
References: <20190311034537.7190-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.0: fix systemtap for arm
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
X-List-Received-Date: Mon, 11 Mar 2019 03:45:40 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We need to enable the arm unwinder for systemtap to work out of the
box:

  root@qemuarm:~# stap --disable-cache -DSTP_NO_VERREL_CHECK ./hello.stp
  [ 1600.955262] stap_2097: loading out-of-tree module taints kernel.
  hello world

This option is useful for much more than systemtap, so it is a good
idea to have on in the base configs. It make the image slightly larger,
but has no performance impacts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index a757945f8d..2350973fef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 57aada3f62..e0a6801446 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index a56e9a19d8..f2c066a150 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemux86-64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemumips64 ?= "5f072445126e6a9e44f9435a552f4fcf6fc15499"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


