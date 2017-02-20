Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8070771B26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:01:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v186so85437615wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 09:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xMKrkLWhtSIGaP72vVetCSdetoMdJC1uOvdysswp8vA=;
	b=UVWTfLlxllhpHOChGrjI5eNspKcxOREqXWQ4vVyVzXmG0G3yTv2FLxSeVrDZW6vjrn
	80f6qselhKJfbBLKsjb+l6ESefC+OH6IjcoOto7StTrtzzJYGwMSGTh5/oOlAWV8TT7P
	3k22li8V/mVdQQMDlxbIAW/bTZRmr3x2boywCeLdrge72IOE8Rg9n7XISX+nt8NpnOMA
	ByfRyrdUHcr8i26Nmm+M4bONP0uWGvxHjif7n0waqmYqLsH+ghxUSwKQJSEvLQlBgrk5
	RZjrrTnsjE/6roC38gmTkDGJPZ7wC99aGo8YcxUu7nLMtphou2ozT+Ed+I83e7dkLgXE
	0/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xMKrkLWhtSIGaP72vVetCSdetoMdJC1uOvdysswp8vA=;
	b=DAuKT+FWXPMcHGva7aR3BnW8u716++ITGWI+wb4rl0yJLBFLvY/Zxd60EdseFHVMkG
	hPU/3I6gTL22OzYTcXXVkR9lTJgvwT0LjXrxLKOCiy99WLGLOLr3qCoIILZ/12cvx4eF
	0Xx6ESN5gYUgESJvLfd9mt3GYtoBlQ3E/oICYaWSYAeSquGVPNvxMWHbNZfdgg/ri9KH
	ukpN3XJFvAWafvKWVgeczLhQGwvW4X5CCEFHYwew6goSe7Udz7jp93s8rE/gFGSQ4D2T
	XxwHbbeSsnjHVb1Q23EIDQko0NCk4pgJN3ICV8CltobIpsY6iY4BxLowI5WzHBLSA38p
	soYQ==
X-Gm-Message-State: AMke39kJk5i1R8DD9kJ78KbM8AlFVES1vU3wgPVeXUWRstSOP5Uj3FZeX9tFr/2WR3EjoCYQ
X-Received: by 10.28.94.8 with SMTP id s8mr19874881wmb.117.1487610062564;
	Mon, 20 Feb 2017 09:01:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x135sm14213409wme.23.2017.02.20.09.01.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 09:01:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 17:01:00 +0000
Message-Id: <1487610060-27007-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] unifdef: add UPSTREAM_CHECK_REGEX to filter out development snapshots
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
X-List-Received-Date: Mon, 20 Feb 2017 17:01:03 -0000

Upstream is releasing development snapshots of the form
unifdef-2.11.23.1cca442.tar.gz so filter out versions which end is something
that looks like a git SHA.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/unifdef/unifdef_2.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/unifdef/unifdef_2.11.bb b/meta/recipes-devtools/unifdef/unifdef_2.11.bb
index 1d13b9a..1ffc11e 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.11.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.11.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "337053fd8a7d9ab3adf5e50f88af95b7"
 SRC_URI[sha256sum] = "828ffc270ac262b88fe011136acef2780c05b0dc3c5435d005651740788d4537"
 
+UPSTREAM_CHECK_REGEX = "unifdef-(?P<pver>((\d+\.*)+)(?![a-f0-9]{6,})).tar"
+
 do_install() {
 	oe_runmake install DESTDIR=${D} prefix=${prefix}
 }
-- 
2.8.1


