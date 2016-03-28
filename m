Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0028F6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 04:00:24 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o6so96246136qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Bj7alxks9MTouMaTNbGlt8p2uXKXEGG03q77EFxzFwo=;
	b=F7jd/Kb7m5gvGvOh5WVLk0qOTDnITOGJ+9kUVJTXVL3dfEBzzeKSL98/JnH1/D28eT
	3Ep2RKoL8bgYSq/3AyzVD31L3m+LybllUQr8ndH2+aWZqhGmZrrkhjPOB9vTK9Kcpd+y
	SuUeMj/2xJR6Sj/wNjITUwKZqThte5EuElR+a9jpfOjpM/uIbXgl71z53Oytw0HjSsTh
	vbOeb4tQcOyDe78EjA0Du+BGjuU6G6f/s/k+xLf2vCRVEYlCYIL3Xyga1UUUgsq7WYno
	HUwzwiBqNIqtX5xv4vh3vdjtdXHzBcm8ItwevXw6UXQQffvvSXpSmQs0K3YrMIbnWcA9
	0eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Bj7alxks9MTouMaTNbGlt8p2uXKXEGG03q77EFxzFwo=;
	b=VBDis74CXAqxjLxDP6lpqm+33sUb/LFMeOT0f1tdj/c8KQPul9NTGREO0xsnJyOMuN
	35lJFhP9RnjfsN6lhdyej++j/wFb5y8msZA8FstaLbkc4eJWCOW6EaYM7MOgXVf5ikdm
	z68MKMvh2VIfiQHfgvMwzzQXS4h5yJYOr78qILJPG7PcNJNexOt6pDrRP379kt0JIhhd
	XMoNs+oWuQRasH2uR+RD93n/7ysymLXeFLMMwMhmFOxERGJvM2jwMRoTuztjMbBoQ1D9
	3B1TmKB4M2QTCmyBH6J4oedSAeoJ49Wyz1t0pltSA06JwuXj49+nYPijBNrhJQj1xIXq
	SkxQ==
X-Gm-Message-State: AD7BkJIrOmS5W0Dhyz0YI17dHKBrhX5mImDgR3nFjUpv53cjsEz8s0oHdldGHDqcnfRwTw==
X-Received: by 10.55.81.87 with SMTP id f84mr32413558qkb.10.1459137624834;
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	i46sm11057224qgd.19.2016.03.27.21.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 04:00:15 +0000
Message-Id: <7cf66bd1eb3a44c482d0dc3df0ce4c381ea72387.1459137452.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] siteinfo: Fix musl 64bit targets
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
X-List-Received-Date: Mon, 28 Mar 2016 04:00:25 -0000

Found that ssize_t was being wrongly computed for mips64 musl
because it was using wrong cache files.

alias them to glibc versions, musl doesn't _yet_ have target
incompatibilities to note in siteinfo thankfully.

Add musl aliases for aarch64 and ppc64 targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 1b3906c..50141a3 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -71,6 +71,8 @@ def siteinfo_data(d):
     targetinfo = {
         "aarch64-linux-gnu": "aarch64-linux",
         "aarch64_be-linux-gnu": "aarch64_be-linux",
+        "aarch64-linux-musl": "aarch64-linux",
+        "aarch64_be-linux-musl": "aarch64_be-linux",
         "arm-linux-gnueabi": "arm-linux",
         "arm-linux-musleabi": "arm-linux",
         "arm-linux-uclibceabi": "arm-linux-uclibc",
@@ -79,8 +81,8 @@ def siteinfo_data(d):
         "armeb-linux-musleabi": "armeb-linux",
         "mips-linux-musl": "mips-linux",
         "mipsel-linux-musl": "mipsel-linux",
-        "mips64-linux-musl": "mips-linux",
-        "mips64el-linux-musl": "mipsel-linux",
+        "mips64-linux-musl": "mips64-linux",
+        "mips64el-linux-musl": "mips64el-linux",
         "mips64-linux-gnun32": "mips-linux bit-32",
         "mips64el-linux-gnun32": "mipsel-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
@@ -92,6 +94,7 @@ def siteinfo_data(d):
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
+        "powerpc64-linux-musl": "powerpc-linux",
         "x86_64-cygwin": "bit-64",
         "x86_64-darwin": "bit-64",
         "x86_64-darwin9": "bit-64",
-- 
1.8.3.1


