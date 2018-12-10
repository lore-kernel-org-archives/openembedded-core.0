Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 545476B074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 23:52:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s198so5738369pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 15:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A0oLEZhEYXWKL7Ra3SMvp0EsCmVKCYJdYZ+S2tYoqO4=;
	b=IErWivLvyjizFX7n0HGschOsSG5w/yxUlAILcbxovSL+XkQbLuIIL4KWtzIzn5Bxlx
	yi/OA7wgdz2B3lz83YbYN+HtDsULjjbtMcGTQ5g1XZq9darZoeDsFZYfjGiWKbu6XQS1
	Hcyhitqph4ph5WVPb7IKAxDGIdEzHbgc/qiaXP7IbBT0yhrhY9GyfyHsppCWsrN/zIi9
	Bk+dZXCXQ6y/p4cT5JILcXO4RZbGchQW+i6v1ei01+2AdSyTspQTt/BVjgTY1R5FE7H9
	3VaWxErb6JOdmpTMCMcFVsNOJpZgLChDkw2/7CfOL+lKXZaWhdCQh9gj7vbsQwLvuVl+
	/HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A0oLEZhEYXWKL7Ra3SMvp0EsCmVKCYJdYZ+S2tYoqO4=;
	b=HTWHJJbNtEbPfONwmYDCWsRpuaRyIiOMGISdLtofwo5WAEwdetDeAbi37JrDPC7ORg
	/GzoeYHENCpD3vsoa/t+Xrvii4oV5JvwBns1fYsEZK5UWSb0AZTy1dF41dLuT/ChK2ec
	YYTFy05KsQ1GeRzeQRBEVIuY4tuyy97eEGN/dd8Ce7vyMVOFToq1nh5ksvzebz2VOB7V
	FWwW19/jX2ELFLBniv7OHW2qqQr/zSC7s5RWZYgSxf6zF4VPkb3JLpFDZ5Dg1IuOy9CG
	o/CmAq/PwHzjRdJiITSjXSt4INIdy6qIW9aV7EfYIWbSaljt2borcUiZY6mtMVaLzvk0
	youA==
X-Gm-Message-State: AA+aEWaqHN0uqx0LBw/INNfkfwF/eqJ7GnKh+K7jpNwb8GWSHRSe05oj
	hgKpFW89grB/hePjYB0KiPBOM27m4c8=
X-Google-Smtp-Source: AFSGD/WqVrPhm9/oZxbywwI+x1dgD86V8Rn59/IjCEClepeIzXdZi25O3eX2grZc6wpPkGfDwewOKw==
X-Received: by 2002:a62:5793:: with SMTP id i19mr14393608pfj.49.1544485942759; 
	Mon, 10 Dec 2018 15:52:22 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	p2sm18841557pgc.94.2018.12.10.15.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 15:52:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 15:52:06 -0800
Message-Id: <20181210235207.11741-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH 1/2] insane.bbclass: BPF objects may mismatch in endianness and bitness too
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
X-List-Received-Date: Mon, 10 Dec 2018 23:52:22 -0000
Content-Transfer-Encoding: 8bit

This ensures that bitness and endianness is ignored for BPF objects
Fixes QA issues like

Bit size did not match (32 to 64) kernel-selftest on
/work/qemumips-yoe-linux/kernel-selftest/1.0-r0/packages-split/kernel-selftest/usr/kernel-selftest/bpf/test_btf_nokv.o

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dbe9cc6162..6411884f92 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -307,10 +307,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
     if not ((machine == elf.machine()) or is_32 or is_bpf):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
-    elif not ((bits == elf.abiSize()) or is_32):
+    elif not ((bits == elf.abiSize()) or is_32 or is_bpf):
         package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
                  (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
-    elif not littleendian == elf.isLittleEndian():
+    elif not ((littleendian == elf.isLittleEndian()) or is_bpf):
         package_qa_add_message(messages, "arch", "Endiannes did not match (%d to %d) on %s" % \
                  (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
 
-- 
2.20.0


