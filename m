Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8C36671AFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:51 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id r185so51341910ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jYLFp8IqaOeFww2Xn+21GbkcTmtGnbb4fx5nQulbXuo=;
	b=a6Cu4g7jTUwHeZkSaDziyah4jnTlLlzoMmW4opxRbju3demF8udVfY5a6Q9+HSuTor
	kBrsTLXd8P3osJ+nXNcioP3jRUqJH89fwrv+ykQDayNpyl308zgelpYQN5uJbPP4Hiqa
	UAxeC5Hx3FNzE/ACyenRBrJ3xoPZioI8ZWFiOqhPcJe8Zas9NiGdagXFFSY8XZQ0Z5cR
	0Ficrj2cf9Eismdkb05PpMXq06nw5i9DTWwVtONiZ2nq1KoOTgA/BfDZ0fgXwWogYuxC
	tDXvd+Dxt4MBuF1/RJQ1FiLAfFw/i4ufxNJ9+Qbwi6ZpGsQ1KKMxCdVQn61iQ9hBF5n6
	xhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jYLFp8IqaOeFww2Xn+21GbkcTmtGnbb4fx5nQulbXuo=;
	b=D30varl7zQ500YGqRrr3SOMrgYB4jw/i8reaC/yuNElmqsT4bdx0JOnN5G5eFLMkT8
	VnbFxzRz8agfn6Jh9WsT09UzQoDH5OxC5CQBxpS7oD1JTsqreMDeE7zxFPJd4wDpaJX9
	MwcmYHuZAFY7CjvqxBPAvT469kmdPkkFTAvRs77ixWAV63y7fvwAFK+SnOD8CCXhBuUo
	LjNTjfVCnq17L7DePdWVX+Oh0CsOD6QoLbqPrspEOQOcuSh/uMTLALj0laisbBLVWo2M
	G6R6qplWOR1BOeVJE73yOMZCMx/O0+cX8uxsa6EycVcQ4D/Xl1VitQzzgEEdWTa5XZRJ
	hZQg==
X-Gm-Message-State: AIkVDXL7humka5UbQhQhDNIcl5+IuMCiOge2kfk9cn9mwkcN8Uv5xgEXnW1p5VMalGT8EaKe
X-Received: by 10.36.213.3 with SMTP id a3mr3793483itg.36.1484064471415;
	Tue, 10 Jan 2017 08:07:51 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:50 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:23 +0100
Message-Id: <6b7f8ea82e821a9cff465b37afbdb325511f3bb3.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 07/11] runqemu: also accept -image suffix for rootfs parameter
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:51 -0000

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
index 203992a..7d84f19 100755
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
             dirpath = os.path.dirname(p)
             m = re.search('(.*)\.(.*)$', p)
@@ -371,7 +371,7 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
                 self.check_arg_path(os.path.abspath(arg))
-            elif re.search('-image-', arg):
+            elif re.search(r'-image-|-image$', arg):
                 # Lazy rootfs
                 self.rootfs = arg
             else:
-- 
2.1.4


