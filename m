Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA132731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:14:11 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id h5so8211617pao.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1tnRm1+F1nlT5FyFA3QdzjdhnY9PZ0A3cVhJsyboggg=;
	b=DHFmUPV3AIixuaVfOt01Q53NgLSxoJmgd9+2VDgm8aWHsfysw+X+QYX9SKTnzkvdH8
	ps1je3kNOeSWUh84m1vEg+w9/msqx+LubOsyko9VKF8ZLa1HK+6oQzwrIKdVqkmUNED8
	hYmH6oUvGbfHrnYEoLel7IkEHbZ/nmyYwPedpbRHP9tjXtSQPEL7ZGDZbps9nA9SmE+d
	FmRurZN6V/O5xAQBvBscc0qPWiGzvk9w7qoKAv9FgXuYP1OU2RL6mHKUJEVQxR4JplfU
	z37ohS34tfxDgKmadcPif4C0RdfkdPAg1B+bwaXlq2V6OodZrR3zwPfDfY9LptheI9i+
	f/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1tnRm1+F1nlT5FyFA3QdzjdhnY9PZ0A3cVhJsyboggg=;
	b=YLrqGsE9lINoXWPS62FnNuCZxqBiTSYzhn9h5KYU1e7T3+RtYjwfSMYnCbAwQitj1F
	o832vxlyQxiZ0Sw3XXGBxcObD0xmNfEX6ptgoAPXSLVZXRycBGymYkWX8o9ZAElXCHpv
	dJf7G+2VXRXv2PfXCUmi63j5oTMm7KUh9pgLwgnPztl2CteQP+Do0wsyBlOZel0qfbqH
	GGKR0mmhNQO2GrGxMFogSIAuwQ0volBFfEOTjOuYA471WZLj1g20PuzfMj77BLT5cfwM
	AuvP1pMET0I8ln8fbdIlUfGpsDtwwsfS/61cXofbUFBUmbAN1oeZhPU5R0w/V0SBW96z
	jKfg==
X-Gm-Message-State: AE9vXwNvr1EHf4TeKZHxJTQ+4Pzbce0CDlerjUztMoMKA/fl2fKhk5ANRu372mZGyWgqLQ==
X-Received: by 10.66.255.42 with SMTP id an10mr37058404pad.57.1473711252264;
	Mon, 12 Sep 2016 13:14:12 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l74sm26377320pfi.95.2016.09.12.13.14.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 13:14:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 13:14:05 -0700
Message-Id: <1473711245-24377-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] makedevs: don't restrict device node paths to 40 characters
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
X-List-Received-Date: Mon, 12 Sep 2016 20:14:13 -0000

40 character paths work OK for device nodes in /dev but not for
device nodes created in a chroot, LXC container, etc.

Since the 'path' array is already a 4k buffer, the sscanf 40
character limit seems to be a typo or historical mis-merge. Update
the sscanf limit and bring the code in sync with the Buildroot
version:

  https://git.buildroot.net/buildroot/commit/?id=8876b6751e0bc19a3754290061808f0f8420708e

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/makedevs/makedevs/makedevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 7471f3f..cba7681 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -360,7 +360,7 @@ static int interpret_table_entry(char *line)
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
 
-	if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
+	if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
 		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
 		    &increment, &count))
 	{
-- 
1.9.1


