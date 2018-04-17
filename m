Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE83674527
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:25:13 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id r125-v6so7991867lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 17:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=R2KNEtrpGlthLehzxTMa7ng4kkCVuOusToDT5UieId8=;
	b=SnhC0Mh80bZIxjl95xxnrJCxzvDOZ1IJUwHt/hGIZQLplRvVgakt0QitFDmn8PvuT8
	V2wybuLPLtrZ2NxzXcFOLG0aHg6ljKBF9o0MTI7vOWOQdQgpt9eiS0rk0sdso7AApODC
	0LOtt33sfpjK6K0qH2gPuugwDCCzM2X5U0I96+KzyQLI0/RJyjEOCVjoKslKcsjCeX5n
	VW2tlIP5fWVQHYg+Ga8KkukEr5HXVz/OdcEnEKtMxv0flEqZ3WYXsqT4UGoToSeNkn0e
	kHaFehe0UwcOybKjZa7IUsGMqfVW+K4UjoN6ORvOsoGp6+qzFN3JMzfvTmISr3sHuqQ/
	7EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R2KNEtrpGlthLehzxTMa7ng4kkCVuOusToDT5UieId8=;
	b=ZWux1Y79Mg0Cr+iMIxOhIfUZIqqN/PUIO75K+3rIzVJep6QoicglWyBDjOCo8BBOI4
	836ea2IbMv90gR+sVUIVeFj5yM4EStTNkYG/0xA+WNd66EgeJvTRW1kNahvD3LgrRZLr
	A0X4brgLNhnToLpkUvhBCoCGSM97IbIFvoQ/aKNcozLGIOEDNaVamoaIAN+INueS8oZO
	9ziGgDCTDluIDExTa3xkjhvun5S73rsGkxphDhp6ipJ+9RNlZ5c+C9BmWaPUVY1DACCG
	Sn38KUKFPPHZ5F7WuPLoIehE8vVqFU6lbtL32G6LNV1JOmimHCrMeTJfa6axez1Alb2w
	STqQ==
X-Gm-Message-State: ALQs6tDaDQYUkaha6HsJG68QUTLOg1wzoXT2VGsjyFngPJ7ERAikFvs2
	jBQQoUgUKJu0HtsIKAir3EgdUg==
X-Google-Smtp-Source: AIpwx4/34f7sScJ/WiCDmS9rHx1xsTyAKy26nTsSfjCLZgjwQRW1KUBz1/8FS/RMuARkonolM6PDhQ==
X-Received: by 10.46.132.197 with SMTP id q5mr2902203ljh.14.1523924713901;
	Mon, 16 Apr 2018 17:25:13 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	u19sm2327914ljj.51.2018.04.16.17.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Apr 2018 17:25:13 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2018 02:25:10 +0200
Message-Id: <1523924710-21480-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Tue, 17 Apr 2018 00:25:14 -0000

From: Ming Liu <liu.ming50@gmail.com>

It defaults to be '0', but it allows the developers to choose not add
file-checksums to do_compile for the entire source tree, by setting to
'1'.

We need this because we have a huge project with 100G bytes source
files, and we do not want them to be added to file-checksums variable
flag.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/externalsrc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c9f5cf7..2b83193 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -26,6 +26,7 @@
 
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
+INHIBIT_SRCTREE_FILE_CHECKSUMS ?= "0"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
@@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-    else:
+    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMS'):
         ret = s_dir + '/*:True'
     return ret
 
-- 
2.7.4


