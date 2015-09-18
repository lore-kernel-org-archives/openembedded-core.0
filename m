Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 900A076710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:53:54 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so16065264igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A1dNMpJ1c1duVww5wVm//z/I1RlkeHiWhxTUsFxUS6A=;
	b=T2hqm7EtH+MmSImdPx+ZYl+bpcPSD2cIJMROWpioekJMLE6vhyuEjbFSxczUWXnkMf
	v0YV6r+NAdLDTAjWynjcu/T0+wkI54w7WuTGPQcPxnSzoqT/5ihOsVifxg3wmL9LcKVa
	scLvicNV4j9ZDekRbbX9In7T6N+jHkCUHIvl8PPTGkpS6MxUkrYUoP/yyxJK/NdTBTEE
	WkLaIPbPgUwtBt1DDuduNpDFtYRvg6wTBVL3BRS28YNhNWzs2JpIM5zgypI7S3N6Wv5h
	Pnp2ntjWaMhZ8heFIApuRMRg8Ii3V82aGfXhISQfrFOSlv/y3k0kkmYNowMnnTwOXoWx
	aY5w==
X-Gm-Message-State: ALoCoQkeo/KKw51sev6bY7Hjvh2iv3itrLBFoeBwJQABImL0RjvmfeVOqv7Igd2B6iKD+91SzR40
X-Received: by 10.50.62.148 with SMTP id y20mr32358124igr.17.1442576932075;
	Fri, 18 Sep 2015 04:48:52 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB4E.dip0.t-ipconnect.de.
	[93.232.251.78]) by smtp.gmail.com with ESMTPSA id
	kb10sm6358553igb.4.2015.09.18.04.48.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Sep 2015 04:48:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 13:49:21 +0200
Message-Id: <3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442576806.git.patrick.ohly@intel.com>
References: <cover.1442576806.git.patrick.ohly@intel.com>
Subject: [PATCH 1/2] initramfs-framework: fix "support dropping into shell on failure"
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
X-List-Received-Date: Fri, 18 Sep 2015 11:53:56 -0000

Due to a missing $ before the variable name, all fatal errors ended up
invoking a shell, instead of only doing that when init_fatal_sh is set
as boot parameter.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 9291ad5..204f237 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -58,7 +58,7 @@ fatal() {
     echo $1 >/dev/console
     echo >/dev/console
 
-    if [ -n "bootparam_init_fatal_sh" ]; then
+    if [ -n "$bootparam_init_fatal_sh" ]; then
         sh
     else
 	while [ "true" ]; do
-- 
2.1.4


