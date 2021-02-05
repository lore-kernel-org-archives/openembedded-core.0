Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.5569.1612513534639445821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 00:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AbjJdtJz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id w4so5249595wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 00:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R7nnD3AJZDGa9c303cAeAwOoGV2FrZod3m5v2vCUhmg=;
        b=AbjJdtJzVhLnJzOyaeQi/M/52U5l4lzx+qXQksuzMsrKv+ulJDU3w+qMkLfFtvU9Ct
         Y00V7KxbABlXZHVD1jK1kt4xIPb/eWrW7CDq49kqWl2QRc/vxraI2IPhjHQ6gKVaRxON
         AGPeYasMWdi2CSGnr9mYDq2P+8R1JZxdWYjP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R7nnD3AJZDGa9c303cAeAwOoGV2FrZod3m5v2vCUhmg=;
        b=O0grchh+08QzoXOGN3n3V+VaH4JjaFkKdr0me2f/urb7A9AeFvagTuq1hnWwMmTLbC
         Ls5AWTSOG4HUvoA5Wx/QREJIJ1n8E43WNzBa9NECI3Z6USc3aLyrYWZFvdo+vtsM6O8r
         T+D/q3aqUBLzZZEC3vvxTgD00cnt6G7E/Zf9NMyqHGgJtVokRTXVYbpOyJu3zlzEVJZo
         fyJaK0wiwTYe7eof4xEE5Z8pt9b26A9KGTfWOH76rmPAYY3L0DVyASphNrxIVDCbtBp7
         Ia3ZJWbGRQbFyuUwpbIZS4yHeYWyISYZgSctfEf9z9PS4L43oV677fGZXad2CJatMFNX
         1j6A==
X-Gm-Message-State: AOAM533yL27H4aNo8Yx/GCpptw9jR2kPAem4Q62sDYwpedtfc+3mOTfK
	lJXN9O5GMdMDLOInE/rDe4XnWHnIRFpUbQ==
X-Google-Smtp-Source: ABdhPJxls3X4Dwzd3vmav1eQX64irJdAsItkAm9zja8KHfXubzlQexc1kwXMeBT1Kj6tWlkzWkcFZQ==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr2530479wmb.180.1612513533055;
        Fri, 05 Feb 2021 00:25:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id f6sm7708464wmq.33.2021.02.05.00.25.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:25:32 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] openssh: Backport a fix to fix with glibc 2.33 on some platforms
Date: Fri,  5 Feb 2021 08:25:31 +0000
Message-Id: <20210205082532.1620529-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes openssh failing to work on qemux86 with glibc 2.33 due to
seccomp and the fact new syscalls are used. Also likely fixes issues
on other platforms.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...440ca70abab947acbd77795e9f130967956c.patch | 28 +++++++++++++++++++
 .../openssh/openssh_8.4p1.bb                  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
new file mode 100644
index 00000000000..b88bc18f120
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
@@ -0,0 +1,28 @@
+From 0f90440ca70abab947acbd77795e9f130967956c Mon Sep 17 00:00:00 2001
+From: Darren Tucker <dtucker@dtucker.net>
+Date: Fri, 20 Nov 2020 13:37:54 +1100
+Subject: [PATCH] Add new pselect6_time64 syscall on ARM.
+
+This is apparently needed on armhfp/armv7hl.  bz#3232, patch from
+jjelen at redhat.com.
+---
+ sandbox-seccomp-filter.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Upstream-Status: Backport
+[fixes issues on 32bit IA and probably other 32 bit platforms too with glibc 2.33]
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index e0768c063..5065ae7ef 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -267,6 +267,9 @@ static const struct sock_filter preauth_insns[] = {
+ #ifdef __NR_pselect6
+ 	SC_ALLOW(__NR_pselect6),
+ #endif
++#ifdef __NR_pselect6_time64
++	SC_ALLOW(__NR_pselect6_time64),
++#endif
+ #ifdef __NR_read
+ 	SC_ALLOW(__NR_read),
+ #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index 688fc8a024e..128e2e318a3 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://0f90440ca70abab947acbd77795e9f130967956c.patch \
            "
 SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
-- 
2.27.0

