Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C6EC61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:49:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.91279.1700747346246256598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OSD1jo/5;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso518211f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700747345; x=1701352145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v22+tSTBfOBVxe+7jRGMO2gEASy6vxZ+zi4Bi5jXTrY=;
        b=OSD1jo/5LEwZsEXTFuu4lBDfvYJLUvLQH4WpVE6jEv34hccgdv3SJeLVoAeTNHGLcb
         KhkfW8+wfNjl/VN6lOgIGI85LUSTjXs2E7smSvZd/1w8mUGNAYS+Wi4PuGQA/kb+0DQ0
         Q6Fsimb2EabL2oIAQAR9UZRjxMIotY44v/scS0EhP2howsa1/cteEXYqqizyrYLwyD7Q
         GSJQJ9unaNTRxnqz7Vli6Fn/gYDy07JHEv+mDBMKUdYTYmW7fVdW0FWRbr3mTJbK9Zdi
         zgvIeyt/bu1F77ARkfsPq6lxlZ9v7yW7q+SCsxSTM73Bhnz/PHXA4+PHkFDiZE9LG11V
         HcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747345; x=1701352145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v22+tSTBfOBVxe+7jRGMO2gEASy6vxZ+zi4Bi5jXTrY=;
        b=Nz0k814QEn8MA+8JrivUgKofcXjP5c2I/Ngg2Fkvo9GlVh4CPjEkPKCDELhZ18bRFl
         +kKhvqKfXF8qiYRGOmumf6UVl6LvpTmfefU1HEcgVSFjwbtILfzBl20RnwbkHU7C0byg
         giFsbdKEflpKsMlvzUvwWRovhWgkt71WKD0Q7MkPefEZSctrngVmHJzbcTK7AJw/ZK72
         f0j3fTpfyhwtM5HsQOpb2wcNQhTG0zrBMsOhROEW1oa1wT6GB9cjFp1JRa2GvUi8V6bJ
         cvpYvdL+7umaSh2n9mtlj6CZREGuuKz0yLVGoOPiOXUUT5alfFuwFtw37xR1WWeaJkeV
         Dtkw==
X-Gm-Message-State: AOJu0Ywu9BUCWCexJo9AAbPE8HNVGo9AhvFj4m7wvJtGJ5Vb5dQxSC+w
	iOidDly6yTnb80gK/oV/rz70JFZl2KZbo1dJdw3lbQ==
X-Google-Smtp-Source: AGHT+IHE5ACDubHKvN/2TUOnKVgYEwtbYLZoOnsJQqYtbAG1FFbOtSPomgczsFiVJYPEZvodaWIlhg==
X-Received: by 2002:a5d:63c5:0:b0:332:d617:e1ef with SMTP id c5-20020a5d63c5000000b00332d617e1efmr2220791wrw.4.1700747344343;
        Thu, 23 Nov 2023 05:49:04 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4143000000b0032dde679398sm1754983wrq.8.2023.11.23.05.49.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 05:49:04 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC 0/2] useradd improvements
Date: Thu, 23 Nov 2023 13:48:59 +0000
Message-Id: <cover.1700746611.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191153

This patch series includes tests for a few deficits in useradd and a patch to
user add that should fix a few issues with recipes who have useradd 
interdependencies. It's still a WIP, but after discussion with RP I wanted
to send this out.

Eilís 'pidge' Ní Fhlannagáin (2):
  usergrouptests: Add initial useradd testing
  useradd.bbclass: ensure sysroot_setscene for DEPENDS

 .../selftest-users/creategroup1.bb            | 32 +++++++++++++++++++
 .../selftest-users/creategroup2.bb            | 32 +++++++++++++++++++
 .../selftest-users/useraddbadtask.bb          | 20 ++++++++++++
 meta/classes/useradd.bbclass                  |  8 +++++
 .../lib/oeqa/selftest/cases/usergrouptests.py | 32 +++++++++++++++++++
 5 files changed, 124 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup2.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/usergrouptests.py

-- 
2.34.1


