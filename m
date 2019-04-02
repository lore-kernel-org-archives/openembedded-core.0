Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5CA6C0C1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:23:05 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w23so2933938ply.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=piog/qha2ytvYjnLM/IR5FJEiJERVSVG1V//k6WaDJY=;
	b=jT1x/QQ0l6YxUOAKimU43g0qw+s7hsdubkAg7M3xI5oE8tlYexWJzwXdhZTyjnkJC+
	C15iRNiphUQwHYGUbJV6tUPwmoZU4VfZoeI52HqG7bPLAbSK/9VkQUlu+4A94RSV3aU7
	t/EHxzSawlbmqWoo4FN9UuWsJWfRt8T4cCufh5CvCxMYp2PI2uKQZMOiYrc9Um1USXgX
	Uu0UuecGhzxtE8TzlmHHvxmDLifS2kbqrG8kelFa80wKUvljmoWaofSDepRR7stYlcz2
	k1nLng/Rg6Yypq11TpSinlGuHMCDRQKzxBJ5cd0kuQYm6XW4nu/CYZNc125ZqDatxnPk
	Zqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=piog/qha2ytvYjnLM/IR5FJEiJERVSVG1V//k6WaDJY=;
	b=TQ5LMQfpzfw6iqNyGlkNwXxpDw4aDEoT3I9ADiZ4HkpF4kNCqLvi6R1XZLfKrUNYPN
	TV0Ymo34bw+1iSRFpIJ13Oq3nWsNuDlIS80FHheFhmccJW1CQ27IJq/nESR+mr4oaSvC
	G7iESPUJv7wR2bT8kjIYNl435CVLlU1YIVyOOccg/sL7hDUpnDng2zdhpiP3MXZguLY3
	mBTnKKPQX4V9E48As8+tCyGeam7VdnBdzfEyhpuhcQMUeAnAAvHUkLix9gXIZRvrBCjI
	4bG0MDT+tYq4d1p/aB74suCXY4+K4apLobIjFWqpZzCfr2QZQfBtafVZwttIjJnZIVET
	Uz6g==
X-Gm-Message-State: APjAAAXcoE/QwRhekexuJe2PJXR36voQ3xMhWYNz8LBfLW1Om2iQvkrq
	aDQLFodOFJNuEqb7hvniI+HCoQ==
X-Google-Smtp-Source: APXvYqwssoAnDiSG96vSPRusYOLhyDRbFm4rxo7Hu2VDnVgMrKbiqL/hNNqGLxnZlR4c2aqd8lfbQg==
X-Received: by 2002:a17:902:7043:: with SMTP id
	h3mr15290706plt.228.1554193387230; 
	Tue, 02 Apr 2019 01:23:07 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.73.181])
	by smtp.gmail.com with UTF8SMTPSA id
	75sm21998741pfr.55.2019.04.02.01.23.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Apr 2019 01:23:06 -0700 (PDT)
Date: Tue, 02 Apr 2019 08:23:01 +0000
Message-Id: <20190402082301.3817-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Tue, 02 Apr 2019 08:23:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The fatresize command line tool provides command line access to the
libparted-fs-resize library implementation of the FAT partition
resizing.

This tool is useful for safely resizing FAT partitions which are
commonly found as the boot partition on a variety of SoC targets (e.g.
RaspberryPi).

The Debian version of the source is used as the original upstream on
SourceForge is no longer actively maintained.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
The reason for locating the recipe in the parted directory is that the
program itself does not implement the FAT partition resizing it is
merely exposing the functionality from libparted-fs-resize as a command
line tool.
---
 meta/recipes-extended/parted/fatresize_1.0.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-extended/parted/fatresize_1.0.2.bb

diff --git a/meta/recipes-extended/parted/fatresize_1.0.2.bb b/meta/recipes-extended/parted/fatresize_1.0.2.bb
new file mode 100644
index 0000000000..a2f6b6d131
--- /dev/null
+++ b/meta/recipes-extended/parted/fatresize_1.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Resize FAT partitions using libparted"
+SECTION = "console/tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
+SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
+
+PV = "1.0.2-11-git+${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "parted"
+
+inherit autotools pkgconfig
---
2.20.1

