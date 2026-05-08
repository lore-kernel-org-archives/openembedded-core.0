Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82639CD37B7
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8164.1778224348277607293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hh/AlUsW;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1333566f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224346; x=1778829146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+bENV1pMyRkJ6Vyu0Hnqfa3ummYzCmPyBLwQjXEtAo=;
        b=hh/AlUsW/SKoRCEXLvn9CZxJktvlQ2Iwlt98zxUYUDAkMCDyUL+kS2R7JDgPjRO/Zh
         BcT9US3RVwm+JUmIdYjsnI4d+5NTslxT7TbSe6vsFLzYAc5vHu6FzxVqQCkRpifTZGGe
         IXHYkw+0+LTc3RQEBY//XJ0y4MYDP3VmnjCpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224346; x=1778829146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+bENV1pMyRkJ6Vyu0Hnqfa3ummYzCmPyBLwQjXEtAo=;
        b=VQUF1Vs04gbzDQg+OsUwUjpPeV1MDeAKI/nXofguBreOnrs9Ufq0ZSsT+dREL8GPj9
         KKmVGqaEicF8+Vds7NkPZT/WYxNUGOPl8AAdnX3N74PzaeUF6v5loLiIYwpph1YV0HmO
         t1cWhxb4JFjOQ9SBL7Y/otOLEc0oBDjU0Aw+oEqU/x1PA0uU/cVYWH+wzYjusI/RLREI
         two/I2c35++Wf1BnwEmlkT4suNhFy93AoOBgby/LmP4CgeO1L/solgPNN4APwpUQdA18
         4ZtnNh3gko/ncjfZgt+2kbd7xnisxxpZIvX5SGEcAdRzTvGBvR1whrCIbAiCnW6djdoP
         mJoA==
X-Gm-Message-State: AOJu0YyA6OiaAeCIJVZEwx1XogU0qgrIxNIP/uGaGs/hhjgKfGrKLQzq
	lt+4/b4KPlsfNBNeKqHo+gkeAc9cwiPLrycV3D7w06dSFMJKbvUZ47Lq5Y535eZEk7z9yLYmwjE
	7ZMbFCdg=
X-Gm-Gg: Acq92OFM9SiPNDWy1G0Sw/F2DOp92+uBMAohSmqoaGQjbR8tC+GOv7/lkGJtF1oIE6w
	waxd61oR6oeTs/RJs/qKcpFbigCvhvgqBCaRzuzLOF+3OXkgAyiMKqH3gl7t7qyFXUFHuHrCADy
	H38TIGTtjeS1+C9VWQFkzI3U+e3/2kjQnj+KvZN9idAxo6NC737kCKvcKvz1kbiNMuELdEx+Fq8
	twsVwXMN/hRz7WBdFjwQgtpNO4dJaSgbYBT02lu8VljK9EXG5vr4vtccmzBWe2UyI9wvrhvO0q5
	+61n/p1M4SGCtYTU5MlHOlBwpLqwSjZnhif79f4wxhW9YHS6HrDsfAxB3klH78tief+1xJ7R7dD
	XYd6z9sS0cNaz4kHksVPbuYFpSBd/GnazwgM/wIcw3wqVLfIBaduNrHI+0Nd9skrGdKC8xsVaU4
	rjUcQhNp+3ylZW+/JRAtVfAK/bcTkIPsclwdfDGWCNvEtTiFA6ZNqJma+I9v5NWq00wwi+Nd1bx
	S7ARwYV+7rZgAwuo+QAY+LxK/w=
X-Received: by 2002:a05:6000:24ca:b0:44f:da08:18f2 with SMTP id ffacd0b85a97d-4515b5241b2mr18335354f8f.12.1778224346166;
        Fri, 08 May 2026 00:12:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/52] groff: upgrade 1.24.0 -> 1.24.1
Date: Fri,  8 May 2026 09:11:15 +0200
Message-ID: <8eae456fbe82e4230b9d519e605f349acd220bea.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236664

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog 1.24.0 -> 1.24.1:
 $ PAGER=cat git log --format=oneline  --abbrev-commit  --no-decorate 1.24.0..1.24.1 --reverse
ebff939de ChangeLog: Log 1.24.0 release.
b7ed0adb9 NEWS: Fix a cosmetic oops.
395f381c9 src/devices/gropdf/.gitignore: Add.
79c950d07 ANNOUNCE: Update template for next release.
b8ef50a3c FOR-RELEASE: Update procedures still more.
c6fadff4a HACKING: Make further clarifications.
e824efce3 MANIFEST: Add item for "contrib/install-font".
7152a44c0 HACKING: Add adding/removing components section.
4f09e7438 FOR-RELEASE: Fix wordo and resequence item.
991c72f8d LICENSES: Update heading.
900841e99 PROBLEMS: Fix grammar nit.
d37235816 Fix typos in top-level plain text files.
91e456e53 doc/automake.mom: Fix typos.
fe3db5400 [doc,man]: Fix typos.
51bc75c0c gropdf(1): Fix typo.
e4b1d4c1f eqn(1): Fix typo.
75d77b7dd tbl(1): Fix typo.
669898d53 groff_mdoc(7): Fix typo.
75850a599 tmac/*: Fix (repeated) typo in comment.
9e162946b .gitattributes: Add some "Linguist" overrides.
6e467c234 [eqn]: Regression-test Savannah #68115.
eee74c1a8 [eqn]: Fix Savannah #68115.
d99cfd9d7 ANNOUNCE: Acknowledge Rocket Ma.
8a6b787b8 [doc,man]: Tweak documentation.
1199bb8db groff_man_style(7): Further explain portability.
67db10f1d doc/groff.texi.in: Parallelize with groff_diff(7).
738d7a66e xtotroff(1): Update copyright notice.
c60093c10 xtotroff(1): Fix unescaped hyphen.
5f8492275 eqn(1): Update copyright notice.
b9d07e0cf eqn(1): Add "roff interface" subsection.
fa1459060 groff_mm(7): Tighten wording.
dc92c2252 HACKING: Add more on component maintenance.
02095b504 contrib/chem/README: Tighten wording.
c7cd4564e [mm]: Update provenance notices.
977034df0 grog(1): Fix mangled man page cross reference.
469bbb2ba roff(7): Fix content and style nits.
8fdeff7d5 [doc,man]: Simplify description of `warn` request.
b4b599e7f groff_diff(7) Advise reader of prerequisite.
f0f7c804a groff(7),groff_diff(7): Update cross references.
cdb97b959 Seed random number if SOURCE_DATE_EPOCH is set.
752a371a6 ChangeLog: Tweak style of most recent entry.
c47dd4ea9 ANNOUNCE: Acknowledge Peng Zhang.
37f0060be groff(7): Document `.S` register as reserved.
95bd5f043 [doc,man]: Make groff(7) introduction cohere.
afa03a297 groff(7): Improve descriptions of `\A`, `\B`.
71bf66d0d doc/groff.texi.in: Tweak documentation.
45afde2cb [troff]: Regression-test Savannah #68132.
9c4e2c8c6 [troff]: Fix Savannah #68132.
c71b99984 Use sequential tag names to avoid possible random duplicates.
cdd553bfe ChangeLog: Fix missing word.
7c04b4254 doc/groff.texi.in: Tighten wording.
ba0908298 [troff]: Improve error diagnostic.
f0be0a65f groff_man*(7): Clarify paragraphing macro actions.
f9420c7b0 tmac/troffrc: Fix misleading diagnostic message.
2e238889c xtotroff(1): Cosmetically revise copyright notice.
7d2fef66a HACKING: Revise material on copyright notices.
833430738 HACKING: Add info on committing changes by others.
6b9a211f2 ANNOUNCE: Acknowledge Dave per commit c71b999842.
5471491b1 ChangeLog: Revise format of earlier entry.
103561eae Update for groff 1.24.1 release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit fc38c33acc062df3c707793a9afead28d082bc8d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/groff/{groff_1.24.0.bb => groff_1.24.1.bb} (97%)

diff --git a/meta/recipes-extended/groff/groff_1.24.0.bb b/meta/recipes-extended/groff/groff_1.24.1.bb
similarity index 97%
rename from meta/recipes-extended/groff/groff_1.24.0.bb
rename to meta/recipes-extended/groff/groff_1.24.1.bb
index 52cb17d5ffb..24b8146a727 100644
--- a/meta/recipes-extended/groff/groff_1.24.0.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://builddep.patch \
            "
 
-SRC_URI[sha256sum] = "e79bbcd8ff3ed0200e7ac55d3962a15e118c1229990213025f2fc8b264727570"
+SRC_URI[sha256sum] = "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
 
 DEPENDS = "bison-native groff-native"
 RDEPENDS:${PN} += "perl sed"

