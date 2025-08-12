Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D49DC87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 13:09:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.73654.1755004147210022241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 06:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ux7W93kX;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af96524c5a9so707847966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755004145; x=1755608945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WseUrvUxD2XFZGMKZfteLk0q8/vbTABICSyv0ZLkU1k=;
        b=Ux7W93kXpGswCfVfN581lUOLP9DuyDQEFmZFO/Z0YHgOWUEd+Ep7ngPJd2CUzt+g05
         VZ2hpPrefs0Dk41TfxrBAX621qgyIuGeQagIFoW89+M97kGfrQwNkJ6Ifv7k0BXdxCI8
         bRrfAZzZOsYzQtFuk6tw9tqzkzSvSLlXf1Vm7yw/daIqoEbb4gzPXKYXgOwtMHOklf5Q
         KmYpOrix887w+Dqjv+ixIN8/el02YlnjekEg7R4bNb2QL0YgahNbjTQNPAXePx3xb5iB
         IP6lyg2cRgoGfvynCOH3n2V61/Q55a97hMEjSVIRJt4oqiVtciwsZleGRun6KQ66aNuK
         ChpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004145; x=1755608945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WseUrvUxD2XFZGMKZfteLk0q8/vbTABICSyv0ZLkU1k=;
        b=Bm/r/DAr/9AFAJeG0nqEaO3eHjFItiz96Er9VnUrG0ghmEFhjWqa84/ZFP+VYebHKM
         xa9eeBLHDS17yRFDPGvC9PRskCP/+zuWkV/59pEp9b40JN+eMDJpRCT1/pTa4i5z8oEf
         3e2kZT4WV03DSkMc4KQ4WS1+26PwJ+XrltZHxwNrajcgkEWKOREL/1lxLfYned0hdSoO
         ov2vXFu3IAH6UFVdwnaAexf9CHl9tOl5VkYWPxVIObwNimkt1XOWlFlmpqBVaAg9jRSe
         22H4Yo0hJGQ22265WBiwPAT8Q6Jt/JKdDzg6rAmP4ex0w3D7esFGHDn6W7SwIXXlgltX
         HFwA==
X-Gm-Message-State: AOJu0Yz+KzB5J42ltOaWoeo35q42JMA+WjwN2jTkLWGXr4zd97mo3FBH
	Z4BRFjorDz9LTjWuhRSaKO7fh0+q+0v+Py9BPMto6LBBdNP4onq1B+Rada/T6w==
X-Gm-Gg: ASbGnctdmAK6KMwR4f/Rp2tEWTY6Z/if99pJSX4YmPcQQd4OgRbWvCpFKuuILJrYLg+
	amZLaRRqyXPh4wnSrRsSrUEGVp7yeXjC+TodLdTPDrdeMOn1NbSNpl0AlZRumfCqWEwOOtwA+MB
	uL83HNcHhpvpKM7dQGYpsNanNcx+JTu+8IteGj5cLbjGeoNgf6Gzl8sCJSfatOWEW4rxHKQZI1i
	GoK9CyiOA1GPq7ty/tcgRGpi8vEfsnHzvMg2F0HLTuHnT2dBzuwZPDOWP5t27/dppd1kDLCxVyR
	LPwoG6U0+TpIT7HTSPGr9ZhTOlfuNyovzo9JF6bsdHHrgi4ON4MD4w7F0+gKKHNHMDFjm+BBSOd
	16/mGvzyTZkqU9OefE6Q=
X-Google-Smtp-Source: AGHT+IGJb9sTbK50Aj8VUoLkcXq5FxAOOIFVO70fnTt8cDKhaXpE7iSufJIglexXxmiqrs+uqPH9MA==
X-Received: by 2002:a17:907:72c3:b0:af9:14cf:d820 with SMTP id a640c23a62f3a-af9c634f015mr1448002066b.12.1755004145064;
        Tue, 12 Aug 2025 06:09:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91dfd4b31sm2171154866b.85.2025.08.12.06.09.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:09:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] logrotate: avoid testing localized strings
Date: Tue, 12 Aug 2025 15:09:03 +0200
Message-ID: <20250812130903.3924399-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221768

During running ptests, the test suite checks for a localized error string
which is different between libc and musl, making this test to fail.

Backport an upstream patch that fixes this by not checking for this particular
error message.

This fixes partially https://bugzilla.yoctoproject.org/show_bug.cgi?id=15811
[YOCTO #15811]

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-avoid-locale-dependent-errno-string.patch | 27 +++++++++++++++++++
 .../logrotate/logrotate_3.22.0.bb             |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/logrotate/logrotate/0001-test-avoid-locale-dependent-errno-string.patch

diff --git a/meta/recipes-extended/logrotate/logrotate/0001-test-avoid-locale-dependent-errno-string.patch b/meta/recipes-extended/logrotate/logrotate/0001-test-avoid-locale-dependent-errno-string.patch
new file mode 100644
index 0000000000..efee91252d
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate/0001-test-avoid-locale-dependent-errno-string.patch
@@ -0,0 +1,27 @@
+From 04b21743980c4e236ca5e8de18173fbd3848573b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Sat, 8 Jun 2024 17:59:40 +0200
+Subject: [PATCH] test: avoid locale dependent errno string
+
+String representations of errno values are locale dependent, thus avoid
+using them.
+
+Upstream-Status: Backport [https://github.com/logrotate/logrotate/commit/04b21743980c4e236ca5e8de18173fbd3848573b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/test-0112.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/test-0112.sh b/test/test-0112.sh
+index 812632b..fa9eed6 100755
+--- a/test/test-0112.sh
++++ b/test/test-0112.sh
+@@ -23,7 +23,7 @@ test_reg.log.1.gz 1 zero
+ test_reg.log.2.gz 1 first
+ EOF
+ 
+-grep "test_fifo.log.1 (read-only) for compression: Operation not supported" error.log >/dev/null
++grep "^error: unable to open .*/test_fifo\.log\.1 (read-only) for compression: " error.log >/dev/null
+ if [ $? != 0 ]; then
+ 	echo "No error printed, but there should be one."
+ 	exit 3
diff --git a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
index 5c4a0a9807..7995438408 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://run-ptest \
+           file://0001-test-avoid-locale-dependent-errno-string.patch \
            "
 
 SRC_URI[sha256sum] = "42b4080ee99c9fb6a7d12d8e787637d057a635194e25971997eebbe8d5e57618"

