Return-Path: <kergoth@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id A3D797FCF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:12:24 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id c184so8089224pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W7ucMzQtnMeL0ZXIbWWJL8VYhrjQpKQOv0pWRZTM4+M=;
	b=M3pW/n8h/7WdLj55yXDj0VP3xFURAEusaoPwRIOGO4WD7eyLB8wxikvBatHoHxmRyb
	A0/NiTgccW3IlIP2qEZ4QBhk4R6+8/KSN/VEEkIlTeye55lMCmR6YGWMfozgz9Tbv0Al
	gQi0Fuypi70gbDR7pcDD4D9TQwM6Tkh8/mTTGXZU0UjKGF+whXwisJKXbpzJItyqEa28
	TIIrgmuI6kEIHJkHlYqNAyouvWabZxxCdBSUu3sZDj6IyUHTlQlRuvPgAnuAjoGhuc8U
	LAMwcgAte/rOLEeVHCa/ZRliEaB10QUJ45xsPVxnADg2DZKf8DSibpVioSaIhA+1yvX0
	ur6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W7ucMzQtnMeL0ZXIbWWJL8VYhrjQpKQOv0pWRZTM4+M=;
	b=huFp0wYWG/rVACMdBjbI4qYYKya/HSSjNdR2Id/b94L0kCrqxGE6djE21G/6AH4hW9
	M+JYsgVusXp/Ht8+3kchMpK4XqlEZvoWM23nQ9T0dvt9pP0+aZos7p6AhvsF8sWDG8zi
	Cz47AvV7eLv3xas1tG5iEpHZlhDwP6E8oe9ReWAbjzfOiVn5hVKsKXUCs0E3DNJ1IsGM
	RGwRHyaJ91VqVnRxp3Fo+0K27RVsy9uKJXM6zSvAwAD2r2BRmgYSbLG7NH+x0XgENjuY
	kz2lr9cSiH07aNA4pNBgXGUcX24bSWkyiZ9edeT/oJbQfkV5UJgwZ5M+2WRT6bN+Usb6
	9eCw==
X-Gm-Message-State: APjAAAVe7ASwE/TJRi/7bENNQQhbgCmYAkDLGmmkWOg4PqT5S2eOt6ve
	o4bjXXtHMsPhnUDoNfc1YMxEqgGVrWY=
X-Google-Smtp-Source: APXvYqw8qYEglIkXzzQCpuD8O1FeD1XNY88B/Xs8Gs8cId0KiUpWjqNR2Iwn2S2nVhlc+p54m7N1pQ==
X-Received: by 2002:a62:5807:: with SMTP id m7mr16707421pfb.180.1574719945515; 
	Mon, 25 Nov 2019 14:12:25 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id h3sm352996pji.16.2019.11.25.14.12.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Nov 2019 14:12:24 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 03:13:56 +0500
Message-Id: <20191125221357.6560-2-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20191125221357.6560-1-kergoth@gmail.com>
References: <20191125221357.6560-1-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] dosfstools: fix CP437 error from `dosfsck -l`
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
X-List-Received-Date: Mon, 25 Nov 2019 22:12:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

Fix this error seen when using dosfsck -l to list fs contents:

    CP437: Invalid argument

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 69aa81af44..c99d2019c8 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -23,3 +23,6 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native"
+
+# Add codepage437 to avoid error from `dosfsck -l`
+RRECOMMENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"
-- 
2.11.1


