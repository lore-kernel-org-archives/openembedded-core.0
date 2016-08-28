Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 91EED6FF76
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 18:31:15 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id ci2so1498517pad.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7hUQGcEYnvx7K6AkdXg0+eAQgfxwmNgKdjTOeAtnqJw=;
	b=hXhZliy2eLEtzZ+gPq6OmuYuNgSsQS+ELK1H9VekIbawg8dQECsTG/ZjQlJ4wHW34O
	9ap4VvkzwGDX8banwqdLfZzNjuh8VYAoE+CGa61nBtPk60orILBE7GrFVCDHqgiH6oYF
	iPzcSnBbEnH6TkozXpyyDnnMAUY1O78+8pecPSbeiQCPD3GvhOkBgApjR5dkAucW9smR
	9H+lil0o7kDICiiCJkuhZPXSGuxZqujBlshGE1ALroxFxrKTMCboeoXYyS3rgbL3vK51
	GvypDIfWPh+2HrwptaqJ4oVXuM9x5wMd+GC2zfzp6YKz/wJ8SbxP2ClGMLo0ZS0X33uJ
	IZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7hUQGcEYnvx7K6AkdXg0+eAQgfxwmNgKdjTOeAtnqJw=;
	b=OtSHYRJDvgrFtP6JfcctZGUkzxoIXvilKE4k1i0BniVboNyxgrG+fnKH/sC49ufAhw
	hKouOhxbpcDyhQQmG5O+b1AsixMCCJ8vjShRy5cued7moWYA5Mc6GRUDrjmdP4IObkqw
	3XJGOVSU9RwgeH+WPwUK1mZa23WxLD/N5hGYGdUwTdmE3qckdqBD+9nFWX6C8cNox3Wi
	iyMr5Jnys0LO8cY/yNC+jeoQmarWN257XQKxPzXyIBxqcPWw8sPP/hohu7c88NHSwBOl
	lIHPFbkOl8I4ZTyeIRgticrTdlm7EOuaDOqqayRmBZu9oAO8O2/2vFttQ0gvjF+REGgq
	l9ZA==
X-Gm-Message-State: AE9vXwPDQANf7mMcymZJkC7FCMWDUv/LIO/0Ifhwuj6fWv8sSbxrkp3q3AJTKqMlmSDE3/t9
X-Received: by 10.66.21.167 with SMTP id w7mr25143548pae.62.1472409075776;
	Sun, 28 Aug 2016 11:31:15 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	xx7sm43383086pac.3.2016.08.28.11.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 Aug 2016 11:31:14 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 00:01:03 +0530
Message-Id: <1472409063-18107-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] glibc-scripts: add RDEPENDS on libsotruss package required by sotruss script
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
X-List-Received-Date: Sun, 28 Aug 2016 18:31:15 -0000

It solves below error observed on qemux86 target:
root@qemux86:~# sotruss ./hello
ERROR: ld.so: object '/usr/$LIB/audit/sotruss-lib.so' cannot be loaded as audit
interface: cannot open shared object file; ignored.
Hello World
root@qemux86:~#

With this change, we get:
root@qemux86:~# sotruss ./hello
          hello -> libc.so.6      :*__libc_start_main(0x8048300, 0x1,
0xbfc86274)
          hello -> libc.so.6      :*puts(0x804851c, 0xb74af000, 0x0)
Hello World
root@qemux86:~#

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-core/glibc/glibc-scripts.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 3a06773..bce0a42 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -14,3 +14,7 @@ do_install() {
 		install -m 0755 ${SRC}/$i ${D}${bindir}/
 	done
 }
+
+# sotruss script requires sotruss-lib.so (given by libsotruss package), 
+# to produce trace of the library calls.
+RDEPENDS_${PN} += "libsotruss"
-- 
2.7.4


