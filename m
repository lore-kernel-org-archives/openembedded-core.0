Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 33AFF713B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 22:10:42 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id fb4so6073698wid.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 15:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=839WgHBh5aHyhd1WLKFqHmeJsg+4VvLjo72iHTtyC0U=;
	b=U9TiuhvgzMOAXxzKqD2BBC7TkpuXtZPE26Ge+jarvlk8sXNiKcIiozfVtXQ3Io3ewC
	K/LX9T7Q2LI2W9hPhLvVrFvzsoockQKcDYyCP1dw4U4ocQOhw9/6xjyWWOuB6QZLldsG
	8UW4xtWru70RAE4NOZR0DfwaL0/WOJMZVyDUpEV4yJ5x22PKd2d0iU61bEJiXYWeAu3V
	nsMd14+dN6Ingv96nJDwR30BC7aR4F+txjFMdALahFY7IxCh221Uj5+KOKVoQYgumy7F
	Seq6/8SXssg8H4jR0dH3k9n3yYPh0VnHfVinFoCDqhznoepUWa4iIFaW8XcCqB3SlK1z
	8FDw==
X-Gm-Message-State: ALoCoQnuH6CQge2IunBquTBgD5vZ+bQqm/ORfDnYpBb+yKMfp8WWu5tk7TehX30XEYKy7Z9fibJr
X-Received: by 10.195.13.78 with SMTP id ew14mr1660816wjd.83.1412633443618;
	Mon, 06 Oct 2014 15:10:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id u2sm18614110wjz.11.2014.10.06.15.10.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 15:10:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Oct 2014 23:10:33 +0100
Message-Id: <1412633433-23255-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: don't add files and dependencies from units Conflicts
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
X-List-Received-Date: Mon, 06 Oct 2014 22:10:56 -0000

Adding dependencies and moving files based on Conflicts tags in unit files isn't
right, mainly as it means that systemd depends on systemd-binfmt, because the
latter ends up containing the shutdown.target unit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 708ba89..c34884b 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -143,10 +143,7 @@ python systemd_populate_packages() {
         if has_exactly_one_service:
             has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages).split()) == 1
 
-        keys = 'Also' # Conflicts??
-        if has_exactly_one_service:
-            # single service gets also the /dev/null dummies
-            keys = 'Also Conflicts'
+        keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-- 
1.7.10.4


