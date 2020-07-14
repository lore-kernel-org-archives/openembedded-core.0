Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.943.1594746175222064906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Am/UjbyS;
 spf=pass (domain: burtonini.com, ip: 209.85.221.65, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f65.google.com with SMTP id r12so23045242wrj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pv9mHVpAWWMY5BP9qVWj3MtoYZg7YVgOYuGGg/btIJ8=;
        b=Am/UjbySg2V2PPSAY1W5MTxP5OA6G6A25il4wc/NQhbG81ryY+9fTV4wWcQaDKPB9X
         CPS/VrAKpZeZpUL41Vdxkj9NYfsB5tZz6LKysNzp9j8i6IpIxDbylKfBSY6Y3+iYapBZ
         5X0DoCXrdeca9/jW5Tv+IEY64ZqBD7S8VaZ5+xstEFNoN4VqxTkUD04ieRo0j+USRs6E
         cAOf8xaBARNsPlZJd857S52R4tujHlZs/bJxJuv57I7GoyDS2+L7NZjAjAkZDscTpeY5
         D2zEYCK/WXyJK6RgNMQ9HyAb5lIkPMDK4hswy2TFOF8bJDdFK9uOAcOtQHTIDLsWinHX
         f7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pv9mHVpAWWMY5BP9qVWj3MtoYZg7YVgOYuGGg/btIJ8=;
        b=QCAMZq6MefvG7Pli0+mU8//6Qkj5oE+aRpO4403B9wjWRvvormu0t6i13kJEYM+aDi
         ATvY+S2ufU1xab3m04psorSy+xk63sfDVYCMepzJNTq8EoILqw4P1ivuB7Qq5HGLJ/IY
         nj7vCro+PigLDuoh+WH/ooc7nlr5e6SpJLjxNl6pPPFQVZV9W5+URtpOyl+Xc+hhTqgK
         DpyU2dPVaBSqqoxfwPhcwJ/def5AeiWEBZwWL/1hliBPx7SXyovo6oMRYXrj20nQXC/1
         Akj2IJ33259o8MtTceZmxSAdPmlMZ9QouDRc4+3T97PPCs9FEKPsLoB9Qto6WRcdUYue
         2Rjg==
X-Gm-Message-State: AOAM530jvYMdx4il3hEFTmWTu5ef9bC97Mvi6ZuosQlfCfZOZzWmIrn9
	RlGfEW7PG+3zSBiKEyxAYNWJfg8DpBE=
X-Google-Smtp-Source: ABdhPJy8pbIrDP0VX8oTwgIKysT+Sh/kPkps8gLJFyGdYYrcCyLrqghfS3eu0ji5ZgkgibzIy6dffw==
X-Received: by 2002:adf:8501:: with SMTP id 1mr7494972wrh.153.1594746173579;
        Tue, 14 Jul 2020 10:02:53 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y16sm30552773wro.71.2020.07.14.10.02.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:02:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane: improve arch test messages
Date: Tue, 14 Jul 2020 18:02:48 +0100
Message-Id: <20200714170248.1036410-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714170248.1036410-1-ross@burtonini.com>
References: <20200714170248.1036410-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The messages from the ELF 'arch' test are not obvious, clarify the
messages and prune output paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 89a516882b..ee19ef673e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -364,14 +364,14 @@ def package_qa_check_arch(path,name,d, elf, messages):
             target_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
     is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
     if not ((machine == elf.machine()) or is_32 or is_bpf):
-        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
-                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \
+                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path, d, name)))
     elif not ((bits == elf.abiSize()) or is_32 or is_bpf):
-        package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
-                 (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "arch", "Bit size did not match (%d, expected %d) in %s" % \
+                 (elf.abiSize(), bits, package_qa_clean_path(path, d, name)))
     elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
-        package_qa_add_message(messages, "arch", "Endiannes did not match (%d to %d) on %s" % \
-                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "arch", "Endiannes did not match (%d, expected %d) in %s" % \
+                 (elf.isLittleEndian(), littleendian, package_qa_clean_path(path,d, name)))
 
 QAPATHTEST[desktop] = "package_qa_check_desktop"
 def package_qa_check_desktop(path, name, d, elf, messages):
-- 
2.26.2

