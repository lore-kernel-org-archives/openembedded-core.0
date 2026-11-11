Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3721.1794377110340635008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PJLZMSZp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=afA7z/vB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1c935d015-7b0c19bd-2e5c-4ec9-8791-5cdf9d534ac8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6jcyl/7gww9M+iaC5U7bxY0eaRur7j27PuyzPfwzkpY=;
	b=PJLZMSZpWom0cz9N6cKdzsU1X89aVutwXddjlgiNJGfc2B95uWsxFvE3EbvkmNsQ
	jJilWcZVlr0dOkWXC3fv2lEvAdWOBWp3Rtgmb62ySMMSktWSZ/PsCiQ6QVplmmxeTfs
	GtVKIq493f+DL40L5b9BGDG8G/2QzcwrorBLlcvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6jcyl/7gww9M+iaC5U7bxY0eaRur7j27PuyzPfwzkpY=;
	b=afA7z/vBxJf1LoQuQlZjckAL71BMlDo2pMlyhKXF9Cpt2YpoEmrtjd9Iokwbm/r6
	4ToKfqYKICiesw309PVD3lR/PrKnRJs67XJk5TLQ/6R3NWOb2DDzAx7yuHK6h5hws9q
	A52Zh/goFlSaRXa7m8DEV+BzNMj/GGvkLrdPRkYk=
Content-Type: multipart/mixed; boundary="===============4301507542882105795=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.99.1 FAILED
Message-ID: <010101a1c935d015-7b0c19bd-2e5c-4ec9-8791-5cdf9d534ac8-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249954

--===============4301507542882105795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.99.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.99.0-1.99.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 78461699127ceea55bbc68880c5b08f62ed33f9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:27:14 +0000
Subject: [PATCH] pseudo: upgrade 1.99.0 -> 1.99.1

Makefile.in: Declare 1.99.1
README.security: Add information specific to file/process security
test-chroot-proc-dev: Add /proc and /dev within a chroot test
test-proc-fd: Add a stale directory descriptor case
pseudo_client.h: remove dangling pseudo_client_fdpath declaration
pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
makewrappers: Allow the wrapper architecture to be set for cross builds
makewrappers: Change 'Warning' to 'Info'
makewrappers: Don't generate unused _int paths with noignore_path
ports: Remove Darwin (macOS) support
test: Skip open_tree tests when the function or syscall is unavailable
ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers
---
 .../pseudo/files/older-glibc-symbols.patch    | 57 -------------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  5 +-
 2 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
deleted file mode 100644
index f42b32b8d9..0000000000
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-If we link against a newer glibc 2.34 and then try and our LD_PRELOAD is run against a
-binary on a host with an older libc, we see symbol errors since in glibc 2.34, pthread 
-and dl are merged into libc itself.
-
-We need to use the older form of linking so use glibc binaries from an older release
-to force this. We only use minimal symbols from these anyway.
-
-pthread_atfork is problematic, particularly on arm so use the internal glibc routine
-it maps too. This was always present in the main libc from 2.3.2 onwards.
-
-Yes this is horrible. Better solutions welcome.
-
-There is more info in the bug: [YOCTO #14521]
-
-Upstream-Status: Inappropriate [this patch is native and nativesdk]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Tweak library search order, make prebuilt lib ahead of recipe lib
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in       | 2 +-
- pseudo_wrappers.c | 5 ++++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
- libpseudo: $(LIBPSEUDO)
- 
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
--	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
-+	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
- 		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
- 
-diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
---- a/pseudo_wrappers.c
-+++ b/pseudo_wrappers.c
-@@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
- 	pseudo_mutex_holder = 0;
- }
- 
-+extern void *__dso_handle;
-+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
-+
- static void
- _libpseudo_init(void) {
- 	if (!_libpseudo_initted)
--		pthread_atfork(NULL, NULL, libpseudo_atfork_child);
-+		__register_atfork (NULL, NULL, libpseudo_atfork_child, &__dso_handle == NULL ? NULL : __dso_handle);
- 
- 	pseudo_getlock();
- 	pseudo_antimagic();
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c0332dc9e2..2a01428498 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
@@ -12,8 +13,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "75222afce8836d12e58b7e85c2dd6057518257a1"
-PV = "1.99.0+git"
+SRCREV = "55ec42526b629081805b5ebfaee9fa2c952895aa"
+PV = "1.99.1"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============4301507542882105795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb: Unable to get checksum for nativesdk-pseudo SRC_URI entry older-glibc-symbols.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.1/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.1/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.1/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.1/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============4301507542882105795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pseudo-changelog.txt"

Makefile.in: Declare 1.99.1
README.security: Add information specific to file/process security
test-chroot-proc-dev: Add /proc and /dev within a chroot test
test-proc-fd: Add a stale directory descriptor case
pseudo_client.h: remove dangling pseudo_client_fdpath declaration
pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
makewrappers: Allow the wrapper architecture to be set for cross builds
makewrappers: Change 'Warning' to 'Info'
makewrappers: Don't generate unused _int paths with noignore_path
ports: Remove Darwin (macOS) support
test: Skip open_tree tests when the function or syscall is unavailable
ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers

--===============4301507542882105795==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.99.0-1.99.1.patch"

RnJvbSA3ODQ2MTY5OTEyN2NlZWE1NWJiYzY4ODgwYzViMDhmNjJlZDMzZjliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6Mjc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c2V1ZG86IHVwZ3JhZGUgMS45OS4wIC0+IDEuOTkuMQoKTWFrZWZpbGUuaW46IERlY2xhcmUgMS45
OS4xClJFQURNRS5zZWN1cml0eTogQWRkIGluZm9ybWF0aW9uIHNwZWNpZmljIHRvIGZpbGUvcHJv
Y2VzcyBzZWN1cml0eQp0ZXN0LWNocm9vdC1wcm9jLWRldjogQWRkIC9wcm9jIGFuZCAvZGV2IHdp
dGhpbiBhIGNocm9vdCB0ZXN0CnRlc3QtcHJvYy1mZDogQWRkIGEgc3RhbGUgZGlyZWN0b3J5IGRl
c2NyaXB0b3IgY2FzZQpwc2V1ZG9fY2xpZW50Lmg6IHJlbW92ZSBkYW5nbGluZyBwc2V1ZG9fY2xp
ZW50X2ZkcGF0aCBkZWNsYXJhdGlvbgpwc2V1ZG9fY2xpZW50OiByZXNvbHZlIC9wcm9jLzxwaWQ+
L2ZkLzxuPiB0byB0aGUgZGVzY3JpcHRvcgptYWtld3JhcHBlcnM6IEFsbG93IHRoZSB3cmFwcGVy
IGFyY2hpdGVjdHVyZSB0byBiZSBzZXQgZm9yIGNyb3NzIGJ1aWxkcwptYWtld3JhcHBlcnM6IENo
YW5nZSAnV2FybmluZycgdG8gJ0luZm8nCm1ha2V3cmFwcGVyczogRG9uJ3QgZ2VuZXJhdGUgdW51
c2VkIF9pbnQgcGF0aHMgd2l0aCBub2lnbm9yZV9wYXRoCnBvcnRzOiBSZW1vdmUgRGFyd2luICht
YWNPUykgc3VwcG9ydAp0ZXN0OiBTa2lwIG9wZW5fdHJlZSB0ZXN0cyB3aGVuIHRoZSBmdW5jdGlv
biBvciBzeXNjYWxsIGlzIHVuYXZhaWxhYmxlCnBvcnRzL2xpbnV4L2d1dHM6IEZpeCB1bmluaXRp
YWxpemVkIHBzZXVkb19wYXRoIGluIG9wZW5fdHJlZSB3cmFwcGVycwotLS0KIC4uLi9wc2V1ZG8v
ZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaCAgICB8IDU3IC0tLS0tLS0tLS0tLS0tLS0t
LS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYiAgICB8ICA1ICst
CiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy9vbGRlci1n
bGliYy1zeW1ib2xzLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bz
ZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BzZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBmNDJiMzJiOGQ5Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDU3ICswLDAgQEAKLUlmIHdlIGxpbmsgYWdhaW5zdCBhIG5ld2VyIGdsaWJj
IDIuMzQgYW5kIHRoZW4gdHJ5IGFuZCBvdXIgTERfUFJFTE9BRCBpcyBydW4gYWdhaW5zdCBhCi1i
aW5hcnkgb24gYSBob3N0IHdpdGggYW4gb2xkZXIgbGliYywgd2Ugc2VlIHN5bWJvbCBlcnJvcnMg
c2luY2UgaW4gZ2xpYmMgMi4zNCwgcHRocmVhZCAKLWFuZCBkbCBhcmUgbWVyZ2VkIGludG8gbGli
YyBpdHNlbGYuCi0KLVdlIG5lZWQgdG8gdXNlIHRoZSBvbGRlciBmb3JtIG9mIGxpbmtpbmcgc28g
dXNlIGdsaWJjIGJpbmFyaWVzIGZyb20gYW4gb2xkZXIgcmVsZWFzZQotdG8gZm9yY2UgdGhpcy4g
V2Ugb25seSB1c2UgbWluaW1hbCBzeW1ib2xzIGZyb20gdGhlc2UgYW55d2F5LgotCi1wdGhyZWFk
X2F0Zm9yayBpcyBwcm9ibGVtYXRpYywgcGFydGljdWxhcmx5IG9uIGFybSBzbyB1c2UgdGhlIGlu
dGVybmFsIGdsaWJjIHJvdXRpbmUKLWl0IG1hcHMgdG9vLiBUaGlzIHdhcyBhbHdheXMgcHJlc2Vu
dCBpbiB0aGUgbWFpbiBsaWJjIGZyb20gMi4zLjIgb253YXJkcy4KLQotWWVzIHRoaXMgaXMgaG9y
cmlibGUuIEJldHRlciBzb2x1dGlvbnMgd2VsY29tZS4KLQotVGhlcmUgaXMgbW9yZSBpbmZvIGlu
IHRoZSBidWc6IFtZT0NUTyAjMTQ1MjFdCi0KLVVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbdGhpcyBwYXRjaCBpcyBuYXRpdmUgYW5kIG5hdGl2ZXNka10KLVNpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgotCi1Ud2Vh
ayBsaWJyYXJ5IHNlYXJjaCBvcmRlciwgbWFrZSBwcmVidWlsdCBsaWIgYWhlYWQgb2YgcmVjaXBl
IGxpYgotU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29t
PgotLS0tCi0gTWFrZWZpbGUuaW4gICAgICAgfCAyICstCi0gcHNldWRvX3dyYXBwZXJzLmMgfCA1
ICsrKystCi0gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Ci0KLWRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi0tLS0gYS9NYWtlZmls
ZS5pbgotKysrIGIvTWFrZWZpbGUuaW4KLUBAIC0xMjAsNyArMTIwLDcgQEAgJChQU0VVRE9EQik6
IHBzZXVkb2RiLm8gJChTSE9CSlMpICQoREJPQkpTKSBwc2V1ZG9faXBjLm8gfCAkKEJJTikKLSBs
aWJwc2V1ZG86ICQoTElCUFNFVURPKQotIAotICQoTElCUFNFVURPKTogJChXUkFQT0JKUykgcHNl
dWRvX2NsaWVudC5vIHBzZXVkb19jbGllbnRfc2NhbmYubyBwc2V1ZG9faXBjLm8gJChTSE9CSlMp
IHwgJChMSUIpCi0tCSQoQ0MpICQoQ0ZMQUdTKSAkKENGTEFHU19QU0VVRE8pIC1zaGFyZWQgLW8g
JChMSUJQU0VVRE8pIFwKLSsJJChDQykgJChDRkxBR1MpICAtTHByZWJ1aWx0LyQoc2hlbGwgdW5h
bWUgLW0pLWxpbnV4L2xpYi8gJChDRkxBR1NfUFNFVURPKSAtc2hhcmVkIC1vICQoTElCUFNFVURP
KSBcCi0gCQlwc2V1ZG9fY2xpZW50Lm8gcHNldWRvX2NsaWVudF9zY2FuZi5vIHBzZXVkb19pcGMu
byBcCi0gCQkkKFdSQVBPQkpTKSAkKFNIT0JKUykgJChMREZMQUdTKSAkKENMSUVOVF9MREZMQUdT
KQotIAotZGlmZiAtLWdpdCBhL3BzZXVkb193cmFwcGVycy5jIGIvcHNldWRvX3dyYXBwZXJzLmMK
LS0tLSBhL3BzZXVkb193cmFwcGVycy5jCi0rKysgYi9wc2V1ZG9fd3JhcHBlcnMuYwotQEAgLTEw
MCwxMCArMTAwLDEzIEBAIHN0YXRpYyB2b2lkIGxpYnBzZXVkb19hdGZvcmtfY2hpbGQodm9pZCkK
LSAJcHNldWRvX211dGV4X2hvbGRlciA9IDA7Ci0gfQotIAotK2V4dGVybiB2b2lkICpfX2Rzb19o
YW5kbGU7Ci0rZXh0ZXJuIGludCBfX3JlZ2lzdGVyX2F0Zm9yayAodm9pZCAoKikgKHZvaWQpLCB2
b2lkICgqKSAodm9pZCksIHZvaWQgKCopICh2b2lkKSwgdm9pZCAqKTsKLSsKLSBzdGF0aWMgdm9p
ZAotIF9saWJwc2V1ZG9faW5pdCh2b2lkKSB7Ci0gCWlmICghX2xpYnBzZXVkb19pbml0dGVkKQot
LQkJcHRocmVhZF9hdGZvcmsoTlVMTCwgTlVMTCwgbGlicHNldWRvX2F0Zm9ya19jaGlsZCk7Ci0r
CQlfX3JlZ2lzdGVyX2F0Zm9yayAoTlVMTCwgTlVMTCwgbGlicHNldWRvX2F0Zm9ya19jaGlsZCwg
Jl9fZHNvX2hhbmRsZSA9PSBOVUxMID8gTlVMTCA6IF9fZHNvX2hhbmRsZSk7Ci0gCi0gCXBzZXVk
b19nZXRsb2NrKCk7Ci0gCXBzZXVkb19hbnRpbWFnaWMoKTsKLS0tIAotMi4yNy4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgppbmRleCBjMDMzMmRjOWUyLi4y
YTAxNDI4NDk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVk
b19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJi
CkBAIC0zLDYgKzMsNyBAQCByZXF1aXJlIHBzZXVkby5pbmMKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvcHNldWRvO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAog
ICAgICAgICAgICBmaWxlOi8vZmFsbGJhY2stcGFzc3dkIFwKICAgICAgICAgICAgZmlsZTovL2Zh
bGxiYWNrLWdyb3VwIFwKKyAgICAgICAgICAgaHR0cDovL2Rvd25sb2Fkcy55b2N0b3Byb2plY3Qu
b3JnL21pcnJvci9zb3VyY2VzL3BzZXVkby1wcmVidWlsdC0yLjMzLnRhci54ejtzdWJkaXI9JHtC
Ql9HSVRfREVGQVVMVF9ERVNUU1VGRklYfS9wcmVidWlsdDtuYW1lPXByZWJ1aWx0IFwKICAgICAg
ICAgICAgIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgaHR0cDovL2Rv
d25sb2Fkcy55b2N0b3Byb2plY3Qub3JnL21pcnJvci9zb3VyY2VzL3BzZXVkby1wcmVidWlsdC0y
LjMzLnRhci54ejtzdWJkaXI9JHtCQl9HSVRfREVGQVVMVF9ERVNUU1VGRklYfS9wcmVidWlsdDtu
YW1lPXByZWJ1aWx0IFwKQEAgLTEyLDggKzEzLDggQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0
aXZlc2RrID0gIiBcCiAgICAgZmlsZTovL29sZGVyLWdsaWJjLXN5bWJvbHMucGF0Y2giCiBTUkNf
VVJJW3ByZWJ1aWx0LnNoYTI1NnN1bV0gPSAiZWQ5ZjQ1Njg1NmU5ZDg2MzU5ZjE2OWY0NmE3MGFk
N2JlNDE5MGQ2MDQwMjgyYjg0YzhkOTdiOTkwNzI0ODVhYSIKIAotU1JDUkVWID0gIjc1MjIyYWZj
ZTg4MzZkMTJlNThiN2U4NWMyZGQ2MDU3NTE4MjU3YTEiCi1QViA9ICIxLjk5LjArZ2l0IgorU1JD
UkVWID0gIjU1ZWM0MjUyNmI2MjkwODE4MDViNWViZmFlZTlmYTJjOTUyODk1YWEiCitQViA9ICIx
Ljk5LjEiCiAKICMgbGFyZ2VmaWxlIGFuZCA2NGJpdCB0aW1lX3Qgc3VwcG9ydCBhZGRzIHRoZXNl
IG1hY3JvcyB2aWEgY29tcGlsZXIgZmxhZ3MgZ2xvYmFsbHkKICMgcmVtb3ZlIHRoZW0gZm9yIHBz
ZXVkbyBzaW5jZSBwc2V1ZG8gaW50ZXJjZXB0cyBzb21lIG9mIHRoZSBmdW5jdGlvbnMgd2hpY2gg
d2lsbCBiZQotLSAKMi40Ny4xCgo=

--===============4301507542882105795==--
