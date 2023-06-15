Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB3DEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:44:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.15868.1686829456448637476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hcxrXayw;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30fba11b1ceso4983055f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686829454; x=1689421454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNLku7gZt5s+HSVALQLoWjlzQLQ8wl1lgW0Fjy3ypKI=;
        b=hcxrXaywA6IJyNX2KHm6dHp1EPfKeIQZli4HP7ZXxcJHlA78plLycHtf/yXo2wlFqH
         BGi478nXjTXP7WePvebFvoRoo5qWkGYYmteebIA4DdatEtuRzDcYMuUYJjf0Z3w87uAp
         03i9nE5yQfMqCDe316Lkc8mOJTcDOQa24O5vQQbinFH74IZkemjNZhN95hCM/eKRah+C
         +x21UVYsnzAElK55DX3NbKamgE3SiqRfz4Fk4qAFtXtBszr2BNccqLk8MUNVqeV7UiK+
         4T4c5vscGPgCg2vcfBmdfj5TnyRH7l3b5LNxiD2eA/vJjjyMPI/FEvLwI34PxFJfLij+
         PTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686829454; x=1689421454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNLku7gZt5s+HSVALQLoWjlzQLQ8wl1lgW0Fjy3ypKI=;
        b=d07eeHjWofQvONQtJ0yjlsZQNQyzHeYu1VK0EceNdysf6ZnezvA041JJrEJ+GCXWqB
         v3NeDkNvsB7hCfE5hCPqWGEMNaPLSvU40lp6/v0nml4AVInwkAwt41z624WwIzBDVLps
         LRsyS89ZVhDMf9fw0YNVklJnJJHSUEmt2/nEh9nQJ6gWYzUc94811D7HFlW/vIW/QjaL
         f8HkUvN/O8KQM44RoMtoGzGIlXm4ttD80WjzMiS/xzZYBIIAvH2Wpu9Uc/vaWE2dluLa
         jibqP1v26fYg8126tsuesomCeTyCajFT4NI6DhsTnNMi9/fp8A7R56sWc4miDYsLBFbq
         8ZAg==
X-Gm-Message-State: AC+VfDyoEa7jvBYsldAJIF7qpA8K8F6PpQmVvLi/1Xq2XQutkRi6x1h9
	daxfemmKvh/+3dwxRFfeVsKGfMjrcGxJUNHo+us=
X-Google-Smtp-Source: ACHHUZ6BO/9qIuf6CdimxY2X4RQzU6UAoLz8HrKMJScloDC8LowdQxhsvKBrJAz7V/h6kcJRLxD+rA==
X-Received: by 2002:a05:6000:547:b0:311:958:7d0b with SMTP id b7-20020a056000054700b0031109587d0bmr3747696wrf.10.1686829454354;
        Thu, 15 Jun 2023 04:44:14 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm15429154wru.68.2023.06.15.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:44:13 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH 0/3] rootfs-postcommands: replace the sysusers.d
 postcommand
Date: Thu, 15 Jun 2023 13:43:52 +0200
Message-Id: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHj5imQC/3WNwQ6CMAxAf8Xs7Mw2ZIAn/8N46EaRJTLMiguE8
 O9uHI0eX9vXtzLC4JDY5bCygNGRG30CeTww24N/IHdtYqaEKoSWBaeF3smhlmt5rqq6LoSoGpb
 uDRByE8DbPhsD0ISBe5ynvH0F7Ny8l273xL2jaQzLHo4yT381ouSCNwBSI4rSYnk1sDydCXiy4
 8Dyo6j+yirJdSm1ktZ2Ar7lbds+0VcE6AABAAA=
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>, anuj.mittal@intel.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686829453; l=2611;
 i=lrannou@baylibre.com; s=20230614; h=from:subject:message-id;
 bh=ocqSSlrhU5Il/K8MqQyo8OA4l0TL3HD5hAS3YCJJhvs=;
 b=yLGfHnbArkgwNXKjzGJJqDKntUqEBqsX17j52SFX4tu4xE14k/WD1EbdFVPEsOyrdUgpa0wMe
 j35VlQ1a2zvAMYTgZqtjr3HKojSmLW076dISCCxpDodbMg5lkC/uUbK
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182846

This is a suggestion to replace the management of sysusers.d in the build.

sysusers.d is a set of configuration files to declare system users and groups
supposed to be created at boot when they do not exist.

Until now, we have a rootfs post command that checks those configuration and
creates missing users and groups. This command is defective when a home
directory or a shell is specified. The actual parsing leads to incorrect
commands such as:

`useradd --shell /sbin/nologin --uid 0 --comment "Super User" /root --system
root`

Also, it appears there is more interest for a command that checks all required
users are correctly created before the rootfs is done.

Therefore, the first patch here replaces the command `systemd_create_users` by a
command `systemd_sysusers_check` that every users/groups declared in sysusers.d
configuration files already exist in `/etc/passwd` and `/etc/group` and check at
best if the properties match.

This reveals two misconfiguration:

WARNING: memfault-image-1.0-r0 do_rootfs: User root has been defined as (root, 0, 0, root, /home/root, /bin/sh) but sysusers.d expects it as (root, 0, -, Super User, /root, -)
WARNING: memfault-image-1.0-r0 do_rootfs: Group wheel has never been defined

1. As systemd supposes the rootfs should not be configurable, whereas it is possibl
ein yocto through the variable ROOT_HOME,, a second patch suggests to replace
the sysusers.d configuration file 'basic.conf' by ours.

2. The user wheel can be used for some superuser tasks such as consulting the
systemd journal or manage printers in cups. It can also be used for su and sudo
in replacement of the sudo group. It looks good to add this in the base-passwd
files. It is not upstreamable as the debian point of view is that the wheel
group is unset by default.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
Louis Rannou (3):
      rootfs-postcommands: change sysusers.d command
      systemd: replace the sysusers.d basic configuration
      base-passwd: add the wheel group

 meta/classes-recipe/rootfs-postcommands.bbclass    | 133 +++++++++++++++++----
 .../base-passwd/0007-Add-wheel-group.patch         |  20 ++++
 meta/recipes-core/base-passwd/base-passwd_3.6.1.bb |   1 +
 meta/recipes-core/systemd/systemd/basic.conf.in    |  40 +++++++
 meta/recipes-core/systemd/systemd_253.3.bb         |   5 +
 5 files changed, 175 insertions(+), 24 deletions(-)
---
base-commit: 8078a62739f08e60de98e194b9cd987d8c5b2e7b
change-id: 20230613-sysusersd-614778830079

Best regards,
-- 
Louis Rannou <lrannou@baylibre.com>


