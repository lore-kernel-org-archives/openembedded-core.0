Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3ABC3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:28:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9002.1720096080449725046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XYiZVwow;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fa2782a8ccso2690865ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096079; x=1720700879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gIhE4O8MfuNkWqb96SL7LjnvtIGZA/B03ZtvMVZ0vw=;
        b=XYiZVwowgI9q/qcNywtYpoqidwGQCqhUleJDwyybl7Hka+Ewo+E38NFK3B0e8ZGTUi
         EjtHJxu+5outHryY0bYRp6q/xBjkWs0n75Tv1Rlc2pGt1gTGRJZVR15D3/LZ1rr4bb+F
         3BmcMQOGWnaPS9H0/xhAk+fIBKsMh4muJ3XKwvqLqHmBVRcqwMslJYBuTZ8W1PowFw9H
         6Iu5mw4HjgvEl31o2FwBaJYfpdNfM9r4HDiSVjInTvDsB/4+HqVddl1z5s/n7Kwcu8aG
         2KM2bslf5B0g6yzhra/7W1RU/WaaWpgs3k4y66yM5bdZvK0E3iDJuNrmzflp+KH3N2cm
         h9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096079; x=1720700879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gIhE4O8MfuNkWqb96SL7LjnvtIGZA/B03ZtvMVZ0vw=;
        b=LbquU+GPpsHNpqlFnTkWpY++1IEGX+9sFzZE7zTqCy8ZIlfn5Rzcw8tet2fSx/WTTC
         aI9LfN39rJKEiTJ1nJ8/Nhr0Nq8WHSoHcqsHkCjhGKrHspa3djJ4rPWqKEEgkRQq1MPy
         yeF/d7DzkVfctgj7sSbdWMZ0OGe+r+g1lZdfX7OVTURW5Png6XmCFc4mPidRK5sK8mwk
         r3k+59GPsmTssTcq7LFoM6kNev+CrpMX81+kE+IfinEak0HYXJ3m+PHkFpxVxejO/UMS
         A6m/GPiyemfLKNuZbqEt9+OyyGi4Lso5F0gEHKMusTXxlK48K4qKWHsxyz45Kp4qz2Ed
         r69Q==
X-Gm-Message-State: AOJu0Yymnv5khBh+x+I8k/Z5zs16HjgELg5UgRZhDHBx02W/Z2lACQ3A
	rVe9/2FgrX1B7gktouSuhxSkEw0oNZpZyRZUf9F9odzjphc6JmsJu4g8IsVilgg7TOoGlsebqZX
	E
X-Google-Smtp-Source: AGHT+IGk+2AkEcYqsywKVJgKoYYeEnOcxyWPgodWSt11jD8UPTrThogKRTQojTtGeKgbbDptDcmyvg==
X-Received: by 2002:a17:903:1c4:b0:1f9:9a87:76f5 with SMTP id d9443c01a7336-1fb33e55a16mr12656065ad.27.1720096079118;
        Thu, 04 Jul 2024 05:27:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/21] curl: locale-base-en-us isn't glibc-specific
Date: Thu,  4 Jul 2024 05:27:13 -0700
Message-Id: <1cab8d06ce5df7a8d00cff8531965a84d90d265a.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201564

From: Ross Burton <ross.burton@arm.com>

The musl-locales package provides this too, so we can depend without a
libc override.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8f1d51f4eb6df6c041707d38f60549d13ddab7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index c74416d7e9..3fdad6a4cf 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -120,6 +120,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += " \
 	bash \
+	locale-base-en-us \
 	perl-module-b \
 	perl-module-base \
 	perl-module-cwd \
@@ -135,7 +136,6 @@ RDEPENDS:${PN}-ptest += " \
 	perl-module-storable \
 	perl-module-time-hires \
 "
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
 
 PACKAGES =+ "lib${BPN}"
 
-- 
2.34.1


