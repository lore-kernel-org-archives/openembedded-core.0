Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF306CC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:16:55 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id z12so988246wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 03:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sC6EdnyzuXbPSNt4FDcK2nbkDyRdd8RiOsDGaBML1Rw=;
	b=WLJaKPx35mdF5+UuVx/Q8BGfx8uTNYgXv57OXRqudhNX/O6mTf9Zq/Y/lshP046vT8
	8FEfnQLbprw+lSgbfiEO8kR3iTgt22snXJa7Pp9xl+3a2IjM+ec2Vhr9AE89h8XgYDED
	+w86uU5XA57F9ajKICwWM8wI2FTeBjQ1uFo4FCeni4eiImeYh8gAh0EwH44II11BjBa1
	64mYh+bFTQcnbzetd05njgM/bCWM5hNvhTkGkaQ9XNgBszxutiw21/4qfFZnwvS5srWi
	20W42v4IMeStLYYbtjZ90jED21U3JyIJ6y8UrRlQvD/Jy6Il0kKuMty3SOZu8boSpqcn
	c5fg==
X-Gm-Message-State: ALoCoQlqFFcbU3OVdsouI4DJoWDXJeZGXMNtVPn0k04+Ow2wM9giRc2YRSkb0I7PC9waYlpov4DA
X-Received: by 10.194.241.228 with SMTP id wl4mr11498905wjc.2.1381400216787;
	Thu, 10 Oct 2013 03:16:56 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id q17sm9168027wiv.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 03:16:56 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 12:16:51 +0200
Message-Id: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Thu, 10 Oct 2013 10:16:55 -0000

From: Victor Kamensky <victor.kamensky@linaro.org>

Add big endian ARMv8 target to OE infrastructure

Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/insane.bbclass       | 1 +
 meta/classes/kernel-arch.bbclass  | 1 +
 meta/classes/libc-package.bbclass | 1 +
 meta/classes/siteinfo.bbclass     | 2 ++
 4 files changed, 5 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a784aff..f1c6d22 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -55,6 +55,7 @@ def package_qa_get_machine_dict():
                       },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
+                        "aarch64_be" :(183,    0,    0,          False,         64),
                         "arm" :       (40,    97,    0,          True,          32),
                         "armeb":      (40,    97,    0,          False,         32),
                         "powerpc":    (20,     0,    0,          False,         32),
diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 4a140eb..6a6ad91 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -23,6 +23,7 @@ def map_kernel_arch(a, d):
     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
+    elif re.match('aarch64_be$', a):            return 'arm64'
     elif re.match('mips(el|64|64el)$', a):      return 'mips'
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
     elif re.match('sh(3|4)$', a):               return 'sh'
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index fd06c4a..de3ffe6 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -268,6 +268,7 @@ python package_do_split_gconvs () {
             locale_arch_options = { \
                 "arm":     " --uint32-align=4 --little-endian ", \
                 "armeb":   " --uint32-align=4 --big-endian ",    \
+                "aarch64_be": " --uint32-align=4 --big-endian ",    \
                 "sh4":     " --uint32-align=4 --big-endian ",    \
                 "powerpc": " --uint32-align=4 --big-endian ",    \
                 "powerpc64": " --uint32-align=4 --big-endian ",  \
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 8705eaa..9ae2561 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -19,6 +19,7 @@ def siteinfo_data(d):
     archinfo = {
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common",
+        "aarch64_be": "endian-big bit-64 arm-common",
         "arm": "endian-little bit-32 arm-common",
         "armeb": "endian-big bit-32 arm-common",
         "avr32": "endian-big bit-32 avr32-common",
@@ -63,6 +64,7 @@ def siteinfo_data(d):
     }
     targetinfo = {
         "aarch64-linux-gnu": "aarch64-linux",
+        "aarch64_be-linux-gnu": "aarch64_be-linux",
         "arm-linux-gnueabi": "arm-linux",
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
-- 
1.8.3.1


