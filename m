Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 03E6B78E94
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 16:54:11 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id ba4-v6so5253784plb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XYg6zsdfLvzcrksJHrhTYUtYS5K86/0HV24PFmoiIEs=;
	b=KNM+8vnu4MArRBy/bGknQ2RzxJKpr5hOK5FL+IoRFPNsBKBNCOQk+2f13ZmBMwuJEj
	6OAq2/M/dsdJUOW9TpYxa3j+JFXnuUWmKpX6atxYzPvorYK/ylRQKUCEitzubKqMsuxE
	IFw3lj0DwzgnBp8DOjpoynAnT0527ysnTjuh/tigM0j0ej/jP57Sm1HVPjVkl2lWcsA+
	uAOaiEGm2KJYyjPWMGBNwqmBNy5mEVupX218S8grT5tGw+pqsEsa8EpXc0N81pQ56GNH
	pMcN8yqFvqLHWcBp0txi86pgBEhnPIu9F7LsZqkPTYSit2g3YJOQzdF1e0jgvTGhSgGK
	iURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XYg6zsdfLvzcrksJHrhTYUtYS5K86/0HV24PFmoiIEs=;
	b=s0fahQjVDokwb2ipk1E9ToJUYKIZPz1yKkbFIUCkjUwih4AxRkpHiW++ePSmxgSckz
	r+R9Dq7bHjR0CfyHyUYWi0LtqOAf6RlLiggS0KNSLReIw2QwRfYlfaKjShbKwPWKvn83
	p/z6cOa8sVyI4nTa63kLDHgl4FrqG5DRIHTEEuGscXA/yE0Z0quFb8SImF0fpzB5WOMB
	+mrUg70/8xybhGZK6KFdAHy1rHaWN1iUshnrohCd/4sLgIf3sPwSgNbiF3IjYzaSiSUA
	hl3kgkY/3DnDCvUfnS+wcfeS5ckNBv7Csn82xAS4sYKxPMMAIabja46pFSOXIZTpMjIK
	4vcw==
X-Gm-Message-State: AOUpUlFK3c++H8ZAXhHOIeyz9ejFPahunGYz3Mfn8X4ecyxtGnl6hm3A
	/BzzHoz3ftHaA9tDqv2T1E/SFqvG
X-Google-Smtp-Source: AA+uWPzckZbGzesLgSbgfSDWl5k2rgzFezzpphGze6z1WweJyPq6yigxUaexXlhFCw500i6l6ZcwsQ==
X-Received: by 2002:a17:902:da4:: with SMTP id
	33-v6mr10308507plv.193.1534006452571; 
	Sat, 11 Aug 2018 09:54:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::3947])
	by smtp.gmail.com with ESMTPSA id
	f75-v6sm41700155pfk.85.2018.08.11.09.54.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Aug 2018 09:54:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Aug 2018 09:54:00 -0700
Message-Id: <20180811165400.16487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] devtool: Use ConfigParser instead of SafeConfigParser
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
X-List-Received-Date: Sat, 11 Aug 2018 16:54:12 -0000

The SafeConfigParser class has been renamed to ConfigParser in Python
3.2+ see

http://bugs.python.org/issue10627

This alias will be removed in future versions.So we can use
ConfigParser directly instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/devtool | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/devtool b/scripts/devtool
index d681a1929a..0e578c0de3 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -51,7 +51,7 @@ class ConfigHandler(object):
 
     def __init__(self, filename):
         self.config_file = filename
-        self.config_obj = configparser.SafeConfigParser()
+        self.config_obj = configparser.ConfigParser()
 
     def get(self, section, option, default=None):
         try:
-- 
2.18.0


