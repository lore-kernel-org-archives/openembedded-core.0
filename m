Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E71A078472
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:20:55 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id t3so5233747pgt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lC+X0rA5Fu239FpvywfM5W2mkOYz7kOxpIMlaWTT2ms=;
	b=qlp3BrOd9SUlONErbyMYfJoDn8stAZDtGV9SosIuR9iLeYbxDSh+goklMub5JeV4xK
	j5WGBz85tNFrA+7et+H6d0xkTJMD8x0wO7tOEibFbFyv+w+vouioFlLGKgoNBXDzwZBl
	gq4n0UkVRRWIQs8a9cPxQPfKiuFbH87253/IVfJq2wPlw8heGoyO/RUP89vaZTFP0iML
	eTmqb0KreWOs1USN9W13me17RrL+LFED0aJxQOP4DvG0JZQNVeRtrgj8MnFAuB4Ee8KM
	N0z7OITcSjMAl0W1GmIPj0x7HzgwJqv8G0raehfEndLnyTknZ7LuwDe0ykIA4ZIvCUMA
	jPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lC+X0rA5Fu239FpvywfM5W2mkOYz7kOxpIMlaWTT2ms=;
	b=NUfGRGDCEHiSFy+XGgVAxpxv/9x5jli2lIyji2RVPcI4P9qTU/w6LoswicLkOnfBiO
	OMYEJxLh6vvsfrNq7mSHZQQmCoWFMauit6YQN6KiVgS9Sb85PqkEa5Ne33XFgLKSH7K/
	nG4LBjIRYiu5fLLZWxsWRHjiMwQE0ecSBWhy0/G5L8sVwHLeZsxSyFdW4+tb8ckLs4N5
	4/IM8+X2wnkX+HqAN0OA6L/+LN32PFHphJNKbt84FCNwXJ446zJ7qy9HJcDExflhUsYT
	uVM+K7NQfTYZDkBCzsp2lCIqyai2oYAExzFladsrSHFt8c2FdtP7xa6oLMEcRf26ZDio
	PKWg==
X-Gm-Message-State: AHPjjUg2j6yyXfkaxXuIZAJJJqa7fR+6x+XpnS8scjbUXZilnab7STMo
	E+t3yjhGWfA2rkI0
X-Google-Smtp-Source: ADKCNb5SqgSqajLHEkW2xwpnLsMXF2PWCjlVB3m1Hm9akCWENJHLjvRdV1u6oaA72zzMLPWe0C1YLQ==
X-Received: by 10.84.131.129 with SMTP id d1mr1012056pld.114.1504243257153;
	Thu, 31 Aug 2017 22:20:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	d63sm1672642pfc.40.2017.08.31.22.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 22:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 22:20:40 -0700
Message-Id: <20170901052040.24311-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] pulseaudio: Backport a patch to replace use of VLAIS
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
X-List-Received-Date: Fri, 01 Sep 2017 05:20:56 -0000

Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-don-t-use-variable-length-array-in-union.patch | 59 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_10.0.bb                  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
new file mode 100644
index 0000000000..11b56abd26
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
@@ -0,0 +1,59 @@
+From patchwork Sat Feb  4 12:19:01 2017
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [pulseaudio-discuss] iochannel: don't use variable length array in
+ union
+From: Tanu Kaskinen <tanuk@iki.fi>
+X-Patchwork-Id: 136885
+Message-Id: <20170204121901.17428-1-tanuk@iki.fi>
+To: pulseaudio-discuss@lists.freedesktop.org
+Date: Sat,  4 Feb 2017 14:19:01 +0200
+
+Clang didn't like the variable length array:
+
+pulsecore/iochannel.c:358:17: error: fields must have a constant size:
+'variable length array in structure' extension will never be supported
+        uint8_t data[CMSG_SPACE(sizeof(int) * nfd)];
+                ^
+
+Commit 451d1d6762 introduced the variable length array in order to have
+the correct value in msg_controllen. This patch reverts that commit and
+uses a different way to achieve the same goal.
+
+BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=99458
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ src/pulsecore/iochannel.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/pulsecore/iochannel.c b/src/pulsecore/iochannel.c
+index 8ace297ff..897337522 100644
+--- a/src/pulsecore/iochannel.c
++++ b/src/pulsecore/iochannel.c
+@@ -355,7 +355,7 @@ ssize_t pa_iochannel_write_with_fds(pa_iochannel*io, const void*data, size_t l,
+     struct iovec iov;
+     union {
+         struct cmsghdr hdr;
+-        uint8_t data[CMSG_SPACE(sizeof(int) * nfd)];
++        uint8_t data[CMSG_SPACE(sizeof(int) * MAX_ANCIL_DATA_FDS)];
+     } cmsg;
+ 
+     pa_assert(io);
+@@ -382,7 +382,13 @@ ssize_t pa_iochannel_write_with_fds(pa_iochannel*io, const void*data, size_t l,
+     mh.msg_iov = &iov;
+     mh.msg_iovlen = 1;
+     mh.msg_control = &cmsg;
+-    mh.msg_controllen = sizeof(cmsg);
++
++    /* If we followed the example on the cmsg man page, we'd use
++     * sizeof(cmsg.data) here, but if nfd < MAX_ANCIL_DATA_FDS, then the data
++     * buffer is larger than needed, and the kernel doesn't like it if we set
++     * msg_controllen to a larger than necessary value. The commit message for
++     * commit 451d1d6762 contains a longer explanation. */
++    mh.msg_controllen = CMSG_SPACE(sizeof(int) * nfd);
+ 
+     if ((r = sendmsg(io->ofd, &mh, MSG_NOSIGNAL)) >= 0) {
+         io->writable = io->hungup = false;
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
index f3a85737fc..9a34afaa7e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
@@ -3,6 +3,7 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch \
            file://volatiles.04_pulse \
 "
 SRC_URI[md5sum] = "4950d2799bf55ab91f6b7f990b7f0971"
-- 
2.14.1


