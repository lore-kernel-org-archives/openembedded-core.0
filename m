Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C27C9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2834.1790154725254964015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QBOFrR4H;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso4214155e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154723; x=1790759523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q7u2CsiNHsuIPqphWTiTSTZimYJUZSCplu70NQsBXiw=;
        b=QBOFrR4HC2KG4v+t5Pr/lMnRA/YR/7jpP+6tK4JZ4CP/XUqXEBylRCBAgVdELD6Czx
         QyYG32KFHEEHXafU17lCxBI9dPDb9PI8xFb7WRsH7u9QXoLZeFFvgKXMMQm9L0pTwnjx
         sevMOurmLV2cnkgSbJrNRYLzmf+PloxQSvl9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154723; x=1790759523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q7u2CsiNHsuIPqphWTiTSTZimYJUZSCplu70NQsBXiw=;
        b=LkSgwxaeicV6MLoKEPUbYDzTOm/AqHo24rWX4+gXlWYp7ggWuoZqejvyyj8bughEcL
         R45HZMnonW0pNF/hnMv7NB7cWXN4fYttVm0ZnqbkzmvbKeI6MM+LZvWGtWznvb47VSb4
         gGmhOuZnYxDc3YYgDkJD/ITUAW6KkIU0x8HM5Muxhn41AXxi7FPSKwy+0vsHKREcbsNa
         EukFFwoq8yVqigR5YEcuRyTNQiOY+8REKUjwKLFdLgENT8J15t+AXYpADirt14WHAkxh
         tXZFUzTKuN2jyULtU9CW9T8DppvZNH3wJtj2uBn9viQGw+en5n2Y+O4Z6vdZ8h8uR/td
         4ZBQ==
X-Gm-Message-State: AFuF++ktD6tuy5sWXIAWWVdODZsvPKhS9+Bm/C1X3OJduC4125wHpB3s
	uVjSUVll4lYP6tTtMJSpqWCMNA0vuPoaW/PohIaSR9RP724Xw72iaCbLfy3BkMBxdRhKp/0iOTF
	Iv9KJCWQ=
X-Gm-Gg: AYBFou3x3fS/jxgQOgd2mDdEXlO44YcxCX6l42XfiYHld5cYzF3e4uE4c6OoU2Fn5jH
	Ep29pk7X+FO3ZQbJmk04X28lcdHpG+Pjcqsctxw7HSjBrgrqi605N0BW7BdABqcT/lxdfGfxqzJ
	hiJGn6YUt8vSQzhSIyFbz5MKPt4hHb4rJn+NS3vw0PMEtQByd5ms26rZ6bdta35chJMV6RjBGH/
	ebAAduebPbeUMJBSB+Fj/U7VbjTStjjMk5ytP5oejaxdOdJvFTJ4a/Uwnm3i+wMD1g+VpnRAfIp
	7KIM7CtY4rxYvt0/GplC43krPa3QTuZI7axg3dPaCQNkazg025ZYxLYJ/lcA1SjYJKSMLxWtoq2
	Wq9CIrxgpl7WSy6m+EQETeyMgerzu8aa9ftfq09USym0ZJ0EGYSAy0VMjJ3KhDUPMKABuUXoQZ5
	VDFwm9MQIDj/14EKUsFcNOFUREPljeSxsBuwTdldMGkArVleIdrpBzMzPDd14fzUZt9eeyO7veX
	OZa9WFCROMwcq6Zbfn2CIVh1LiZbsd+3lTb0NdGpVngN1qVRWfMl4jLOe3CB+1Mw2xFnTxIBg==
X-Received: by 2002:a05:600c:1d2a:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fdeffce6bmr30256645e9.3.1790154723507;
        Wed, 23 Sep 2026 02:12:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/48] ptest-runner: Upgrade 2.5.0 -> 2.5.1
Date: Wed, 23 Sep 2026 11:10:38 +0200
Message-ID: <b969018b72abd96e4b504a23cb7054db4f661761.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246498

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in buffering fix:

"""
When running slow ptests, we can see an issue where the tests are writing output
but it doesn't make it to the process (e.g. ssh connection) running ptest-runner.

The issue is that the standard buffering for non-interactive terminals is 8kb and
some ptests don't output enough data to trigger a write. This can lead to
the controlling connection timing out.

This change forces the output streams to be line buffered in all cases. Most
ptest output would contain newlines so this should work well. stderr can be
unbuffered by default but making it consistent here seems the best approach.

Testing with this change on slow ptest runs (e.g. qemu emulated) showed much
more consistent data with this change.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b57105311f1c5fd879dd58fa1de8862ebad989c1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
index b52f327af97..4bf4827bb89 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
+SRCREV = "afe64efbb3f028e898fa9a5efcdc3010ebdf283c"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "

