Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D0ACCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.14191.1760704032839288144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kNU5vJIh;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5818de29d15so2333404e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704031; x=1761308831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QgV+0pn3JDG35e1SdhckIst7dMhH/1rZVeeBjXL0I4=;
        b=kNU5vJIh6Sfx82/lqla5901gv8ZdbSu790FIiu6IE8sHcT+xSxmukUK5zKseU8S3gy
         95+kxtMb3lGlnCjlYJ3uOQw/oXN2KAU+6Qv1ATIiYGjwvnHu4DQPq2v4D9pf4+H17ROw
         w90l9FtTrAm0c5T43URFP69jypeFtDygZgtO0SKlRG6DPT+mLj4RxKH5UHt/SJdCfxV7
         xyNADndP6kn1c/xYLw+q/fktWWhUV+PXgG5mGUiG1v4m10Tws5bE07onhkQj9nKSZUPj
         ckJknqJOekvVM1P2t6EBrKkc2YzFUHfkqqyN3nbGaJ6y+8yh+qpPsQREFgDBe6yqKI2B
         oiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704031; x=1761308831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QgV+0pn3JDG35e1SdhckIst7dMhH/1rZVeeBjXL0I4=;
        b=eXZ4vnGRYm/+GCBaO3DzgS/z4SKxOo/PP6x9mEzjYBqNu+PIleJxAYoGU0GbeRIhjD
         fCRIxKpmQ50q4GqkrZABcQrW+UYAHCNHE5N5yH5w+8SzUxqibGrHTWWC0AGY2EfQSgi9
         6cKDwZxsHIaCku+P5b+llC7mPkl9zKw9+it23qYQOvBuBcQIBIPFYY8O9ZQdJ0xedQ5d
         i7vSDzIjumOvdo8s15939MWRui7BiaXSun26spH30FwjosCnnJNlGySZ5VtZrtTQ+KeW
         aywUa28wOlrc7JF+LiJhzsI3SWjRXkIvDb/z6uAFD1P9gEGEFS/43xFDKzrfwyL6NNS0
         npZQ==
X-Gm-Message-State: AOJu0YyiNkQOevUIdYzWPKfWKe8kXcUUwKAUQb+Ad7UVfR1tqDoS+ATw
	O4xyow51Xu2XoBgEuvigJ85PYdJdlW1C//15nfUWvOuIg04/kos3f/U5cd3NokSBQvezoFyMRl2
	fbi5NeHQ=
X-Gm-Gg: ASbGnct1KZE4gNh2w4bTfZf0tbml173bmY8bEgsMtEbQXRmdjLSvUEF9nScrj70LhcA
	PzehOlc/xrKF2z1G8JqXwXUbs2WZJBLNT5xg60JJmXVyJo+0M9fabNZxRGVIq+KWuIL5doyIri9
	rkLa8r771IdT9rXO48aXJLK7r+8qFVzJVp1za7OxlSn/tKA3nFaLEE3x7cI6FrjRoevBKNZsY28
	6OrvLXQJyakl3HAF3GqXDNyqCi+j9UuLxv5cfMGk+TaFUTi8/0Nze0lq2+2cZyWPwvS3MnEGHUl
	FPCF94U+nTRCE9aEkLh0eFD/dZwfei5Gfi9tRPL2nQwtwjOf9BTe5peWltFny+Y255kdv2ar+t9
	svlsg90zz/z9BCCb+sakXPzXVojtjLSoFU03UvYtLLBIkQbmvW4Qdf3brnGuVCziCmm7ZySjHP0
	/L8+0U9wCm2JBBLgsqanZKJ7ffWYsvCEYt9OYN8oRl2NTX
X-Google-Smtp-Source: AGHT+IEjj8iHg7piNaCS5mIxpACbdzZu0aFaoW+/55cq/XRTeHMycSU/pEV8ujbpAnD8WE2ZedgSuQ==
X-Received: by 2002:a05:6512:1194:b0:55f:71d2:e5be with SMTP id 2adb3069b0e04-591d85af70amr1205763e87.52.1760704030966;
        Fri, 17 Oct 2025 05:27:10 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:10 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/5] sefltest: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:44 +0300
Message-ID: <20251017122649.493701-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225012

RFC: did not have time to properly test this, but sending this out
in case this helps with current release issues

Autobuilders see failures like
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2714
and
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2630
where selftest are booting qemu which hangs, possibly due to graphics
issues.

Disable graphics from selftests which do not need it. Other selftests
already use runqemu with nographic.

Mikko Rapeli (5):
  selftest devtool.py: disable qemu graphics
  selftest imagefeatures.py: disable qemu graphics
  selftest overlayfs.py: disable qemu graphics
  selftest package.py: disable qemu graphics
  selftest runtime_test.py: disable qemu graphics

 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  4 ++--
 meta/lib/oeqa/selftest/cases/overlayfs.py     | 12 ++++++------
 meta/lib/oeqa/selftest/cases/package.py       |  4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 12 ++++++------
 5 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.34.1


