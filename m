Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 872FE71BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 04:06:39 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 19so17681497pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 20:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jYqqmAVVhe51BOrU2MT0cfPz8aJ70hey67yrxopF+yE=;
	b=qqp2rQEqKkp0JW5PL5BlHFufoysRh0MnTVxo5cuySLSMaGOrdaeRNaOdHtuji2IBNg
	1pCpkjM5fb2b8fVjykclZKz4eDYMRmBlyIeOeAKXiWGO/dqbJ+3D42C5H4K7Zcrr/6pQ
	nKGFebGp1H8f0YKr8raLQ1fegypPm9RFWijP0/6rXPYSF7/J3Uurmk6d90HwiTauUjrf
	f/5F2paFbvs5hB0Zb1F2Nz3RqwikDImCIXlQs+IgMMCEsQcUFMq4npDnr6lwgNS4tGUI
	IoFKAW6HaqxXcnyCc4YfeOCXbTKdnZ+PNuJ7SbUYzSSZXWN45rQFvZ+8M7POYmf/yrXR
	jVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jYqqmAVVhe51BOrU2MT0cfPz8aJ70hey67yrxopF+yE=;
	b=MPRfa7UO8aKVuBgFZXs87sBvcg2lvs4527E6QKqJ5V+jlw53hyhA2qV+952lNwP4kZ
	gbXuaA+vU81JAkGrZIy5T8nRGe5xoxZHEFnIl0oK65NPRuJVzWHQmF6OTHfCqOMZ/Kac
	7vU5n4CgrbCp/uG+cttqZjtC50VJuteo3mp+VMk5Yn/RilnNsfewCbiWfmAVBE1R6GOE
	WwoQItHHdoIy3xhyhBEVg5L4LtAIQlVXse6rhEbLUWnYA6ipkW185L6tRPohqFCWeS9T
	WOpPSMgI4+xPDH+WnX9oV/PoS2zCkk9QxmG9fOQJj6IHcab93kxz4TBtvV5r56rkLyik
	JNFw==
X-Gm-Message-State: AIkVDXIhCu7c1Yec0v7kHDS9gBokxHOt7xIndQ4gy7TszjCahs3iIkAysGz61I/kh7CA6w==
X-Received: by 10.99.177.6 with SMTP id r6mr7189355pgf.61.1485489999734;
	Thu, 26 Jan 2017 20:06:39 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	k78sm6666312pfb.93.2017.01.26.20.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 20:06:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 20:06:33 -0800
Message-Id: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: respect USE_LDCONFIG when setting default PACKAGECONFIG
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
X-List-Received-Date: Fri, 27 Jan 2017 04:06:41 -0000

Avoid trying to call ldconfig at run-time in distros which force
USE_LDCONFIG to 0 and therefore don't provide it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index cc8781e..cfe6958 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -39,8 +39,10 @@ SRC_URI_append_libc-uclibc = "\
 "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
+USE_LDCONFIG ?= "1"
+
 PACKAGECONFIG ??= "xz \
-                   ldconfig \
+                   ${@base_conditional('USE_LDCONFIG', '1', 'ldconfig', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-- 
1.9.1


