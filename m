Return-Path: <3fFCZWwgJAGUDEUHVWLFZDbPR.FRP@flex--abrestic.bounces.google.com>
Received: from mail-qt0-f202.google.com (mail-qt0-f202.google.com
	[209.85.216.202])
	by mail.openembedded.org (Postfix) with ESMTP id BE9FF7966B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:44:27 +0000 (UTC)
Received: by mail-qt0-f202.google.com with SMTP id u45-v6so2261296qte.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=u9sGGq1ePyT5Kk9kYk8VZd+3GjsStrvEs0RsfkxWAm4=;
	b=j4C1gDwcyT5KhBPvaDVBle4ETS7JCpgxHZxhfFtrOr6DMDuMHnCpHx1m/k5+ZdGQwP
	rqr4fqpoxtNXZL2bWS8iUdqnEQqyOofDXg6jcNwzposWxQQiCoErudIPOqaHDpsi9j3z
	Yjn4oIcSaXScc2Sfe704/ecUFLCbCNgrXJQtlVO++TebH3246a8Y5Oh3ZSVpfi4a9EOV
	Cy9F4/n1a3xnsJzACxJ8eNIvCe+I2gcfo54HXdL1zeaoV0AgImVFJOOLz8Tbx8bxp+Wp
	R4YJCW5xQz5pFQloU+tvwS7sUWUvtb58E/ckTcHon/v0QSxpUotAwql/gU1/gV2jPVp+
	UbKQ==
X-Gm-Message-State: APzg51DJ/aHWT072tUvYVcas5nIvwvSFGnAYseds5Df9fpDabjFpTsrZ
	MiWBtP1Dfcid4cYpaPUEXVqgYWrcNL4NQ7v2E+uFam3nHWKOUfVhBaXNaO9oinsGsxAy4ipKgcU
	HniMORhVv4Jzmx6adkJhE7xw5DqQlMUz7Cv8X3N7HM7L9g+iDduFDXoa5BD7PzmDnNJaPeU1MI4
	z7fjd4hjBPwQ1B
X-Google-Smtp-Source: ANB0Vdb4C0RYf6uLFJoUvl3pqvZrIycylOTxaeyb8dUw4DyYcW4xxj5GaWsZ/p6Yg4zM5j/Px0RcdgN3jla0Vw==
X-Received: by 2002:ac8:1019:: with SMTP id
	z25-v6mr1008141qti.14.1536774268594; 
	Wed, 12 Sep 2018 10:44:28 -0700 (PDT)
Date: Wed, 12 Sep 2018 10:44:14 -0700
Message-Id: <20180912174415.71497-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kexec-tools: Install systemd service
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
X-List-Received-Date: Wed, 12 Sep 2018 17:44:27 -0000
Content-Type: text/plain; charset="UTF-8"

Set SYSTEMD_PACKAGES and SYSTEMD_SERVICE so that kdump.service actually
gets installed.

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
index dd46901197..4b9b5accb6 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
@@ -78,6 +78,9 @@ INITSCRIPT_PACKAGES = "kdump"
 INITSCRIPT_NAME_kdump = "kdump"
 INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
 
+SYSTEMD_PACKAGES = "kdump"
+SYSTEMD_SERVICE_kdump = "kdump.service"
+
 SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


