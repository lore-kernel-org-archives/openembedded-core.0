Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id ACD98731F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:29 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j13so62011138iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AGTVFgJ+NUl+ydgSO4otcbilQiD0d1EF/nRmiCky6Fs=;
	b=rj5AffFPcz5BGc55Df7xx03V657GP8wtWbHxdxCvxUTE3iXWjlCL0jzfK0uw9MJFwF
	TLzD6Bp0F+kvl0ty7pj9dxDcLynCWBhJSNit9Kf9XReg3LJLwGrb/Meia7EdoykBBbSO
	khFLVnhf6f1PFEFSx/DKujCJsnQ9J+GM69aJAkkXL4P9kmASm5VdO6SrV/l7YQMm8nIn
	tO2D7YCf5Ziyz0uItu41alS9Jrjut8i43B32yrJRkBDhswir9DLKIEvyQXgs8SJ6PZLW
	sOLH0UkT0cUDzdCcRz+Bii+EuLgjOiT46q0FuXSJGs45jmD5h+veYVh8mPP5i13OWYW2
	Zc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AGTVFgJ+NUl+ydgSO4otcbilQiD0d1EF/nRmiCky6Fs=;
	b=puowjDfVMO/fYKKCErjLpRMf5LKSylA54kU5txFJ3mn0CJYJ2kjaUFeMrEtkjnOYbs
	xzM3qEpLOYi8M3FXaPyXs9Igfl5QGRSPQMRPh6ODLrRd4D/VqZcSkWwogrYIV8dh0wY0
	pzHNZTFuIW/whCYDcogwDubsM1cvCjtLSKcOSP3MxXXxZoIMkRC6CBbNpq/x6Np+aFzC
	6jx+y2i68euIjP19LIMy+4foW8mvTpOYHt0to3cMgcJQDHWx/yrDp5f+awwKAEzYAAu+
	Ve2kKFr8sq7TmTQfurieXb+mjF8SLqZKZcmOuc/a4OJpIQBFyOK64tf0NLcanhMKvmOo
	e3VQ==
X-Gm-Message-State: AIkVDXKlPaFGMUA44zyArymZBAOCEoP8I0r5Cbxki6KituEW6wT17lvdj78E4QdPqMs8nK6T
X-Received: by 10.107.167.204 with SMTP id q195mr14921405ioe.170.1484921609805;
	Fri, 20 Jan 2017 06:13:29 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:28 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:40 +0100
Message-Id: <0b717f1d7ec9feb2165145e43cdbbbbce957886f.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 09/12] runqemu: also accept -image suffix for rootfs parameter
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:29 -0000

The magic detection of the rootfs parameter only worked for image
recipes which embedd the "image" string in the middle, as in
"core-image-minimal".

Sometimes it is more natural to call an image "something-image". To
get such an image detected by runqemu, "-image" at the end of a
parameter must also cause that parameter to be treated as the rootfs
parameter.

Inside the image directory, "something-image" has an -<arch> suffix
and thus no change is needed for those usages of
re.search('-image-'). However, while at it also enhance those string
searches a bit (no need for re; any()+map() a bit closer to the
intended logic).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 17d79e9..4d7168c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -218,7 +218,7 @@ class BaseConfig(object):
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), re.M):
                 logger.info("Can't find required *.qemuboot.conf in %s" % p)
                 return False
-            if not re.search('-image-', '\n'.join(os.listdir(p))):
+            if not any(map(lambda name: '-image-' in name, os.listdir(p))):
                 logger.info("Can't find *-image-* in %s" % p)
                 return False
             return True
@@ -267,7 +267,7 @@ class BaseConfig(object):
              re.search('zImage', p) or re.search('vmlinux', p) or \
              re.search('fitImage', p) or re.search('uImage', p):
             self.kernel =  p
-        elif os.path.exists(p) and (not os.path.isdir(p)) and re.search('-image-', os.path.basename(p)):
+        elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in os.path.basename(p):
             self.rootfs = p
             # Check filename against self.fstypes can hanlde <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
@@ -381,7 +381,7 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
                 self.check_arg_path(os.path.abspath(arg))
-            elif re.search('-image-', arg):
+            elif re.search(r'-image-|-image$', arg):
                 # Lazy rootfs
                 self.rootfs = arg
             else:
-- 
git-series 0.9.1

