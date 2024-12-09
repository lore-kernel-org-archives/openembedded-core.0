Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DACE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 16:54:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.106842.1733763288336576252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 08:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyXsGYOt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a2033562so43762755e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 08:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733763287; x=1734368087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ3a6xpxs9GgA0SogE6VWHaqrvND7Vh7ipV0cqcBb9w=;
        b=IyXsGYOt+4GzPALTxsvWast9iiDCe14vTKdNP4ZkbUAKrnK77zGsAB6mO/GBuNevgY
         lboFQGekLVAo5by9wWKEnUwHJpYgpZeXfjsUrv8ZpQr/0M9u8byRo+QEFxnBFHd//Alq
         5SSM/OIE/4pqvSgWBiSGYKewRwpZAw5ennoiUd6cmqkd+BSee3ds4mcpYQlQwc++f0eR
         ddI5lDU0T3IRnOxvZHodPLIjvokwbGwBtrdNA3PYKY4fir84s07wgzaudCiiJdSDNbLd
         xr8alRtaI7VhHRx6o7fGgGg1T/v3O0bwQfJth1i6FOAq78gBv3SXRVwE5THYOG9D8xfT
         8iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763287; x=1734368087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQ3a6xpxs9GgA0SogE6VWHaqrvND7Vh7ipV0cqcBb9w=;
        b=UdbatMMT1tbgOHy6Srrm0pt9XwsWu8RDNAHce7xCPV5ANBm4qMeAV5fE6ZtOKxBxCp
         0VytizybNVTy1WkG2Zq+xod0HRC4wEIp/syjJ3aICin/WiJJO0InSFplZUcEMEWzAt9e
         q2HoayGTq5K/goQNlWuZLR2nNGtQ525BGYaWquKJc4V7KXt4ifUcYso0nqeeqFBr6Jb5
         GCMCyVRD14zWIPyReL5W4dabS8yF3PD9yGKOFCunI+sMZTtGVICleGWguKAUOUYDz521
         Z+fuz5l0JlraBXOF8Tbw59KZTLi6n1eyX7VwluHsM+EgAdx48lXk8KcaHpna+sdP4wXp
         OGsg==
X-Gm-Message-State: AOJu0YyOBAJv5gWKH1GE1zOPPwR+k3f2kFKK5rw7g7oiwYzmHb77Z5Bg
	gm+ISxqnLGVYwZfwjVrZ2K1BevQQOExqeJqHCKNhE4biilrDpkdH7lHIeA==
X-Gm-Gg: ASbGnct8YkIY9x3OozprgYBM6uOvidHvm9AY0odlbvvUqX8Ksx3Z1PWWLfHoFeo+egV
	JkbsGnV1Xfuh+5hL67a1n8J5cMe3PnREjIC6044Ep/b1YQ3kHxb4ilDveVadUxva3jd37eWY8ej
	iqfRwXKIQQbKB7/072PwmZAsW/FPP9VVIf6uKWNzA9HfC3rjq8gBucdRGbkQL/Ax8a9Du/JeCkb
	u4rBibdrAKY5bi6y9RGRXC30mgxhccDScXZNBx3u5WqBKW/KfKk5p0GKbUd3EcupbROAl/lXkUx
	u+HG5+C/yO8=
X-Google-Smtp-Source: AGHT+IFbmvVFWARYvnWPzEYb1GbMCpyuYKJBiP7cOxZrt6bgE+TWHv5e1TP1oxqnNTOtAeG3vOr9Dw==
X-Received: by 2002:a05:600c:1f85:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-434ddeb5a8amr102915055e9.11.1733763286346;
        Mon, 09 Dec 2024 08:54:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386348182d4sm8390183f8f.53.2024.12.09.08.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:54:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] dbus: disable assertions and enable only modular tests
Date: Mon,  9 Dec 2024 17:54:39 +0100
Message-Id: <20241209165439.2549621-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 16:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208489

There was a report that enabling assertions and all tests results in
notices in log.do_configure:

NOTE: building with unit tests increases the size of the installed library and renders it insecure.
NOTE: building with assertions increases library size and decreases performance.

This was overlooked when dbus and dbus-tests recipes were merged;
enabling all tests and assertions still requires a special, separate
build of dbus. If those tests are useful this could be revisited.
Until then, we should use productions settings for the main recipe.

Buildhistory-diff:
packages/core2-64-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 9958176 to 8627824 (-13%)
packages/core2-64-poky-linux/dbus/dbus-lib: PKGSIZE changed from 544347 to 346339 (-36%)
packages/core2-64-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3524983 to 3116951 (-12%)
packages/core2-64-poky-linux/dbus/dbus-ptest: FILELIST: removed "/usr/share/installed-tests/dbus/test-dbus-launch-eval.sh_with_config.test /usr/share/installed-tests/dbus/test-counter_with_config.test /usr/libexec/installed-tests/dbus/test-dbus-launch-eval.sh /usr/libexec/installed-tests/dbus/test-dbus-launch-x11.sh /usr/share/installed-tests/dbus/test-counter.test /usr/libexec/installed-tests/dbus/test-counter /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh.test /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh_with_config.test /usr/share/installed-tests/dbus/test-dbus-launch-eval.sh.test"
packages/core2-64-poky-linux/dbus/dbus: PKGSIZE changed from 510939 to 350331 (-31%)

(From OE-Core rev: 054ce01ae84eb10e055a41ec8dd85ebce9ea23c8)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index f03e5c2d2e4..6f4d8ae92e9 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -22,9 +22,8 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --enable-largefile \
                 --with-system-socket=/run/dbus/system_bus_socket \
-                --enable-tests \
+                --enable-modular-tests \
                 --enable-checks \
-                --enable-asserts \
                 --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-- 
2.39.5


