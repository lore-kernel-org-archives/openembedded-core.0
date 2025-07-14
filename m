Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9A4C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.82375.1752510212557373638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=juPRvWmp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so4303340b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510212; x=1753115012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zK5pKzFGW4N2o8z/4rFYnNgJR0w/ch9+3CtM9rmgVws=;
        b=juPRvWmpTK3p2rihY0ywx2hI0xhjNg0z+SVBuhSfifFtRgGeZT8u/LRLkMR9bzsEvp
         MxHSrflYrlc1xGiT2tps+xIAMujGjde4NFiATiYxmIxcqVGeZugjbfLhTBQFvq6fpuzP
         7ugMN9u+LoHf1G/ShaQfHFJgSqN4JdGUOxal2QS9a5JuSZsb7odb3UWkAT/0Gu3wGM+t
         z0qZVLc5bm+7P9ZPgxfL4ly4yRFXlGAEohNpclcZeW4rkOmXpZw5ALTXb9s0eppDtyut
         0iSFBa1uh7hbHefh2LBZ4qXp6AS4qUsI0e9VC13b7Qg+uFtgjStnQgKsDD9MvbkTjlpD
         fs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510212; x=1753115012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK5pKzFGW4N2o8z/4rFYnNgJR0w/ch9+3CtM9rmgVws=;
        b=btb0IEdWTE36PptlkbcYyqV1lUJIW0YpgsG515F+4HXl8/mISwIabRQRXA8FjXdNw1
         8B+ZQ/doVkTuBH/4+UzkqByBbYt7q1r7LkbVx+4LCZUOuktt391lewuMKH0FeiZSRRIQ
         KwUWocktF3Li3xKIn0TZhaO519D60nFyTbW67QDq346Mg5a5VQh3NsXE6ahgaA3cvupE
         xUv7vnJ/iQ6NGEwm7vl4+PnLIA6jrocUWesupxPD4ezEZoPAjAMQrp53Z2qy5/ohQYwk
         q+tCwJnYQ4OxNXbu08u0Sf99Wwotn2n84jYW62wkHCorUJOLbnnuPubJO8YPi9VGqdn0
         2xTA==
X-Gm-Message-State: AOJu0Yzoz2pZwqOPrAbo/PbxC6sDm0r7/NyGb5b41xE6o8RMVk5nq/iM
	/30tbXWnV26CwiFa69hFZ+H/gwWjqLLUnR+GsKRyy9ybV7fxU+zC72yuVghWH/P5/Jh12s2it5M
	GZv/7
X-Gm-Gg: ASbGncvYF0o1/UyNMIdX9azNdgFInsMwZp1c10MptjNGODjaH/yGhSU2c4OZL9RhRZ/
	RsNjV5ONc1PiPYX4t2Q/w28WCYOWIhlQO1szJmDgNSzu9jz7uPdUfYprTmvLKSR/P7iJ8gNmJ/0
	/tFdbmOsfkBTsPxmaKigDmfsw8NkCLQA4bO9ldjSvSiaN95hbi4XxxvsmgPhkM0/bR9nXK92nVn
	oqB2wfXbtZqgs/UW54D5yVILBZjGQ5C2kmLAk6RTP9JRL+6A5f1hS5hyXwf/fMns7TLiWSnFpbe
	j2FrmA1Z6v8V6x4QikvFal/IblKDoSzREGdaYvLTFSYXn+SB0/z6yTMG5JKFd59QiXXGrILTzVc
	oP6IO/F6xLEEl
X-Google-Smtp-Source: AGHT+IGGK4kEvM842ax81Lu0k+vX9bBcWcSLUd6TflgL7BHtrVxoZp3fnYnG6RJalK7lvrC6ZlZUhg==
X-Received: by 2002:a05:6a00:b93:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74f1e7ddd35mr16544431b3a.14.1752510211494;
        Mon, 14 Jul 2025 09:23:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/15] sudo: upgrade 1.9.17 -> 1.9.17p1
Date: Mon, 14 Jul 2025 09:23:04 -0700
Message-ID: <3065d9be88bd66c979926649b442559c611d88a9.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220248

From: Praveen Kumar <praveen.kumar@windriver.com>

Changelog:
===========
* Fixed CVE-2025-32462.  Sudo's -h (--host) option could be specified
   when running a command or editing a file.  This could enable a
   local privilege escalation attack if the sudoers file allows the
   user to run commands on a different host.

* Fixed CVE-2025-32463.  An attacker can leverage sudo's -R
  (--chroot) option to run arbitrary commands as root, even if
  they are not listed in the sudoers file.  The chroot support has
  been deprecated an will be removed entirely in a future release.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.17.bb => sudo_1.9.17p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17.bb => sudo_1.9.17p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index 71d48f448d..83bfc0621c 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069"
+SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.43.0


