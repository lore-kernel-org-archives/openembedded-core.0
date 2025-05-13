Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6119BC3ABDE
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.84924.1747163318087321039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t19j7lIf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23198fcdeb0so1068165ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163317; x=1747768117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ko2vNXtNqdZea4Wbg9rBSgrUqeg/cKxomOt3ZFUfsTo=;
        b=t19j7lIfYYkmRxdBJAWemfZu/NnkKww9OFArRt8/I+Uz24hoMUPf0jMYFKsI2ahh/M
         5GUueVfjO0yBbFQevNEsAwLg8wZFrKH5lHkNUoOCoGzr5sg3UkmsFMQLdy04eFaKa+2J
         o4dRiGyyp12kmEObMIaUIL2Ha1scqtxJcerqVeKXJQPNeSZ2MblY+kCm9eoNW0AyZozg
         9NtL4P4Cbxxysy6vKvgejn6CYFjoJ8qDCgrrrVfBHwMDFATOCjivj6uxij8t+IYeFMSu
         Kdj7WPhDz81JG5eBkgK2tuQiEwPlpN7vAkev3mR920UMwcBTVLmwmue12nrtqDlmGpvm
         V0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163317; x=1747768117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ko2vNXtNqdZea4Wbg9rBSgrUqeg/cKxomOt3ZFUfsTo=;
        b=DaVQYhtl1SVYgiiHibnclqcHSZr6GemC353ItdlTMOH9vKWiKHbnCgrKNnMOfomv+C
         iD98ZDzADNK1lxh5aMI1iQTXxvx1huXrtg4s8gQkgwQPsWQK9HWPSvZ6CX6dah7jPYN7
         4t4JVcF/MeVDIjxsnVoxmCFzyOTFXCStT9xEmlginAwlYgfKzVdSzG2oZb7u/pr2u+BZ
         mpmsDZz5K+ROr2xReHCTl+fu6rXjED6KQu28iiW5/AGrjj/kjy2x0Fz1NhUdzK5jyo4L
         8BVEQ/pgZIwPt/1KD9+ToU1mZ/WBSoSsvmdrHvXa8hu27JEV6VUZZY085PIPB0I3gq2v
         gUOw==
X-Gm-Message-State: AOJu0Yz7futknF7Uv1DWnjPY7Sas7hVpBkLebUHiN3iSnGIgel8w2ja5
	MxFHKLH09PmIHqzfL8YgiAla2YgKdj09PMy+wnLsdRrOIBiHCINGW4xSS65/21r+Uxok2K53u1v
	h
X-Gm-Gg: ASbGncsBzG3N1jQIoVEiBsyZJLjDFPnz7feAT+kgpKaHhm2UoZEvNDc2FETd4RhwW8g
	9NiZl8gf+2hdge/yLaOUF3HZK02SP6Jh7VQ6xz48QgWCuG9YQ21/dTMK12QhOB8Ti4fjt6I3Qbr
	2egQ5ptFZH8V8lH8JupnhxYuKrTgDMban3WWqQO1O7CtKsiwhmHu8FI0Us1r9+FhDbyM56dUqDH
	74Emihk1Jtx4k0FSwdM+b6+SSEpm4lZTSqnecfnpMfjVMLnbv0fIuw/8RZIawAAd5ueTOj/qIk9
	P6cR4LIpsBdynkv0pSKzqVF+qxEH7hDhWW1xTzn1pl4=
X-Google-Smtp-Source: AGHT+IG3n7ohW50F0ULQ+niwI4M4U6gEnjc3EIKoj9HgvElWfrFAdtq9OGzzR0u/LJwGRPAlxnerLg==
X-Received: by 2002:a17:902:f545:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-2319811998emr7381905ad.29.1747163317361;
        Tue, 13 May 2025 12:08:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] scripts/install-buildtools: Update to 4.0.26
Date: Tue, 13 May 2025 12:08:09 -0700
Message-ID: <04ff268291598c1e0588cff43df694a714e48746.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216445

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.26 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 56b22e4270..8e55bd69c8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.24'
-DEFAULT_INSTALLER_VERSION = '4.0.24'
+DEFAULT_RELEASE = 'yocto-4.0.26'
+DEFAULT_INSTALLER_VERSION = '4.0.26'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


