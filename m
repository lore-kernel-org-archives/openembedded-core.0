Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182F5F8925B
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:42:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21820.1776767334880174539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m/tbwCQa;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so47196145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767333; x=1777372133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knv8OHkTYFq3in7JMjaEX9aHm+yJPBR7EOCvHu+XnTo=;
        b=m/tbwCQaq4yh81rRdfNBmcfHZuhBEwp18S8FApUIzw0ZlRfu3FynMlvl8Zwn1mBmzT
         gY3NDLTRVdv5snqFS9ZnXG/yRK6nJRY5/aP9x31jzcTiHaEjuhzPAN/UDEl910ljZ63o
         DmENdso3NdhPfkZ4I2rXzojKO8JY1+QjzdiqfXvh8wzDC+23kaSE8xajflfpXUJ6m+nl
         avd4zM5kXFFKtNKfxjllJsNLm40SaHUvmCVCmwtz9BcuCyXHDofWgRDdC66kJ2yC/41p
         uoAVcg74EJwF0BiKWKtYb/NA5YDDlaQ4/vzm4hyhiSAGZqDiS+67MESLom04zhVvnOhj
         w1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767333; x=1777372133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knv8OHkTYFq3in7JMjaEX9aHm+yJPBR7EOCvHu+XnTo=;
        b=XIQumtICurpBtLx503xp4tPPK4L+vzWvuE/vHW472I/oA48rl5aVQEWaWw8u4M0Jbm
         whncWkPqp0TmsG0k1VFOoshQawE5peaM2I7awfqE0ztEJEzNLSxXiQn9V/UwhjnRKGhM
         nZPSRsk739f6rXMqTVdS3ONv6kJk4plMQnczdm3oWEyfNq9HYOtM6YRe+eKQhnK3so6v
         QwRQv7HfQf9NE/w/K4Sg00f3YSLHBNdjlCu9FJdl9Q6kypzCUZTcYHmXrRAtIGsvtiIP
         sTmBYJwT7+GbdprHYx8Tmd2kTXq/pmaMTcMbur3okR9oAll3+9mYi/gpPVmF6Z6NrES0
         m0QQ==
X-Gm-Message-State: AOJu0Yy+7kGzPHAI0JShfmHYqS9vHe7hvC4+4GfLMVkl9FHglj5zkhwh
	YNTsgEqaToYujt0fB55fx+4bH+jKoQG/vIkDwSHxuiGcJENq8Rm9NCKWLTbg2iOe
X-Gm-Gg: AeBDiesAO9rmoRWZaB7OfbZZyu6g2/EP2mvIQl+2lGvgzEp1PanPfwvGa+srtEQ4zqB
	IPXE2jCaOzINYyJsNqm8fTzaduQEGDlaodgzkIpxPoQQK0mSv39TD4Bl+G6GK1+heJKmrGl4f/P
	QaI5gmeYfgPjzpVF+AQ0xuqR1PqgIT5aLrehaOrQfPhcOFnrlQwECijOQR3wQFc3XYW9tqR3+JS
	/KqaF5ngk6hjbRE+G3it25EmpG5FwAATn5jWWmfRiSAhFOyJuCgxbH7iW7NSHPLPQAEXeAFUPft
	Gz9gkeN+y2gTXjX1CTcJTF5FidoGwVbb+AfizA4pg6KT4jqWVCl5j9sj5huCav5ZBHP/z974BK0
	VGcAgb/JV2yIvs8V2Ei3qJoF9GOGmNP8XXOoVPokb7jf1Em1knSC7z4DWIL8dcViSp7Bek61c/d
	w/9o2zVeg+dTLsJSUVKeAkd1cMx5jxl0IZKF4VWHwBOwZiC9lCH7q0RNWBJPs0S8kVLtwFFwuAp
	mZORN4=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr87422655e9.10.1776767332724;
        Tue, 21 Apr 2026 03:28:52 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm328752475e9.12.2026.04.21.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:28:52 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH 1/2] package.py: fix kernel module file pre-filter and document strip asymmetry
Date: Tue, 21 Apr 2026 11:28:44 +0100
Message-Id: <20260421102845.292954-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421102845.292954-1-sam.john.kent@gmail.com>
References: <20260421102845.292954-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235667

Change the check to f.endswith(".ko"), consistent with strip_execs() and
with the /lib/modules/ guard already present in is_elf() and
splitdebuginfo().

Fixes [YOCTO #2348]

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oe/package.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 279cd56..c375acc 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -37,7 +37,8 @@ def runstrip(file, elftype, strip, extra_strip_sections=''):
 
     stripcmd = [strip]
     skip_strip = False
-    # kernel module
+    # kernel module: use --strip-debug and --preserve-dates (required for
+    # module signing to remain valid after stripping)
     if elftype & 16:
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
@@ -1167,7 +1168,7 @@ def process_split_and_strip_files(d):
                         or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or file.startswith(baselibdir)) \
                         and (".so" in f or ".node" in f)) \
-                        or (f.startswith('vmlinux') or ".ko" in f):
+                        or (f.startswith('vmlinux') or f.endswith(".ko")):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
-- 
2.34.1


