Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C92C3600E
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.44228.1742834041604843042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js5CV7qi;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22398e09e39so94026705ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834041; x=1743438841; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m+wMZA5nbU6zr9uqS/vvYEjbsdwC+w9+9nVuopWk9I=;
        b=Js5CV7qiNNciAFtKeU/alP/rgwE6mfpIb/rNImcj698zhYo7EzWc5oo6J+9qzOSogM
         odr1piX5ML23P1EjThL4Xr/ujvwZnvZTYVUtznJzr09lG0MmKfS1x8/h4r5c29SlVbTw
         ieOlXRgVZQQknzqZITnsOipvlOhnYauIoaptq3eQgqfV3a0I8VZcKQXZ6+I4jj8lmZk7
         A39wO/ayycMdO5wD6SlJDDuuz2IoNNNq/DRzx/X/93tUDBFMVxa/L2lqu4cRy4ofzo87
         84AQAztbEMN7jcOYkwPVTsuyCF5X8aVBIkhktaXb4xi82i6Kwxg/M0YAPakzLQEsmOzY
         /tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834041; x=1743438841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m+wMZA5nbU6zr9uqS/vvYEjbsdwC+w9+9nVuopWk9I=;
        b=pRUFzZmwO9RhoahI+kXZpp/pYNWR/V3zv87ucovm8+XrTDbBihcXzeda4qi3GPsjBc
         lWZxmdZDijyOHyyYZhYFXzG9zt37/rO+FlCSyRrodqW/WCWWd8flYZGONc/U+M41gGPA
         B6x0LZK9ODJvRvNNp7k6M9sct3Orm3/8sm2z+k39uq8hGSCs8LYYl5J2thJuUuZ/2mL9
         Yyw7YWpiUDl9CZqCtj7cDhS7o+9eM3aLs1XYp7YMeZnb9u4jy8HltFR5ade8KSTiaCxV
         IU7UyNhXJyZQyAtJqGhF/6D6757sapNYb3HDga/bcyP61+NalozrlmqJAQkifsjHJaHw
         bwDA==
X-Gm-Message-State: AOJu0YwZRUZmKAtfeXVg92WoNmBHXXDh7rYxk9jVevtpjSnBns6ziH6U
	wLntqdAWqHMDRFqwr4hDXCVC+4dAgFeKLPaSlxxvCYk2CYiyY3NNKE+z8FUk
X-Gm-Gg: ASbGncv15kR36oHRz8sGyTna4puTr+6KXgmeS6DOM6ahje5HP+dysc1kgmd2W6l3RUj
	C6W2o9PzMngiwxGdGH0nNgizzfmlMNqIujkLqv/U0pBrtxHw4uBiRsEK5hfLfkPkRvcl89pck0y
	A/vHITyejSRI/X7VZFtyjCvitWMmrOfqP0TKQzBS3/n62Vk66tQdiDVHMqV1un4jdQMuBd1gwaV
	irumgnPoTJuc9zjFgxetGK+8J2AkKJiNQibVEpOH3tEYOtjkoHFqUtUWifB0Gm5lemz5V6YL2yk
	EFn03SqxlZ6Tk4JHL70sYqGgxgK39pZ8QG0Q33y0qjMh5H0=
X-Google-Smtp-Source: AGHT+IFzC2YlcZzO0kqrb6QTbwpkIMAF1rl0xOfblnLP1l6DkTDC0KN5oIyOZFzyOTZuV2PpF1llsw==
X-Received: by 2002:a05:6a20:258d:b0:1ee:ce5b:853d with SMTP id adf61e73a8af0-1fe433198f8mr24016996637.39.1742834040887;
        Mon, 24 Mar 2025 09:34:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:34:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:39 -0700
Subject: [PATCH 18/21] gperf: Pin to C17 std
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-18-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213550

gperf needs to be ported to work with C23 standard
especially around getopt function signatures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/gperf/gperf_3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
index c57ade9fe3817e4355ae92fec9cc24d619f320c9..9175bc13e623e08e0ce1824d9eda3fd7c54f1d04 100644
--- a/meta/recipes-extended/gperf/gperf_3.1.bb
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -18,4 +18,6 @@ inherit autotools
 # it where to look explicitly (mirroring the behaviour of upstream's Makefile.devel).
 EXTRA_AUTORECONF += " -I ${S} --exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "native nativesdk"

-- 
2.49.0


