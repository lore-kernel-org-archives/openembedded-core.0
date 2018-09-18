Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D63E7982B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 15:16:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k5-v6so2514268wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0LLem7avRFu2QrxBhJuaLBsNRVCjH52MkFiZtibufDI=;
	b=RW2HLCQMnaPR/NApc9dvJoNwUz/pdJ8DUcGJwcZfIvm3T24vUdtX7BrmRnEkqNv9js
	sUG+GUt3jv5IeeaY1n2DSdMSIGLulejKxytI61mKr8WalJ+M68rqjTMwgCnro5CwZ4fr
	nBzW7KC1owAs8G1+PMEdxH8/D9TN6WueETiQl/p/I6nxyPrcLjODxrWmcjaSjmWxXI8W
	VO0abkNn45Zp8zyYkgHj0z+xnbVBbl04/JIqgcV0UsILhGOq8SnjyCWLTeUfgzMmpjDJ
	F/O3iqLkOPWYXluT//xzZCH78ykA2uMoMkWoE5nCsLTb7uiqyS3yrV+203NtD9ATenE6
	UKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0LLem7avRFu2QrxBhJuaLBsNRVCjH52MkFiZtibufDI=;
	b=gGh58BRSqWMHxKhXQH84sXEtnxv7bCrYYL336lisVUINIqxqWPqitlDbVSfpuOpE7m
	T5hBU+ZASlQNUCZZboyy5443XLsjIro/y58lyrcqOh7hDAXQYpP/dCkz5oFc/LI6EQsi
	sWD6kEfGxAQPkhavU+tuE7vUd49L5XqVAsofOVJaBIyGye6yahDEKC6JcsyMrzh4S9bo
	pzWOiT9A1OelXszZkmbTJjkpm9xYvEsgVAfu6haRHf/nbuU4VtP+f5ESXTb1wreleG1F
	8wdbplAM6II5E4QZdozJKDgNAE0V2kq9y+Z0B5pJrtuHZina2ytgijEaMfAKbuDd0NOR
	2qTQ==
X-Gm-Message-State: APzg51BYCH4rLLXgNWAz52jUToMfVPkoVVkcwAZdwLbhwubZqmc5PIOy
	imY7f9/th3xkak1CcbkybURFfBup
X-Google-Smtp-Source: ANB0VdZFITWDxRabLEO+zmtGXYHjCyTZ5gtCpt9Uuy8ZweCf9K2x17Na1mIR+n4x9uKXnNUU05O2Ig==
X-Received: by 2002:adf:c5c5:: with SMTP id
	v5-v6mr23538038wrg.30.1537283778862; 
	Tue, 18 Sep 2018 08:16:18 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	142-v6sm1904838wme.35.2018.09.18.08.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Sep 2018 08:16:18 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:15:21 +0000
Message-Id: <1537283723-27429-3-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
References: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 3/4] kernel: Fix modules tarball generation with usrmerge
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
X-List-Received-Date: Tue, 18 Sep 2018 15:16:18 -0000

When usrmerge is enabled the kernel modules aren't under /lib, but /usr/lib;
ensure we fetch the modules from the correct location so we don't have a
tarball which consists of a single symlink.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6b734be2b675..396627e7efa1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -671,8 +671,8 @@ kernel_do_deploy() {
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		mkdir -p ${D}/lib
-		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D} lib
+		mkdir -p ${D}${root_prefix}/lib
+		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D}${root_prefix} lib
 		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
-- 
2.7.4


