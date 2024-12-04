Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841BBE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.21208.1733334899065157686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L3MXUNzm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so47095a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334898; x=1733939698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gY37AOd+40VlgKwDeH80euDPfklxH1T+CTOZWLr4uwM=;
        b=L3MXUNzmnHPaoKmUQZh/Ax5p+dNNvFaNvrLlop3EDALGeZTS783dLQmObdNodn/6lK
         lkHRiLYAoH6uhA3K+69iuwaUSZccxrrPU7QpCId1BKoVvwx2du6dwKWdeGnzsJ0xW6ZG
         7DnNQLVOW+W8MdCZY76vFiqmvScELXBGwiD93r8MIto/r2dbEUg1VK8gj/HJs2y4hr6k
         F+oQ0EfxukyTrYSt7I+dQvNAQ7vtcq8voQ5s500U3AkAJNvOAWyfBaZYt83KboGZo0Tx
         9dGmmNsBiZX8TCC6YyrArJ1uGuDgfjZo6hvVmjlSHlaJCYT6rQlBGjmYqgjske5W4UKm
         Fz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334898; x=1733939698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gY37AOd+40VlgKwDeH80euDPfklxH1T+CTOZWLr4uwM=;
        b=KUtM+Zk2Rw2oYXfvVPAStMHecfzLaqp2PecQyysWij0sWEPxUKXZ3eZNgM3oBGpDoP
         rembfO+zwQWKpJuIsi+X3hQBTff9ZUBEyxECTfOagLMIwG+udOHygS+Er939Itsuxh6O
         eICE6Pqk8sLLEh8mqUfcDDTQPSun5GP3evG9LWW2g9vBkNyX+9+oQRNyiCh9jPMg6DlI
         sf73DOIQ1UiRs5GDjZ2wtwFR4s8X4/aCZATC6oZii85H4upK/guaMPa14Jdz6ibtx1U0
         GhwbaVp/JvqgpkhbRunvRy+kM0Lah3mCd6HsjG4hzHJ656+sQkq5PUJ7bLUCXHe/BhAn
         7B3A==
X-Gm-Message-State: AOJu0YwEH+Ub/rkO0jPqwV5BENrC4z1qug1F6Ega57WFM8o+iGYWcBp6
	MJjRZ6gSsx/It9pso62PtXloULYlApJ9iLDKBUMVH4xEl81SNkz0lPYpy1/YURXvFu2XOw8R6Zy
	/
X-Gm-Gg: ASbGncvWZRzh1ppm2fdESU+I05aHHqfDRnqzFluiMGP9x+eT6LikkD4qlRRFYd6x0fa
	nt4REtI+x5CRkEHPSOkORh4VFcNbtCgmSRH/iNIF6fMc3bhLSHe2aSNOuG0/oS1HgB+F77xNvPR
	DPIffKdcWp8PaO3AWSEjBFiv0dIDZkSELSuXff6+CrW/W11S0HWeEV3idw2feJ6xRdUT3eoQpIZ
	ytej7Ft1i7KTqHFIQHz5VyfmO4L/trKxMzH7Sc=
X-Google-Smtp-Source: AGHT+IHk8t6CZEiV7V7WvS8UFUjPJt9CWpKvIfNEPhu4IuHKJty1uMZhWkOaEXaAKieEmHPNM/L7UQ==
X-Received: by 2002:a05:6a20:9188:b0:1db:f057:151d with SMTP id adf61e73a8af0-1e1653f2632mr9665728637.35.1733334898248;
        Wed, 04 Dec 2024 09:54:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/38] diffoscope: fix CVE-2024-25711
Date: Wed,  4 Dec 2024 09:53:52 -0800
Message-Id: <da4977e9414361a30eb322d1456a664515b35693.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208308

From: Jiaying Song <jiaying.song.cn@windriver.com>

diffoscope before 256 allows directory traversal via an embedded
filename in a GPG file. Contents of any file, such as ../.ssh/id_rsa,
may be disclosed to an attacker. This occurs because the value of the
gpg --use-embedded-filenames option is trusted.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-25711

Upstream patches:
https://salsa.debian.org/reproducible-builds/diffoscope/-/commit/458f7f04bc053a0066aa7d2fd3251747d4899476

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../diffoscope/CVE-2024-25711.patch           | 116 ++++++++++++++++++
 .../diffoscope/diffoscope_208.bb              |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch

diff --git a/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch b/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch
new file mode 100644
index 0000000000..de1099c40b
--- /dev/null
+++ b/meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch
@@ -0,0 +1,116 @@
+From 1eda4012c5350efae02fcc058e0a36cc71ad62fd Mon Sep 17 00:00:00 2001
+From: Chris Lamb <lamby@debian.org>
+Date: Fri, 9 Feb 2024 10:43:18 -0800
+Subject: [PATCH] Use a determistic name instead of trusting gpg's
+ --use-embedded-filenames. (Closes: reproducible-builds/diffoscope#361)
+
+... but also expose the embedded name by attaching the ("unstable") output of
+--list-packets.
+
+Many thanks to Daniel Kahn Gillmor <dkg@debian.org> for reporting this issue
+and providing feedback.
+
+Upstream-Status: Backport
+[https://salsa.debian.org/reproducible-builds/diffoscope/-/commit/458f7f04bc053a0066aa7d2fd3251747d4899476]
+
+CVE: CVE-2024-25711
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ diffoscope/comparators/pgp.py | 34 +++++++++++++++++++++++++++++-----
+ tests/comparators/test_pgp.py |  3 ++-
+ 2 files changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/diffoscope/comparators/pgp.py b/diffoscope/comparators/pgp.py
+index eea997b..9215664 100644
+--- a/diffoscope/comparators/pgp.py
++++ b/diffoscope/comparators/pgp.py
+@@ -32,6 +32,8 @@ from .utils.command import Command, our_check_output
+ 
+ logger = logging.getLogger(__name__)
+ 
++re_name = re.compile(r", created \d+, name=\"(?P<name>[^\"]+)\",")
++
+ 
+ class Pgpdump(Command):
+     @tool_required("pgpdump")
+@@ -46,21 +48,31 @@ class Pgpdump(Command):
+         )
+ 
+ 
++class GpgListPackets(Command):
++    @tool_required("gpg")
++    def cmdline(self):
++        return (
++            "gpg",
++            "--no-keyring",
++            "--list-packets",
++            self.path,
++        )
++
++
+ class PGPContainer(Archive):
+     @tool_required("gpg")
+     def open_archive(self):
+-        # Extract to a fresh temporary directory so that we can use the
+-        # embedded filename.
+-
++        # Extract to a fresh temporary directory.
+         self._temp_dir = get_temporary_directory(suffix="pgp")
+ 
+         try:
+             our_check_output(
+                 (
+                     "gpg",
+-                    "--use-embedded-filename",
+                     "--decrypt",
+                     "--no-keyring",
++                    "--output",
++                    os.path.join(self._temp_dir.name, "contents"),
+                     os.path.abspath(self.source.path),
+                 ),
+                 cwd=self._temp_dir.name,
+@@ -75,7 +87,7 @@ class PGPContainer(Archive):
+         self._temp_dir.cleanup()
+ 
+     def get_member_names(self):
+-        # Will only return one filename, taken from the signature file itself.
++        # Will only ever return one filename
+         return os.listdir(self._temp_dir.name)
+ 
+     def extract(self, member_name, dest_dir):
+@@ -136,4 +148,16 @@ class PgpSignature(TextFile):
+             ]
+         )
+ 
++        # ... as well as gpg --list-packets
++        difference.add_details(
++            [
++                Difference.from_operation(
++                    GpgListPackets,
++                    self.path,
++                    other.path,
++                    source="gpg --list-packets",
++                )
++            ]
++        )
++
+         return difference
+diff --git a/tests/comparators/test_pgp.py b/tests/comparators/test_pgp.py
+index 8652ea9..49b3fa0 100644
+--- a/tests/comparators/test_pgp.py
++++ b/tests/comparators/test_pgp.py
+@@ -80,8 +80,9 @@ def test_pgp_signature_identification(signature1, signature2):
+ def test_pgp_signature(signature1, signature2):
+     difference = signature1.compare(signature2)
+     assert_diff(difference, "pgp_signature_expected_diff")
++    assert len(difference.details) == 2
+     assert difference.details[0].source1 == "pgpdump"
+-    assert len(difference.details) == 1
++    assert difference.details[1].source1 == "gpg --list-packets"
+ 
+ 
+ @skip_unless_tools_exist("pgpdump")
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/diffoscope/diffoscope_208.bb b/meta/recipes-support/diffoscope/diffoscope_208.bb
index 3c3b007d60..e4fde88c95 100644
--- a/meta/recipes-support/diffoscope/diffoscope_208.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_208.bb
@@ -12,6 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
+SRC_URI += " file://CVE-2024-25711.patch"
 SRC_URI[sha256sum] = "2c5c0ac1159eefce158154849fe67f0f527dffc5295bfd3ca1aef14962ffcbcb"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
-- 
2.34.1


