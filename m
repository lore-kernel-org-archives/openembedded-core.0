Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id BAF8672D0D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 14:48:53 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so2528355igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 06:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lNfoqwNTOeVlI7VgPX8Q4b500H18gCaMU4/3XE3GuvE=;
	b=eI0fjYPil3n4VA/igsEvFTBa4DQiWHtOF1hxro9jGxxb5c7EtHpMEnYvGhrgmv4Ezk
	sXWywuFwPgCEY7DbyiXBwMq9LX1JqZ5HUjUzPD2Rzd7/0aAbCYNPZvEi/hH1qHN8XW23
	4aBDFbIeoBm/4eXmeFZvige4UPJBG9vAKtR2EoxXWZFiDhryfcpO6SzUGIVIBruDvfxE
	Vba/iHVXGZtxDdSjoyDHCsDZWEbBwiGjZeEKYoyyc+2d6o1LthU/PnmD6nFs1+ydLbvI
	zqngggGuVvgaXkQNi8AXn639ODaTVHrD1yUdMs1L/KyD0/CHT9ZlhLcgOycV70zigzMg
	eMCw==
X-Gm-Message-State: ALoCoQlWUL0ifr38ISGbCOCvOdbBabuJijqR/S2/lFyBnhu8lMptRBZVkvxvkwbmYVIOpLXVWes6
X-Received: by 10.42.83.147 with SMTP id h19mr8740746icl.95.1422024533879;
	Fri, 23 Jan 2015 06:48:53 -0800 (PST)
Received: from syncev.vlan14.01.org ([198.145.21.8])
	by mx.google.com with ESMTPSA id qj3sm748363igc.17.2015.01.23.06.48.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jan 2015 06:48:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2015 06:48:18 -0800
Message-Id: <1422024498-18778-3-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1422024498-18778-1-git-send-email-patrick.ohly@intel.com>
References: <1422024498-18778-1-git-send-email-patrick.ohly@intel.com>
Subject: [master][dizzy][PATCH 2/2] binconfig-disabled: install config scripts in sysroot
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
X-List-Received-Date: Fri, 23 Jan 2015 14:48:53 -0000

The purpose of binconfig-disabled is to manipulate config scripts such that
using them causes errors. But that only works when the modified config script
really gets installed in the sysroot. That is not the case with the staging
code in binconfig.bbclass.

Only patched config files get staged. For that reason it seemed more
appropriate to change binconfig-disabled instead of binconfig.

The reason for the change was the observation that the swig recipe needs
pcre-config installed on the host system. Staging pcre-config removes that
host dependency. swig did not actually end up *using* the pcre-config from the
host, because later during do_compile the patched configure.ac is used to
re-generate configure.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/binconfig-disabled.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
index 4c42ae2..0acc964 100644
--- a/meta/classes/binconfig-disabled.bbclass
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -16,3 +16,13 @@ do_install_append () {
 		echo "exit 1" >> ${D}$x
 	done
 }
+
+SYSROOT_PREPROCESS_FUNCS += "binconfig_disabled_sysroot_preprocess"
+
+binconfig_disabled_sysroot_preprocess () {
+	for x in ${BINCONFIG}; do
+		configname=`basename $x`
+		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+		install ${D}$x ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	done
+}
-- 
1.8.4.5


