Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id B62817CC62
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:42:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t15so4202225wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wEcs9sij53X+4pj0Fv6rTkw+pSHsAJ4tR8Q0K+my4hY=;
	b=vGx3H2rtY/AIw4c18Az3A3pgJgwVC4eT+SrZsHufOZfaZDR1MjwKIl9fMn0avEeXRl
	qIhgZfGIXqcJveo3NvRf43NAqyR/J65wMI3RWbh2Xy9bvzhjBy1+xmF6rpMdDOAEAwkP
	dGfyEw0BfUwyTa6RH+GvTgpNr2AIZf9tza0hIGzVOQHkb0VhOxDhWNxnFYvsl/L2VaXS
	PwjpdUdcWDKn188/cYe7B1pi0luE1fj8PiroI4iZXAZEF1jnzNa2LUzTJrWgim2jhxdU
	57LzTc7+ElUB16TbCBAEFbsG5WhGipZgojfkEdIqmHihdLPcC36j8L8aYF5554gC3f3q
	NL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wEcs9sij53X+4pj0Fv6rTkw+pSHsAJ4tR8Q0K+my4hY=;
	b=a+Ycnd59ffD3IsGMS7o12l+JNPZezlEUp+EASvtOZS0SqqXchq7N+e5uADa9ar6Q0L
	Db5rGY/2avja1wpGLSt8XVnppJUYYVz+dyyRhb6zm/TjrvLI7Q81sKHbLxtfpufeB82i
	0mP3zJFt3CJWpxw09YVqlRcVeRSdVw5MIHdtl+3WjzUSUAZCvoWVk4IDdk7ohO0TMUOM
	4J/IU7nVZQBlnM7VwtzEEMcCAhHKtnh/oDxZVGdhcz3uXxk8en7m/nB1fL6y1C4wLd1r
	0lUKJUVlMUw6RO1yIrP/pWQeHPguxNkwBDthR8yarFGfe/3665PcK+8/ESj/OVqUOYmQ
	fIZA==
X-Gm-Message-State: AHQUAuaDB+I81l+MopDlCo5lehTM2V+I4wIp72T5a72kJ4MO+HPTcvNS
	rQonXdcS9MAWZHKikL5a0NkqCPn/
X-Google-Smtp-Source: AHgI3IZF8/o8GulUYrNf3NjoyQCx+HtF8njY0VvE8GbWO4N/uGIcSn6DvKamdbrqgrcqADLmiPJg2w==
X-Received: by 2002:a1c:e1c4:: with SMTP id y187mr5529980wmg.50.1550925775951; 
	Sat, 23 Feb 2019 04:42:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id u12sm3290125wrt.2.2019.02.23.04.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 04:42:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 13:42:49 +0100
Message-Id: <20190223124249.14744-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gtk-doc.bbclass: unset LD_LIBRARY_PATH
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
X-List-Received-Date: Sat, 23 Feb 2019 12:42:55 -0000

meson has been found to set it erroneously.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gtk-doc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index bedb36ec8b7..707d74d1083 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -51,6 +51,9 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 GIR_EXTRA_LIBS_PATH=\`find ${B} -name *.so -printf "%h\n"|sort|uniq| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH
 GIR_EXTRA_LIBS_PATH=\`find ${B} -name .libs| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH
 
+# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+unset LD_LIBRARY_PATH
+
 if [ -d ".libs" ]; then
     $qemu_binary ".libs/\$@"
 else
-- 
2.17.1


