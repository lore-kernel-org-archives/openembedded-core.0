Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id F2F627D27B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id d26so1201086pgl.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=V28F5i/TuWeO7dFSmEV05utbZ3AIdskvV75PjOVxV1E93d1OmfPbFagngkFDdCIHau
	gyYTA64nuNi1b+UiKvomJV9ES5EXdOymv9xIpSWx9dxeKVMsdv1IVhQ4ezuTWYhrQhYo
	zm+TQGwZoI6IzkewYmtLncqF3+ATpKClLCQVTG/CjL4IK64sC30/lozA8g1KLugrln1j
	bk5y3L22osowhfPsJiQp2BY5JTkP7bcsOlnDR2l8d39EJKMYsXJg47G4KqBVEt3E6b1b
	9okJZZG+GPGs00ZrLjdW+6sQwGYoztdTKuZl2H6eehURWhndRedBHq2K5lcZoLCGHHXA
	+VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=s/R+mwRtivneocbUkI0gFdkKskkYGubIlMdpG4KHNLGqtpWWHSwbJzsafIwRobyYWt
	dPEqQj8a64ewexnarv7LZqhqDGS3XvoZODXjQdWkaEmCpaak4djw+34ThGhehR/l9qdt
	yalCGy0k7p42f1e2KUNRVukssqnr2En0g1lqGmMoUokkpagUTtVl2IcqbQJtvR6o9Nt0
	ycH9aOA5U1qlNTYPinwYiYb/Mb4d2H+O16kBzJqTzzIra8qhSYHLusjJ8V7Jn//6joBo
	QSKTFEqB+yD7z+bv1IDCu6c2/oF455cArmKDNQyJrpeuNpcpYNDS8SK3G5BNHsyl9I2c
	mdFw==
X-Gm-Message-State: APjAAAW6ea3irFOmN+qAaQGYkfq7iWIETwYahP5d39fcQqM0b/O4yfPK
	FGZGh7LZiiKy4LdHqW4zEsm2J00pxDg=
X-Google-Smtp-Source: APXvYqxRlSVSxH31rkZHI86Ek95T/9cj+kGphZ4kWYqk7i1S1603gMfcTNVlx5aDDlgDUtyTPmsjUg==
X-Received: by 2002:a17:90a:33e7:: with SMTP id
	n94mr25204770pjb.15.1569818885945; 
	Sun, 29 Sep 2019 21:48:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:07 -0700
Message-Id: <bbbd16f96f4db392e0bd38da4c2ef8fbb4883938.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 12/54] package: Improve determinism
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:05 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible in cases with multiple shlib providers we were not being
deterministic. Add in a couple of sorted() calls to fix the shlibs and
pkgconfig cases with this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index eef1f7b..2c44fc1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1918,7 +1918,7 @@ python package_do_pkgconfig () {
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b595132..b8585d4 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -265,7 +265,7 @@ def read_shlib_providers(d):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-- 
2.7.4


