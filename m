Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C804606BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 15:28:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 6so18142860wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=eoHK59SaRbwYdogdkcrfWY/0Q7deYeFqizfES/+zAqw=;
	b=TGP2LrnkmVlUDWgedfWxZIGmGtCZFZvgfk1l10QQ6T6auz3hzLnpQo05lLOGk/KaF/
	+cH0gBQd0Oj8V0F445n6kaTdOoHnJDFFJigF4XPN+oomEFpq3kaJVB5fjar1ALo4WBLP
	WEaO4N4IzV0IkudajjOU84HJqmYh3m14Fxovbcpy0LLFe9YhO+EUhmImnx4zzwc7elq3
	w+cTALlujEJzdbAbzhPA8inhZQ0rJf/3jhgWboHFPsEmigWaCEXe1/d2Yp5nzxe5cGyd
	wnMFMbboYBy+NFf0RoUwwWs93RbFQx9YLmaO1RPPmiQ4Hg9DdlmSrBvLf8rhSaJbXN1W
	Rq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eoHK59SaRbwYdogdkcrfWY/0Q7deYeFqizfES/+zAqw=;
	b=phcg4rtfn++R4wt9O0uwLGf8Zo3txMUIpCDADNBllRYc/WxvDDX63/T0DtD5plI2az
	Rdz7o+pnfHP6cxofJYEhKlPCRvqVYJBLY0oKQ3HbkYeWxILOvvjmKreOMphd8jjkLb5U
	bcw6GUFeXZzrFL4oD3JL2uCb6bOhrdFAfKFsYWEWCjJpGKf0AdzrukgUanyRBThLYGFp
	T1Gi5fZ2CB4SsSuD8DS4OPnt/tdz3dsAchulDKbHu2yQ3y/2khy3OaX2V8kYLFJ8TeFD
	9rpQ9blUwG0O6qxE74QInoOfHbGhz08Lv13rjWXg+Pso+qENFAbBFIwlLiKeYiyZT4fD
	y5yQ==
X-Gm-Message-State: ANhLgQ0FcmA/gG4KpWsSQBL7ngU+OKhXRf87oZQb4gexK6pOu4KPAgV6
	x+Tp0U05H/Lno1c0aWALxQRS2+v/0w3Y5g==
X-Google-Smtp-Source: ADFU+vscLtxzykZ49sRP/OoaeYXXzlYbhrPn2PmhIKaN7bR10s/Plsdjpmo+nr+iaULhPWQtMl+N/g==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
	q6mr22791890wmg.52.1584372517889; 
	Mon, 16 Mar 2020 08:28:37 -0700 (PDT)
Received: from agherzan-lnxU.hanoverdisplays.com ([81.145.148.228])
	by smtp.gmail.com with ESMTPSA id i9sm51036wmd.37.2020.03.16.08.28.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 08:28:36 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 15:28:20 +0000
Message-Id: <20200316152820.23437-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic/bootimg-efi: Respect fixed partition size
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
X-List-Received-Date: Mon, 16 Mar 2020 15:28:37 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..6c3d7b8491 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -263,19 +263,22 @@ class BootimgEFIPlugin(SourcePlugin):
             cp_cmd = "cp %s %s/" % (startup, hdddir)
             exec_cmd(cp_cmd, True)
 
-        du_cmd = "du -bks %s" % hdddir
-        out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
+        if part.fixed-size:
+            blocks = part.fixed_size
+        else:
+            du_cmd = "du -bks %s" % hdddir
+            out = exec_cmd(du_cmd)
+            blocks = int(out.split()[0])
 
-        extra_blocks = part.get_extra_block_count(blocks)
+            extra_blocks = part.get_extra_block_count(blocks)
 
-        if extra_blocks < BOOTDD_EXTRA_SPACE:
-            extra_blocks = BOOTDD_EXTRA_SPACE
+            if extra_blocks < BOOTDD_EXTRA_SPACE:
+                extra_blocks = BOOTDD_EXTRA_SPACE
 
-        blocks += extra_blocks
+            blocks += extra_blocks
 
-        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
-                     extra_blocks, part.mountpoint, blocks)
+            logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                         extra_blocks, part.mountpoint, blocks)
 
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
-- 
2.17.1


