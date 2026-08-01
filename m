Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32135C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4420.1785586502688622922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K3PleodF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-472326ca506so1414747f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586501; x=1786191301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LMdvypWQY2b9nygbX6Vwknk+PCQuW/zXkuAZTBjkO2Y=;
        b=K3PleodFWKUI7YcyPtIsR3iIlarZTUBeDj1u2+hFGADPUmO5Zx4ndNVWLL5KzaNwvB
         FblCQ7dqCVBHW9V7AW1SD3As90tl5EbzIQ/d09H9ZWCdQ77EeyH5Zza9XjfvwlLRKk0d
         wCw4zV2hl0kQQ8BoamoXriW24X5teTXopy5gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586501; x=1786191301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LMdvypWQY2b9nygbX6Vwknk+PCQuW/zXkuAZTBjkO2Y=;
        b=QsyVQFxvVQataxlgb6mZ0Jhf5gwVVg64nEbI7EYrwVailpwEjRPXEV7GBp2bw0uO5L
         UdtOVZ9B1gdmfmH3WAMJTxCd2hRVbtL8nYLkcD9eOZSoAFDM1PeuJ9/z6NFmoRU557aC
         zMgJPX48bPJHyQWo44zIxep5AyxgASnhDULCGBIUdiQ9DnQ7hL9HIm2CL/rxp1KQbuYT
         +q0PRoIoXg4JeB4nPUBfQPVpSBltIJuPr9/FEv7NUTUJLyjFb1AvR9S5BJo8thaPM1vg
         4YDx7YVvBVD66DKMQeJaHb4eYQiTNtE14EiRW3vv/E6n1HKAjPLAiIJp84jwdABrn/hN
         XFhQ==
X-Gm-Message-State: AOJu0Yzsy8HXJ5Dc0W5WpsGNlluGnMLqP+oLzr3UvaMmXhe/yYaqvw+u
	bEUSZXW+2+KbUbjCIgkMMZShhYR0NXIUwucB4TYPcMbanPM5vSz4eDNRLc2F4y2LtbhS7RmT/ii
	Z00uQgec=
X-Gm-Gg: AR+sD110Xh0/0hVLDvj0p31wShQNNrg8m5njqve/Wo2FYuTx1parZo1BQFy3DxgWFIN
	efgMi5iOsoiLp3rSZvvF9Qm0jhc713Lw2kWmERF90b7N1mED1IT5e9fCbV96h1XnObuLKrgY6z+
	gr15YL4ILIF6eEeOhnsXsvN0vyXpc6Hmi2SRmvhs9CbfICY400zgTHM/a9ylyNWYHlLKRu4M7Vu
	kLczo6j8cS2p+aCEeMDEqG7tZcGpcj7wmbsv8Tb1MKRi0Kvgh3uKxq1rLBYQFjFhN0+auFxVlqm
	/cHgIaUeg7Rt5ckiLHN9VfZReufeI15EDLYW/WiVEecpvq6rjeRtYZhSAxRtduZhOD8RJr+N5pF
	I+uKmVFj1jBmauMOpHW1xfQp9ktrUWHXzC35zxa45ljK3J0NiHvbkngdNSB1QVhbyqHfyKU4axo
	WCK1YG5I10pCYHHjt5QwTojmb94cOQwC2FSLhH5kR6m66Xdb6MdurTSLWHkNSVr/QKcMzWrUDSD
	hMS0tDNUr7pJNwfVIvCltVC6ISv
X-Received: by 2002:a05:6000:230e:b0:47f:2de3:b351 with SMTP id ffacd0b85a97d-47fd72d2fc7mr6269666f8f.26.1785586500870;
        Sat, 01 Aug 2026 05:15:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.14.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:14:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] msmtp: upgrade 1.8.32 -> 1.8.34
Date: Sat,  1 Aug 2026 13:14:52 +0100
Message-ID: <20260801121454.2770123-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242493

* Bump version to 1.8.34
* Update translations
* Update NEWS
* Update gettext.h from current gettext
* msmtpq: fix loop condition in make_id()
* msmtpq: fix compatibility with older bash
* Fix: msmtpd can leak zombie session children and eventually stop accepting connections
* Fix base64 build on FreeBSD
* Bump version to 1.8.33
* Bump year in --version output
* Add curl-based connection test to use when ping-style prohibited
* Update gettext files
* Fix heap buffer overflow in RCPT TO command buffer growth
* Add curl-based connection test to use when ping-style prohibited
* msmtpd: fix infinite loop in smtp_pipe on premature client disconnect
* msmtpd: fix read_smtp_cmd out-of-bounds access when len=0
* Protect against overflow in string_replace()
* Fix a potential overflow or NULL pointer dereference on systems lacking strndup()
* Update base64 from current gnulib
* Protect against buffer overflow with very large input strings
* Fix a potential error-mishandling on systems lacking vasprintf()
* Fix typo in man page
* Fix typo in msmtp.texi
* msmtpd: allow NOOP and RSET commands at certain points in the session
* Fix minor type
* Update notification checks for DBUS session address
* Adds connection test option q to force msmtpq to queue
* msmtpq: Add uuid, simplify anti-collision logic
* msmtpq: explicitly enumerate globs
* msmtpq: move up err() defn (SC complained)
* msmtpq: Add config knobs (esp rc location)
* express failed sending attempt more clearly
* msmtpq: robust notify, stderr, nc timeout, path/typo fix

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.32.bb => msmtp_1.8.34.bb} (88%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb b/meta/recipes-extended/msmtp/msmtp_1.8.34.bb
similarity index 88%
rename from meta/recipes-extended/msmtp/msmtp_1.8.32.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.34.bb
index 7f39f66f65a..c6ac7bf5857 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.34.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4"
+SRC_URI[sha256sum] = "84e8fe2a5a80a1ee7802013b3fbdb846a3f27a4163cf37a1c6d7c7f888873ead"
 
 inherit gettext autotools update-alternatives pkgconfig
 

