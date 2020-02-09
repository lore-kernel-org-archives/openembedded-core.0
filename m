Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 66C8060CD2
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:11 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id ep11so3087006pjb.2
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3WI2TNNULi47th3+4rVgBf34Kxkz0dJ84UlSg0hsepc=;
	b=XLkovV9uP43pRL4gTvdF9Ddvn1PGu3WHjufDdiEZfUBDE1+J4fgXbber9OpaNb+pT3
	o6H2HyEbeVR0d7Q12H44KVEmGZKhu/7uP4S3C0nroaSzb2aIWHmOUOtxujpOFFXv3glV
	TCaCKSyaNlVN6P5vDAN0XlztWL5S7tYIKu1R5zP1lsr600d0DBXws/KnzkL7z1mmCDNq
	WrZ/tueZW26D6TWQlu6xZ2q10H3cPcsceui/u5FltGO9+XnOM+1mEbOsFM9A3JpnL1Rh
	w7qD4GUPu2n2G0f29SDbPxSeU7J1yl+j6yBmNwOTSEyYaTco445oGVM4WI8xxdms7TCB
	l0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3WI2TNNULi47th3+4rVgBf34Kxkz0dJ84UlSg0hsepc=;
	b=RASKnNEwpkcZgiCV0hczyoACkgEx/2P+j3F4JmOqlGPy6fpcAH4iWHb1MhQ1Dbybq5
	nDleP1+Lwsw5viXTlGu31gO8knsFAI00776CVEp8WXIqcNd3AzEZoBQ8JqMjdhmK5tNM
	58tzfGMWnC9YvXP7I1yhiE1aR7qJITuD6gHqJVHGPCXqSvQmhBjr4QfeVFNWtMTVSiQ4
	4xCcz7B1dqDMYIdZ401OzPLlxVeYC/dEppYcSVe5w6/66YPz5pFtwytyN6skHsXgC/eX
	AliYboYyPRcAFT/KP71Qjl9X54a6IxdwJoFDzLntxkzqe8Iv/tTMbd95JCwblUijLZFh
	lW0A==
X-Gm-Message-State: APjAAAXovdOBTBCUJ4jUgy45u+fJZKCr5UkU6m/PF6kv8K9fAKeuKEMR
	ORb8AFxp7KgM5HCyj/HKNZ5v2tXD
X-Google-Smtp-Source: APXvYqzb94a37a0mBqsIagdYfs5HX0Vo/nfu9A9mR8QAPLE12kZH6bQA2zGYKELvZO4GNiR66SiDOw==
X-Received: by 2002:a17:90a:fe8:: with SMTP id
	95mr15653858pjz.98.1581264612528; 
	Sun, 09 Feb 2020 08:10:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:39 -0800
Message-Id: <e70fa41a90784a671d1b231b1259e06e92fc2cbf.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 11/29] sudo: Set vardir deterministically
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Without setting this it will vary depending on which directories are present
on the host.

[YOCTO #13775]

(From OE-Core rev: 39fe849b56d70689846262c31ab7c182c8443923)

(From OE-Core rev: 51274c9b195ad00dd6362f352ad9bbf7e9a3e098)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 0a11a1b28f..ee3be95644 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF += " \
              ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
+             --with-vardir=/var/lib/sudo \
              "
 
 do_install_append () {
-- 
2.17.1


