Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 98D967722A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 22:40:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so14757788pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PsA6B7xQLkinwmay0L/KPsyJmP8caGv+D4YmrvOvFA0=;
	b=GajWDLX3j9309KFxCpHpzhLNXki5/D0AIt1Eur/xGxQEozGIG1c89s9XxDT/gcLf0w
	VJJwBjcHXt9IintGI057//Ol8wx4rOF9RIoWuAnjM5rTtlo/CauBvHUZhaIWf+UQEccl
	2VXnBMyPo1N7aHwAbvBXgsTIRzN1NvTLJIZ3+ClvvIoC44R8Anhc3sbLr20Z5658qxGa
	Nc6dGNgkDelvmmfwgtWlcjkfViVUahgmJG3C9Yel24N5zaHhlV4ZfSnC0nd5UQ7fEYoz
	iHKVWpGWQhPUmHnVxV6bw9b81aB4DgY6uEKFjjNQ0bY+b0Z9tQonjABfufr1M64+hqGH
	ta7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PsA6B7xQLkinwmay0L/KPsyJmP8caGv+D4YmrvOvFA0=;
	b=lcNFH3MDcx7a89QVTYuz8Io3mcPjJLvwxf3hl2yqUNMDF9+H2QSbYE3LQd3aJ06yOe
	Y2D2PEz8jIsSe2pXVnMw4AuwLGuh9jhbs8UHQkkukLF4bTn95UgtMHHW81UC6ZpPs6Lr
	/EioqFdcbF9wWmwQO4CTQnMbh3bnTXV/dzhuRNWwi2XLER963EHhxCxKEtBzGJ6cXMVg
	DwbysRFhY52huuDv/tW6HmFgf6HXAd6yWdUTispLueXplJQ9JEIoZXl98MioZrURGCxr
	xeqQwJ5fCtD7aVTKTv9gvbs0ye6UKPV+VShjzaMq0XnGZp3GZBjwskT4+DWXBPsrh51I
	a1EA==
X-Gm-Message-State: AIkVDXLQAAFXHaH9Edx4ghtHjm/HPvYOhc4csD+OMpCw1i85UloA+HhAUg9GqRhQqjNxRw==
X-Received: by 10.84.217.216 with SMTP id d24mr46828708plj.101.1485211208493; 
	Mon, 23 Jan 2017 14:40:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	n70sm39281208pfg.34.2017.01.23.14.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jan 2017 14:40:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:39:54 -0800
Message-Id: <20170123223954.12039-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] autotools.bbclass: Change acpaths defaults to be a weak assignment
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
X-List-Received-Date: Mon, 23 Jan 2017 22:40:08 -0000

We currently have to override the default setting using a particular
assignment order in the recipe, setting it weakly helps to get rid
of this problem.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 3741d09706..da5ec27575 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -27,7 +27,7 @@ inherit siteinfo
 # results for autoconf tests we cannot run at build time.
 export CONFIG_SITE = "${@siteinfo_get_files(d)}"
 
-acpaths = "default"
+acpaths ?= "default"
 EXTRA_AUTORECONF = "--exclude=autopoint"
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir}"
-- 
2.11.0


