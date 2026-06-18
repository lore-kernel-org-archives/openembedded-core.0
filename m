Return-Path: <yocto@nkent.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E7FCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 11:50:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17635.1781783433513027989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 04:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=X8JUQsiQ;
 spf=pass (domain: otiv.ai, ip: 209.85.128.53, mailfrom: nathan@otiv.ai)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4908b92904fso11372385e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1781783431; x=1782388231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJYmLJ304CENhbL78CjH+Oqz9vCGzgPOgq7pfgtMXvo=;
        b=X8JUQsiQyCo79DlNIt+vkXjI6uPNrVT0A7Az5nL+6G47RXa6tkOHpq5M1JqatGtD8c
         0f4xY/P6mAeu8nMoLmqCEM1IXoWSroEZzdVroaHSlFrpe8sRsrt5nDZ82TcDIubtMp0v
         IFpqbjBPTN83BiJi9Km3H5Y/vslrf+E2SC7b1ONqaU9jeCzJYMobYW+49q7awyOiPY0j
         VtKt4hBQg5QYNTPga3BGLPBM+LyYJYJ/m3pfJN3rKPfaM8jpoXiKJBTr+cJy3hsJiKkD
         5FM92BSjxbtnnwOMGDLpsoVVZNiCIFi0EPjkWbWZhmUgPHXhTAVnIGiWisccBZOPI0aw
         dMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783431; x=1782388231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJYmLJ304CENhbL78CjH+Oqz9vCGzgPOgq7pfgtMXvo=;
        b=DWFs9MAyN2Ez09eOiQPnCvAa/yqgu1WzTngZT0/iLIjJyMLH11CBzupRTiFeU/HDA9
         x4SiJYuRnWpyfUBBaqeUQqusvkAVvQzqnBHYPo4siOzwRhE6ZQ+C72xbAEgfk24RecFO
         gray/qJ4BDgYZ3IfsE0G3k72nT0eG71WY28AmAfz9SpJnlcDk6OUjfoDrBbTNzLu46V+
         EslNFtg9i7Vby/lglQiqHWRlABgVrtbcLk8e0pL0DSROi6zMf+BIkFjE3IGHVfARGDtj
         t/MPxnqrGfCc/xTF/50KqnXzaYBPy64SSGpVwdIdvEKNKH2rJrZ7rEm7mu6dRAt1b9km
         LiBw==
X-Gm-Message-State: AOJu0Yyxu67E7oCarHsE/9zGELGf1PrMvWlossm0t+R8lyoc6C8Qn6c/
	1ElFzijGuTY7PAnT0HqYkaopN9iIMgVfHNNLVU0/E//HrwUJZCijTZHNqlcTwJi3YNMV5DIDWjn
	L0pbG
X-Gm-Gg: AfdE7ckwgV6TutWGPhO6kMYI3dmE0BE8iBmLBWoVaLKBLm8taYqKXb7RHSvL/Mw+3v0
	+BmdHsWeehTds2XNo0ePl84A/5jkmshK3UOSCQI2I9ufxvTkHaf/PcJerVCZEl0zvc0/pndoMBv
	aUqAuKHfH2mAU+SjJ3U/KmslzryTosKt8zY6m3W2bhgJX4++UcfdAVZ6/a2z4A30yAETx8dDQ2O
	B2BvA/gvzo/Rwu1w6Ad9K4Y1jeI45UiD2c9WUIKERgMqhDrndKL1BXNuqRcsSQyA/hIdLsSbOkT
	3uyigtE16r0V+VDEjtEgpiRbX8ucJUulgrl41GW2f5C7EHIu+ZYgipYAfMkzansurIjH5dUh5uf
	qtDItG3Dlfid/itTQ2kxI3Q7p92YT63R/t2oWvEFMwPhtiF8Hw4rfyk+G/4rPcrAjTzQu4hJ5cj
	VfrRyuZR4l3RV7Xw1bFoH+cfoVZBRnI8BiyFl2H62Fn500haij3LTAQowoB2hh7+H2zEJ/1Uw6f
	5U7it/yFcesyQ==
X-Received: by 2002:a05:600c:c84:b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-49234131ffamr114591495e9.27.1781783431517;
        Thu, 18 Jun 2026 04:50:31 -0700 (PDT)
Received: from nkent02.otiv.ai (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96d14sm222313885e9.12.2026.06.18.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:50:31 -0700 (PDT)
From: Nate Kent <nathan@otiv.ai>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [PATCH v2] sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
Date: Thu, 18 Jun 2026 13:50:01 +0200
Message-ID: <20260618115001.370220-1-nathan@otiv.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618102839.363123-1-nathan@otiv.ai>
References: <20260618102839.363123-1-nathan@otiv.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 11:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239079

[YOCTO #16321]

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Signed-off-by: Nate Kent <nathan@otiv.ai>
Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
v2: add "sudo" shortlog prefix, fix Bugzilla tag, removed Upstream-Status
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 7dfa0cef6c..489c0db09d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -37,7 +37,7 @@ do_install:append () {
 		install -D -m 644 ${UNPACKDIR}/sudo.pam ${D}/${sysconfdir}/pam.d/sudo
 		if ${@bb.utils.contains('PACKAGECONFIG', 'pam-wheel', 'true', 'false', d)} ; then
 			echo 'auth       required     pam_wheel.so use_uid' >>${D}${sysconfdir}/pam.d/sudo
-			sed -i 's/# \(%wheel ALL=(ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
+			sed -i 's/# \(%wheel ALL=(ALL:ALL) ALL\)/\1/' ${D}${sysconfdir}/sudoers
 		fi
 	fi
 

