Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 95A717DF0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:33:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w12so15823992wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=sbrY7CTz3m1jPp9rtB2aESg7lXx5HqCnNk1BE3daPflHlzVLeDUp/Yk0mhMdJ3CVX+
	qDUAZewFtfXRkUMNYjWPHPmCUIHFFHROg+CgggjwqQykZXBY7Xww3s7BenJkypHKl/IP
	drHY0vHPhON7+OZTx/2/jmCZlZD24ttiL2r4vg/cjFWOpDHQ3FCKxG2ZJFw8VjFCefgX
	ICWY2fibhCAnSid4cmzUJ6Pn1C7cjAmQTpKtNiAPjurE0wNK+6IMrVCzidFb1zL3rPTn
	YdYnmIQY9X8D1LDSzknAnLB9k29O9/u+uPYA5rFpJOFqWjpwGgBJaPv2hcz5av4rsbir
	jRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0ZghqI/bxy9oC+rsHTjxaBZnMy/FWzJPvfX+6Sg3oZo=;
	b=g4PSzq1YwqozW24Gi1LWLeDOBOKbdT7wRF5k3F1XIahKBVyijlwAjXbJPOIMTJ4CPF
	BMj9jN62VXXYf9LsXQVwWp46Jg6LEk6/q0+Meptq+dDEE6EWnOdGsdQe/nATB0iYLOA7
	E+I1C6/iX7bEp/L1MMEfmszSebR7QwGrZDTlqevxp93y3/bqXQwjCf2ijKZXnZp7IMDE
	YoCdeT7eoAjU11cRh1rlQ5ZwpVW0aj1XBg9rz+Gf1+Lsf1XUjT4Kfx6rOhHHerExYJTB
	Mof1uftPC0ZNZ7oBUtfBuj4MZllQ81Kupg3pdUGZosh9YbnT+skUJg/3/jRLJLlT983d
	X+PA==
X-Gm-Message-State: APjAAAXzfzu2pd353OtLRFSi+R0CTCKIj8GG++CMLG7qvTnAb7hkwcjv
	YmIICc6wTEUmb4Nnx7Mvio68g0MN
X-Google-Smtp-Source: APXvYqyX/WEP0sNpXUWWkJzy/eVeyuGEOYe3FRJkrH+EZvHRB669cIH6HBcjQri2XA4aanC42RbDzA==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr18945685wrn.235.1557761590986;
	Mon, 13 May 2019 08:33:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	m8sm25046407wrg.18.2019.05.13.08.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 08:33:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 17:33:02 +0200
Message-Id: <20190513153303.50095-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 15:33:10 -0000

This matches what the qemux86_64 is currently using, and
will allow testing the instructions added in the meantime;
particularly various SSE extensions are now enabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86.conf             | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 5fdbe4df50e..82ce46d8604 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,8 +1,8 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME_x86 = "qemu-system-i386"
-QB_CPU_x86 = "-cpu pentium2"
-QB_CPU_KVM_x86 = "-cpu pentium2"
+QB_CPU_x86 = "-cpu core2duo"
+QB_CPU_KVM_x86 = "-cpu core2duo"
 
 QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
 QB_CPU_x86-64 = "-cpu core2duo"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index f2434a4b5f5..272ad1e1870 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -8,8 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "i586"
-X86ARCH32 ?= "i586"
+DEFAULTTUNE ?= "core2-32"
 require conf/machine/include/tune-corei7.inc
 require conf/machine/include/qemuboot-x86.inc
 
-- 
2.17.1


