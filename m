Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D8B107F43B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 15:09:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x15so65036988wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AkkjdJtwU4LWpq+VpC2djLD2AtP159FqBOITD6wpAaA=;
	b=aSMrjbmQqefkvXkOSM84crefLLJLVLsHoQtHHVQF2AsP9rJCsraylxraoqM58xkn+V
	2L9ntGXvWqoEUUtCFCc5f1u8JMCiZLpluf3QD0l1fKPKf2/vRVOmX6a1bLTjv84xKZjY
	E+IBupaXnBjTZcZbRHFhlK7HTX7TIeCx4EQcFnuDf+Q3GUJ0dv4+OaVlTy5kGKu1Dpq1
	IZESRUMS38072v7AwSNIVMb9pmqVqu0DhMm3U4nQUOL9JU+Tu3FOHlQYcEHBpR8bMuPC
	QfkPXDuK2LPHAA6XtzWWF6EFn1VaOMPLMTKouHDzL4v+lxE9FRGmf0PZDqItjGZw8ipG
	bh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AkkjdJtwU4LWpq+VpC2djLD2AtP159FqBOITD6wpAaA=;
	b=K+dHjVFiKQwCRkKLG7yMuJDydjfY1vGU0DQQRuy/vN4ULWSgoW+66rjohFD8/y5NKR
	CEqZGjC+Unta72JR9Eyumt+GjQ826/iGa3xEWD0ThP52Ik/MZ8nIbPU+/AlHhS+AKPap
	17oO2raagjO9CrZXkZfvTgscARGc20EoQq9kt3ylA9HYa5tZ9PTAEiUVgwe7umm4XfyR
	4RrjqnGb7OQfekW8nAVVjku2DGf05l1Rv3s8lZEmNRe2bfDCzxbSzEnGwioujmiOqeCx
	u4jHNLp5sxwerRSL8JRPy6/r+kNYG0ZU8BmLHA5enDKmzeQ7lwx9U2lw3W5pjLOiL3/E
	hIrQ==
X-Gm-Message-State: APjAAAXDZJ75e40at8O46CTWaAx7z+0TxOxQgsWfx1mpRG3uQM19qh1g
	3D+4CoobnvjC2rSBRNgyX2asB0TtysU=
X-Google-Smtp-Source: APXvYqzdST8CYqLPfcF3UJzOC3cMDpFW3UWDJbHFYQTjSlzq6fnc7wPN1gaM9F7se17pL1tQvtrIqw==
X-Received: by 2002:a1c:4184:: with SMTP id
	o126mr114047571wma.68.1564672188120; 
	Thu, 01 Aug 2019 08:09:48 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v16sm59382652wrn.28.2019.08.01.08.09.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 08:09:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2019 16:09:44 +0100
Message-Id: <20190801150944.26219-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] insane: check if the recipe incorrectly uses DEPENDS_${PN}
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
X-List-Received-Date: Thu, 01 Aug 2019 15:09:48 -0000
Content-Transfer-Encoding: 8bit

Some people mistakenly use DEPENDS_${PN} and wonder why the dependencies don't
work. Check for this and tell the user to use DEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 891d3a84218..35c4fdb4913 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1237,6 +1237,11 @@ python () {
     if prog.search(pn):
         package_qa_handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
+    # Some people mistakenly use DEPENDS_${PN} instead of DEPENDS and wonder
+    # why it doesn't work.
+    if (d.getVar(d.expand('DEPENDS_${PN}'))):
+        package_qa_handle_error("pkgvarcheck", "recipe uses DEPENDS_${PN}, should use DEPENDS", d)
+
     issues = []
     if (d.getVar('PACKAGES') or "").split():
         for dep in (d.getVar('QADEPENDS') or "").split():
-- 
2.20.1


