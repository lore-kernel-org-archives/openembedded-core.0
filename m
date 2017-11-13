Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3740F786A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:06:52 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d65so2436745oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1EJP5GwLZc5r569vFYpldSLfuqNiP8mJzIO2v85D8EA=;
	b=EB/uolLzhn8dc0pXSgbJQUy7HpoVvxCxFfHpfDTmpOIGqGaFebKLYBajU5eF9y77Qx
	q2KYXFeljsTowLfnNAKt3yEX7zRsKICgudpsKDfqJuW/nDQbDxQ8ABW76g7+KypWEWji
	/CAt2yMSY3nus2RunpK5emis0mH8+WjvHy5JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1EJP5GwLZc5r569vFYpldSLfuqNiP8mJzIO2v85D8EA=;
	b=m6DcMhrhSERLaQBp96MdMQcD0uESbJI2tMykqCR0kk8QotSEQU9wlEDOGYEi7LzjOi
	xYPBfarEXr1N9zc0Pwsm1usPwO6bJHonxKDRXflJwRbbFtJwZGtlEM8KepanE24RkjJU
	4UE7tu9i9Z7uUXr2ojHlP7c76dQM1YrN6wZuDZExQ0RcjoPFTmxN4RZrHmbti1WxuesA
	wkNxvINOMiiWYe59LrGwOYuPyEHY+6Ud65IHfxEvUUQ9X5f8Af3CEmfz3so4a/sPFeKC
	FuGfeMXUaBrW8c6yeWA+MXSP/BEUj0wY059VQIkX1viMeF7bZ7hpag1SKnCZesvRzYPH
	WjWg==
X-Gm-Message-State: AJaThX6ZMlCM4nl4hIYCa3lZC2NGCDz86I1BMhqxsgnbl7N8sJ3mP7/V
	M7IPlXAFI2lhJ6d+sbqpaJRXRl8hEwo=
X-Google-Smtp-Source: AGs4zMbNXRMeurJedv80uWx52RbBPr6vb5h54wLI6d/9rCC8jeS//H8HvhFEVouGX1mYdXU5Oq3CMQ==
X-Received: by 10.202.175.205 with SMTP id y196mr3583758oie.363.1510596413868; 
	Mon, 13 Nov 2017 10:06:53 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink65-176.telefonia.InterCable.net. [201.172.65.176])
	by smtp.googlemail.com with ESMTPSA id
	q51sm1504974otb.71.2017.11.13.10.06.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 10:06:52 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 12:06:27 -0600
Message-Id: <1510596387-27934-3-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510596387-27934-1-git-send-email-daniel.diaz@linaro.org>
References: <1510596387-27934-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] insane: add support for ARM64 ILP32
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
X-List-Received-Date: Mon, 13 Nov 2017 18:06:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add aarch64 32-bits (ILP32) ELF header into dictionary and
check binaries for 32-bitness.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index def9c70..fc9395c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -146,6 +146,9 @@ def package_qa_get_machine_dict(d):
                         "powerpc":    (20,     0,    0,          False,         32),
                         "sh4":        (42,     0,    0,          True,          32),
                       },
+            "linux-gnu_ilp32" :     {
+                        "aarch64" :   (183,    0,    0,          True,          32),
+                      },
             "linux-gnux32" :       {
                         "x86_64":     (62,     0,    0,          True,          32),
                       },
@@ -426,7 +429,7 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
-            (target_os == "linux-gnux32" or target_os == "linux-muslx32"  or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
+            (target_os == "linux-gnux32" or target_os == "linux-muslx32" or target_os == "linux-gnu_ilp32" or re.match('mips64.*32', d.getVar('DEFAULTTUNE')))
     if not ((machine == elf.machine()) or is_32):
         package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
                  (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
-- 
2.7.4


