Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.1527.1614411697508483769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 23:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RFwbnu2/;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id o10so7683833pgg.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 23:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vbZUTOVcSui0UKdC+Q4hsuQMKfv6xki7vXMMJrVI0eY=;
        b=RFwbnu2/0r/DTaDPtHJ33BB+kpVkN02gDqPHFXJaB1dUZskAnBpg+YeI+ydi0EgOP6
         XzWD/h9qR+Y6USyqlSlcEUwUqg3tbosdKMsn9xHj/ORVci8HyqoAgWA651OMk/FfJJF9
         PAszczRKjEuusVcmEgxhh0S3PsSns4mJKoxsBVif4qZPoNu33D3U01riPFs0nmrLrVqg
         omjax2IwQK8ABLWxurDuiLJeYDmWcXOaenFJMV00551XvVCtbCFula0juSj4UyGeMvkZ
         L3TN82NfAnEmmXRzxfqnHYwQBPiJ8WfjGjRNGgu9gcPb9AXPN7iDUq3J7THp4alE03vU
         hU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vbZUTOVcSui0UKdC+Q4hsuQMKfv6xki7vXMMJrVI0eY=;
        b=ZwwijBiOum4cKGwc5nB21ZIPUQnAjYtszyW7mZ9QBffvtwqrd38k3YNdXmXNtklG8M
         ZpDd4tMb5U8XiQCRzi/TB3oGAEwBE5dOaaJAd8a+Z406F806cVhw0c7f3vkdJKh8Getp
         /x+U7mMvaFpT9XlwOBhuaveRqUKuVh/Lf9QNmOxe/9Jab/wWc8NfbTc5sH8TzuljS6Wl
         rEkV74Ic3zgoEffEKUy44xs3sIATQpTlNDD9ElRlpk8xPnAD5RdYhyp78DfiED+t56Yn
         xU1deNrZ1h1ASRrJBZP5jtIKYPRGx1XFZra2EeAiXKNMyIxeYE8IKzztNmT3fL5kgGLO
         uIiQ==
X-Gm-Message-State: AOAM531FgP545GAGKoJzp0xBVH7nmWqujCT0GbRy78VrbiqBk4Khzx6z
	5wkByzfSygOcQO911HfPOWtf9fn3gnjEMg==
X-Google-Smtp-Source: ABdhPJwcpoIFBqSf6VL+keqKWWFbDA2Mrsm5yBMx1yj0pPwBUM6ZbasC6mCMkuXSqvatKi5e45m+0g==
X-Received: by 2002:aa7:83cc:0:b029:1ed:446b:1ae2 with SMTP id j12-20020aa783cc0000b02901ed446b1ae2mr6735754pfn.47.1614411696717;
        Fri, 26 Feb 2021 23:41:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z137sm12462003pfc.172.2021.02.26.23.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 23:41:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] dtc: Fix array-bounds error
Date: Fri, 26 Feb 2021 23:41:31 -0800
Message-Id: <20210227074132.4029374-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227074132.4029374-1-raj.khem@gmail.com>
References: <20210227074132.4029374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
| libfdt/libfdt.h:251:28: error: array subscript 'struct fdt_header[0]' is partly outside array bounds of 'unsigned char[4]' [-Werror=array-bounds]
|   251 |                 fdth->name = cpu_to_fdt32(val); \
|       |                 ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dtc/0001-fdtdump-Fix-gcc11-warning.patch  | 35 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.6.0.bb          |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
new file mode 100644
index 0000000000..ec825cbf7b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-Fix-gcc11-warning.patch
@@ -0,0 +1,35 @@
+From 4827e0db6c4f7dea7f4094f49d3bb48ef6dfdc2d Mon Sep 17 00:00:00 2001
+From: David Gibson <david@gibson.dropbear.id.au>
+Date: Wed, 6 Jan 2021 14:52:26 +1100
+Subject: [PATCH] fdtdump: Fix gcc11 warning
+
+In one place, fdtdump abuses fdt_set_magic(), passing it just a small char
+array instead of the full fdt header it expects.  That's relying on the
+fact that in fact fdt_set_magic() will only actually access the first 4
+bytes of the buffer.
+
+This trips a new warning in GCC 11 - and it's entirely possible it was
+always UB.  So, don't do that.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/patch/?id=ca16a723fa9dde9c5da80dba567f48715000e77c]
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+---
+ fdtdump.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fdtdump.c b/fdtdump.c
+index 9613bef..d9fb374 100644
+--- a/fdtdump.c
++++ b/fdtdump.c
+@@ -217,7 +217,7 @@ int main(int argc, char *argv[])
+ 		char *p = buf;
+ 		char *endp = buf + len;
+ 
+-		fdt_set_magic(smagic, FDT_MAGIC);
++		fdt32_st(smagic, FDT_MAGIC);
+ 
+ 		/* poor man's memmem */
+ 		while ((endp - p) >= FDT_MAGIC_SIZE) {
+-- 
+2.30.1
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.0.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 92df70d9fc..a407137859 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
 
+SRC_URI += "file://0001-fdtdump-Fix-gcc11-warning.patch"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.1

