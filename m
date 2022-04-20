Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF81C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2931.1650418612119931780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mx/sp1wz;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id 12so373405pll.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+nhN5OVl3wxTN40qpl+puaBNnhmF13N6Wito6Jz2wiY=;
        b=Mx/sp1wzI7jPFvahMN7SWnOO3Hg07dDTWNZtBF48kdFdj+vRKqATNJ5CjhZsL6psfb
         H2Uw2pI47ojbCirLnOqys08Va+JB1SsUOAaL+rPu0R1mW+1+FkYeNCHsD71nkXgCi7wg
         UisGeYkEt2O8OnY5nMmDSIihuqp3H500pAxnyes/5r/DAoOU+lv5CvesgVFg7fwfTYY1
         08IQuDbhFBcDLlcEmPPQG5czMN1ZwKWtsk02E9K6BSkPcBVseIsnEoXhC5NLDIDG+Dsm
         HqnUjADdMqa54Qxh5OScUAgYoq7MfpTcheVF/7+rfMGKkZMXX5zXtE2f7id0GrhyQIgJ
         zf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+nhN5OVl3wxTN40qpl+puaBNnhmF13N6Wito6Jz2wiY=;
        b=Ytl4QWrp6Qp9s898QBgdI7IVpOj08SSQyXKi2uvSv/WyBsWiKI+HHQBel1BwftzwQM
         ongv6zs3E4gHh2pdDZyFVwAXaRWLrstOaHWaU1mjkxCrfeL0aSi4vGQWm7JrhhRdTMyB
         Epn/kV2EFjDzBujSBQId93dWFfvBABBI/snoX7dljGsDxgfbjRFfzHM5OGXWHAjNOev6
         wMTiebA3Y1eyzEsLTbtgEpmhKZKy14mMohlVvIq38e3/dWoAKkWydVF09eqootsQ5hfG
         Rwf6OGxYe3mm4+XG0AAILlLaM9QKRXvg/WPfSTYNnPBK+RGMBvB9DYJbJynOVyAzXtPn
         WbRA==
X-Gm-Message-State: AOAM533rSQbqUdMrWwDX/ux5zesDxK6nquLdCKVxbqPqHCZEYuFXLcpx
	Xon7hxL+U098iz6NhW8OcBevkswqqCsgcA==
X-Google-Smtp-Source: 
 ABdhPJyRWcUIvd5SaA0HpWIZcC3J10qHXi7SVEN9m37o61uHrK1sOLS0gKJBKXztTTpJwCWQTtNvCg==
X-Received: by 2002:a17:902:ccc1:b0:15a:24df:a7cc with SMTP id
 z1-20020a170902ccc100b0015a24dfa7ccmr2268039ple.42.1650418611379;
        Tue, 19 Apr 2022 18:36:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm18643669pfv.69.2022.04.19.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 18:36:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] seatd: Disable overflow warning as error on ppc64/musl
Date: Tue, 19 Apr 2022 18:36:48 -0700
Message-Id: <20220420013648.3101309-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164638

Disabling the warning is easier fix then trying to fix it
in musl which results in ABI breakage and disabling the Werror
gets us along by doing minimal change, also see [1]

[1] https://todo.sr.ht/~kennylevinsen/seatd/10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.6.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/seatd/seatd_0.6.4.bb b/meta/recipes-core/seatd/seatd_0.6.4.bb
index a38f8c21524..601736adef1 100644
--- a/meta/recipes-core/seatd/seatd_0.6.4.bb
+++ b/meta/recipes-core/seatd/seatd_0.6.4.bb
@@ -13,6 +13,9 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
 
+# https://www.openwall.com/lists/musl/2020/01/20/3
+CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
+
 PACKAGECONFIG ?= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	libseat-builtin \
-- 
2.36.0


