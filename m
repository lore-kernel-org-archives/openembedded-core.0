Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5337F3A9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 19:41:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4634kq2s1yz8L
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565120483;
	bh=M/S69tGYKkYJ+wy9UnG00hoA9xBdcBMifACxtXUYf2I=;
	h=From:To:Subject:Date:From;
	b=lTHRV+0Ogwb3QUivzTk6+/kQMgxOtkJODb9XIykNaNx88s6SL3x0quOoU5zMF9Zow
	RQYBsRENw0q/BOb33iDJyPCq0Bj+5ZniHln4hi1hajBC0G1kuY9mEkJnZpnfNwkgQS
	6o1d25qSNE7fvL0jpYibvNifzEiVjnQ+nhOsbNMXaCfhC4+/Trq48mKICl3mVnkgYE
	kgrUvEUX50HGCaFVFnknZDufhaFpFgCEpNPEZv+OpbWAZk2t9QD0EenPQVBFoOBUgD
	dBl1mCnn7VJt/oWYri0ak9IISIoNCKo+L1HrYpaSwAr9PGYngsETwIfxxit5nVwRXn
	F2YzAEuM1Xsv2lM3Gvv7odh5shzJjKWUjF/U+RUPIXSs2r2qtOT8BsYMbzZGjMJsQg
	/jssCaWCs7xQLjuM2Wu+ECplFK6BEp93mjOogWNeT+ktZPXQthTqCwVDJOcsVjgYVe
	1hVc1Jqf9cAm26+1u/jndpyQDP0v5f2GnFg+i3QyiMyuSVURhiFhWEPtQuG59YC6uE
	ZSC0zetdx1SU7g2ZJ5aDKncOyH6AgPh2bShFL/7hNFQ3/+fs+4VqkONvJlSHKVgarc
	++Dby99jtL29056RfdHe3H+GzUSPoqs7RsS/xpoC/V83xG7E9eehEnSmSIF8GsR5g9
	vf04QXvfwdepMQzsQ2mTXihI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 22:41:22 +0300
Message-Id: <20190806194122.22430-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] systemd: Backport OpenSSL BUF_MEM fix
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
X-List-Received-Date: Tue, 06 Aug 2019 19:41:23 -0000

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
---
 ...Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch | 41 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch b/meta/recipes-core/systemd/systemd/0001-resolved-Fix-incorrect-use-of-OpenSSL-BUF_MEM.patch
new file mode 100644
index 0000000000..f0ae1db60d
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
index eb3242d624..3ebbbb7897 100644
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
2.17.1


