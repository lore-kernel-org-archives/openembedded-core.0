Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E9FD73603
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 12:40:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.133149.1732970391340871934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 04:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA1/xD0N;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso25268935e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732970389; x=1733575189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTmWSy/x5Ep08m+gQXx3dv3zmdnHSnqVrCZV2CT7CWE=;
        b=QA1/xD0NxaYAOXRQveUFyVEOsaTIfynD29Phe/jfeIBOkoraw0pm2u0Un4vO0E+5r3
         MRplYbKisUDJEaN99H2pg6y2EzQumfmlJ20osvJVHfHbzzS4Z6dUricGOiuavOSHmkb5
         RnF5zlupekj+H9QBvONPG+TvFnID3ryFBWeUahUn6dj17SYfhVTLVXQjp5EmDHy3g1CG
         QO00n4g3Sy0jroUHEg+8bIyd9y2Kbw+i5jjkfwvDVA6QHqXteXLB9iqmXlZQ6JkhgYpo
         tAmhVzYFsAkU2fnSyiilccxqwkDhINpqyvPGajWzkgEIkq4MP5v+SxHzlWPAuC2n1DDy
         QB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732970389; x=1733575189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTmWSy/x5Ep08m+gQXx3dv3zmdnHSnqVrCZV2CT7CWE=;
        b=BF5m5wefQsJYTKL2uxZK7VuUD3sKy3P1B+7M6qVV9wZpx6itlKE9kKwl8/bCJ5p893
         MXjgLyvhWWkS6YO3izTDK0lzrMucbIyNHWG7X9XVjmQ1jbFaZEegCj2H6c25ROiJnF74
         WSyiQBFGrNkZRtt9Fc2uiAL18fK4SNM+hiDGeS4oGJHzxVgwXN/nKziVkNPl6Dnxd+Fm
         i8jJB83PqWeDxWOVJx+taxFJF3U+zAaXVWwE3b2EAzYvpVT83yXXVeIaIMMCDDmhGClN
         2+MGBvC+bpujGKUEBemnavYGSCxZbcp/0QisOmTQBYOP5v9i7sUV5ca1rrihiZmSOQsB
         HbfQ==
X-Gm-Message-State: AOJu0YyzUWg1OTWxboW1lwNtnFXF+qYa4klAJ9WI3Xhx2K+5F2e9xOlE
	iXyyIcBpFL24pn8nfh5vGcmjjDgfabynIgKAO+yd5gYYGihYC3K+GUnqpw==
X-Gm-Gg: ASbGnctolv2bID2WNdQcS3OKIPriXvVymcvjZhsvwN6+2xsN6RDfdmFEI0ZGiGmpfwo
	++fuodE2eKXdfmLAKu5z7/61OUTikVs2WHQ5/mKDCcuApep/7UcFTd0wacFa2bmYJyljJwkHg4t
	3CnHA6EwPaxCPclwK1DqoHqcb7DCVXT9YApBMb5/amCtIMVmNGzu0Xl1BjQ5QZZ0QDZCgk+uanZ
	9ua0V2+TXs4MBqB4fbzQuW6BhsctqH0YmRQahiBN2Ci3v5MJTymQvN+uuvIQmypu5C9dPOvp18=
X-Google-Smtp-Source: AGHT+IEy92rvHZjaPKoGGxYhWqVuBjUxrgL7y9Dn+GHE8+jbVrtOkL/rBapnHC2MI9FeHftRWq8OHQ==
X-Received: by 2002:a05:600c:1d8d:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-434a9dc7875mr159673815e9.16.1732970389115;
        Sat, 30 Nov 2024 04:39:49 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbe4e6sm83854755e9.14.2024.11.30.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 04:39:47 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Sat, 30 Nov 2024 12:39:11 +0000
Message-ID: <20241130123911.5111-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 12:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208044

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index 3f94dfc9a5..f9d6ea1fa6 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
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
2.43.0


