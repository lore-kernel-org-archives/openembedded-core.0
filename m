Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2C39077414
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:31:19 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id v96so62991154ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AGTVFgJ+NUl+ydgSO4otcbilQiD0d1EF/nRmiCky6Fs=;
	b=iIW2xFstbPjsXAxqPS7v0wkbIFhzVakSj0JEivz3iuSGIXGrawfAYrgiyL7gDx7RAF
	/rWbtOd7/cHut58c6XXpg9SSgn0beytw19V0M7EAMTCFWEGRJyidE0eG9IoTQRQuJT2R
	/TN+KohsHO1Yh3oYK4NhSU+ZBx08y4qhXLqit2+z885d46nfB3jVNj9GiTVN2z57I/qG
	d0oUL1b2PZTPwFNN5YLXpXyCjsnBVqeCRgtDn8gYVfhy7StWaGzit4/vwwGNgESb09mS
	dCoB63j5sGCZ06Rnny+Jx4JdfwRnpTI39UP1QHRpi/N/KxTpjoo963CK5rv3+gjSgrSj
	Gc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AGTVFgJ+NUl+ydgSO4otcbilQiD0d1EF/nRmiCky6Fs=;
	b=UofLLK+VWOYShl5rqt9PHsziwFxFGU2JOoRu2UdxgtEeTIpF1DPF4qivL4INzN9Zfu
	AEoeFnwOeCtksaIKxjXcgpcd84nhnUe9K8hc82JIKWaFVP4gzg6otaFkiVuDf32JwyeU
	T/EmHHewAh+1MjA8zYcusm5KVP4/i7E66w+4HAvBoRxQKK+7bKiDkjw/v1G9VEd9f+7m
	44NSkPycebvxqyNG1C4y2Ps43BFiXcgoi3UwYRFB+lBgW2BwkcqXVynh/2fSACRNtkiV
	Q10HAlov5/QVeunlnIWFEkwFJF4UtE2LsFhQeas6A929gOk96fm/JgvN0Df64VNTAliE
	fHbg==
X-Gm-Message-State: AIkVDXJ2dsVsJbFa9eNUYosMKFiZbB0wkMxKRuapx338QOl1xQ3QI2HVKoj0USsN46qXS1gu
X-Received: by 10.107.7.91 with SMTP id 88mr6976218ioh.91.1485531080009;
	Fri, 27 Jan 2017 07:31:20 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46]) by smtp.gmail.com with ESMTPSA id
	a128sm1542174itg.22.2017.01.27.07.31.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 07:31:18 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 16:30:39 +0100
Message-Id: <707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 09/12] runqemu: also accept -image suffix for rootfs parameter
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
X-List-Received-Date: Fri, 27 Jan 2017 15:31:20 -0000

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

