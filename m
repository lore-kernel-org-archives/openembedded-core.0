Return-Path: <sstncr@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 847047842F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 11:41:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z17so4399105pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 03:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ycl0Rs21GKIH4nS8inEB0nzUE728G+DmagUJqw/HUBU=;
	b=KV6A8bJkS2wQFQvo4w2OOjekkgfNzqV5Lrh7imPzdXISglOyRRyizAMKp443Vcq/zm
	/pz4zxrxt4+qRy3QFtmisyr+tL1spU0yk72yY7KFYfwq6QmuQicx6HCor/oaHCJRIMKW
	oLl6M/2ylo401Sd2C27zSDNblcMg1z0D5R2c2rneXo//+iOtmmpBVIEfnieAQICdiCTv
	nj56n9QcmvDXfeiwXeJnsddnk3tsOM/JxyPD91dZepVjyWvF8z32nXNqv0EcQ7wTRpId
	w3KubNRfoxEbDUIsC67z7r5vPdmarj5iTkx3SoRAfqY2wiGMTPY0eH/mhDt0Gw1SQCXb
	XHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ycl0Rs21GKIH4nS8inEB0nzUE728G+DmagUJqw/HUBU=;
	b=Z7GkUoHVt7JAUKL6NWnwMg4037uGWQDA2o8jdwLoDjqNs2dLv1AK/nkcbp8J4ofve9
	MYb9AABNUtsSRwC9+GGkfZGqCP5RFEhqj2LjovehyfAWH9J1hKu90O0LkY201mhcDzD7
	0rUEnkrVftTkoW+N6N5Un0+GocZnF76gh1Vfs6/S5ax6r6vCuTBnIC7YOf6cO+vDVrtK
	SkmXtseuMy7aJv2nu4bijyIvsXmoAVgWmlUyCNXbww0vpsNUDfuyEDOped38K08GVnwm
	jeoTbksr/9CHFbT7mcGrEpFJu2QRsGbfCwnf5BaFsjEVErcq2vjgSS52syONgg6Z9dJG
	GI6w==
X-Gm-Message-State: AKGB3mJRMr4SdSGeHm5fHhLIuj75R9pmVh2ysITpO5Ufl+mIJle8BL3I
	ovST4ICTB9Kc3ometKJOht60aG0k
X-Google-Smtp-Source: ACJfBosmYBPtb7mJuu6zNzSGacM7gJXIbJoVtdoqbzO+H4JBfQE8FzGVAsRJHyaXBUo6GFakmUlRUg==
X-Received: by 10.84.130.75 with SMTP id 69mr25993153plc.409.1515757310460;
	Fri, 12 Jan 2018 03:41:50 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	z15sm37295256pgv.13.2018.01.12.03.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jan 2018 03:41:50 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 11:41:32 +0000
Message-Id: <1515757292-12201-1-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Fri, 12 Jan 2018 11:41:49 -0000

do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run, since
this tasks gets removed by externalsrc when it's enabled.

However this was hidden because externalsrc does run do_fetch and do_unpack if
there are type=kmeta or file:// entries in the SRC_URI value of the kernel recipe.
(e.g linux-yocto).

Make this a separate task so that it actually gets run for kernel recipes with
no file:// or type=kmeta in SRC_URI.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7b612f..6f0a117 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -125,7 +125,7 @@ inherit ${KERNEL_CLASSES}
 # the symlink.
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
-base_do_unpack_append () {
+python do_symlink_staging_dir () {
     s = d.getVar("S")
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
@@ -142,6 +142,8 @@ base_do_unpack_append () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
+addtask do_symlink_staging_dir after do_unpack before do_patch do_configure
+
 
 inherit kernel-arch deploy
 
-- 
2.7.4


