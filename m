Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6216C109
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 16:00:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w18so2530360wrv.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dhp38Uj/VvvFRJnQq4b+8pSs3sRCe5geveC55ivh7o8=;
	b=PLkE6ffxj5qxpqz7ccnoqIo6bMOxLyilU8Nx1hejb4lggMAT6D2pRW9E9qxZGvakqw
	Czd8LElreKnsJcS5yG57AurifhmoP6OC7w6sYUvpdPfBX6lCKEFgm5m5gEsxMEu44H9P
	UZdElc0VqjW2nxArjR2DwGxcvwikOAC6GMP9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dhp38Uj/VvvFRJnQq4b+8pSs3sRCe5geveC55ivh7o8=;
	b=DVSkHr0McG8j1JF0q9MBpgxwmRx+kB3ht424NkL4uLY2x0pgsvqXzEtDCGjurU7T+O
	+cGbDNS4o9PEQue6H3KBb6OcLVaza2BiW0MsGMgQhEeb7DJ9SckHmxxXjIIOCPeRx+GU
	6DbZZW+wAp32RYMiyhnmoo31BCpIp7USYf3QzWLGlACY17YFZaGnSKdHGqTmJNCFZWm6
	ocO0z2Lyrfr9RsoEwU+C0BcmA4FR8VxYVY413H5H389ErTnnIBczxPs0HkL+470sf597
	owY22J3ICOOmmRvfQW8Tz4hJy7yRSYqJjDM/6VOo/Rutt9UgtKOi9tgYhRFwsA9NPv++
	8VhA==
X-Gm-Message-State: APjAAAUdwFgMM/67g6MuVA6ulj5I4+u24RjKH3WwwlzoNeswD9cllSnv
	QdMxTu5X67U7vo72ihu2tTBbyfhl0Vo=
X-Google-Smtp-Source: APXvYqysKGWEDw4VlNlgDK1UuAOP7JXpKOr8aKf9qmEkQ9zt7u1yerjWvJ7RkF1BNvVXRx9ZAuhzdw==
X-Received: by 2002:adf:ef0c:: with SMTP id e12mr56159717wro.170.1555516804939;
	Wed, 17 Apr 2019 09:00:04 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t81sm5290330wmb.5.2019.04.17.09.00.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 09:00:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 16:59:45 +0100
Message-Id: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' ptest execution image
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
X-List-Received-Date: Wed, 17 Apr 2019 16:00:04 -0000
Content-Transfer-Encoding: 8bit

Create a common include file which lists recipes that have ptests divided
into 'fast' and 'slow' groups. This allows us to include ptests which otherwise
may not get included in images and allows us to test the faster running things
more regularly.

The new image allows access to these faster executing tests. 'fast' is defined
as tests which execute in under 30s roughly speaking.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../distro/include/ptest-packagelists.inc     | 75 +++++++++++++++++++
 .../images/core-image-sato-ptest-fast.bb      | 16 ++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/conf/distro/include/ptest-packagelists.inc
 create mode 100644 meta/recipes-sato/images/core-image-sato-ptest-fast.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
new file mode 100644
index 00000000000..768ba743ed0
--- /dev/null
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -0,0 +1,75 @@
+#
+# Lists of the ptests in OE-Core, sorted into two sets by the time they take
+#
+# ptests which take less than ~30s each
+#
+PTESTS_FAST = "\
+    acl-ptest \
+    apr-ptest \
+    apr-util-ptest \
+    attr-ptest \
+    bluez5-ptest \
+    bzip2-ptest \
+    dbus-test-ptest \
+    diffstat-ptest \
+    diffutils-ptest \
+    elfutils-ptest \
+    ethtool-ptest \
+    flex-ptest \
+    gawk-ptest \
+    gdbm-ptest \
+    gdk-pixbuf-ptest \
+    gzip-ptest \
+    json-glib-ptest \
+    kbd-ptest \
+    libconvert-asn1-perl-ptest \
+    liberror-perl-ptest \
+    libpcre-ptest \
+    libtimedate-perl-ptest \
+    libtest-needs-perl-ptest \
+    liburi-perl-ptest \
+    libusb1-ptest \
+    libxml-namespacesupport-perl-ptest \
+    libxml-perl-ptest \
+    libxml-parser-perl-ptest \
+    libxml-sax-perl-ptest \
+    libxml-sax-base-perl-ptest \
+    libxml-simple-perl-ptest \
+    libxml2-ptest \
+    lzo-ptest \
+    nettle-ptest \
+    openssl-ptest \
+    opkg-ptest \
+    pango-ptest \
+    parted-ptest \
+    quilt-ptest \
+    sed-ptest \
+    slang-ptest \
+    zlib-ptest \
+"
+
+#PTESTS_PROBLEMS = "\
+#    qemu-ptest \ # Doesn't run any tests?
+#    ruby-ptest \ # Timeout
+#    mdadm-ptest \ # Timeout
+#    clutter-1.0-ptest \ # Doesn't build due to depends on cogl-1.0
+#"
+
+PTESTS_SLOW = "\
+    bash-ptest \
+    busybox-ptest \
+    e2fsprogs-ptest \
+    glib-2.0-ptest \
+    gstreamer1.0-ptest \
+    libevent-ptest \
+    lttng-tools-ptest \
+    openssh-ptest \
+    openssl-ptest \
+    perl-ptest \
+    python-ptest \
+    python3-ptest \
+    strace-ptest \
+    tcl-ptest \
+    util-linux-ptest \
+    valgrind-ptest \
+"
diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
new file mode 100644
index 00000000000..b794a7dc9e9
--- /dev/null
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -0,0 +1,16 @@
+require core-image-sato-sdk.bb
+require conf/distro/include/ptest-packagelists.inc
+
+IMAGE_INSTALL += "${PTESTS_FAST}"
+
+DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
+
+# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 1500MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
-- 
2.20.1


