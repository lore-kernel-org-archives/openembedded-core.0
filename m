Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAF0CFC52E
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:20:30 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8112.1763814021866654395
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QtEDTjws;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b72b495aa81so344637066b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 04:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814020; x=1764418820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llbSsbiUo0IOFFgkvhFo9MCLuhxJYcfvW9YTOozO0PY=;
        b=QtEDTjwsv7YgEf8qm183ZaaYuswPVT3SZGjIpzzj9RaZgeql59e/h9XTeOurCn+eFQ
         vlcZzOdX6z14thvJ2/z4MTTsj4rQDAq/IqPFyS0h9CYDGWOGqy9nV2F/XPHIEd/pLpd+
         9G8U7PFzIXaryRn3Ru6L/mMpwDkDQoEdqpWEMGJ3S/bB/0z7cTVYnfEkFZfzLDprY8Yo
         KOi4TysaCN/QOUNA316DxEoZ4Ezct/4R6mJrhG9CmKWOnoXmUsHPhJ/qQWbvVRNd3036
         q2PRMU+3fTaLq51fh0/keWRGlkH8fdxmcbOxfnYVRMw5arl3iNj/tOo0MWEo4yAOiiN9
         uwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814020; x=1764418820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llbSsbiUo0IOFFgkvhFo9MCLuhxJYcfvW9YTOozO0PY=;
        b=YIZqYng6GGl+Mi2zM7PpxxeR2Irw6NDVugekPFEUT3ZP/pOKljL7iF6om7UAayxTTP
         2zQnPNv8DfidMQA11JN9TNvKAUvoLup0PbF5y1CLQ6Ine9/mpxo3QMlP/wuyzvj7tNRg
         MqdajNpHgnTTOAQeD1NzHcqxldb8g+sLLbmckF8vpVG8OABPcSKGkglXEDJYRzdhRVsd
         4iuo6UxbgWFBhO5/HfdjWLmmMrkQSdREbHQ3QiB3di+/ra66gKZIrixXKlCNY53PBIeE
         r8RrHiMpfB5Xc0FxXQIUBTxbWBpektcJqC6gCi6c6dqbwnsWNXSmDFrJEFw7mMF1TZ1I
         AXSA==
X-Gm-Message-State: AOJu0YzLlmvk82QrAlGZ5h32Ijnhe7oFMT+mk+rm6+HevCf7L4xua6dF
	RzLrZsDVbKAvbg9Xh29SAzXZpGZpJFQRQtlTzq4xPjYqX11hDAToFur4dUKNDw==
X-Gm-Gg: ASbGnct4XUznKtyi4By3I7FO6iqWFOWezA/enBa5SXgUj6IT+oaAGbWPfuhehyoETke
	Bv/5xFBkaqYYsZoj+RQhsK2fPiTNuxvjEcRBIO/GdHxEoFpyNGhku0atsONWXOd2SfZMcO5qO4t
	P9VlJqke7LGQ4mMidpl/jaHlNg+4fOIvF9/4zdCMrikcjqbmj3M5VjGxIKPmp0P4lcFnHCVZqJM
	AZbUevqO/iOaCVAYMwQcnGbt/Uxf4NY4QIYSZ7cfloMZtbAtghkuHJt0Lsg9+WERe3H2WuJW4ds
	KWEPkbZxDOVFXHyFnan5p0H1yR6kR2o1CUPeFbwYUScPcq8pMD0RjHo/HTw8ODrLjvo9JAPufiM
	BiEHGVcgqtKamYRjeXd2Y1GYiFdBsRH5gWCK4ZEPhSnz9bCDGyrPSRsexYKvUwfRpqlpC4ZkWpl
	HJqZvgkGCQA0aXpXyPfSIi+rJ/LbluDXTQmDhawqyVFgSA0qBHThKohLyDHjjITm1qJhJl2J/JA
	TBczis+wSqZvktPud2Fotn4mnFyRqow/vYm6Qk53qN670eyL+A=
X-Google-Smtp-Source: AGHT+IGDH/VUVAg+FdBbKeQ/1dQ4zr9mBVPH+Tp/UAgCXybvKstUzllA9bdIQqp8CjRO1+fEWuxd+w==
X-Received: by 2002:a17:907:3e82:b0:b73:875f:2858 with SMTP id a640c23a62f3a-b767156746bmr630415166b.15.1763814019619;
        Sat, 22 Nov 2025 04:20:19 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765504828esm708694066b.64.2025.11.22.04.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:20:18 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org,
	peter.kjellerstedt@axis.com,
	Ross.Burton@arm.com,
	richard.purdie@linuxfoundation.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 0/3] bash-completion.bbclass: put bash-completion package to PACKAGE_BEFORE_PN
Date: Sat, 22 Nov 2025 13:20:10 +0100
Message-ID: <20251122122013.1960798-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 12:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226690

Changes in V3:

1 Use PACKAGE_BEFORE_PN instead prepending to PACKAGES.
2 Fix build errors in other recipes that caused by this change.

Ming Liu (3):
  systemd: use "+=" to set PACKAGE_BEFORE_PN
  iproute2: use "+=" to set PACKAGE_BEFORE_PN
  bash-completion.bbclass: put bash-completion package to
    PACKAGE_BEFORE_PN

 meta/classes-recipe/bash-completion.bbclass           | 2 +-
 meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb | 2 +-
 meta/recipes-core/systemd/systemd_257.8.bb            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0


