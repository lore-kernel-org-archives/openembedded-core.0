Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB499731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:32:00 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id i11so6395428igh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TO3FIKsPv94ZPmI2LZy0vgTijO8utn2FTiCj5cqM4dg=;
	b=pK8xfwA6DuE3+YFyLLvB5pT8GjF8JhqUZ5Ln+py7Tbgww0IEX1PxxXJFp6AiLbWm2x
	mZ2e3jI0ssnNqKBCtOclEkPsatSgr74TKywq2UjkR+TrXQpfkcJr0AdBIIEfjumQnyqg
	H4NL34E0HZQ3doP1PRHotIhZnopb/wdfQ5HHi1j+/f9qR7OMkq5LFvTAU01v3aXXzhIy
	ygOYO6KWZBhwnafA9HnhEYPLSk/cOa4p+FT/GHDONSTmV/mj8ijcdkA9JDQveBQgua3j
	6YEE95yj7r6A7jQiOX6AWkMZHkaViSj9N4lroYSK3RWnd+kl8DN+yPgW8B3xO2/m77Zd
	z02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TO3FIKsPv94ZPmI2LZy0vgTijO8utn2FTiCj5cqM4dg=;
	b=lakjcbJlmrbiuloRJlZrUOoIFRy3QzIaJtBGpfr66x/tRJyDezPmghlEWqELGwfOM3
	lVam/3uK1mTRc/xMjMU0nOhAWVjASXLpv3qx9x7M+HrwGO3xCN7bY7avGhAEqhT/sTjb
	dkmlQ/SZh+jcPfMKObZivuKoP2AaM/53X3rb1/seT/F6Qm2EA1gqo9p9A212VFcILmHb
	xQ1fyXFSWwDrTKQBQOzOA9XH+o4s6ZSGQn1JNvG7/prh6Jme1MhnONVxreSV2Hbxbu/a
	yRqstXfadURHYQxsaDuDgcXdhj9KHn8BHfe2RjtsMk5AHRxpG80vmIOnnNKdcsW1DrcF
	l/Zw==
X-Gm-Message-State: ALyK8tKRocR1IamqhQHIFnAoyKeMtjkE7UwUQYRFRs1dGVFj+10iHbIB8y4Lc/Zzqtudjw==
X-Received: by 10.50.104.165 with SMTP id gf5mr5519245igb.79.1464208321435;
	Wed, 25 May 2016 13:32:01 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	w207sm7771019itc.20.2016.05.25.13.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 13:32:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:31:52 -0700
Message-Id: <bd64398a1c368644ee9d2e7aa74ed6fed70a1445.1464208170.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <2db0b62305a20e906ab5e57bff2d3587628b0471.1464208170.git.chris_larson@mentor.com>
References: <2db0b62305a20e906ab5e57bff2d3587628b0471.1464208170.git.chris_larson@mentor.com>
In-Reply-To: <cover.1464208170.git.chris_larson@mentor.com>
References: <cover.1464208170.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] wic: bootimg-efi: include startup.nsh if it's available
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
X-List-Received-Date: Wed, 25 May 2016 20:32:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want the system to boot on its own, rather than the user having to manually
input the correct file at the EFI prompt.

[YOCTO #9556]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index a4734c9..ec13f6d 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -197,6 +197,11 @@ class BootimgEFIPlugin(SourcePlugin):
         except KeyError:
             msger.error("bootimg-efi requires a loader, none specified")
 
+        startup = os.path.join(bootimg_dir, "startup.nsh")
+        if os.path.exists(startup):
+            cp_cmd = "cp %s %s/" % (startup, hdddir)
+            exec_cmd(cp_cmd, True)
+
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
-- 
2.8.0


