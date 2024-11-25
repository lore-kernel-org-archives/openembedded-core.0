Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145A9D58090
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.17109.1732536117414105844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jx8xxY4W;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-432d9bb168cso30205715e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536116; x=1733140916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn4Vmi+/A0btgNTY6o+rmYl9V975jPZRrB8MckEmVvw=;
        b=jx8xxY4WgJ7fqN9lpfXQ7GwDmnyJFPAQKNkJuNqBxOVLY4vhMxLbLpT5UDs+qmovpY
         6+kRHsjxinB3M1FDzca0jObsudKyZhEb3+c+gzhPdRFH/hEZjE/9RfNsnPTLhmspvQzv
         D/frpq+eHDgXbFHg540xbDFJ0v3M1cHmJVNmJCxmkWzkvxrVvM/b7FguSEudfyv49nCG
         UayjhHlS37qYHhww3WwgMvDyC+CRHOw19s0ppqWhv86WzSG9pQIO3jIbpH/kg1DiFxsu
         Ys8HMGd42VDYUpwcKOi48ZLvjNlGWHPrOSiiZ1xiMp0nk+vlWBbvIT6+Dh3KLHa67tgK
         W+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536116; x=1733140916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn4Vmi+/A0btgNTY6o+rmYl9V975jPZRrB8MckEmVvw=;
        b=U2Lrz6F6dX4Vk0eIQr3YHGwix3eThasdZBqyDwFfcFEyiyHNu60mSYlgZkn4GYFN9Y
         XrVXLw6F4MK0OLXQrM69CBqCINkdjaJwQx6vv0d0Y/lFgv6TSIs+3d4YaLElhzT4yxEn
         Vuxey6WdDJwxS/urWvWRUyrdyCBXIB+lZWz+0NzXwkJ9XZErvl/t8rejFayepHdgxg9Q
         ueFYN1gz4sx/fB0ei53kFA2bpKkw6eZ6cbh/cSXqHEfY+KbwdTwPzH9Sp2L4OuoNkUsY
         6Tua0Tj31PQ+kG+YmR6xFMNKfVuuvnq3ngvqVcSJwmTu1iGaXaQ0lpICBNyi9fh7Hcf4
         PZ1g==
X-Gm-Message-State: AOJu0YzaVDZQe6ZNGyCNJZ5JoS63BqVfiKUhBhroCgeL1jMVZ19QAy1n
	h9kCTtVEw0+aRHGGUG2UG1LY0TOqKVzV0R1+GdnF37RYPDRfAQqKA4V9lQ==
X-Gm-Gg: ASbGncvhJ/ETVNrtC8YpWAlG9CRf23T4h9irr35NG0EjAnhkZnSQH2oYgrF+666Sct3
	HpkMzz5LwiaBum8yZK2VzwxtQrp+CUgT3gYkUjX0tsxgd7qgb6nwvDAbjHSUx7cZ3uNDDO6bX52
	EzZZc/r+sN08HZi+0+dqw7WMMNQ9fNLnmPtCdZAzpv/JF3Yl8R+T2frxe97XjKTtrisN/wmzqJZ
	hToHNvVPwqN7wcChjnFskWSb5GgiuPT0AfmRYO3Lr8SGtaMk3U1qjWcSOvOcbJqLhb02Iijk6EC
	LqXwuayQdFA=
X-Google-Smtp-Source: AGHT+IFykSaA3B4RjzzHDq5ljgcfKNzWOkyuuTZ5zyxP7OZwQrdC7L+5GqPQ/OeVcpHKzTKgNEdlTA==
X-Received: by 2002:a05:600c:3ace:b0:431:57cf:f13d with SMTP id 5b1f17b1804b1-433cda09dbcmr105641785e9.3.1732536115302;
        Mon, 25 Nov 2024 04:01:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/35] enchant2: correct SRC_URI and other uris
Date: Mon, 25 Nov 2024 13:01:25 +0100
Message-Id: <20241125120127.2205232-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207781

From: Alexander Kanavin <alex@linutronix.de>

https://github.com/AbiWord/enchant confirms
the correct locations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/enchant/enchant2_2.8.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.2.bb b/meta/recipes-support/enchant/enchant2_2.8.2.bb
index f0da896e591..e26fb640f4f 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Enchant Spell checker API Library"
 DESCRIPTION = "A library (and command-line program) that wraps a number of \
 different spelling libraries and programs with a consistent interface."
 SECTION = "libs"
-HOMEPAGE = "https://abiword.github.io/enchant/"
-BUGTRACKER = "https://github.com/AbiWord/enchant/issues/"
+HOMEPAGE = "https://rrthomas.github.io/enchant/"
+BUGTRACKER = "https://github.com/rrthomas/enchant/issues"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
@@ -14,7 +14,7 @@ inherit autotools pkgconfig github-releases
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
 SRC_URI[sha256sum] = "8f19535adb5577b83b00e02f330fe9b9eb40dd21f19e2899636fc4d3a7696375"
 
-GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
+GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
-- 
2.39.5


