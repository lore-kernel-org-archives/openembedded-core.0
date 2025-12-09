Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2437BD3B9A4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:53:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2552.1765317195214833652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 13:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ucByih5x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34a4078f669so1769437a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765317194; x=1765921994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh9GlwImgKC2UzdbCX1Lac4sUnBs1oUooB5FxV7MLVY=;
        b=ucByih5xWgBxKrpG3BkBvz1YrCUy3JyvSi/RzVqW0FXyQlElv2L2MfAOWDV0JzYeRd
         EiSvr9/Qp3FooRtslz8lAOMSOXMEFQu3Dr6HmPe7c9ssIjkHmr3nM6lQPJfD987ueMvE
         rE/XnhTOzxg1JDgfcWzHBv1Y+mULq0g67liHNO5UtvEDXfhvslcPHB9JxhgMHmjdRK0L
         8b1J1bA0zXfLCi5YNW2Br8QrpFD7nvkPgq/4VgcAFDWR41C2dEzqQlRsOmKj5agz7ZBw
         lkiwhF5sD8vi2W6TOc6h/j4cO8rk8tuGYPj8WoiDWw5+ZhkIhCu169E4DmjtBNTRe6jx
         6I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765317194; x=1765921994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rh9GlwImgKC2UzdbCX1Lac4sUnBs1oUooB5FxV7MLVY=;
        b=IUt6nygYHEYQbUI2MsCu2gRO53juHTA8LFuFq2YIUgFIRjo/ADZkkyCeE2BjZeTJOE
         gBYbwmHB0vrU940nwSQcQsHYXwassLBS3Q5y+6wbqyDYc7HJu9BqtG/bWFdzSTJqxD54
         leOrJlCpPtnVjFJ3x9EbA0s97AcOvJP5eqkA7DthjthJ35ZCJbZ8il3dvpbHhat9GuIX
         KTMaCRdw12KTdRomgM9v5mXzb9HkRR+9nn2Lw+sLE1UOjcJOHPsElk0a1KNsIsX2jALW
         Dl+7sPgjg375dDq9TTbKy+cAB7zhKp7RnwNb8WfKBVtaw5Ksi6xySDl2GD7ktYR8ybJp
         Y/9g==
X-Gm-Message-State: AOJu0YyWtKP0a59PkmUxK8nJISiHnE7Olh6cH7o4OfwerLHsspfaDoZW
	9kXigL3gmMN1vIv803rg5YU9Di/cg8qMwgXwIM7uVakqHB/yjuA4tpjqFdZVgL2dsY20SQzaBMj
	S1LnU
X-Gm-Gg: AY/fxX6coNqR+cro04c2xhPLzPOrJGdSkUz2LUxHtokBJInVe/QBPJ8J9kVVEIIt/Ry
	Zg5GDdUleCrIJlgJpRJNd9ns1YGnt5gJdqmMwqcvWn0rLpnbhOHGgZ3eL8Tm8C+VUGRNJ9h0ytn
	UKmLYnMwcp2In6zZZpV8XrTH5HqpMvMIK9hUMHcClj6ULxtfa0VHK3pXUn/SipvyXO4pcH0cWPA
	kbehFWhsGZANkUVCTTv+COaatt0Y25tN5tTjWhqC8ly2AvSdbbdnQwmhjTiwpP0RWp2nOjY2eaF
	t9Jp7nPbiX7bJVCCixRkty5G1Rs1P4vSQZogRSHzzwpmypL/ZuQopIx9jPlXjYs/Bd8sBFsTHfi
	7t6xsb56HmpZoK0tSBga51CYHJlgFKNnz9GREi63ETsdbjRhjROk5VaL51HytVQYbLhrIZVFioR
	Q80A==
X-Google-Smtp-Source: AGHT+IEQ9nkG2Td9wABYO3VpBrudGoeTQWkfIftZdQi8xK6CDbFumaPC3oT1hnRMgFMBjR20VfrSpw==
X-Received: by 2002:a17:90b:3dd0:b0:340:b912:536 with SMTP id 98e67ed59e1d1-34a728da882mr170523a91.31.1765317194155;
        Tue, 09 Dec 2025 13:53:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5aef:241f:68f0:d970])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a6ff012e6sm412296a91.2.2025.12.09.13.53.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:53:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Tue,  9 Dec 2025 13:53:03 -0800
Message-ID: <cover.1765317045.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227447

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, December 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2836

The following changes since commit 80c7fd87fd95a79c6eb5f41b95cf70ccc70d9615:

  systemd-bootchart: update SRC_URI branch (2025-12-01 07:13:56 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (2):
  libxml2: Security fix for CVE-2025-7425
  openssh: fix CVE-2025-61984

Peter Marko (2):
  libpng: patch CVE-2025-66293
  libmicrohttpd: disable experimental code by default

 .../openssh/openssh/CVE-2025-61984.patch      |  98 +++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 .../libxml/libxml2/CVE-2025-7425.patch        | 802 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 .../libpng/files/CVE-2025-66293-01.patch      |  60 ++
 .../libpng/files/CVE-2025-66293-02.patch      | 125 +++
 .../libpng/libpng_1.6.39.bb                   |   2 +
 .../libmicrohttpd/libmicrohttpd_0.9.76.bb     |   3 +
 8 files changed, 1092 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-7425.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-01.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-66293-02.patch

-- 
2.43.0


