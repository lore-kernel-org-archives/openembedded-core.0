Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.40416.1629214058128685949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Es7zTV0g;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 14so23476671qkc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q3LXi6XyY6bQvQe9KkMXTZPyQDg9FgWzQw66dTYqipo=;
        b=Es7zTV0gbE/jN51mtP1zqaQLbBfiRO+F1sWSg0maUAhdV0nwI3KxbqYokANirtgjWN
         vNFe7eJ1Cbi7A21LL9jAHQROh5PH7QgpwecJbxnot/auiGqw+oI+x71tKGb54J+oSluP
         X4jKTN1JiGhNxzu+TAUjuFIKN5kcFGnLBkZo16nMsH19JeUx62FqQoFl0TZgjusDN/rn
         XsHBBuS51ILEFO9PMgxo0n+OzVFjUVnUHCkfT1hnr2z1HmJR9DncUaaFN/6woygvAaHG
         I26gUnI5iVP1ghWWIJPvI1ezWIhJRc/c36puqTtpKHgPTuNpndl1zMRHih+uThARN60f
         Jghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q3LXi6XyY6bQvQe9KkMXTZPyQDg9FgWzQw66dTYqipo=;
        b=EhsH6aibJdW6G5Bh3Ijg4cO372l/ZVVeN1dsOt0aP8QDCCq5Pc4TePp4En/lt35VsY
         TE9vhT6nSMghVEF2Z+vEj0TA6AMiCA4pRSpkmD3rAXTrYbiaiFvnnXvGLcMuHQ8D5KXy
         N+JZAAlk3OPmtc6EpOcCAcjc9ktoyISQ8mu/8r+4pllIRBG/apkIwOw12oIfokeepUI+
         yu/Ps0MTe0nQOheypr6T2EILfK35nG/a2zSVKWVcoEzfm5hyH9ATvz8BzygsT0qjkU9p
         6K3nFU16Sc33Wq2nPthGoq0ORo7VBX3Rlm1r4V4pnv/zbKoL9eSH6+K2wrqSjpgxD4JI
         ZCcQ==
X-Gm-Message-State: AOAM5305+uAtg/G/GFD5P7NK7VP2aOsI/qw8jzPjWF3ODw8I6JAw3YcY
	jy5nTDWbuhfYdMWN0A2g7R2FEdspGlix8Q==
X-Google-Smtp-Source: ABdhPJy8OwfOPqjfyV1JXIFiBrcNxO6IiC0bQsHNQnh5t88p1d1rX97em+YFCBLPEsJoEkFWgrE+Pg==
X-Received: by 2002:a37:e20f:: with SMTP id g15mr4494280qki.450.1629214057194;
        Tue, 17 Aug 2021 08:27:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h6sm1175744qtb.44.2021.08.17.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 08:27:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel-devsrc: 5.14+ updates
Date: Tue, 17 Aug 2021 11:27:31 -0400
Message-Id: <73e7e75bdac08f652fdd330889d798cb72197f2f.1629213685.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629213685.git.bruce.ashfield@gmail.com>
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

commit 6218d0f6b8dec [x86/syscalls: Switch to generic syscalltbl.sh]
means that x86 no longer has a syscall script to copy, which causes
a build error.

We already copy the generic syscall script (in scripts), so we just
catch errors for the copies to support older and 5.14+ kernels in
the same devsrc recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3b5fdda773..23de1a4917 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -220,10 +220,10 @@ do_install() {
 
 	if [ "${ARCH}" = "x86" ]; then
 	    # files for 'make prepare' to succeed with kernel-devel
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
-- 
2.19.1

