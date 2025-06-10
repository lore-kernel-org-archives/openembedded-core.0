Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FEAC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.95780.1749584091313234050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lr409Cd9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c384b2945so4556856a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584090; x=1750188890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBRhrwWV6VwJV9YOZU3EjeVK+JXXf/Mb8Sh7ugxWDvk=;
        b=Lr409Cd9afOS8or+rcoMw6sDakwI92yw/wLlmJyy4H90oesLyVT32FWGTh8VE+NT3V
         XqFER+OiOFcqyVwZMtHDLjqpy50h48+7EWmDZGfrs43D0fKiF9TLPFmLKkO6/3O4V14a
         aikFvomqglP0jqXs6wz+xt5+jIFpAKpJzM2CAcKu8qM3YL3+u/oxXZgXnV8HZ8lAFwnm
         zqZW6G/CsdLDXnu0+FSMK6qgF0u8+kqqzOIOR0xWpHWuKf1z/DDzhl3a6ltXFApMv3H7
         zlGsI48Ut4u22Trud0A3lVJj/mT0b/IC1YKCDaObKNiFyTUchh3eXBx8yUCIDg86GL3x
         6ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584090; x=1750188890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBRhrwWV6VwJV9YOZU3EjeVK+JXXf/Mb8Sh7ugxWDvk=;
        b=JXTXz5+HdwwCeue9LFGXnbHf6FXzxXuYHtV7XUo2oQd71aNztmN5nFAjSy3eExfrb8
         fMjxTqOpiD3PuKq3xmc/N5MqQ2sH7nuHDFd4m2MBUhenVXUgCzpxPc/dUsnsmWwRVLbP
         w3lFdkNEJDW1Y/AUzp2kF6zWm3VM1LlFakTc4ekBmKzFZuRc3ETk/n9UUa+41+VfWrvE
         huXCsXo4VryjcDI6oSJNi0XTOxuAS6PaW0NE7Irv6xgZkhaavuJHJD+0oBvQZaZ9wd+A
         hTq6F8S8ZYg2xsvWa2DOmFMEU0xhKGBjf7931e1CxRBwjXE67in9LDYtSN01eSNH5pTF
         h+/w==
X-Gm-Message-State: AOJu0Yx7V1fwTsVdsvodL/wJtPk/T67L/O1Nul+aqo54fAzLpKlD4CA9
	EhYwElxop4IyB3AAxz8Uw2LhbAqw/9K7W0r6Oe5GaRVdQW955ZLN0WgqksjWb1QFcEXG2dHkdw+
	nzwFT
X-Gm-Gg: ASbGncujy+WvR8e2lXb8Wjhouus/IBTf6Lfmy2W3spA4suZupbG4vYu+8nDWPo+AKwx
	IcHmCvU2vd1XqkgrKcydKw07JuIC7mWfgLg01xGAwNnE5pD0rc1rMCoT2MQVY7aQKNr0rP9ETBD
	oupOc5inAZSmrL12b6oI6DTa1KYB8HgaCqDQZV7YNv1mS/MS/YNr+kOM2h5bTjEWhCsxiw6wQ9C
	CaeMukYebLUbVS4VF68948UJl8rmPEntupzRTV9/Gd7z9oSo2oLwFPdCSXXNRRIXVWPBvkbwGCP
	uCilbwWNjKRHdriQuJ5Ej1B15CcJQpaHVzjbOYkt5VcSgF05Ky2AU0gB16YQYMqg
X-Google-Smtp-Source: AGHT+IFqxBIxUcxuXnO/+TB8YR4UEbajR7TVqrCTmvddrwXj8BgJtWpnP2kW/VO1zmNxSWnQkOvcTg==
X-Received: by 2002:a17:90b:384d:b0:311:f30b:c21 with SMTP id 98e67ed59e1d1-313af243a50mr789247a91.26.1749584090589;
        Tue, 10 Jun 2025 12:34:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] testimage: get real os-release file
Date: Tue, 10 Jun 2025 12:34:11 -0700
Message-ID: <f7ee6db8ca5dc72b7a468531e31403b60e6a0020.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218421

From: Peter Marko <peter.marko@siemens.com>

/etc/os-release is a symlink to /usr/lib.
Symlink is retrieved as a dead link which points to nowhere if also the
original file is not accompanying it.
Fetch the real file in addition to this link.

Alternative could be to use "tar -h" (supported also by busybox tar),
however that could lose some important information if links are relevant
for failure analysis.

(From OE-Core rev: ed43f9ccb3c08845259e24440912631afd780d12)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testimage.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 954c213912..33b1c13f9d 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -25,7 +25,9 @@ TESTIMAGE_AUTO ??= "0"
 TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${localstatedir}/log \
     ${sysconfdir}/version \
-    ${sysconfdir}/os-release"
+    ${sysconfdir}/os-release \
+    ${nonarch_libdir}/os-release \
+"
 
 # If some ptests are run and fail, retrieve corresponding directories
 TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
-- 
2.43.0


