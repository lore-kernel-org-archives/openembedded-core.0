Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.7480.1593486259156524575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SIyry48j;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id u5so8777321pfn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X1kjISk8xYHoyoWu7k3zw8RjQJHz+LINHdpG3/yjljM=;
        b=SIyry48jE3J8x5TaRU+TJ0h8IDqnCQE0IqW0XDf4+TIG0Jagvyg7U5GUF7HE4ChQzC
         nQd7hFcyEMk5W2irD3l04vM3IHUQ6mkOd6hhdXHvPxjapzDLOAzx8YFXzjrodMHX90T+
         CpHyFKgYF5R9JtCtNZdMur4UghRyhUwa1SR31bPmnszT4Vxim39m6dB6XxnyIiNY8bh5
         wQqhZzNSh1xgM6TtcKCdpXiZXoZZQ3MIescNYFuC2fLRzOIN/QbaBJpso9oshaFhHPUn
         4v/XQqLo8dtAKhr4v8shVXexj9y94plBzH/5X200vIjfRNa+XAo7mHRNaiYHoLIJlgZ8
         28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X1kjISk8xYHoyoWu7k3zw8RjQJHz+LINHdpG3/yjljM=;
        b=j2VRxJN0wwCokr9HN1/3IVqIY+oYrnNtBhiaTWYCbihqF/HimDeYqrMiUy5HUMAjo9
         IChB3hI9lDJd4SXsUXKZ1qJh2tIdOW8BplXuOSzfNCCn/keCZuWFDkq6xDFqClgJ+K/X
         PXaJmn6dB2cMII6wDWOq21FC0wQm52MZRfWPZsF/cFLRpeH+TbKuPZsroGqi5KkjTUCP
         j0BearPsZuDn+TZawrZQTUVIvUx18kaxAi4QDG9Nbk85OYOhS4WIVushRpPX5iUnpaaq
         CQ940UpPNNaQtZbXvJREFWZewN+0C1EvhLhRH9Y/wN1N09zC5elB29zxvui2o9kZPNKn
         BYDA==
X-Gm-Message-State: AOAM530CJcfvhRaEfL4Xy/e5PRinxF6yLxpd3truCSmOLtxjJ0LaBM9y
	awQNrI6+15UU6uzuXvLarsehRg3MyRvb6w==
X-Google-Smtp-Source: ABdhPJzDOvtJQC4Sr2GFkF4N/CFPu+6ZIxO3mZxxrNzhRAAFqpKzBhH5OrufOtzXezd/hVfjBImUAA==
X-Received: by 2002:a63:4b44:: with SMTP id k4mr13510233pgl.305.1593486258252;
        Mon, 29 Jun 2020 20:04:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/22] systemd-serialgetty: do not use BindsTo
Date: Mon, 29 Jun 2020 17:03:04 -1000
Message-Id: <b1d0eacc431517695c348ad14f4452be607c0b62.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Chen Qi <Qi.Chen@windriver.com>

This unit was changed from 'BindsTo' in the following commit.
"""
commit f0f359ec9210759f6b4dbfb35d3fba8af208c43a
Author: Jason Wessel <jason.wessel@windriver.com>
Date:   Thu Aug 29 07:00:31 2019 -0700

    serial-getty@.service: Allow device to fast fail if it does not exist
"""

It was changed back to 'BindTo' in the following commit.
"""
commit 63bbff61b78c651339c4b18d8376187379ec3b3c
Author: Otavio Salvador <otavio.salvador@gmail.com>
Date:   Fri Jun 12 14:30:44 2020 -0300

    systemd: Sync systemd-serialgetty@.service with upstream
"""

This is now causing runtime problem for qemuarm64. The default.target
is not reached until a timeout. Output is like below.

"""
root@qemuarm64:~# systemd-analyze
Bootup is not yet finished (org.freedesktop.systemd1.Manager.FinishTimestampMonotonic=0).
Please try again later.
Hint: Use 'systemctl list-jobs' to see active jobs
root@qemuarm64:~# systemctl list-jobs
JOB UNIT TYPE STATE
102 getty.target start waiting
1 multi-user.target start waiting
95 systemd-update-utmp-runlevel.service start waiting
110 serial-getty@hvc0.service start waiting
111 dev-hvc0.device start running
"""

We can see that we are waiting for /dev/hvc0, while in fact there's no /dev/hvc0.
Jason's commit actually solves such problem.

So restore to use Jason's method. Do not use 'BindsTo'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43b989c1231d3d867303ccebceda72364a9519ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd-serialgetty/serial-getty@.service          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 542b905795..549d566009 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -11,7 +11,8 @@
 Description=Serial Getty on %I
 Documentation=man:agetty(8) man:systemd-getty-generator(8)
 Documentation=http://0pointer.de/blog/projects/serial-console.html
-BindsTo=dev-%i.device
+PartOf=dev-%i.device
+ConditionPathExists=/dev/%i
 After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service getty-pre.target
 After=rc-local.service
 
-- 
2.17.1

