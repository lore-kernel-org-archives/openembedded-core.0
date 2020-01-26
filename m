Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id AD0AE916BD
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id t14so2855701plr.8
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ID3jUDWmBqfiGR3GGO2/2dca/byibbqBSCcziQcgmN0=;
	b=SGg/OH97clUfAgUY3XWQgVFhgmtQMn5j2+bpw9nwgCLBl+3YVi0Tbqx2YtP07K0Phl
	ZInP0cA/wgv0m8ZEC263050rDPYxv8848aFo0Uc34ymxGqf4usCYmAZ+h7G0TqDFqfcL
	DdXVNWEesKymkAJznhjm456lLXsrbXaZzi1LpmOqyZqwaV8Znja1e+W31bzxshonzBGO
	s908oAqEOjvxM0zGI9/VPyPN3woeIi0RTSo+as3Sf7Ig9eUUdcoYhCkFC4DttARbYpJR
	oLtaz/xxAO9i+rnmdi08sPslfLwUNfV3rTVzLPmsiK/Cr8zHitnVcAZzNYplKoJQb5Ow
	NdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ID3jUDWmBqfiGR3GGO2/2dca/byibbqBSCcziQcgmN0=;
	b=A4VIb7DqzW9buSQFCH10LzF5iuH0ZW6BiKU9YgIUx7aU7AVHcgseumH0LLe5GoPOHW
	yDK8i6AmO7xV3GvO5WWUWlP58FYeh6FBfYMuzclwx0Cwe5wH7VwpZtcLglpZPGb4Y+Nu
	X+UOd1WWJs/QpfyKhMAoVTbevOADmpygqUAJ2ad8uB/MW3unrNeoaaVd94AHdw7XzPvH
	LhX2EmjyqqpHRA7HHcVmovO/c3c3SeajYNI4+/FtKJ9jyJt48Bj+G8ODCPhEC/rSOmlo
	ZvtqbK4T5IzIcTZ3YW2iO8su3gYVZ4Dn6y7yh2oD0k6PMQNrJSQ06T0JqjLCWRXH1Mmy
	d5iA==
X-Gm-Message-State: APjAAAW3Vn95tIJStYDAwsu24KF58GI9LA82TqtWpoRGYJdKbrv0HIcX
	UJM3Cdt5H3QVyh/Ut813wMM2Doue
X-Google-Smtp-Source: APXvYqxSF8FSV9/8Y1HJU9/Qsj9NMhLMRxNZMWKP+zDDE3IGgtmGg9d5qt35QyeXgXhXOOsnrVFiog==
X-Received: by 2002:a17:90a:8808:: with SMTP id
	s8mr2625403pjn.119.1580055910574; 
	Sun, 26 Jan 2020 08:25:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:42 -0800
Message-Id: <86f196dc077de7f3f6664e69703a96245b42ddc0.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 17/29] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:09 -0000

From: Mattias Hansson <mattias.hansson@axis.com>

do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
which sometimes causes a build error when building a recipe that adds
groups.

This issue only occurs when executing do_prepare_recipe_sysroot for a
recipe that adds groups before finishing a task that depends on pseudo
for a recipe that doesn't add groups.

Signed-off-by: Mattias Hansson <mattihn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1636c6ef93..d6f566a413 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -476,6 +476,7 @@ python () {
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.appendVarFlag('do_prepare_recipe_sysroot', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_unpack', 'umask', '022')
         d.setVarFlag('do_configure', 'umask', '022')
         d.setVarFlag('do_compile', 'umask', '022')
-- 
2.17.1


