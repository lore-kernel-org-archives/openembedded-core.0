Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4255860107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:32 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yl2so3728449pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zik6HloscBcNCe/ohSZYNHYr3lnXlsnRn/AQJGgS5kY=;
	b=JegDdvu8Xdxrwb8yT+3tLH/MjjxlU0JyN5+4XveW52SfuEC2iIWYdPbMFnMzI5H4DC
	J8Mnr4bNdtpjfU+Yeu/ArQw//hKhFX0kSrlGJiaKddWc0NmlEVCDZ+RvqGSL3ZkH40gJ
	lag8f0ruecJheS90KvzxFRom2zykH/DaUcf1EUcT1NCDOdKMgmsrKpdXrpuN5SNhaEZb
	JFp1BvEzsgQqrX8sQer0rCSin1DN1yfLpqJsXPmWBHFp4JbW4NfHvZ84WPY+eiNMyims
	O4IZj6dhJIHG6B71Ozer39yFrayOuNaizvoqGkhsQ9Z3prQMv/t8SZhm1Etx8VkZrVEq
	iKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zik6HloscBcNCe/ohSZYNHYr3lnXlsnRn/AQJGgS5kY=;
	b=Bd6sJXWxPEkSOvGy4qEHS2s+zfcW8TT5075n6xHmJvSrF3aKopZuPNUjff8qGul+60
	tTRAYYSwjIcH89Zc13lsUz2xhhlI5K+ojmDWTXz/FFxbKpMuN1eg2DC3ybN2o7MmQrWt
	MneZtsmgZD86+st5TQ7k7mqPsJhwrVJeilr/9m5E0J7rV6pz54cfgB6nQc/LjB6irkYs
	pfjsz2OyZ3ZhtFiw2AaZF/LeZxBcdKdutZB9whFWTGTA+yY/qqy5G39ESEmEFuOWIObH
	sA7wHsh5+suepWKB6qFRRb8xjIKBOTouTBPc0nkVyj8qPD9x32Y8Y1rPWUk52+UWmK4Z
	RD+A==
X-Gm-Message-State: AOPr4FVqmJM1yxCvZDpq5MBtYgEvt0WCowTdVJc6RfrEYsfuzd/w1+nJPqAhQvapoCP9rw==
X-Received: by 10.66.119.177 with SMTP id kv17mr7707180pab.57.1463546433297;
	Tue, 17 May 2016 21:40:33 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id e2sm8324447pfd.20.2016.05.17.21.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:20 -0700
Message-Id: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <cover.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] useradd.bbclass: Strip trailing '; ' in cmd params
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
X-List-Received-Date: Wed, 18 May 2016 04:40:32 -0000

When there are more than 1 packages in a recipe requiring useradd
services, they are concatnated and a ';' is inserted just after
each of the users being added by the packages. A situation arises
in cases where this is controlled by PACKAGECONFIG then we add a
';' separator in the USERADD_PARAM value itself for each packagecofig
since we do not know which one will be picked, we end up in situation
where the final string returned from get_all_cmd_params() appears to be

a; ; b; c;

and then the logic which uses these cmds triggers with ';' as separator
but in this case it will fail after executing useradd 'a' because the next
cmd it will call will be just a whitespace

This is highlighted by the systemd patch to add more users as needed
by systemd 229 components.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ee402ac..ae27c01 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -203,7 +203,7 @@ def get_all_cmd_params(d, cmd_type):
     for pkg in useradd_packages.split():
         param = d.getVar(param_type % pkg, True)
         if param:
-            params.append(param)
+            params.append(param.rstrip(" ;"))
 
     return "; ".join(params)
 
-- 
2.8.2


