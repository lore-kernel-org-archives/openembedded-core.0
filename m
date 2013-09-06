Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4856186C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:16:37 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so3752202pdj.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ppZhzfmpcqxmu/DVbjTp/OsoliTuJ6S0+Ulu+9x3/Vo=;
	b=Pzwz7mE+KjgXg/lrEaejfebOYjqbF9pO5OVC+3AcfhtWXWNIYFiyuYoggAM7b2iU0c
	uRy0yEta7PW3nOwsW+udfpm9SoIPn2BqY32bgwIoy0Eu3jguy/6I6LvE50aU7UQbTvpz
	Hrb55/N70XFMwy9+mFd9g8bi7qJkuPxwZE1HaNTL+fqi7VcSLBxFM32ejGVz827QUIPa
	LwjA+SWGz2UK3fUemqLz+T5KnIvbzmpjZ/6blZQWgZtvUCjz3gTIjU1cf7gWg0ecGgoo
	UyCgkdbySVUcCr9GI4iD2GZtYKYiag8zgdvxhrLKjiF+51OMt7Vk1QfmkZ/pF53Dx+iy
	ZG0Q==
X-Received: by 10.66.149.73 with SMTP id ty9mr6107751pab.36.1378502199287;
	Fri, 06 Sep 2013 14:16:39 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id qa9sm5931489pbc.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 14:16:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 14:15:18 -0700
Message-Id: <1378502118-18126-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH V2] package.bbclass: skip already-stripped QA test if asked for
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
X-List-Received-Date: Fri, 06 Sep 2013 21:16:38 -0000

Some packages like grub have already stripped binaries e.g.

ERROR: QA Issue: File '/boot/grub/kernel.img' from grub was already
stripped, this will prevent future debugging!
ERROR: QA run found fatal errors. Please consider fixing them.

We would like to have a possibility to skip it using something like

INSANE_SKIP_${PN} = "already-stripped"

This adds the logic to do so

it acts at PN level and not at package level. so something like

INSANE_SKIP_${PN}-misc = "already-stripped" wont work.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 50490bc..599df24 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -811,8 +811,11 @@ python split_and_strip_files () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
-                            package_qa_handle_error("already-stripped", msg, d)
+                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                                bb.note("Skipping file %s from %s for already-stripped QA test" % (file[len(dvar):], pn))
+                            else:
+                                msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                                package_qa_handle_error("already-stripped", msg, d)
                             continue
                         # Check if it's a hard link to something else
                         if s.st_nlink > 1:
-- 
1.8.4


