Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 075F0765DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:10:26 +0000 (UTC)
Received: by iofh134 with SMTP id h134so21157126iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8JQaZjmFzKbkM2ysCCDSbsPDBEvtPlfA2fsyAbJHs7I=;
	b=EunZYHbIVOw/8myzD+LOB8UPajdJpOMVgOqqsf1w1nx5d071hmFjMID0FdEcbnoa3y
	u3sL0AjRJ/k0J6l06/xH4NoKafoYeZpFLeqo0D/p05X4ruwFf/4hFmkDZ8g6kzPmiZdn
	UQkUkoekiHMsIPKQ6ghf4DGQon5CnH0I4X3Ap+iEv/IILmy3zY2Ujm/L3SYV+0VxlvYE
	vpRXZfDi0SrwBy5u9ZW2LAVposc1Pjdy63u/+eB6fwXyo1P2qY0CymxP/0rGgo7M++Py
	VmRZlqfbLekM1jcAYg0kvMD1NIQLZ1RuQ9pcyzbGByRuCh/8pq/jGF2GphpOxLQi4we/
	lkVQ==
X-Gm-Message-State: ALoCoQml5Cd5vLHOnKTPBwTM9G9I2Yr4NptEBuxCV2PrNbS4MLCu5tPAbwaTnujscCZVvOaY03Xj
X-Received: by 10.107.160.194 with SMTP id j185mr7729260ioe.37.1441804227150; 
	Wed, 09 Sep 2015 06:10:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56733.dip0.t-ipconnect.de.
	[87.165.103.51]) by smtp.gmail.com with ESMTPSA id
	k21sm4513409ioi.10.2015.09.09.06.10.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Sep 2015 06:10:26 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 15:10:46 +0200
Message-Id: <1e612377a8e6331361f984ee0e978fa4a5c4b0b0.1441803055.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
References: <e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
Subject: [PATCH 4/4] initramfs-framework: support dropping into shell on failure
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
X-List-Received-Date: Wed, 09 Sep 2015 13:10:28 -0000

When the init_fatal_sh boot parameter is present (i.e. used without
value) and a fatal problem occurs inside the initramfs-module, a shell
will be started instead of looping forever.

Useful for debugging.

Interestingly enough, the code was already indented to support such an
if check...

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e8f4713..9291ad5 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -58,9 +58,13 @@ fatal() {
     echo $1 >/dev/console
     echo >/dev/console
 
+    if [ -n "bootparam_init_fatal_sh" ]; then
+        sh
+    else
 	while [ "true" ]; do
 		sleep 3600
 	done
+    fi
 }
 
 # Variables shared amoung modules
-- 
2.1.4


