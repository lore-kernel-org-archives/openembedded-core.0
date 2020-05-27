Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13.1590594616273878973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 08:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ipCAUZt4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id a13so10277505pls.8
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weJ74nFGgBh8wJiK3GCpe07f35a8GngFYJff6eKrN+U=;
        b=ipCAUZt44e8Uer7ztIN+w/siJdW/vOW4w5Iou4Z/bH16x7HZkR+U/F9PnTJtUPWYYM
         jtvbWGEUjx1xZBzSivaD/3fw1vcQRn22HX99jOD+qWAAaqgTNlnCcKWcfhfcqH2auyrh
         7yYuE+WZMd1TtqPw/yELL49g6IvB0Y29AWDceGcmcfAlDrJMUTOeQbKpEVhPO7MJ2yOk
         ZEH0ePHyj6UGdyMWmnZNJmaHuoX3XdUZ894KPkVEXJWmorE1J4WDrQ06uWcF/zB6OrSs
         1cGpI6lv4T621A5D+MshADZIV1e8/XI+PW4Ok6bjFPrObH94rej310YRhGc4CHBoauVk
         BaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weJ74nFGgBh8wJiK3GCpe07f35a8GngFYJff6eKrN+U=;
        b=jQMXb3e9xuzxaIOHR1VsaesVst/Hu8Ywu4y0JepSv/rBj23tO8eZxlVt6F59w+rzgJ
         3v41o+HFZrw9YL7H64J8+3FfavZr9TN6ndDoitkJTPk/02EtL25ZppHxnHukNVct+RTJ
         34K0ef+AK3a6bXMCB6hsbyowyOa1tjL2X2JkrS5GfrnmpudqdxP45ovOu+9mugTjg/IP
         LaNu2K1wU+xO/3AAzyNMxtKb87PuUIZ+Dn910fXsgiqeWhAHiAb5fBjk4c0JE6ym0DOB
         aXdl8ozii8T12zGataBPPBwvjm8HfFleLC3/Nrxmi2VV4M5SCWsaNtT4OkDfFttUcgF9
         RHWA==
X-Gm-Message-State: AOAM531U0v9p0s8uNkQnh4k7Wq/ACVrIOaMcOb+pLRpDMO1vYBbQttEm
	7kAcPTK609ac2n+Koinyhv5nNjtdZCk=
X-Google-Smtp-Source: ABdhPJyxRfDdKtxMXlhBSQMnJ5G2wlVBXOvvop227MBuZexzY0V8P+sgqusIqA47W4O8njFHyDTFiA==
X-Received: by 2002:a17:902:bf84:: with SMTP id v4mr6531312pls.312.1590594615000;
        Wed, 27 May 2020 08:50:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3faa])
        by smtp.gmail.com with ESMTPSA id n21sm2847597pjo.25.2020.05.27.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 08:50:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Date: Wed, 27 May 2020 08:50:11 -0700
Message-Id: <20200527155011.3165976-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
this helps in using common header across multiple versions of kernel
going back

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 4481aa430c..933a01ba81 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -81,8 +81,11 @@ do_install_append_armeb () {
 }
 
 do_install_armmultilib () {
-	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
+	oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h
 	oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
+	if [ -f "${D}/${includedir}/asm/bpf_perf_event.h" ]; then
+		oe_multilib_header asm/bpf_perf_event.h
+	fi
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.26.2

