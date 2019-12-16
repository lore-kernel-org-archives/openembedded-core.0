Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id EDC017FDA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:11 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q127so3963291pga.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2/glOOHy3oqk/KUsu4K7YjaSpxAyMsywLlB6f9m561o=;
	b=DCdxnz/+119K5GTYfWcInlNdq9kQBPHYBx6J8gx8Doic21YQbtuJCCi8/TMw1Kn00z
	CRyrA2F5FKpRY2tPCz0aW9NoREUPJDpbvjaQI+1kFWfbnPEwBy4MSv610lthhp3onu2X
	iJ+KJS1pVVLkNMtACFHChxbyvvUI8j4Y5XMpcYwaoPZBw3FXKVSAmTkPfUr6YStww/q2
	dzlD2wptkXaw3u1IBF1A5CBHi2kwnmVjQOmsZ2wRI4EAhVeMCrm4Xqijebqy58kWompP
	vdC5jWU9Awv3eH5A8oNudMLhwRNdvXph0ZIGECCB1LgnJlo/ic4jwf1vLQ/Uffb91BPu
	P3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2/glOOHy3oqk/KUsu4K7YjaSpxAyMsywLlB6f9m561o=;
	b=IsTOGMzX1TVvXki3Do0tjzS58kjbSsi99BKIDzWOFVt6q253FVZM12veL3KTuyLvp5
	Ev9pgqoaZV6NN5Y2v/u+KHiMEfXLzoeElfVPzjIe08qMsqQQEkmoA0Jwdw09WuHe+HIY
	+2qsy4IlnVsnlneW05OJJBtrK6nivUATAPmtdwtKNCHTlwzAr4hOFIS8oMLF2ogmeTfn
	jhXCtwnxkyjZO3ME0SEcA70Ne0mGABULzndHvt4vG6RXKvqjx7yGcVAzm+2m2KG6NEmd
	dZB5oGtC6QBGeSqU3aUtNCZqDQ6jW5tu1eSWcCXMC3ufXMphHWGgcGSWPyD3fRH6J1kQ
	Aq1Q==
X-Gm-Message-State: APjAAAUw/Wuaw0ruUqK+fhC+uXp9A94VfcDC6iHlMiLGFoOeaCo4LAQs
	/YO76Jy35bS7OZRzT4pvg+uvN34jLPc=
X-Google-Smtp-Source: APXvYqzc4dqZ8lYsf8fxhKGIEFSTQp9i9wBsBdrHPEb203tokW3CENe18NcxEXWHCZyxDew3VXbcGw==
X-Received: by 2002:a63:646:: with SMTP id 67mr19218061pgg.150.1576512012858; 
	Mon, 16 Dec 2019 08:00:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:52 -0800
Message-Id: <4a17afb3fe42cbc01c52b2d5357f6021bf782c01.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 02/18] sdk: Install nativesdk locales for all TCLIBC variants
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:12 -0000

From: Khem Raj <raj.khem@gmail.com>

install_locales() here is actually operating on nativesdk and only glibc
is the default library for nativesdk, since thats what most of
desktop/server distros use, therefore bailing out based on TCLIBC is not
needed here, since nativesdk-glibc would be required for all non-glibc
targetting SDKs as well.

Fixes SDK install time error

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:
Your system needs to support the en_US.UTF-8 locale.
ERROR: SDK preparation failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sdk.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 153b07d..ef81f8c 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -84,10 +84,6 @@ class Sdk(object, metaclass=ABCMeta):
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
-        # This is only relevant for glibc
-        if self.d.getVar("TCLIBC") != "glibc":
-            return
-
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.7.4


