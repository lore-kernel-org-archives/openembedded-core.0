Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5393760166
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 04:29:34 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b72so7798936pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 21:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2wFVy9/nzOncTaVbdacjVXpspm3XbXxX1DqwodqROZs=;
	b=m6HswfySTKI3rw+LP+AwPPKUHMWZbv5B0sJR9py1iEsP0fVab1j5W3H3eFjPSwuZLK
	HkXgZ0nDKq7VBV2AfXaleDDxT0nklVCenpB5a6cUtYU1uv6CHEHGZglYCn+I2+btMDlc
	UN/RjtWtQFkd1gbcuGv8vrJw6W7m5ayAKqrDCG6awzQO4AKCjBonSOCbR6PW+C4lz2/w
	GhM5WLztyZaH/NOdLKwp+D1svScyw9qkE64IMT5j1+ltUH1Aesv6pAg6Sa7oTYpssP1W
	j618fbAkV2WBn3d87175rRX+TQ/rCVfdNKzoifyczuGaeqq5/mMpXU0JLTWSObxfl5zT
	300A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2wFVy9/nzOncTaVbdacjVXpspm3XbXxX1DqwodqROZs=;
	b=bLvVCGERL3pDoQ0cFU++BOJeLUYT2GlqPLvJNA+kaQJFf79izcrpboWNcA91atYVJ+
	PWYQF0nCu4zu7LU6bIZ57s35wTF/znlxkzWo3DnEIfzrDqdbpbKoCIhSB2oO3PuEEe8x
	rvRk+EOra64hhwZ48YJE9Hpc4TDSDPFtJohXLKHbG8xxSPYhd6JEo3CmxNNbUTRi8sIO
	Eb7JZzXbIdkTJmamq/kyYZyhS5JgvCknJonOnIx58OnSeZxL1qt39O1vUrj8eN1Zm2w8
	h7lDDl7/do8v3u0XbAESzePp5xnsePlz75FkKX8ameP0q05hp8yFSyxLw0IGSr434weh
	Qj4g==
X-Gm-Message-State: ANhLgQ3VCGvMDltH9x5PfbSaxF+yIc+4YSY0rEDHURYhsQ7CtEIdKhDJ
	SJma8zonoJ6phxe6A03sdQ9aNMuVF24=
X-Google-Smtp-Source: ADFU+vs0r2sDNqm4AvAa+ZMVT0mJhHiLHjW5ScJYAntf3HEJsRXI6KSATgVrXY5z8Yr2jgVBJl4U7w==
X-Received: by 2002:a65:67ca:: with SMTP id b10mr5556319pgs.69.1584246574596; 
	Sat, 14 Mar 2020 21:29:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::af11])
	by smtp.gmail.com with ESMTPSA id
	y18sm3053437pge.73.2020.03.14.21.29.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Mar 2020 21:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2020 21:29:47 -0700
Message-Id: <20200315042947.3257882-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 04:29:34 -0000
Content-Transfer-Encoding: 8bit

In some cases, we run into parallel build failures where BUILT_SOURCES
is skipped, as a result required header files are not generated and the
build fails with missing header errors like

../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
 #include "uniwidth.h"
          ^~~~~~~~~~~~
compilation terminated.

BUILT_SOURCES should be built automatically with `make all` [1] therefore
ensure that make is invoked with `all` target

bison-native parallel build fails when -l<n> is passed globally from
build environment, errors like below due to race starts to show up

Therefore removes a previous load limit if set

[1] https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/bison/bison_3.5.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb b/meta/recipes-devtools/bison/bison_3.5.3.bb
index 09e4b18f9e..27e09434f8 100644
--- a/meta/recipes-devtools/bison/bison_3.5.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
@@ -18,6 +18,12 @@ SRC_URI[sha256sum] = "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd9
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
+# Reset any loadavg set via environment, it breaks parallel build
+# | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such file or directory
+# |  #include "uniwidth.h"
+# |           ^~~~~~~~~~~~
+EXTRA_OEMAKE_append = " -l"
+
 inherit autotools gettext texinfo
 
 # The automatic m4 path detection gets confused, so force the right value
-- 
2.25.1


