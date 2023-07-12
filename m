Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12A6EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 13:57:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7900.1689170234589321648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 06:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=NpP5+W58;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-314172bb818so7558577f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689170232; x=1691762232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgtKvlw7Po6hxFm6qve5TFVRHEqGoPUOTrdI4vaJzpY=;
        b=NpP5+W58kOEVoOvs2geKuBf6lTL0r1jNcJOVKhfyDQhd0r+T0GGMGuRVlFMuWu3H/J
         a6GGC0JIq8lzmB7bidOt7EvhIjXZmI2GGD35YgqZf4yzMtVL424aHuNiCSkd528R2W+v
         3BzKNokaI/w1bvhCEfmibJNC5nTT5LBlULYWdfIj7vszyOFaQLq2RiD+Ot3oTpL+TdA8
         SGRVelo8OSVyArXiHJk+1uUP3GpXfbKbHGzEBH89YlUZ5Nh0HcBXHGdmHupS+i/yE1Eo
         4GQxj+fELC3tKcNUmulSHOwP6LNJ7Evn2NIHOOoZRHF2NFIHeVPRMtelhPjVOzxrWFhI
         UouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170232; x=1691762232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgtKvlw7Po6hxFm6qve5TFVRHEqGoPUOTrdI4vaJzpY=;
        b=NHxd6KipbIHCvfOYp9ykxJBuipZS4FTfvtpLlKMyuu+/bfPHNaeFG5+cRH2KnilUp5
         vJkwbWRJ0uqongl4tmFdg7F20rA3badiMKS49SswWas96nHu9wqhCHowXmPFn8TDGUwh
         Wq16wrqSAEW9mcFSflHBcpO5L1p8Tr/IvhpFmv26HeCLeQFmznCqQ+HVVq5vgAIO0PKY
         GXO6iM1NW59a4pAtoJcwqi0UkkFa/4rGvs15KXrw934GPAcSxZYFxzlqStQO2IcOPKib
         TOW4k9F8tb9nsDE6X5cs4JOrHA0VXr87fU0ElJHx6ftfDogpW9wC/apQ633C2iW7hI8m
         YU6w==
X-Gm-Message-State: ABy/qLYpdm9eF1B0vkchUY3GT4zw97m7xY1fKskMA1sr1vEhbP5HqXfU
	B1h7IbKHAvOwj8fxV1JSyAEncXSH/Iw9ioIImQfIWQ==
X-Google-Smtp-Source: APBJJlEP44ya302Fllj+qghBzeA+AySCjn75/lsusTqoutoW0AmChkc0XFo6xvhWRUzeKswvNggjIw==
X-Received: by 2002:adf:f592:0:b0:313:f59c:95ec with SMTP id f18-20020adff592000000b00313f59c95ecmr18177239wro.28.1689170232645;
        Wed, 12 Jul 2023 06:57:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id i10-20020a5d558a000000b0030fb828511csm5143850wrv.100.2023.07.12.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:57:12 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] automake: fix buildtest patch
Date: Wed, 12 Jul 2023 15:57:07 +0200
Message-ID: <20230712135707.264998-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 13:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184201

Add check_PROGRAMS as a dependency of buildtest-TESTS target.
This is required because according to the official automake
documentation [1]:
* TESTS: contains all the tests files
* check_PROGRAMS: contains the programs used by the tests
* check_PROGRAMS is not automatically added to TESTS

So, by using only TESTS as a dependency for buildtest-TESTS we may end
up having runtime errors because of missing program required by the
tests.

[1]: https://www.gnu.org/software/automake/manual/html_node/Scripts_002dbased-Testsuites.html

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/recipes-devtools/automake/automake/buildtest.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/meta/recipes-devtools/automake/automake/buildtest.patch
index b88b9e86938..c43a4ac8f37 100644
--- a/meta/recipes-devtools/automake/automake/buildtest.patch
+++ b/meta/recipes-devtools/automake/automake/buildtest.patch
@@ -36,7 +36,7 @@ index e0db651..de137fa 100644
 -check-TESTS: $(TESTS)
 +AM_RECURSIVE_TARGETS += buildtest runtest
 +
-+buildtest-TESTS: $(TESTS)
++buildtest-TESTS: $(TESTS) $(check_PROGRAMS)
 +
 +check-TESTS: buildtest-TESTS
 +	$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS
-- 
2.41.0


