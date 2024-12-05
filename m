Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2BFE77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:33:32 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.6552.1733391202889376203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D/W2UfHE;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffd796ba0aso5918711fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391201; x=1733996001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wI86a61Pfx0dLhCjXiGL/N4J+BL/2PQ2tlqj7Wlsyps=;
        b=D/W2UfHEElSjSsUP322jJBfwhk35jZtOM7kUrewkd8T1oZRMF9VpaAhy++YY+j4V4A
         phLHTPmruCfgPZ/w/ty1eborGx+Q9t7Vm2H0fEAE73E8cHhXh3pel8cKXH+TNxCGkZgB
         5OfZv95g9XAHrBqfKWI+GX4oSHjEMAscJZuLOKJvRB6fM7TaYaobuPNs1PIaJ4GlZ4pm
         U59PGTBRJtubifQgJQSwCr5O/6kyIodRX9nuzh/kMJptWk5hvb+R67NNdjpqD7Yle2MJ
         iHX2COAwD+91Z7zS8jsaeyN+g1D0lBdJqbLMbCgksTkVoDPcyIFWkXGeGxuA+eBCc6qS
         f55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391201; x=1733996001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wI86a61Pfx0dLhCjXiGL/N4J+BL/2PQ2tlqj7Wlsyps=;
        b=bDGzZb/JNpMxatwu8JAdvP6ccEbR9Dly4ZYoG0LmVjryROFHghA17cPAWYIvz3f3el
         TbexB0VDcbbjMUyq/BUVmJofdP4IlIhgDLcIm/kWroZ1BUhPuP4T1Ay5OmYaIolDCVF3
         EM73E64cFYc5S61bN9nDn5Hh3gY4C17Wk4+SXthuQwR4nRahr9K7uLqXViKCB44d8vIx
         rcCzDXhijTi2A6H0JcmBbS5fGbujjVjpgnL8fyt+16I7jcNkW0mnP1zk2yq/fD4nfI1m
         NjbOlCGjqpOIMH4LX+Ko2ix6qXSkXobCSyi6PnGkQHvavAhUc/7JcJU7vJ1jobixkzRt
         xTCg==
X-Gm-Message-State: AOJu0Yzb+ikcrJco3xeSK8Zk+QKmWtLGmYn39VM65oy4JE0sxiyjZoG7
	lsOlOYjgU07TIvqmGt9yX/1vR9B8+jirQ+gud7opfx1PlDivk/liOdeGgatSKgJOTCEti6YZd3S
	Y
X-Gm-Gg: ASbGncs3eWFCQNyDzANBfWtE5B0KcFmWdQfz1eF8sdE4p3mOb6Cm9jKCDzurri5lAQ+
	ErDBavB6fOZ5jezZNfVsRbsDffSi7hqi6//0U3PZqwq75z9z4o0RXirP5uERkjWidbMf5ju5PPF
	0vALhQornHlijkUrSoQ95ZM5DIDyMU42hQlkZFObXw/tzzR8kLj9spZnNGF4OSrHPa+/B1NbGB/
	H8dldoGtOc5or6qpIqh/wapFYAtkV9KPy0z61lNdwEGcnQRHeoSxlB51J8+uBF5tEym9is2WQ7S
	a1bWIaoK68snTESZcbPCzM0=
X-Google-Smtp-Source: AGHT+IHWK9VuNLGaFwtPU0V1PIOYhl08yLaJ0DZBLBgU22lOqyLBPfXvol2gWFTaQpXmVYBujzHkAw==
X-Received: by 2002:a05:651c:12c9:b0:300:81c:f1ea with SMTP id 38308e7fff4ca-30009cc52b4mr53806251fa.38.1733391200755;
        Thu, 05 Dec 2024 01:33:20 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e5750dsm1648961fa.101.2024.12.05.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:33:18 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
Date: Thu,  5 Dec 2024 11:32:34 +0200
Message-ID: <20241205093237.333818-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208366

Ran into some issues with swig generated code and python 3.13
and prepared these but then the issues turned out to be something else.
Sending these out anyway but there may be something missing
and/or broken.

Compiled obvious swig users:

$ bitbake dtc swig-native u-boot libdnf python3-dtc lttng-tools gpgme libcap-ng-python

Mikko Rapeli (3):
  swig: update from 4.2.1 to 4.3.0
  python3-dtc: update from 1.7.0 to 1.7.2
  dtc: update from 1.7.0 to 1.7.2

 ...erlay-make-overlay_get_target-public.patch | 132 ------------------
 ...hon3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} |   5 +-
 .../swig/swig/determinism.patch               |   8 +-
 .../swig/{swig_4.2.1.bb => swig_4.3.0.bb}     |   6 +-
 ...01-meson.build-bump-version-to-1.7.0.patch |  29 ----
 ...n-allow-building-from-shallow-clones.patch |  38 -----
 .../dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb}        |   4 +-
 7 files changed, 10 insertions(+), 212 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
 rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} (84%)
 rename meta/recipes-devtools/swig/{swig_4.2.1.bb => swig_4.3.0.bb} (87%)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
 rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb} (86%)

-- 
2.43.0


