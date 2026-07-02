Return-Path: <yocto@nkent.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E024AC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:49:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64579.1782982159738794186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@otiv.ai header.s=google header.b=QfwAweiM;
 spf=pass (domain: otiv.ai, ip: 209.85.221.45, mailfrom: nathan@otiv.ai)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-476d8e647e9so1464737f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=otiv.ai; s=google; t=1782982158; x=1783586958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIAMEZDaw50JUG+S+9JLTHg4rQaoxqpcxB0M0XIxicg=;
        b=QfwAweiMabAL9P4i0fXXXzF++G0qdBdk8n7qW0wWnIbF11XjaOMF6U0DBWExDmRwnO
         tIP0DZw12hwYFIKeVA9JcHTNRlWSqPEBWe6S8Kq9sBCcip8sltnp+hKIknehzCt6Vu4w
         5+SPuKr+hn0yoE3Gr6NEQtmFtWLRT6KWkC5rpImmWuKhf3YmOfl4Vi0xt8Z+UhlnZCoU
         ctxRD+HJ1HFMhMaB+P15fRCGJ5++hXFlLCdlX3K3FlDh7c3VjJGWMsh9fJLbrd0ToFWl
         Z5FsAS0i7pRW5V/My3YFSC+YkHHUZUzWRbuw57GdeDRj4hBwqfGKjh+5I789b49iZgg1
         rxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982158; x=1783586958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIAMEZDaw50JUG+S+9JLTHg4rQaoxqpcxB0M0XIxicg=;
        b=CA3iA+/j1murFxzioDVZ+i8519t7+VDojlOERJ6issAl3yrJkB0Y874O5CTTPaEBXe
         GKtTjnBMA3ll68lb+ANOaWdB/Ytu0x1ZwT/YwgqE2bQ7I+kILRGnrE7A8CoPbC48B3+J
         yG+hDw53iuYPOFtb3ot47oG95B1lm4fAN0aPDQnJMaqnL4h1CrsTMNfSraqcsT31lhKk
         1D4sVnP875H/CZG2spHX0Meep3dYbVkysMp1JZgs2uSL/lArQdhOaa9dOkD4oONhR9d/
         nIsKEo1yaVWbIHuTADM/Zjg3TBwziVDQg0xK47bno6tL3YllRGdv6f22nwaToBAJaLhE
         cPgQ==
X-Gm-Message-State: AOJu0YxTGDpzEuN+kbDLr8NteTtIdMpB6rAXNYXKWM9ivVHP6c76J38j
	ggKXf2WUX/7C4KmmOr+ZaSP+bWXEyWtL6oetuoikm1CGcGHLCLWvf4zgJpGBLWQuxk2kbqYjTwm
	dnF0w30c=
X-Gm-Gg: AfdE7clI5jfYwikt1h70mKS5CQ8j5jj3AdQOeU+hRF8pu8ZZo6GBaRJYHPw7RRwDeh8
	h6ysBskzPEGtcAdME/WQOMF9OpFET9UyLChT4fNhAndROgjQyT+UIfV3UNWGEQtiPTpbs8t6Izx
	RuWIBg0b9tGQ9fWMMENAMEKYK5zsGIg8OWistq1gmvqViPCetSNXkXZzUsnjj7nwcjH2bnVv/m9
	b4LwbZ0WWS+Yb2LGJV7O4ykBX+ullAhkmMOnyf9+h4eegQ4BR1RVrFXdFHJYAxS3i0sHxkAwbhN
	ZnYvOOYPfQBzeANAmWkp9VAJal9f3QA98IYtwRAaTh6Gj4R4HjiSYZHDGQHVWn3kZeBA2gGE9Ju
	liswBq45IIJlZ+A9o13UEbuU083FujDELC0RLsvVsJZKbDFS0hL8fPA6R0qt83eCmBRxXbBRn69
	nKkd1L4MMBnIrogO2jfKw/YoH2PQAQX3nkoPoL1ZSVjPH+Bt441J3BDfffySvCoGWEaBGmVYZoL
	vQ=
X-Received: by 2002:a5d:5e86:0:b0:460:1957:1b33 with SMTP id ffacd0b85a97d-47759c267a7mr7728218f8f.3.1782982157722;
        Thu, 02 Jul 2026 01:49:17 -0700 (PDT)
Received: from nkent02 (2a02-1811-e507-d800-de56-e30c-805-27e7.ip6.access.telenet.be. [2a02:1811:e507:d800:de56:e30c:805:27e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm6786401f8f.8.2026.07.02.01.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:49:17 -0700 (PDT)
From: Nate Kent <nathan@otiv.ai>
To: openembedded-core@lists.openembedded.org
Cc: Nate Kent <nathan@otiv.ai>,
	Siva Balasubramanian <sivakumar.bs@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][patch] sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers
Date: Thu,  2 Jul 2026 10:48:54 +0200
Message-ID: <20260702084854.260494-1-nathan@otiv.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240025

[YOCTO #16321]

In version 1.9.17p2, the line that the recipe uses to add the 'wheel'
group to the sudoers file does not exist. This updates the sed usage to
the actual line in question.

Signed-off-by: Nate Kent <nathan@otiv.ai>
Tested-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76231f202a437be221c2580d4fa0fc100c453e92)
---
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
 

