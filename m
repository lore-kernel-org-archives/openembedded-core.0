Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B2A877D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:53 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x15so4160584pln.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KKusKZu1WqWjl+eUF1KJPwFDOijJpwskoiihUfK9uGg=;
	b=phesORjR0MScegfRqAzBb1TKD0seiyagsY7UGyhBF1Q/LyXxwCKwemo83Ebh4qVjqf
	XcqlsfO5yeYb0b6GrukD3GsjpplAJXkOZm48AopLeony1jyD/JDMGF7VtqfX8r8HkHFW
	rU586HwSCy35CJWusyNLQWKX/Sf55G428X5TbwyqvaMxKx4G/UVuREEs3dxCJybyX8f1
	AmbgrpJW4gLFYB3GaqJajPiwHHIrBAh0SMKqMa1y9p5plIxpruoGfCA3fj0K2jxin9np
	yqKS4MBVl4NjvqF4EtRgF2/yy2/kBvLBX+SED6zLkNvXkyWhu7riRQR9g+rkpdrk6t/n
	eN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KKusKZu1WqWjl+eUF1KJPwFDOijJpwskoiihUfK9uGg=;
	b=bYSGAnJnskFgtHpyNeu3TMlP8MktspVP4qUFb+132KXHj44xCp2aJtQapeTT3/jvbA
	akux9xB2ai8lrOwYRzVQuPUB3Taqee1xVCpdxSMlyu9EVdTQiEYz0oMVxZ2qnN83DnlC
	TCII6qyphVnGjjquywifgaLZLfLrVd+kkcljIYfH5Q3XcrNY8W8VbweY21+EmpHMxcCs
	Oht2p6cEuObIr0dzs95IuydKOBgBtCH24pTdfO4CDXaS1qRcIo3iTLez2UKUD9xTW8hq
	cs+mzHBJ1w9v1uuYZ2JLHHCFhOEqtvkDu3TGsmueDNujbRycNhMt2OCw44berIfDzJZP
	tvmg==
X-Gm-Message-State: APjAAAUOdZW5agOVaM+09AsNrQxgd2EsSOXvea4ZB5iMGualxojNkZYb
	S/BVeIAM1Nge7v+vSe1qKKO5LoAV
X-Google-Smtp-Source: APXvYqxE4D+Tp3De7hUafCKXx8L3VNbUHjENcgvWMM3iZArgeCDMQ+aZZEt/68+w3Kgam6XPA1T/bw==
X-Received: by 2002:a17:902:e091:: with SMTP id
	cb17mr19099493plb.222.1556983674891; 
	Sat, 04 May 2019 08:27:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:05 -0700
Message-Id: <e3898996665591c2909208a629a14603941b6c28.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 29/43] linux-yocto-rt/4.19: fix merge conflict in lru_drain
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
X-List-Received-Date: Sat, 04 May 2019 15:27:53 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Paul Gortmaker sent along the following fixup for 4.19-rt:

[
  Author: Paul Gortmaker <paul.gortmaker@windriver.com>
  Date:   Mon Apr 15 12:01:31 2019 -0400

    Revert "mm: handle lru_add_drain_all for UP properly"

    This reverts commit e6e9d6e290028b0a6b83b563fad9fafa7f1d515e.

    It was a 4.19.31 backport of commit 6ea183d60c46 ("mm: handle
    lru_add_drain_all for UP properly").  In summary, what that did
    was to fix a possible harmless WARN_ON on non-SMP, introduced at
    commit 4d43d395fed1 ("workqueue: Try to catch flush_work() without
    INIT_WORK().") by adding non-SMP variants of lru functions.

    The combination of that, with the -rt commit 473f14a9f234 ("mm:
    perform lru_add_drain_all() remotely") at the merge of the two
    results in the following build failure:

      mm/swap.c:736:2: error: #endif without #if

    since the -rt change wants RT specific lru and the stable backport
    wants non-SMP specific lru, and a chunk of the backport with
    an #ifdef CONFIG_SMP is missing.

    However, before we add a four way cluster of ifdeffery to handle all
    cases, we note 4d43d395fed1 was added to the v5.1 release, and it
    was not (currently) backported to any 4.19.x stable release - so it is
    unclear to me why this commit was ever backported to 4.19.31 at all.

    Further, we note this change was to mm/swap.c -- and by definition,
    any preempt-rt deployment that uses swap for anything other than a
    failure contingency mitigation is broken by design.

    Given all that, I decided that the best path forward was to revert
    the two of the three chunks of the backport that remain in the -rt
    branch, and return us to the pre-4.19.31 merge behaviour for -rt.

    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
]

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index cdba9d2..834b8fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b0ea9ef736c8ab8695bdfba61cd121ce5aa47e49"
+SRCREV_machine ?= "c279a81f1e654023c4cc78afa9f14350ee5f836f"
 SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.7.4


