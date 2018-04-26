Return-Path: <sarah.marsh.engineer@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F43560722
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 01:35:35 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id a6-v6so13601025oia.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 18:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X8fRis110MiPHPTynKmjDl189aHIz1m18q2EqSLUDTY=;
	b=jwKscBVf36VKHb5sdbM4psjE8WqJ6oxrIfvK/TEDv6kbmPkPoIc/qLx8pPlKOUZPe9
	nnkR7YcAeHK0ImfH87HqYzwjvfxNvPirFU8omw7VBg7GxADQtg16YO6jkpwMyS5kvhdJ
	0UOOSYArxOa57egWzV4+kROnr47TrZJ2Rkr6kwHrdcDjznmEyZjP8lKbJmuFIxIeY6Gq
	DCkWEdBvUHtEXvl3E+JN2Kn6NEzVL9PD2jiuDTJYGGTYiLJTzOyT6G6HEuZ5mf+9e1fP
	YWMGDf7bq7n+q8uaW60IVsgAaex0quEDYNxGE0mna+J13ykGqZduvFDo0//HSxjZ4+na
	+fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X8fRis110MiPHPTynKmjDl189aHIz1m18q2EqSLUDTY=;
	b=N6iT2y6EXrU36lYORzecboSmBr2fURRx9sV/UUrR8gEI82xVsYRvSq06e+8mk9K9Pt
	sPvlFresZbP2/XIh1CJ/womrze5RGeQcWcvEmIyV30nJnJxaHKe857MN/N8pFWnCdEJt
	Lidln1ySMl9tATxlPDM4sFTjXsX6Cfg22fL4AVkT93DDnTnmmZOYmHryU3ZNlHRY9Izx
	60R1VbjZC7btiAjf42kTND/Z8YkhhBgUnKXx5A5Qq73iAOcWL24U02a0S5+1qLXnBnl/
	h5YxrKMlW0jKOI7rGzegW/b4doVATbuhp83EDEHJW/jQTd95ERqbHDKGpF7XsALte0dH
	VDBA==
X-Gm-Message-State: ALQs6tAB7SppMGIcGMnBpMipArK68fDpm3Y6xGTX/iV1FOhA5x6O+oxy
	2mfyhuOzxrhMOYj+CGU5RC6JpcCw
X-Google-Smtp-Source: AIpwx49LEYNbDRieWraQ4FyMrorSAwOtc/NfdUFB4+4LZ7ruNYZbNADfn+NTJtyRfUISygeVmmkKBQ==
X-Received: by 2002:aca:ed15:: with SMTP id
	l21-v6mr19316222oih.39.1524706536700; 
	Wed, 25 Apr 2018 18:35:36 -0700 (PDT)
Received: from localhost.localdomain ([136.62.82.41])
	by smtp.gmail.com with ESMTPSA id
	w20-v6sm11789127otd.70.2018.04.25.18.35.35
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 18:35:36 -0700 (PDT)
From: sarah.marsh.engineer@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 20:35:25 -0500
Message-Id: <20180426013525.29086-1-sarah.marsh.engineer@gmail.com>
X-Mailer: git-send-email 2.14.3 (Apple Git-98)
Cc: Sarah Marsh <sarah.marsh.engineer@gmail.com>,
	Sarah Marsh <sarah.marsh@arm.com>
Subject: [PATCH V2] recipetool: fixed uncaught NameError exception
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
X-List-Received-Date: Thu, 26 Apr 2018 01:35:36 -0000

From: Sarah Marsh <sarah.marsh.engineer@gmail.com>

When packaging a node application, a `NameError` can be thrown in create_npm.py if an optional npm dependency does not
support Linux.

Signed-off-by: Sarah Marsh <sarah.marsh@arm.com>
---
 scripts/lib/recipetool/create_npm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index fb57e705f2..bb42a5ca5c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -320,6 +320,7 @@ class NpmRecipeHandler(RecipeHandler):
                     blacklist = True
                     break
             if (not blacklist and 'linux' not in pkg_os) or '!linux' in pkg_os:
+                pkg = pdata.get('name', 'Unnamed package')
                 logger.debug(2, "Skipping %s since it's incompatible with Linux" % pkg)
                 return False
         return True
-- 
2.14.3 (Apple Git-98)


