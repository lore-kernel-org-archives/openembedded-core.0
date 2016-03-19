Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A4D3570034
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 07:36:50 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id s5so58411145qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=12eGJOCNvZk91n7QpMOMe5oQjdxSG3D/loJy4cd7i6c=;
	b=wEj6TgTLtkYGj2i6FP22l7y0+kmmuvp3hzjvW2LGKbHniKNQDiJRGPRYpeX1KJ/DfY
	j+yIxNI/QxlEEqvKe+dabuRIk7Si1XTDCQXeyocE0IbSK6pucx2omgF82GiEdH3qWSwH
	IlgqLF/yZthMDRJeNPed/HQxhQKL1wkvYrqpyBoKfZIZBcmN+p6012GyiSPeYyB62dz3
	zMeQFDizT1T0zr87a3b2pGeCVqtLG/gmqb02fuyB6hFsqYuhPhSx6mUij6IkFUqFnb0v
	tRAJF82BoShiILGlEQQT1875Cs93to8X7T/60nMA3E3MqXZpdZ4vluJwnsiUm4Jw9kUH
	ls9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=12eGJOCNvZk91n7QpMOMe5oQjdxSG3D/loJy4cd7i6c=;
	b=Vh+1oS0hSQ3q0g8KovdCLONXyaGfilqTPDGWaDMzP9qmZT5UiJ+e3IYtwFija/CU0O
	CTDZH/92OgAb6PMb+jzYhZiOJBwyJ+dLDjA4L8AEFJJO8x0cE2DpaT8R+IkglERVnAch
	Ldv0OjL2msuEFu5u4CN3RuYUjTpg9CyMFmKDv25/orm6bgWsJPl9YoAD2komuQ6q+X2l
	vk2Ki48u+aap+1o8/GwcFjUyao7zpbmb1/3U4ofhpdsiUGwZM1nHgyFZsknqoGtN0xnR
	m0nXePJdwVrnBFQiog0eAHHkQ1Buuj+NF8xsSP6EHfag4Bh7GdbOqhesC0oh4lbBaycB
	jz5Q==
X-Gm-Message-State: AD7BkJKPlT2XA08+Svx+4jmGmVlu97tfq2xEsFIhxWCroqjiY9UGG3Zw+StPJaR2qSzshg==
X-Received: by 10.55.80.86 with SMTP id e83mr27257587qkb.91.1458373011230;
	Sat, 19 Mar 2016 00:36:51 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	f128sm7693466qhf.30.2016.03.19.00.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Mar 2016 00:36:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org 
Date: Sat, 19 Mar 2016 07:36:42 +0000
Message-Id: <1458373003-13033-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] siteinfo: Move apr configure cache to common-linux
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
X-List-Received-Date: Sat, 19 Mar 2016 07:36:52 -0000

There are variables which are used in all target specific
sitefiles. Move it to common-linux, so it can be effective
for all targets. Usually they will vary based upon libc
e.g. musl does not have process shared mutexes so apr_cv_process_shared_works
should be no for it. For glibc though it should be yes but
existing behaviour is to use 'no' so its left as it is.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/arm-common      | 5 -----
 meta/site/common-linux    | 3 +++
 meta/site/ix86-common     | 4 ----
 meta/site/mips-common     | 3 ---
 meta/site/nios2-linux     | 3 ---
 meta/site/powerpc32-linux | 2 --
 meta/site/sh-common       | 3 ---
 7 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 12e5d45..a3c979f 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -8,11 +8,6 @@ ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
 ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
 ac_cv_sctp=${ac_cv_sctp=no}
 
-# apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 448758b..21fcac1 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -5,6 +5,9 @@ gl_cv_header_working_fcntl_h=${gl_cv_header_working_fcntl_h=yes}
 # apr
 ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
 ac_cv_sizeof_pid_t=${ac_cv_sizeof_pid_t=4}
+ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
+apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
+apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
 
 # samba
 samba_cv_HAVE_IFACE_AIX=${samba_cv_HAVE_IFACE_AIX=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 5cd2ce2..135c305 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -24,7 +24,6 @@ ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=4}
 ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
 ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
 ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
 ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
 ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
 ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
@@ -35,9 +34,6 @@ ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 ac_cv_sctp=${ac_cv_sctp=no}
 
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-
 ac_cv_path_ESD_CONFIG=no
 lf_cv_sane_realloc=yes
 jm_cv_func_gettimeofday_clobber=no
diff --git a/meta/site/mips-common b/meta/site/mips-common
index 89d72cb..5858dfb 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -30,10 +30,7 @@ ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_struct=1
 
 # apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # glib
 glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 9e53e5d..434f09b 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -7,10 +7,7 @@ ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
 ac_cv_sctp=${ac_cv_sctp=no}
 
 # apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index e3929ac..a7744fb 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -38,8 +38,6 @@ cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
 
 
 # apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 
 ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index bde416a..5cbf36a 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -29,9 +29,6 @@ ac_cv_ushort=${ac_cv_ushort=yes}
 ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
 
 # apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 
 ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-- 
1.8.3.1


