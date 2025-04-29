Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51056C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 18:38:11 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1666.1745951884893980916
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 11:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JjrC7e0v;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c560c55bc1so767861685a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 11:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745951883; x=1746556683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGGfpPIO+LX0xZ3J4louerIcmmlNrOhUAOuWdRMAslg=;
        b=JjrC7e0vSvfwOPKMscgQOPoAQLyh81yC1K85jkHKIWuJP9lirzh+a6PJI7/6xzwP1B
         V6ccEoJlPzIgB2XvktVp30aPaLMc7Eqrpm+oN9n618wluWETXo6XF6GrU0mu1TzarsR9
         dLYnR4XWjyMdgHEXq4L1vpfPZkab0qrT2dAVIIQxeUPk9g7atLBK3gn6EIpENOkq+ll0
         qMZExxQB9ezLGlNoc1wrUvUKgA+ScIeI8r+62DiJmlL629AWHO6uc7KsFSFNfpw4yc8T
         q5LePw2OS5CGJpCXVgr5CJMKvQEYHCE8+a5ndbIs7lcNxB/lDi6jygRZjOk+kLmKhkY2
         YZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951883; x=1746556683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGGfpPIO+LX0xZ3J4louerIcmmlNrOhUAOuWdRMAslg=;
        b=PM/SZsNTb1iulmcL9jYFj6pq3FNvEz6wDAN0LdolWwpWUZP2kRU8zKznA0TRZc5/Ke
         icpl2zdQUigYktIJYNB1zT+7yhb0By1cgJPnDP4aHiq6rTeJL7hA0ZEutXBf0OOFOIWt
         KsYGTwlppz+UkiRVmePeF0EUh/KQIDIO1xO6r2W0aUh6VV5b7fB7beMUJqTdYLFtU9Hi
         VhQShDPVxnWW/3cEJk42GyWLqpyIIdgpogM03yeEvZpqVXDBvzhvdp7+yD3hxOFR27zu
         r7EyvV4HcsoQg74ictyCYBywgcmO2G2ptEVVpva0ihOm8lM0px7Vu5RKGM+OdEReuEh9
         xR7w==
X-Gm-Message-State: AOJu0YxRmgx85kH1TzUErVTGVR0sQNXL94qY67ZaRBRezPHCoH/p5FE5
	PlHjBjObnJotyuYd4+RQdgJvVOVlXS7IVXarbxWUfCDicHQ4e6ox+tKV7KBiBBWeYq4y0gEZkmb
	QWwg=
X-Gm-Gg: ASbGncueprpC2hfVyE5ccSo8JycAbPRYTUGATUntjY3EK1+44YyaLJfgAcuo1BBnp62
	NAhLA1noQ2crv3p9CUmV79ftLkSvivn+TAtjlD9LFV7HXuWiPKAxk7p8v8smYMiiFvgCtlXXqJh
	PY24KMOyaRZfihnE4j2QlDmLSbAe6BAXLil1gqCYv55Fn4KoM7Gdb+hHSx+z0X8ESqsCBWPxPad
	+w1/RCpi5i5xUy5YUiozsLlnuVWYAwM+cD1tC2hjtBTPJwzZgOB4muQH3OtKdsDCzniewsR/5YU
	JptjhGLNTgQykQtgjiYZN19ICrRraBwbTrx4oaw1KZJtirYLf1rLqh8vYXaNlD8eTEOgN6yzkTH
	G
X-Google-Smtp-Source: AGHT+IEQF1vMumRxEUbGHmzzx6ESK/ENFLt2jYCWEsFza79HVlPzy7sqMUXtWUDgkgRkAMt6ywtGWg==
X-Received: by 2002:a05:620a:458c:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7cac767c3d5mr21957785a.37.1745951883389;
        Tue, 29 Apr 2025 11:38:03 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c92078sm767547785a.16.2025.04.29.11.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:38:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [OE-core][PATCH 0/2 v5] numpy: upgrade and ptest fix
Date: Tue, 29 Apr 2025 14:37:59 -0400
Message-Id: <20250429183801.1125000-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 18:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215686

v5 removes gcc from ptest RDEPENDS and skips the related tests, cleans up the
run-ptest script, skips test_big_arrays via the pytest CLI arguments so we don't
have to carry a patch for it, and adjusts the commit messages to match. This new
iteration still takes almost 90 seconds to run, so it remains in PTEST_SLOW.

v4 tweaks the run-ptest script to use `pytest --automake` and adds the
corresponding python-unittest-automake-output module to ptest RDEPENDS.

v3 includes the patch to disable a consistently-failing ptest - this was
mentioned in the previous series and the numpy recipe file, but was missed
during final commit.

v2 was re-sent with a few cleanups compared to the previous version (which
didn't have a cover letter).

With the introduction of patch 2/2, numpy ptests should work (they're listed in
PTESTS_SLOW instead of PTESTS_PROBLEMS, so the recipe-specific ptest image can
also be built). More tests could be run with the presence of gcc (present in an
earlier version), python3-mypy (in meta-python), and a Fortran compiler, but
there are enough tests being run right now and doing those things would add more
complexity. Further detail on the changes to make this possible are found in
that commit log.

Trevor Gamblin (2):
  python3-numpy: upgrade 2.2.4 -> 2.2.5
  python3-numpy: fix ptests

 .../distro/include/ptest-packagelists.inc     |  3 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 .../python/python3-numpy/run-ptest            | 16 +++++++--
 ...-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} | 34 +++++++++++--------
 4 files changed, 37 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (88%)

-- 
2.39.5


