Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB15605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:31:11 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f65so32662840wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iNud5DqRk8d1XRo7Vy7CiXH9EtG5Cyq1dkR22/DT9tA=;
	b=KR+CZ4+C1/hIBQzHzEDIXNsX+swmYHtl0Yno46xMGrCuEA+P2zTWGRdWvnYcGEIMu5
	f84awFyXI8fo5jM433pScJh5AO5B3/39IViAAfHeJEBVi+ssOlsWA0c7zo9fxX2NSlww
	Xf4dIJggozDQR9KQ5V6bXEu0TI/cpb+e15CWx/XpoY+D6pxmGsR/15KC54PuFDqvh0mQ
	7XeXIx5etPKH8ab9KZVNYhwPSDm2+FPpG7tRfWUQmRL98GvUo5s9/5iCKVJMW9D0a9oa
	IuqwZgr0Hh6oNp4rdojnq1QIAVLCdh1iw1oIJH0Cgfu4DQUAN/sNUPgnKYwBkfIiY7ak
	31qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iNud5DqRk8d1XRo7Vy7CiXH9EtG5Cyq1dkR22/DT9tA=;
	b=lTFr4F/j3Jn2l/CFVJHJHO0b7V8IyLXkVTJE6m7358clR+iho/GlF/kQdBJGRmkP2q
	hX0Nguk1X+nIKMnlmjWe6XU1DkD1FTih/k6hde3cLc6gFtBRJrL0hWbxVCqQJOZuuq2Q
	5E44xxD4Q0LA+2e9GTA8VGbRpkAh/BSE4e9RlopphGlpEUMtphmc6KmW3LgZssSRLjGk
	uXtzu5VmYB0bxvMjebO2xLoKU6OCdfsxM6E6/PG/J/ziSbIziZMUtNsYU43i6vVt6dwl
	y5tS3jk/E2oypjWo/HcjNs+FQbVNipw/Z6bj5sE3fgJeP/Uu7yuC2AoZkH6FqRgRSmo7
	Zjyg==
X-Gm-Message-State: ALyK8tKK2t8yYjExMbafyA5LlhYJkchA/jR6A8Vt1l6xNYF9oSwaeWmiamkBkjMMavz7qkD/
X-Received: by 10.28.148.21 with SMTP id w21mr16990185wmd.50.1469129470949;
	Thu, 21 Jul 2016 12:31:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q137sm6522351wmd.19.2016.07.21.12.31.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 12:31:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 20:31:08 +0100
Message-Id: <1469129468-2776-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] insane: only check ${S} exists if we had sources to fetch
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
X-List-Received-Date: Thu, 21 Jul 2016 19:31:11 -0000

Only check that ${S} actually exists if there was something in ${SRC_URI} to
fetch, the argument being that if SRC_URI is empty the the recipe won't be using
${S} at all.

In general recipes that have no sources can remove the unpack task, but
expecting all recipes to do this relatively advanced operation isn't realistic.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9b2337c..c389cfe 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1246,10 +1246,9 @@ Missing inherit gettext?""" % (gt, config))
 }
 
 python do_qa_unpack() {
-    bb.note("Checking has ${S} been created")
-
+    src_uri = d.getVar("SRC_URI", True)
     s_dir = d.getVar('S', True)
-    if not os.path.exists(s_dir):
+    if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN', True), d.getVar('S', False), s_dir))
 }
 
-- 
2.8.1


