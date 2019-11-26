Return-Path: <kergoth@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5185C7FCBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:06:57 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id h13so8502117plr.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WcOhLisbIo92L89StdKEa61zbHDWxHWbOcdnyJ+C65I=;
	b=bNRhwpjCvS8NVNhfK9rwcHvHq33ieudJe8238zMvqioYJy19YdR0LGmQuyr/T5naHU
	ZWc7Ml7yuDGbkCQ124aqUrH5wyxMuJ4qntKpAq+nXF2FfpwpQIKj5VxD63I2ObhYLQHO
	GrqxlBa9Rf+3C3ROcplInSsD9a9qPVyhh+0ssccAcs7VR1+AGNiaYmoiioBHeted5J/v
	y3GTI5M4AtTsSSScRMpRkW0e4ppKNLce/5FTs9yjB/SlU9nb5KC37Y550RB+wV3i1Lxm
	Onx4htet9rIh+Pwtet/odkB7C0nayLcm4r4H6T8WG1o6J/1c4Wixedhzi/DZLU4XgcFG
	eDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WcOhLisbIo92L89StdKEa61zbHDWxHWbOcdnyJ+C65I=;
	b=D76Xp9eRsotJ6FxWzL0QwVnpKG1xHF4hD/gQRxATYgknYuT5cAIV3Hr1qJeSsgH5Yu
	02Faugru8u9xY4/EFMkpBBE8h3dbzrEc3bqiraCXR8XvZeiEaHaOyvWspz+cnjAXdthm
	5e3igQDAhbTQpWIHC0SXhoGJovVZDUqxZ77/jprGJG3VZzUckkXcXZZXxI+h3WVVt9N5
	AUOtYN67EUsIB6HXqnl1YpmtAf/dQz8YrmxJmT9SGEx2EbrStKTJCjP794Kc5Ay5XgAe
	m5Ga0QoyZFDwibWAKjI/ncEgkvHWoRhNUGqG6AEhs1lI3L746+/aWGA1a/xBcyaYqzKR
	NKmw==
X-Gm-Message-State: APjAAAW4i/4V9JfqRC9Eekd7m56logKyYnJMeJWPdMySvVwG88QRWCSB
	bR1ubJ5iRNFJ8XO34ZVKwfxboie52/M=
X-Google-Smtp-Source: APXvYqw3pAqJMI6zSAE7Kb9FcQzLpq1kSVGaBtQLSXRl7pdUYiO3lX5EXYsrPLjVsRE1Bex4iSIXBw==
X-Received: by 2002:a17:902:b20b:: with SMTP id
	t11mr36178433plr.211.1574791618193; 
	Tue, 26 Nov 2019 10:06:58 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v15sm13171989pfe.44.2019.11.26.10.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Nov 2019 10:06:57 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 23:08:28 +0500
Message-Id: <20191126180829.25680-2-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20191126180829.25680-1-kergoth@gmail.com>
References: <20191126180829.25680-1-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/3] dosfstools: fix CP437 error from `dosfsck -l`
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
X-List-Received-Date: Tue, 26 Nov 2019 18:06:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

Fix this error seen when using dosfsck -l to list fs contents:

    CP437: Invalid argument

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 69aa81af44f..23b88366705 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -23,3 +23,6 @@ EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 BBCLASSEXTEND = "native"
+
+# Add codepage437 to avoid error from `dosfsck -l`
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
-- 
2.11.1


