Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A95CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2502.1755816216113192197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOuU9WOl;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a3a085so251943366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816214; x=1756421014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAAOX2DHn2Wv1PMgD2Uwp31yHJVoI4n54+01juUsYhY=;
        b=AOuU9WOl6BWgqNWG0hOMMLspp+64JxeY/KuzmdwwQxt3YHdSqvhg7pP+Fblzw16RPz
         w/AgKmw8GEtBumzwYtb3PR1PQk3+7QlSW8VP7PlMOuSGiLjyqyumk0qD8MGymhJcDZ64
         Hxc9e63tafRetknlF4/c4YK9qGGlHMOQrx98+Q+kuovceB3MOlCHYxNK+SVvUROIOo0I
         IdXq4SGBmSDWLy6h0Ljl8wsR5cWfJLENrJDPlvHX1O7MJxLmW8uwQKH5hZ8SzU5KVinb
         sISTc9ZnYvRHCXKTU3Ll8vL4Y/9C/9t1Xp8R9sdM1Qm0CpEmsiGx+H+l1s4SGcwn4yuB
         4fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816214; x=1756421014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAAOX2DHn2Wv1PMgD2Uwp31yHJVoI4n54+01juUsYhY=;
        b=TV21nDxTVuy5182+IXZnX8HYTi+aGMKuGsAZgxhWbB1z/oCSB4ydlZPQ4vEgwaHrSN
         D8gVZkqAglyTteVjX7XN1yTElanfOwDp+rD2NLZXep6CG0D7xSpQ9a9szVu+pkr3GwpB
         iIbuHZ/OqT6cQ/rjZHJ82HHRnUPhH48w+1EtLXpjdQ5oNQgbIo5sgzkPSB2QBLlnWbU+
         F3xibViDb+LOEMqztq+i2icoeF2vvu08cFMKZXOlWVk2Yn5hEql3E9xOupyFos0QV3Al
         +0ncMP8mdTlaK191WJ2VFp0iyS8zOcwYTqT/YOcZsQpzrgA/cMgNfsk2pS175lpCrSaO
         Fvpg==
X-Gm-Message-State: AOJu0YzTAdkOjkBIHPyPcQPNE7w88j3x9rnorzchjt1dawAfmCqKJflq
	5tmwsszfeznY0uqXeq7Duer2qXBPW7AGgsydZxcKaULbFRqvOqRMYnos5pj6gQ==
X-Gm-Gg: ASbGnctj5TZ4GnJ6S6S/3orY1SHNwzBgjp8VJaw9Sz7me3h/nE455cKxA6MYlac8rcq
	xNIZTETIMMP9SMLfyh8BCTtJqfo9dbhltEdRaiX7TDlC2ATsB5O8mjLX+vWKWUOIAUn/3vWKBvo
	DajaFQz8L/MnP0N3rKdu4iAlh3kFSuCbVubtuLCb6k8PnkfcClozJud9noOhz0H6nBMC9iJ04DK
	lGPLvRi7JrkN0PJ5A7vS5AjUV9ERt24t398+ksmygwVbrus3E28KwOqlOd+txf3g0r3c/otQWwk
	vVKMz00qmjL+rjegIJ0cjspMjIf2v1tJhxoHqC+WqDs0JODOzkW4wXgnHzwbaIAzVqxq+x083mL
	KdMiiVlNpk4PFmBOzpF/TQJc4ffVeF+F9hJWyzRVtuZHVZKpa0UG7+Ngt
X-Google-Smtp-Source: AGHT+IEwYCTgHtBoqus8GJ7ThFALoGZ0N3aHxrEav5SAknF251lAttK6IQ5FWBDgzhcu3KQN+8c9kg==
X-Received: by 2002:a17:907:86a7:b0:ade:4593:d7cd with SMTP id a640c23a62f3a-afe28f85827mr70059666b.13.1755816214426;
        Thu, 21 Aug 2025 15:43:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded2bc37bsm472781966b.2.2025.08.21.15.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:34 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 15/15] yocto-uninative: Update to 4.9 for glibc 2.42
Date: Fri, 22 Aug 2025 00:43:09 +0200
Message-ID: <20250821224314.1690103-15-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222300

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dabd604e8e..3ced03d477 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.8"
+UNINATIVE_MAXGLIBCVERSION = "2.42"
+UNINATIVE_VERSION = "4.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
-UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
-UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
+UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"

