Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F0FC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:24 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.6301.1636603763533841689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nc+iqrO/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so3419820pju.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P4OKQ0DCkrwm286F0YGR/OEASYXHAqwdzNUbdPKV3B4=;
        b=Nc+iqrO/2ZH7oEy+t4JB9OYQXpvmblaZB0W7xTqBMGmbxSFHCRLJgJnpObobdeiWGw
         YCktZPJDKTejcO6V/HXOszAUKErap1r+REKvDOCn3Mxs08f09OlF3S3o9VoTbv6eY8xI
         QipUFH8IPapls7HgxUxkBBPhaIvInikquzxJq0Q6T8HMfuS31Z/ZuuKlcw22wemnPWP6
         SuscdL/OYWR0UO5Q97W26FxLqPr7738KpU9aRt32QzWiouiUF3NHoi7BWOz+sexkIuL8
         3L8q/gky3Euq76ZGRSGUFqcbicRHzJxAE+l04dpkwioDIdZuCnmG8HH+NF0QLVJY1wgO
         KNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4OKQ0DCkrwm286F0YGR/OEASYXHAqwdzNUbdPKV3B4=;
        b=Ibwz+DWwlfg0+N+eYNRBY5lxJBGX2h1r67yCbctq9r32Tb+Eqo7GIcG5o5au34uQ6F
         e6osxeJ/qnx2FSTK6J9LXymhvRK6zvWTvmC16EL+msqA6SKceirkbvxLv+OB9TNrfNXL
         SsTgRDQZ61YovBlmnxnAqs8gzCBhk+YL3HTcC7Gx05lkBdwCBfvJpWpghjpFB4UWZ/Ep
         ONFyCmjrc5Pm2slIAWHgwKeyjBwX7Hmh3aOGTDqvmAyDo+3QP4xVxx0OVS0sr6tzCEUW
         JwWB0laPkjPgGtBLaFn1zFkMh7wRa5Sdzd0nfMSfnoT28N6BvhWKlLTFkc1GWJKXIxsv
         cVjw==
X-Gm-Message-State: AOAM533bb/YgIoQ6IlA9ql+VE790atjcR79oglLzICP/6JfyNKBN09fK
	u01sAJqoYHEnTWI5fwaLrJLGxQf0cwstWklpjsA=
X-Google-Smtp-Source: 
 ABdhPJywACB5yharPTC1pgHEDO1eLxUgk58a15OYFxSxWsNpfU7pGRtBnzcLOROm9vMmLXWaPbA5cA==
X-Received: by 2002:a17:90b:e83:: with SMTP id
 fv3mr4956557pjb.115.1636603762427;
        Wed, 10 Nov 2021 20:09:22 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] sstate: another fix for touching files
 inside pseudo
Date: Wed, 10 Nov 2021 18:08:35 -1000
Message-Id: 
 <e7d94a9cc5ab1b2c5d160fd06d643a4bc3409d26.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158142

From: Jose Quaresma <quaresma.jose@gmail.com>

This patch is a fixup for 676757f "sstate: fix touching files inside pseudo"

running the 'id' command inside the sstate_unpack_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
will always return true and the touch can fail when the real user
don't have permission or in readonly filesystem.

As the documentation refers:
- the file test operator "-w" check if the file has write permission
(for the user running the test).
- the file test operator "-O" check if you are owner of file

We can avoid this test running the touch and mask any return errors
that we have.

(From OE-Core rev: 29fc85997ade490ae46ffca37ef8e1a56957c876)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b9210d66c78bb3f79056e5586cea7b0edd714a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 38dc3bff30..930d87424f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -859,12 +859,12 @@ python sstate_report_unihash() {
 #
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror
-	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
-	# Use "! -w ||" to return true for read only files
-	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo
+	# update .siginfo atime on local/NFS mirror if it is a symbolic link
+	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	# update each symbolic link instead of any referenced file
+	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.25.1


