Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC64C87FDA
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:13:12 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.6050.1754169185153336583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=0eqHrvQn;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.179, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ab8403b6daso30319831cf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754169184; x=1754773984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SurNLxKASI4TMPfHPdAgF6EJHmhp71PYTyaxC0fr3LU=;
        b=0eqHrvQn4QcaBHaxC7qShtKMqWh/7wpwFJLH7Od4Cmz5f5J6d9nmFWSiwzAa/JotrO
         Ug9dPonreU/lSVVim96SAxzeTQKgsQ/FewYkwcwDqNcgt8/DM7IXekrXHlSKR+nGmvdE
         B4TAgQ9ffqong0Jx8WcR2NBJwjWn0Cj+3pHLitH5K+wLOON1eXShzT3fp5XDwqS4i05x
         Glel80qob7rb/dTMBlpxdBWxqxN+MpD52Oq60vptxBNG4y1Hq4wumLVqH8Yt/og8DXbs
         VptGZxtm2QzYhR0yeFxOyXH87wolyZYCVot3TDZzxQaQqgnl9UtcDY+6ww8DZX9fC3Te
         NU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754169184; x=1754773984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SurNLxKASI4TMPfHPdAgF6EJHmhp71PYTyaxC0fr3LU=;
        b=GyRyM2ZZ1z/2DwxAUuGC1F7IiIolUaJ1cLo9TnPGukrnrz7eWK0PwRmsuN2gdP6vw+
         xCV2RB2c8CRRn1sTaiDBklUfEtSY4mTB/JQTBNWsmXL+Zm2k1Cb7QN/6hmeH2Sr8C3Mz
         wPlQMHiV2O4vl8dqrU5XkDdgFauZhaR27I5sKgO9Arlgd5XZx7cFmfWiABoVW0c8BMaE
         pUwNhGem+3/ks8gxBNZ4yl+/Od5+ofnf+fuQzMs9pVUKl/TVwsMHROVwVi4XqajOce93
         +Kaw2Da+egZonRd2F8KEBDrMK/ayblBZOKV8Giv1vl9uRtBZCRj3tk0zyMI3TmpWlZkF
         pyYg==
X-Gm-Message-State: AOJu0YxB9Q/rhwQ6azJAc1y2UJ7SWMITvCqo9/1yEW3JTye+u/tkU+oD
	/9cMkyk2Hzm/Ccdv51PZ7PtEuv7fdRRK9un0gmZnDHRw/Mu1VeHxWgZbfPpUoI8e7upb6tnpJg8
	g7NVV/bOtNA==
X-Gm-Gg: ASbGnctH3BRD3BmOfLolGNx+PBgLbHhsWt5+YynXnYnN8MOsJEbO4spkvAVC4oQiBkz
	oCrclRfqH01ENVhJGB1Yx9id305fxC5LkFUn9Doyqj0xHLXBcc3zBrHP4DkWwPO8XT1xxjM5ypH
	hvdokQqEbizkaOIJdF/p0V4bFH5wZcXHjdsZm5zq6CRz4TiJQtisE9/8ICrYcXL90q20euHIBuU
	YQPVFcHL1cXSpSNfbFtVKcsa4XhBhahNcynxvLCyKV1BrHsP3A8ljuRF3JQ7TExA76aoz6acr5L
	Kyq1VDrZy8tElfZqbOJjQjdhIfyAt1gOfd8EiCQCzH1faWWHKICIsvxYWU0MA7Huq+mY2SKayDq
	H2uz/7VRpH+qve8K69l54UuSXT+s=
X-Google-Smtp-Source: AGHT+IFF7xsCNS7fB/TysRbQkMGWcKDtGEVy/4bL7BUMqAk8bRMeEJT0KKlj2RqMzrC8yX8LnQ2cCg==
X-Received: by 2002:a05:622a:153:b0:4ab:95a7:cfa3 with SMTP id d75a77b69052e-4af10d2523amr80372631cf.54.1754169183609;
        Sat, 02 Aug 2025 14:13:03 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af230d8a21sm4955651cf.51.2025.08.02.14.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:13:03 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 0/3] Automatically add compile_commands.json to ${S}
Date: Sat,  2 Aug 2025 17:13:16 -0400
Message-ID: <20250802211319.20060-1-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221388

To better take advantage of Meson and Cmake's automatic generation of a
compile_commands.json file for the clangd language server, link the
${B}/compile_commands.json to ${S}/compile_commands.json.

I accidentally missed the initial commit which provided the
compile_commands.bbclass. This corrects the previous submission.

Anakin Childerhose (3):
  clangd: add compile_commands.bbclass
  cmake.bbclass: inherit compile_commands.bbclass
  meson.bbclass: inherit compile_commands.bbclass

 meta/classes-recipe/cmake.bbclass            |  2 ++
 meta/classes-recipe/compile_commands.bbclass | 18 ++++++++++++++++++
 meta/classes-recipe/meson.bbclass            |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/compile_commands.bbclass

-- 
2.50.1


