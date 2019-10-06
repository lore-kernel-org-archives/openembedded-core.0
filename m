Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 81D2A7E08E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:24:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d26so6644238pgl.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=EbH8yVOoi7CuyFgAl0wK/mBIDj4ZX+5mtoJ7jr489yortMwx3+67ZV+R+Gr4WR0FxV
	1mx/Lx9/O4gfcUPxizkLTDsv3bsK6SC1jgLDAOSQER+2N/GCSgrTcKNygR/gjT+uEkor
	6d07iRIE4xSbzKWgEoudDeZR/0ivB+Bg5qzprUqDFjvHXxwZT9yEZFd7Gv5dfXZG0byj
	sq87+wAYVXlO02MvPDhzCmLyxmIkHE2PVag4Yywne45wFnsNDVPO4DZlJ9aEI28QnCIt
	H11YPKkJ9pbXqa6CfY47IAAFrl4ltxb1nFpmpi05Ejxgx7F/Ge+5smsi8GfcY07A5QU6
	T9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pojecd08mj2wemeStIcomXq3yvWrHPt1J3193bbAAFQ=;
	b=BMeeMymjTGooEZpVZ3Rg8B/y0YCAdx5ajNd+y1CnBGzfXyP7/YHTE4zxi3jNg7ioMC
	u+VU4FDUSSRMsEdh4hQ1c/s/hRIfZVMZ1z0FEwiE5/d+d6JagazOWiKQbJdFZj/ynF/3
	Bw8rwPbOkidyBq/SMqulqxM9l1jP8LmwfuyEttMHP3humEwUos5S1KqMog5IeaXyp2KN
	2iR8lPza+CEiDjeNKlEjDzLRS9vtYns7RSvAXs6Ml83dSR5mhQa/LoA6aSb6UkIpvkAG
	NJLINSLLxgxMjmCoi4Y2gyH4BQ3WWME0H5rpLHwpzvZzny96FFOe6YKmIYum5q1c2REr
	EY3g==
X-Gm-Message-State: APjAAAU7b6c8kThxXBvJrkqj71B2Tnng6BBuALA1NKxBD5OmzdPKoosR
	EvuthUx/u7SkYBULTNHER25VV+pFikQ=
X-Google-Smtp-Source: APXvYqxParnhJNMM/O34g9JSUc2vkG7MWntPvpTKZ/hkh4XSgN0JI1y2ZBwu/YCtAPCFX4n7r+oCYA==
X-Received: by 2002:aa7:8f33:: with SMTP id y19mr28895764pfr.245.1570375455043;
	Sun, 06 Oct 2019 08:24:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	v1sm10586425pjd.22.2019.10.06.08.24.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 08:24:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:24:03 -0700
Message-Id: <ab43184bd773ada2b64b60947dae9533d8b9fa85.1570375187.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570375187.git.akuster808@gmail.com>
References: <cover.1570375187.git.akuster808@gmail.com>
Subject: [warrior] 3/8] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Sun, 06 Oct 2019 15:24:14 -0000

From: Adrian Bunk <bunk@stusta.de>

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68..e6a3899 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -20,8 +20,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
-
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.7.4


