Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812DDE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20328.1734012501772228654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kX9VJmuS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216395e151bso4230745ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012501; x=1734617301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8g+qFqJ8ysErahvVsAiiBcARiIhnBGjFlZKfLUbdeA=;
        b=kX9VJmuSEtF8iIM1qHKeQr28QSEWPJRLNFoWSr0bbSiKaS5iRO4F1dLV9AM2pLDdYh
         TE/9rX3SrU31j0nAcKRATKJzU48GcmTb/sTyYEcmFO6puZBfsRCsznx0HgQL3WjcVBE0
         qnNnFDDmJHuIlVl3PelqFJPnGlfDfXacipz23756/WE4qfs541MYKEYZq43GKsjo9gjR
         zz2AIdwsGfC61T6I8jeULA1mgH08HhLOIYoO6WHZWpSaXswgDVhPR+jHgbXQsM95oW/H
         thYsDHdZ1IsKwNPsCF6biQcyop53vXg5wvKIzmpL6pXJh0qujGbXBmg1OYcE+oAo9Det
         fBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012501; x=1734617301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8g+qFqJ8ysErahvVsAiiBcARiIhnBGjFlZKfLUbdeA=;
        b=DcAu3Y2igP9CIm6pADY4QJr0fjczZBfL+lWzGtHkAlOEqW0OaRVbQoPArf/PnNBj3j
         Ge7EL3I4h319/mE/GWa5cjA3MHvoPhRUUZuQZFpZCRoS5j3ltOT3eNT5vGAMFVOjxV+O
         +fWQ5j7NK3UKSvgZPvBWdsZmX3P0I+4WL0eriyckhMdnIcPlUNN6qorRlzDcJ9+UV+JG
         IdSSU1TXhOIclfon0pE+IMGC019xIikOD96DvW9SJikr9uENA4XzfRONaVyUTyv15mQK
         XPw37tTxa2s5ykw+Q7jGYLyB55hoZ19rMOHSnwbMNgV9JxfKzOcV51tSWDk4TgPTJV2t
         pgiA==
X-Gm-Message-State: AOJu0YzDb9MPAs+rex92kO73I2oS0V0yvVTwjg98MGfMVlu3yd3tXprR
	ARLTCdDyn23lkkeoDz87bCZsQATh/Fzmnv399uxeDzomLU5DfiInjAmV3ee7K+G7DKAAEhMB6rB
	J
X-Gm-Gg: ASbGncsS87f6rmrZUZxTVJlvXawsBz8novK6FW3e/BEXwBIOm1VhyrLggwufUf/tGHO
	9pnuRjC0hqXKPYGgpWTzawshHTaC1hSzHCzD+sJ93qMZMUsGsOL22yL2qLI/OsC04Wlt2fO7012
	NBSOx7ncgIt9A1pZ6/VEfXKFnL5Gfc/yr2ZvMsbSM5rnMyRZASx2NkR0LTqIYjygCdsNqNkYQfP
	yYP9ldMJ/9Z2QT8sKy++uYzucw6aFV+zCrnH44OL/VjJA==
X-Google-Smtp-Source: AGHT+IE62NGOYnP+6IMK3WECmWEgdRRvfICzKJZ7yW5VU5P85rsz3RR/YYxs6fDCZoCeu9raGhIC4w==
X-Received: by 2002:a17:902:db02:b0:215:58be:334e with SMTP id d9443c01a7336-2178c8384ccmr58484075ad.10.1734012500999;
        Thu, 12 Dec 2024 06:08:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/12] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Thu, 12 Dec 2024 06:07:57 -0800
Message-Id: <82b1c8fb497f74bbc67cc6763116fa96267acc4a.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208645

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dnf/dnf_4.21.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.21.1.bb b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
index 09bdbd88a8..d5e2a688d4 100644
--- a/meta/recipes-devtools/dnf/dnf_4.21.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.1.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
 
-DEPENDS += "libdnf librepo libcomps python3-iniparse"
+DEPENDS += "libdnf librepo libcomps"
 
 # manpages generation requires http://www.sphinx-doc.org/
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
@@ -49,7 +49,6 @@ RDEPENDS:${PN} += " \
   python3-sqlite3 \
   python3-compression \
   python3-rpm \
-  python3-iniparse \
   python3-json \
   python3-curses \
   python3-misc \
-- 
2.34.1


