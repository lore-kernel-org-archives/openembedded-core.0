Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 673FD747E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:17:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x9-v6so3019067pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kboVR71E4mjcHWM+mZ1U+a3juqGA7+SBc8e/d0yusJQ=;
	b=ThJA3XmAnnvkthOnTuxwGB9GCQ4trG/YTVqu9gO6/yfPdMDNei1NIyJs5/r7qoFBpn
	uYXqHn8Z+vqoiy6AHsWRiqXdRMNVxIwrIIzAiLC74+booiRYsTAMtwj+U+5o9XcFRwd5
	3D5bn0v2pG122zfO0C8lETiK+GVrw7nkEE2MLd63cNiYt9P9CRU4EbNoapLcZ5NmFp/J
	FyXx138BETPGclkNGPCjH4+UfDYb4XrMagLfezU+/AvNp7E7HjwonHtT16hyE2BkyMBE
	B8xQLwu6RCyWZfxeJ1dqiZoPUlPN+B2ChlaPB0Qojw2+lpZLOTWh8VYIyXp2Cix0Hj47
	cd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kboVR71E4mjcHWM+mZ1U+a3juqGA7+SBc8e/d0yusJQ=;
	b=uWoNcyqZE4w+KiHNk111S8FStkt4vX8ac0lNSK6fx95YgfR730v2C5vDYKi26UVzzS
	8ubzTEAvDpUDGxiUAQ7PmO6M75VoDAvNnoVEwXNld3p+/AYYFuDjZy2fCH19X9Zhy3Ka
	Y5gLIoozW9xbaQmH/22pAcRuprLbmoLIrms75ueu1pA1Q7qpgNinmYFHoo04FXDyum8s
	UPzP5WTfi6NER7bW/9g82Bh1vqSNnFjy2WhTeJSAehF9Vune5vog1nfqqJRFqzWnZw0L
	mCNUYspO9bW7XyRrG/EtHUbC2pKeqhM9c58XVFefhoG+JPFq7CNanLUfvnFyEDABz2Vu
	VOKw==
X-Gm-Message-State: ALKqPwezf9uB4KBPzDBBIsKQ6ZTd04dPMY+zRmlKEokgWDMKXynOH10p
	jUPeFlKIoF3Pl/uhVaVvEkbNwQ==
X-Google-Smtp-Source: AB8JxZqVDreDwT2x5dn1S+ghNyUw0Y5RFjGBTQT1QIRiXchHiMcr+gCxqo6ypakt3YDW1F2wQFNmRw==
X-Received: by 2002:a63:7043:: with SMTP id
	a3-v6mr2980282pgn.206.1527275826052; 
	Fri, 25 May 2018 12:17:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h65-v6sm60154782pfj.54.2018.05.25.12.17.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:17:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:16:55 -0700
Message-Id: <1527275816-6705-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
References: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
Subject: [morty][PATCH 2/3] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Fri, 25 May 2018 19:17:05 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The isELF function works by running:

   result = file <pathname>
   if 'ELF' in result

By default 'file' will prepend the result with the path name of the file
that is being checked.  This usually works fine, such as:

$ file /home/foo/openembedded-core/meta/classes/package.bbclass
/home/foo/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

However, if the path includes 'ELF', ELF will end up in the result, and then
the check will return positive.

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
/home/ELF/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines

This will then result in the isELF coming back true, and possibly causing the
checks that use isELF, such as the 'is it already stripped' check, to do the
incorrect thing.

Adding the '-b' option to file will result in the path being omitted in the
result:

$ file /home/ELF/openembedded-core/meta/classes/package.bbclass
Python script, ASCII text executable, with very long lines

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 5a324e9b2cf6378f8eaa4e394f9cb36d4e2680ac)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/classes/staging.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 531ca4a..8e89cee 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -892,7 +892,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bfabd06..033bd5c 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -83,7 +83,7 @@ python sysroot_strip () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


