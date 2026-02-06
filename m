Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A78EE2095
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:19:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9954.1770380358469290101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kRoq7wmm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4805ef35864so17879085e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380357; x=1770985157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDA25zT/2sn+6MxRAyCTBS0eSyVSO8ULVk7Q2xF4pBo=;
        b=kRoq7wmmK640uKb5LQTOC+w1BTWlPPsewZSsvBNr2cVJVzLEv7MQ1IQ/5eIJffWLeV
         +u97PKv39iCMPF9Q0h4SlnwAa+N8xNC9Uc7k4fFRz2Xug5QFasZy+0OInfgGqiXMGTxS
         rJ9HvfAp3UwAPkrulPC389HOykvuYmTDoyWdMcH2v1IVxloauIK192Z9MfykExwLT2y9
         3iks7MSQ6c/iG8Nb6YKk9q9jUepyexvXP750d4nNoTEPHWmpjULjoL07Mj4UwP+qPkyt
         tWQchxjvHxhU0DwWQvqi76joNlruJZOcJ+JlPG63vAOvT77wmd/oYtboZr6FhIKOiz9P
         cawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380357; x=1770985157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDA25zT/2sn+6MxRAyCTBS0eSyVSO8ULVk7Q2xF4pBo=;
        b=G6kPLb6vr8FJxCcVjKIsPT7EzQwQ4cKdh4y02vuFLonsOpIW3qeXYeZuV5L/D1WWFm
         88i7TLmIoFMgTtyiRYFfwyaGWQLuIVnpZk10vHYyP33egaaZgzLSCuRdbeU1QZ2N4D+N
         GVqpRsy5CF7RDvzKi3iXtN7cJLhmP4S2N68einqyqNP+cieN1I9g233x6t+YTQRANCbT
         wS7BsaXI46kVoCZsQb0uPiSkbrUdNdwkcGw5l2nPxlzJcpN6z8W4dJQtJPYqzCC5Ux/x
         tVpIA2a/pHGivQPz1MBfmjIXrWkRBXfCScoaEgYEHOVL1i4K4miXgnDuykeQOB/tQJCm
         Xtyw==
X-Gm-Message-State: AOJu0YwTZvAfquSfD7C/gvS0g33wIBXdPvi531wz1upsPIlwva2NbenZ
	eKxCNV3h33gh8RIm7uRjOgOVucXSZGp0DYtslQPOuS7t76L61yNFEatxBREIsQ==
X-Gm-Gg: AZuq6aJPsRm1nI/99vI5AxIy+ZepuvDq9+DHEjLJECMeGroUsR2iGv/NnA7wL0hlCa+
	k2d4SFWqdcfkPQPEoYOqssdkkUx/4A40pofjZMAaBQSTS+AuOhsMDjEKiKIVKieAa6/dfBjG7V2
	gcHdW2mMfYN/J58EnMbd/pcxPdUscRpcsopeQXqn8F+ZwNCR2j3qQmTEF5hdEFw/3Y/+zqNOH/t
	XxcqsSxzrf1JEm4oJyF6SU6a6qYriCvjSDqQjEqnIXxpy19aOxx3QS87ojtntXUZzSIRcAEEjXp
	qqbJMVtUGTzOvE7q5oPRBWxHNzBh/xf216o2E02IXRD9frG3AT3kT1oqj9DwJ76xcgWTVO9A+IS
	gehlE9Px4s4fw3W/zTfuPkgq34m1GU06QIj0hmrGKyldQ83raCNM8DUqWVVH5M93v39MK1g6XSK
	KaRZ5f2KxRSuwwIfyxEMEpbA==
X-Received: by 2002:a05:600c:8b22:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-4832021d9ccmr35368585e9.28.1770380356712;
        Fri, 06 Feb 2026 04:19:16 -0800 (PST)
Received: from acert-swift3.. ([95.90.195.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320638ff7sm53719565e9.0.2026.02.06.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:19:16 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.15
Date: Fri,  6 Feb 2026 13:18:54 +0100
Message-ID: <20260206121855.1895055-2-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206121855.1895055-1-aleksandar.nikolic22@pm.me>
References: <20260206121855.1895055-1-aleksandar.nikolic22@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230616

Update to the 5.0.15 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index f1c3084245..c874494f4a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.14'
-DEFAULT_INSTALLER_VERSION = '5.0.14'
+DEFAULT_RELEASE = 'yocto-5.0.15'
+DEFAULT_INSTALLER_VERSION = '5.0.15'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


