Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385B8D6ED37
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:42:53 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.10901.1732196570667058190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 05:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUXcM4Nd;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd1829b56so121888e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732196569; x=1732801369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hx9qJdM41mp+gsxjizrljdrU2E3aWuVAYm6VQuYMqOg=;
        b=TUXcM4Ndiv8b3fp2UdgLgylUQZjcN5D1PzeKiKZg9kfc8ouCjIYLaUK/hadouQiC6M
         TAp7+GXzD8KhJsOvLV2ImSjefA3PxyJdGFmkEBKuNOI5nRKDK3nQO66Rv+hjrmyttLZ/
         BKXce+roppgFAygVX2VAblr+WN2oFmspLcUBfM4KzXnXJ5ypsW5CYwlhw4skLYRZ1km4
         hYDbi5KLwuURfJ0oKJp6zY+ll5MXICJFaMiJXUZ0EXoPlUizDceaugycLlaNKb9bj3u+
         Q2QfwyoqsHHV+6U+/0vI5hzKn9LLEosmJOwclv0BKWde+fLiJgEQHQcnwER8YUbp/aKN
         lZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196569; x=1732801369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx9qJdM41mp+gsxjizrljdrU2E3aWuVAYm6VQuYMqOg=;
        b=tH6eej2Ekc/rF45er7Od3kJ0BYV0JYuSij1jOPgS249wRYJ56GLlXvZtruczG5nzvX
         QHeGN3fdphlRB/zBNM7igiF05fpbh/YefFOfWbUD2Lo6LlDKJXsEU8GF5rcXSh524lbl
         wrh0laNJBKOJ2lCxTT7y4joB9X8saE3fv/YhliLOhR/pwa+8OLBrLRv+cdLqIh7wQSVI
         4lsJo8m6bGPYiBBwyWZV44Z9n8Qz7ObFrbqhyeAofqRBrR+AtlrKQyMFOO1KptseK0le
         JibmXwpmPwPptGmCAXQPgRLd9vAo80faJ8jXZL4eg/48tHxt0rAg4zKlYZMOZ6So7tEH
         MTdw==
X-Gm-Message-State: AOJu0YxUi9yDM4mF5y1F8GkFhRzl/j/hkGkgfKzjJCbbAAnGArO+MYq+
	MLSx4XrWYJVMuM42b0eLzE7Rrryr2lqosLqTKhkXD4lGrhD7Cnv3tBi3mg==
X-Gm-Gg: ASbGnctEz/LnzEpzn7ecjDcDeDXPGpfXC667tW+erDTF7UA15SsIs9Fpfbro3Ziv6uh
	x8QgEcB1UJ7g/SOYIpKU8e61CxV+u5dXXV3TeV4GvpFCMgdWO3zFjUpdc7Zc4Z8YRin5J/UfR/E
	LwHFk/zJK8bNzWqKBb24J56cJvUrUH7T+n/MWhUFSXy/ATxjPNEN3EBsVTJWhA76czOAZivyMSg
	RKEYeYKEmLs/NfdjVaQOBSa9aaSBaDFW+EvdcP3XfcNBPrHprnyjtwFz86e4/+FQXr3WRmohQgR
	ZuBj3KZEScE=
X-Google-Smtp-Source: AGHT+IH9VgpaASVRarzN1zbUGPxWUv52PKv1AcQjl4RN1p3+KjYuWjjlg0dZA9YnHiV0MpJOkcf9wA==
X-Received: by 2002:ac2:46c2:0:b0:539:9645:97ab with SMTP id 2adb3069b0e04-53dc13429a3mr2640432e87.33.1732196566858;
        Thu, 21 Nov 2024 05:42:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254910e82sm5060734f8f.57.2024.11.21.05.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:42:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [scarthgap][PATCH 2/2] package_rpm: restrict rpm to 4 threads
Date: Thu, 21 Nov 2024 14:42:42 +0100
Message-Id: <20241121134242.1072796-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121134242.1072796-1-alex.kanavin@gmail.com>
References: <20241121134242.1072796-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207534

From: Alexander Kanavin <alex@linutronix.de>

TL;DR version:

with this, and the previous compression level changes
I am seeing drastic speedups in package_write_rpm completion times:

webkitgtk goes from 78 seconds to 37 seconds
glibc-locale goes from 399 seconds to 58 seconds (!)

The long version:

rpm uses multithreading for two purposes:

- spawning compressors (which are nowadays themselves
multi-threaded, so the feature is not as useful as it once
was)
- parallel file classification

While the former behaves well on massively parallel CPUs
(it was written and verified here :), the latter was then added
by upstream and only benchmarked on their very old, slow laptop,
apparently:
https://github.com/rpm-software-management/rpm/commit/41f0e214f2266f02d6185ba11f797716de8125d4

On anything more capable it starts showing pathologic behavior,
presumably from spawning massive amount of very short-lived threads,
and then having to synchronize them. For example classifying glibc-locale
takes
5m20s with 256 threads (default on my machine!)
1m49s with 64 threads
59s with 16 threads
48s with 8 threads

Even a more typical recipe like webkitgtk is affected:
47s with 256 threads
32s with 64 threads
27s with 16 or 8 threads

I have found that the optimal amount is actually four: this also
means that only four compressors are running at a time, but
as they're themselves using threads, and typical recipes are dominated
by just two or three large packages, this does not affect overall
completion time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9a5d04c472e..6d1519a2728 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -705,6 +705,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
+    cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
-- 
2.39.5


