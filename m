Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BF7C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:59 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8399.1710366532762154062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pdX3sNBX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6cadfffdbso77487b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366532; x=1710971332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zr2JZMxup/NfakNCii5XMW7eB/psB57oGU6f/cKioYA=;
        b=pdX3sNBXlovBrUqSQORduazQ9OXu6qZci3LwV1L7LoaXPp7sev5mBrJ244fvwABa7q
         fY/atLs/89dZKMikL4zkacg2eIVl2d89Y37OY7YsMGHKwpQIxl8AGed4+biFPe03x9X6
         7xZH+fdEDiseSbO/ujQEc7tWQSASohTmkWA7Qh4kGMa4AHXu5k2Zqsyc9QVNwkWQp8SW
         G0oCD00UKP9q7JmwLKoAWt+8VXAf78NMjmbnyqQKAFOgDlLfFMSPAuIOsO1VJV71agWW
         8mLIN2nUap2WFDxPYhk3HXkdyB9KA+JV7lxCWZgAsLuxp7/OzhofCSkQ9dBl9DW+q85d
         KwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366532; x=1710971332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zr2JZMxup/NfakNCii5XMW7eB/psB57oGU6f/cKioYA=;
        b=tSqQcWvnUehueeMN1StKwfO3GPg1ZjKN2g06RMKCGzXTVQptwIWgsPmH4rIBt9vnkm
         KAOLcOHkcdiTe7sAy5Zv8b/beyId/JVuYh0FuJP2M+i37YXz7fgVkTbiyisiM0vYkmV3
         CX4JWMwy2gkTbWwuk69gtsQj4J25sU6Zu/X/d0Uhr0TBiwZrJOu98WylQ7kPRy8igGBu
         x87NoUN2ZlsPqtWpz0Z9x+SMSymYEFPh8zd0TVnHuwWOVWpBq7BnQ1h+5sDJulJTdH1x
         Awih87D59H0oOK+WQPfCYux/J6DTvKEO9pzC7zWvxSsrbBYLSLPIkUcmstUJdwOCCmiN
         aV7w==
X-Gm-Message-State: AOJu0YzegzAkLUez72J2Ybf896J3KX6KIEPSN7xVmpsPoSOOx/ZrYpD7
	0RiqP2jBpecDFN74hsVpfhDC6F+MOENQYdK8iPAMJsMOGx6AeI2J1Nq3XJ9fYtA92+CtPpVa8DR
	AuWk=
X-Google-Smtp-Source: AGHT+IEMc1p/bQ+zBYRpiesW2Isd1hS8ZA/dpIjWhb5Ii+7frnpfKR7XWGrhisyZ828SEMsPc1GU7w==
X-Received: by 2002:a05:6a20:7d99:b0:1a3:3ded:a4e4 with SMTP id v25-20020a056a207d9900b001a33deda4e4mr21753pzj.26.1710366531702;
        Wed, 13 Mar 2024 14:48:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 0/7] Patch review
Date: Wed, 13 Mar 2024 11:48:38 -1000
Message-Id: <cover.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197084

Please review this set of changes for nanbield and have comments back by
end of day Friday, March 15

Passsed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6674

The following changes since commit d88e0fa7c5e6c8252f8f775996f512a37fea4818:

  kernel.bbclass: Set pkg-config variables for building modules (2024-03-08 12:33:07 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Dhairya Nagodra (1):
  xwayland: upgrade 23.2.3 -> 23.2.4

Lee Chee Yang (1):
  libxml2: upgrade to 2.11.7

Simone Weiß (1):
  gnutls: Upgrade 3.8.2 -> 3.8.3

Soumya Sambu (1):
  bind: Upgrade 9.18.21 -> 9.18.24

Wang Mingyu (3):
  python3-jinja2: upgrade 3.1.2 -> 3.1.3
  bind: upgrade 9.18.20 -> 9.18.21
  gnutls: upgrade 3.8.1 -> 3.8.2

 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 .../bind/{bind_9.18.20.bb => bind_9.18.24.bb}               | 2 +-
 .../libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb}         | 2 +-
 .../{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb}    | 2 +-
 .../xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb}     | 2 +-
 .../gnutls/{gnutls_3.8.1.bb => gnutls_3.8.3.bb}             | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.20.bb => bind_9.18.24.bb} (97%)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.11.7.bb} (97%)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.3.bb => xwayland_23.2.4.bb} (95%)
 rename meta/recipes-support/gnutls/{gnutls_3.8.1.bb => gnutls_3.8.3.bb} (97%)

-- 
2.34.1


