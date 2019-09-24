Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id E82B27EC5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:50 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id a24so375455pgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cUARvByYzOwht197J5yWgheTn7bGlmOxrDf+gHbY0J8=;
	b=gTUIlih2rdlcDS4R70ozR3ACNM9d5GdHidoRxA4LqBqZNHH0fuJ0xXOVmPYW6bJYCI
	UtGIVGPtBDrBVeVnasHrQjbkFrZNGKyAsfiUBdhoo2A/sAod1nfqDFJAQvJE3I8LGznv
	CTMa56iCzqspoEjbHY6DoRdn64L9kxamdwI6Cwaz1CZoWzulW6ADqCqvw0yhZBb78O39
	1ZVIVQB4q05jAZxWLhBqaXsIa6sYatDFhGGvRoUs8cVcWKZ9O5jEZKxeBcUsiuKh3BxT
	aLqxA/sku+7o/bZ1p4HcuhEcp/aMiEkZPJtM8bGT5rJQLbrB6YBhpGCJhifctWh2z+g9
	s6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cUARvByYzOwht197J5yWgheTn7bGlmOxrDf+gHbY0J8=;
	b=l1Tlee1goPbDXWQ5W/vLAcX+zNIv25cCt2jPFnZ2NZ3/4s6lN+lVZdlQQjWa2O5Fu/
	glKD8ocY5dSedav/jOTyiyRsOp+5PGjaW+EWFaNnsriDvaC4o6NzSMpupjEMN8UPbs2J
	an2jjrLynO/2/yC+FU+yPJrwUdBvq9FqhcOQs150ZKOjJyfDVchUni5Abmu15fFM9xIZ
	WIQafdV6YgWt6MzfPnSgSaIxVfQglt+aFrmINaXEhB3KepNuo2SsqlvOoKk81Q1X0GWJ
	BAQ9zCo7JrNKbIiVs4wCfk/kqGTTlKcrPSrvqCvbfNgZkcYm/RM9P2GNkSY717ihrf66
	0e1A==
X-Gm-Message-State: APjAAAW1ddFwQicin0gY3ztXxwuljtSis9dMxESyYIZNAI0fkKClqKrt
	v0Axl2mx1WHPCrKxGemDu1uJEDwvGto=
X-Google-Smtp-Source: APXvYqxBodfyb0SmCr6vGqo7guGKSWuT7gXhqnPgS6IUwmScQ6P+PoAP6JcNB7oydciALzQ2Cr1DVQ==
X-Received: by 2002:a17:90a:3d08:: with SMTP id h8mr452460pjc.12.1569293391749;
	Mon, 23 Sep 2019 19:49:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:58 -0700
Message-Id: <d000f85c4dfa791e2e764c9d6126bcc13baea01c.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 18/50] systemd: Backport OpenSSL BUF_MEM fix
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:51 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

Building `systemd-resolve` from systemd 242 with OpenSSL 1.1.1c and enabling
DNS over TLS ends up calling abort (on 32 bit armhf):

  Program terminated with signal SIGABRT, Aborted.
  #0  __libc_do_syscall () at libc-do-syscall.S:49
  49	libc-do-syscall.S: No such file or directory.
  (gdb) where
  #0  __libc_do_syscall () at libc-do-syscall.S:49
  #1  0xb6940ea4 in __libc_signal_restore_set (set=0xbec68b78) at ../sysdeps/unix/sysv/linux/internal-signals.h:84
  #2  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:48
  #3  0xb69336e0 in __GI_abort () at abort.c:79
  #4  0xb6968428 in __libc_message (action=action@entry=do_abort, fmt=<optimized out>) at ../sysdeps/posix/libc_fatal.c:181
  #5  0xb696c7e6 in malloc_printerr (str=<optimized out>) at malloc.c:5352
  #6  0xb696ca1a in munmap_chunk (p=<optimized out>) at malloc.c:2840
  #7  0xb6bd1c4a in CRYPTO_clear_realloc (str=0xd0e59a, old_len=388, num=<optimized out>, file=0xb6c300dc "../../../../../../workspace/sources/openssl/crypto/buffer/buffer.c", line=135)
      at ../../../../../../workspace/sources/openssl/crypto/mem.c:290
  #8  0xb6b5da3a in BUF_MEM_grow_clean (str=0xcfb960, len=len@entry=393) at ../../../../../../workspace/sources/openssl/crypto/buffer/buffer.c:135
  #9  0xb6b486a0 in mem_write (b=0xcf8300, in=0xd07c6b "\027\003\003", inl=24) at ../../../../../../workspace/sources/openssl/crypto/bio/bss_mem.c:235
  #10 0xb6b45c86 in bwrite_conv (bio=<optimized out>, data=<optimized out>, datal=<optimized out>, written=0xbec68ec8) at ../../../../../../workspace/sources/openssl/crypto/bio/bio_meth.c:77
  #11 0xb6b452d4 in bio_write_intern (written=0xbec68ec8, dlen=24, data=0xd07c6b, b=0xcf8300) at ../../../../../../workspace/sources/openssl/crypto/bio/bio_lib.c:343
  #12 bio_write_intern (b=0xcf8300, data=0xd07c6b, dlen=24, written=0xbec68ec8) at ../../../../../../workspace/sources/openssl/crypto/bio/bio_lib.c:320
  #13 0xb6b455b2 in BIO_write (b=<optimized out>, data=<optimized out>, dlen=<optimized out>) at ../../../../../../workspace/sources/openssl/crypto/bio/bio_lib.c:363
  #14 0xb6cabd1a in ssl3_write_pending (s=s@entry=0xcfd2d8, type=type@entry=23, buf=buf@entry=0xcfcc28 "", len=len@entry=2, written=written@entry=0xbec698b0) at ../../../../../../workspace/sources/openssl/ssl/record/rec_layer_s3.c:1146
  #15 0xb6cac72e in do_ssl3_write (s=s@entry=0xcfd2d8, type=type@entry=23, buf=buf@entry=0xcfcc28 "", pipelens=pipelens@entry=0xbec698b4, numpipes=numpipes@entry=1, create_empty_fragment=create_empty_fragment@entry=0,
      written=written@entry=0xbec698b0) at ../../../../../../workspace/sources/openssl/ssl/record/rec_layer_s3.c:1107
  #16 0xb6cac92e in ssl3_write_bytes (s=0xcfd2d8, type=23, buf_=0xcfcc28, len=<optimized out>, written=0xbec699c0) at ../../../../../../workspace/sources/openssl/ssl/record/rec_layer_s3.c:613
  #17 0xb6cb1698 in ssl3_write (s=<optimized out>, buf=0xcfcc28, len=2, written=0xbec699c0) at ../../../../../../workspace/sources/openssl/ssl/s3_lib.c:4460
  #18 0xb6cb87b2 in ssl_write_internal (s=<optimized out>, buf=buf@entry=0xcfcc28, num=num@entry=2, written=written@entry=0xbec699c0) at ../../../../../../workspace/sources/openssl/ssl/ssl_lib.c:1943
  #19 0xb6cb8896 in SSL_write (s=<optimized out>, buf=buf@entry=0xcfcc28, num=num@entry=2) at ../../../../../../workspace/sources/openssl/ssl/ssl_lib.c:1957
  #20 0x004ddac8 in dnstls_stream_write (stream=stream@entry=0xcfca60, buf=0xcfcc28 "", count=2) at ../git/src/resolve/resolved-dnstls-openssl.c:270
  #21 0x004d8d5c in dns_stream_writev (s=s@entry=0xcfca60, iov=iov@entry=0xbec69b4c, iovcnt=iovcnt@entry=2, flags=flags@entry=0) at ../git/src/resolve/resolved-dns-stream.c:225
  #22 0x004d9516 in on_stream_io (es=<optimized out>, fd=<optimized out>, revents=4, userdata=0xcfca60) at ../git/src/resolve/resolved-dns-stream.c:334
  #23 0xb6e7f020 in source_dispatch (s=0xcf3658) at ../git/src/libsystemd/sd-event/sd-event.c:2821
  #24 0xb6e806b0 in sd_event_dispatch (e=e@entry=0xced6d0) at ../git/src/libsystemd/sd-event/sd-event.c:3234
  #25 0xb6e807f6 in sd_event_run (e=0xced6d0, timeout=<optimized out>) at ../git/src/libsystemd/sd-event/sd-event.c:3291
  #26 0xb6e809bc in sd_event_loop (e=0xced6d0) at ../git/src/libsystemd/sd-event/sd-event.c:3312
  #27 0x004bb64c in run (argv=<optimized out>, argc=<optimized out>) at ../git/src/resolve/resolved.c:84
  #28 main (argc=<optimized out>, argv=<optimized out>) at ../git/src/resolve/resolved.c:91

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...lved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch b/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
new file mode 100644
index 0000000..f0ae1db
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
@@ -0,0 +1,41 @@
+From 18bddeaaf225d5becfc10cd2c6a1d037c90574a2 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Tue, 11 Jun 2019 15:10:21 +0200
+Subject: [PATCH] resolved: Fix incorrect use of OpenSSL BUF_MEM
+
+Fixes: #12763
+Upstream-Status: Backport [Not yet released]
+  https://github.com/systemd/systemd/commit/18bddeaaf225d5becfc10cd2c6a1d037c90574a2
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/resolve/resolved-dnstls-openssl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/resolve/resolved-dnstls-openssl.c b/src/resolve/resolved-dnstls-openssl.c
+index f269e4d6487f..5d9223007581 100644
+--- a/src/resolve/resolved-dnstls-openssl.c
++++ b/src/resolve/resolved-dnstls-openssl.c
+@@ -6,6 +6,7 @@
+ 
+ #include <openssl/bio.h>
+ #include <openssl/err.h>
++#include <string.h>
+ 
+ #include "io-util.h"
+ #include "resolved-dns-stream.h"
+@@ -34,9 +35,11 @@ static int dnstls_flush_write_buffer(DnsStream *stream) {
+                         return ss;
+                 } else {
+                         stream->dnstls_data.write_buffer->length -= ss;
+-                        stream->dnstls_data.write_buffer->data += ss;
+ 
+                         if (stream->dnstls_data.write_buffer->length > 0) {
++                                memmove(stream->dnstls_data.write_buffer->data,
++                                        stream->dnstls_data.write_buffer->data + ss,
++                                        stream->dnstls_data.write_buffer->length);
+                                 stream->dnstls_events |= EPOLLOUT;
+                                 return -EAGAIN;
+                         }
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index eb3242d..3ebbbb7 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
+           file://0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch \
            "
 
 # patches needed by musl
-- 
2.7.4


