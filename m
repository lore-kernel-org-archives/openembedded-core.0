Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7350F60778
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 08:34:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v90-v6so7251079wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eA8c5wRZ7c/HltlSE9wIAAS+FFxvbSGS8Tk87kO0Pdo=;
	b=OixAaN1uxDzK7+C2YOaGekLF8GINWkBLKhmfba1LMc7YOijJJnUHEEhihnkXorzwXl
	Q+QSoWbQPfKUxqK7x6RUxRFWP923T/sl0TaW08dCzZKgP4RBCH1VZ4sxhKyoZGwg//oG
	MEOwaCCzj2AvjkeWQDEFMoNwn8/LIJrYB12MiMeIdYz+4RA8a4ird/Jbf3D302okYgPP
	WoFEgNYx3X6R17AjqvO43GqHgs+HepeYRKzjBZKA3V62ORlj4xjZ4nD1XgB9CZCeuVYE
	3xFXEbVhR/SaspJDMSgIKrqnykkZhigKVQvbkzwfd4ZnAb8g/aMB6Okwm5EjaRY+K+54
	fvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eA8c5wRZ7c/HltlSE9wIAAS+FFxvbSGS8Tk87kO0Pdo=;
	b=rL9AvXMmGdND2OPUexObfvd1NcUbgWEwVa2xdRFKJpSQxt8gi6CzO8w/xafN7UsU0p
	1lKCp7hyeDX94F7h8QJS+2niQv1CixMp+qrMJ2FXQSDObpywWDW2n3bNeoB6B0luzOCa
	bFkztJ1mLnYeQB0pl4UsCktHIck3Don8zJOaax45CBrAke3DTuzXBEjEooecHnpm99jk
	XHUpQ2U35cZnPn9kSebf8jtXUcQIW38Mn8cH14AHGIlWMcTjea/W0ElRpsXyODyDYIUa
	NcbMBCuy9lGUJty/C3u6ITzeue05hZVF/FV68RyWFaDz5rr9LvKgy+lmrnNjPgzXvC3p
	2cVw==
X-Gm-Message-State: APzg51BSz+1TbIdzGbx2MaldAMhuGT313oiLpsk/qjwUEIFgDnj4vUnG
	HRYIDTF0xYhsQPq/f6DEZXsUgGQwU64=
X-Google-Smtp-Source: ANB0VdZJa4HGZbkY/LuYyMCG3oTqqs2jWRcdc97CBWQLs5AORFptuqgFVS8ID3T6B0aFxz1o/oAv+Q==
X-Received: by 2002:adf:fd12:: with SMTP id
	e18-v6mr7095435wrr.280.1535618067943; 
	Thu, 30 Aug 2018 01:34:27 -0700 (PDT)
Received: from localhost.localdomain ([213.205.251.34])
	by smtp.gmail.com with ESMTPSA id
	j191-v6sm1267971wmb.37.2018.08.30.01.34.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 01:34:27 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 08:34:24 +0000
Message-Id: <1535618064-18215-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sudo: Add missing dep on virtual/crypt
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
X-List-Received-Date: Thu, 30 Aug 2018 08:34:27 -0000

Ensure we have virtual/crypt even if building without PAM; fixes:

  sudo: error in /etc/sudo.conf, line 0 while loading plugin "sudoers_policy"
  sudo: unable to load /usr/libexec/sudo/sudoers.so: /usr/libexec/sudo/sudoers.so: undefined symbol: crypt
  sudo: fatal error, unable to load plugins

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
index ab9c8cb..18add22 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -10,7 +10,7 @@ PAM_SRC_URI = "file://sudo.pam"
 SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
 SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
 
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', 'virtual/crypt', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
 EXTRA_OECONF += " \
-- 
2.7.4


