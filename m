Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0A2560B9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z13so5876786wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FkEcVXqSjTeKFjpdo5Uco9sWizmaG2beAO7Ah98u0M0=;
	b=mX4pgxzyVbU761eXNm+3K1Bzmv8v3x5OrgjPL1jQsMGa1RrSC+cDpjnOCKY0UXrzCb
	wWQwZ95cE9xeUqjyLZnTQQ2G9l6abaM3lTljwVmwBjAvzWsnYb1DPvEruNMpU3mrROo8
	QMVcrPA/x3jQT4xEuHeSn5NX69NmbtLBGotiE3s+/TOA44lQYW1jDQg/XElTiApHe+H7
	ZDBO8xjkPBLfLOq3xkHASFuhO3h1CwDtCKBXgYRjlhXGhYlwIcscyYfR0fLXUCnZWvZP
	z0Liz+Dl9f7XWcmSP6aRtRpesiWTkRPLesDRVwOvZZe3iRoGMIh+Nl3pyNxY6i+1BBUQ
	HAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FkEcVXqSjTeKFjpdo5Uco9sWizmaG2beAO7Ah98u0M0=;
	b=DCvSb7Yh6x/+Uiyez4TdIi7lYs+1kPhv2ROznWMAh7hcWuZ7uxhMCtkFhR7EMTWikC
	L0g0+9Ujn0KSnLZK0lmJKaLyh4Kn5pmJasedUMUBSat6v0WBInqnT1FtByo+SWX7EgpW
	X9pH/9f9Rmqt8C29wUYLSqD3pvhTUUVnuI/2nsoJAlwnQ6qugWT9HJaiySgMURIWaiWI
	MiAsPKJodzVLSBmzOONugEGAH52YrIwJ+giiKMGFvf08L8lNlnbIWEsnsf3bOg9XlRfv
	L2xuAfsY2bsByvJ6kcZ0vBT6EaXF3RNZPD3EU/OoesCtALfRPCvKVwzNuJoT38YU39s1
	rd7Q==
X-Gm-Message-State: ANhLgQ33CjPYVV0Q1FhVj6OS2pZwp4FTjyVBKM0cVCkzsGAz1jOocmmu
	C8SM5i7/QIuDc+Ny7tbGQiK/orC8
X-Google-Smtp-Source: ADFU+vsPNHWVlHqdOOySOGTSC6Kr1bAKYoPb6nUv/D17pQuAVQy/BlfeFJLyjQ8XQ3yuRR/YAjlKPw==
X-Received: by 2002:a1c:7f10:: with SMTP id a16mr5811040wmd.1.1584458938029;
	Tue, 17 Mar 2020 08:28:58 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:57 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:58 +0000
Message-Id: <20200317152303.4600-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 06/11] psplash: Set RemainAfterExit on systemd units
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2020 15:28:59 -0000

psplash is only expected to run during startup, but if any dependency is
pulled into a transaction and the unit is inactive, then it can be
restarted.

Set RemainAfterExit to ensure that the unit remains active and is not
gratuitously restarted.

Drop the nonexistent systemd-start.service from the unit.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index a8c97c7a7576..36c2bb38e072 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -6,6 +6,7 @@ RequiresMountsFor=/run
 [Service]
 Type=notify
 ExecStart=/usr/bin/psplash
+RemainAfterExit=yes
 
 [Install]
 WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 4e18980bb271..082207f2324a 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -1,13 +1,13 @@
 [Unit]
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
-After=systemd-start.service
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
+RemainAfterExit=yes
 
 [Install]
 WantedBy=sysinit.target
-- 
2.17.1


