Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E412DC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:42:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.532.1749102138621468183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpytPkcs;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad8a8da2376so95053166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749102137; x=1749706937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShkLOUIdheYrCDp+nREKx9C0kM06ts9T0r2vdTzeeP4=;
        b=WpytPkcsOEk6+gbUfm7/b1Se5Rl97DqtJCdOvsfbB3pbj1PS2kjULsKu9Xo38ArEsT
         tUNfrdc6imSgcmHNJiyq1DPAr/wcYdoRTGxCszUKtyIOubndhfPlObAPzmNdo4B8dhYy
         n/DLkRomtNRcKIkr2sOrQNb/bI/M8O2/hXsmL2GlUBB00unsGjlRaWsQA9hxEj4+6UqZ
         H7cx62ulracboBPb2Rd4KSmQT3ZmAz7wFYpaTSmAdbd6l7ntYy+NOZxDJm0rF9pp8dKy
         4sIEr5T0+S6v6KYA8pfSqqYEEyyzJRNHllDEyhbzN9y8UVcbhIWNpEKPzHH4JG8qUFny
         /HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102137; x=1749706937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShkLOUIdheYrCDp+nREKx9C0kM06ts9T0r2vdTzeeP4=;
        b=UWvKwxZeD7OBemyhES6/hppdv2OxpYIxZ/kAc2wRzYbDRhypYGOiKarYFyWp6oy0WU
         ryHnKwKJUQpPWyhtEI/SWGJwFYqV4+0mGO0OIrE6BFzsFpv+SwhjHVQLP+jHzqp9EHQj
         NN4UQPKDwkh7PuUShLFKminxHwbyuWRNM19T0RPm5psNQhmRlnMONYKOZ90ShASjAi4l
         lB11H7sZyQlA95RIVOE3DsqxOZZYzsAaVKeBvnlH6ND6vhdR0nHwK/0FypnjFKOL7Sbf
         8DlCZv6x41qTdLXufAghS/+UfRlNWbLpAIuvmF/UGtU5eelY9ks00+1VXgsan5/QOaQV
         9Vyw==
X-Gm-Message-State: AOJu0YwC0dTdcI9oItKYTnAPnjhez5lhytFSMB+mts/wmTvLXt5EMurA
	a4zsN5lbaLtHwF2snGfyr1DWajZYcr8OLUxg6M12GaVEdv8O51Beh5xeu8oz3PKn
X-Gm-Gg: ASbGncupGUNIYm1r9OweJ0y14Naru3RUakCFZxVWLy/rkDPwK4CuWWp9+z0s6AtlfWN
	lFZm0Y0hjFkQ6OsU7n77JqRAnwSbDd1jhKTniGbWQPM8UwXosjkZCAw58xACYa9h2/U6hH9g9mf
	huJ6vanXOhJ8JgW/C4wx+De1YKyj1lLjCR3xyn6TgbtC9AprW3daZYqBIR2/oei4+Hys8swp7N/
	3vumwtFP0IUs//sdGw5LqRx2RXZvCsQp8ZsN2/rlBRyXk9jqlcXEtpFgAhjlX9FipS7eWJVp4nU
	3EqgiV2wlNgYX//Fe6e7udcYTFGW1wSEW2dRg1xEIm1C73EuLisSQ1xtEF+ZlsvbytHilEfAMSm
	cYvgkriocWwOo
X-Google-Smtp-Source: AGHT+IHKg7I+UG0UPl99ULLelv15QAVuVUlbpDHRb8YWgATLwTDm11LKjazISejaTfPROQG8IJYS3A==
X-Received: by 2002:a17:906:dc93:b0:ad8:9c97:c2e9 with SMTP id a640c23a62f3a-addf8c9b2c9mr484178366b.1.1749102136691;
        Wed, 04 Jun 2025 22:42:16 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm1213606466b.63.2025.06.04.22.42.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:42:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] piglit: upgrade to latest revision
Date: Thu,  5 Jun 2025 07:42:15 +0200
Message-ID: <20250605054215.2188481-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217986

Changelog:
  tests: Add test for GL_EXT_shader_clock
  tests: Add test for GL_EXT_shader_realtime_clock
  vulkan: Add cmat tests using constant as accumulator
  tests: test UBO and SSBO backed by the same buffer
  arb_direct_state_access: fix internaformat query behavior
  khr_texture_compression_astc: normalize error-color
  tests/util: provide simple array for cleanup handlers
  ext_external_objects: use piglit_set_destroy_func instead of atexit
  ext_external_objects: fix timeline semaphore validation error
  ext_external_objects: fix validation error with barriers
  ext_external_objects: fix validation error on cmdbuf usage
  ext_external_objects: fix validation error releasing resources
  ext_external_objects: fix validation error for cmdbuffer usage
  ext_external_objects: fix validation error with semaphore value
  arb_shading_language_420pack: test uniform block matching
  gl: test push pop attribute with color material
  GL_EXT_texture_integer: basic validation tests
  cmake: Fix mis-matching arguments warning
  fix invalid typecast

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33b..673055a32b 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
+SRCREV = "a0a27e528f643dfeb785350a1213bfff09681950"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 

