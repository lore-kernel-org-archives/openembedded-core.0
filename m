Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 41E897FCAC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 12:20:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b6so15984839wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 04:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=HK0PiRaDmtM8moT74YkfOIqATuBdwKLh/GiumAt5NP8=;
	b=y//BGlnhfS57et/Bhf53PBlYaCXQJ/E9IVBGed0KITf5FZWut+wkFfmmmLCHrhuy/x
	63VTuxQaMVvTGAgJs68etQq/b+1eoAqakIB8WtgbPRy7goMa7+EC6ouGGrv13vwDA5oT
	VhdSkVQ9fjD9uEj+G9Wi8j1XgBfpzlKup28bRILUtaUbZKbTMsWUwYVMiO8+gCo2Utjy
	UhqGcMKsxYN6GIsv5x25AKrZf3EdJOudM3X//t95Rv7QjHv3A/N6ENDsrBwM5sFyZRpF
	zDOERZvDawNrcxiJZT/MpiulUMjSNreoqNzR0p4XskcD8JoMTcM7BkgpqPnPGeXiKMdd
	jmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HK0PiRaDmtM8moT74YkfOIqATuBdwKLh/GiumAt5NP8=;
	b=TyXpJGrqHt8EpiWWX7A/8ob1zjLTWBXOQBP69eX2UNaBVW1Y7PTvZc1wngP/eiNBet
	1RSlhIGRtjes6n+/v0rX/A/++iq86iZjCafNDLGCTT1bB0LzSN65Vu4Nmz9sjv0FkckF
	s2MzHShLBUkDyobvMNt/s8H3BrXQx8MJzDZydqnpzLC2de3o6w5nJMi6TmKWY0W7lSqV
	lSkcCOJNp4obpDEwvIn0lF91ZPkXWqCnd0oUWzb+zDAHoSnc+TmJv3yieqdBOd0ywytV
	ia8OGuTNCpTZZLM+tlf6R5NQlLqh75q3XKEuAPbaC/WIl2F9EPqikQaokZEXzd4x9Hik
	inHA==
X-Gm-Message-State: APjAAAUqm0skQwh3fqASSwv+xQ2NmQFrTZP4YGvalJIhg9BCmxkcDFIh
	ipdRWBB1J80jGUC5p3bEKAXP7sC7ei4=
X-Google-Smtp-Source: APXvYqwnO/6ExzACZcojLbwDEjCG22YTOrbY/JhzEApkbgwxNEPAVMmsMmkk2dZHWLUWUotyOHNG8A==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr1877435wrm.345.1575894015731; 
	Mon, 09 Dec 2019 04:20:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a3sm14611177wmh.5.2019.12.09.04.20.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 04:20:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 12:20:05 +0000
Message-Id: <20191209122007.13306-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209122007.13306-1-ross.burton@intel.com>
References: <20191209122007.13306-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] oeqa: add insane package walk test
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
X-List-Received-Date: Mon, 09 Dec 2019 12:20:15 -0000
Content-Transfer-Encoding: 8bit

For reassurance when changing the insane.bbclass package walking code,
add a sanity test to verify that the file listing is what is expected.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/classes/insane-test.bbclass |  4 +++
 meta/lib/oeqa/selftest/cases/package.py   | 38 +++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-selftest/classes/insane-test.bbclass

diff --git a/meta-selftest/classes/insane-test.bbclass b/meta-selftest/classes/insane-test.bbclass
new file mode 100644
index 00000000000..aafb0031a5b
--- /dev/null
+++ b/meta-selftest/classes/insane-test.bbclass
@@ -0,0 +1,4 @@
+QAPATHTEST[selftest-walk] = "package_qa_check_selftest_walk"
+def package_qa_check_selftest_walk(path, pkg, d, elf, messages):
+    path = package_qa_clean_path(path, d, pkg)
+    bb.warn("WALK %s %s %s" % (pkg, path, "ELF" if elf else "FILE"))
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index c6444062674..d9725b4f2a3 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -148,3 +148,41 @@ class PackageTests(OESelftestTestCase):
                            '/usr/libexec/hello4']:
                 if not gdbtest(qemu, binary):
                     self.fail('GDB %s failed' % binary)
+
+
+class InsaneTest(OESelftestTestCase):
+    def test_insane_package_walk(self):
+        """
+        Check that the package walking in insane.bbclass is listing the files we
+        expect.
+        """
+
+        import re
+
+        config = """
+INHERIT += "insane-test"
+WARN_QA_append_pn-selftest-hardlink = " selftest-walk"
+        """
+        self.write_config(config)
+
+        result = bitbake("selftest-hardlink -c package_qa -f")
+        expected = set((
+            "selftest-hardlink:/usr/libexec/hello3:ELF",
+            "selftest-hardlink:/usr/libexec/hello4:ELF",
+            "selftest-hardlink:/usr/bin/sparsetest:FILE",
+            "selftest-hardlink:/usr/bin/gdb.sh:FILE",
+            "selftest-hardlink:/usr/bin/hello1:ELF",
+            "selftest-hardlink:/usr/bin/hello2:ELF",
+            "selftest-hardlink-dbg:/usr/libexec/.debug/hello1:ELF",
+            "selftest-hardlink-dbg:/usr/bin/.debug/hello1:ELF",
+            "selftest-hardlink-src:/usr/src/debug/selftest-hardlink/1.0-r0/hello.c:FILE"
+        ))
+
+        line_re = re.compile(r"^WARNING: WALK (.+) (.+) (FILE|ELF)$")
+        for line in result.output.splitlines():
+            m = line_re.match(line)
+            if m:
+                expected.remove(":".join(m.groups()))
+
+        if expected:
+            self.fail("Not all files were listed: " + str(expected))
-- 
2.20.1


