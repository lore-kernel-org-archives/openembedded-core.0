Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZTS5-0003PT-8g
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:55:37 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 May 2012 13:44:13 -0700
Received: by wgbdr13 with SMTP id dr13so2991809wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=lm79452p5Q0h+IsHewq4u4IRozJcVB6PKxI0BwUwvV8=;
	b=Z11Wuwsw1BVtJeSd+vjkpyACCgEqGIQq1YSJhzbl4P4+YsbOHdmhGWLiVUU7ApOBvi
	wI7RmbV18h6UVbbWIS0gEat4GAUOpCqgNDtF8+J1w55lWhH1YpU5nr9zR/HkgKVQkBNB
	7nXGrLhw+7m1LY6eQaKNMSFccJpf4tOtd/8zw2V5XOBfNm/FR7KU9fCSt6hcbwxaLtCv
	2xVQ6sZ9k+arwr5F/j9SN7mX7PEHePYoDkIyJouOm6HLPZ83DPNjUINWzYWfC8hj+nas
	0SfwVQJ2v0IKiLnW46Z1DqoAcTP8TXgMjh4BJkou7vbD3/XxL/2R1SQI3WLWwJeJvSdH
	DE+g==
Received: by 10.216.142.102 with SMTP id h80mr7156483wej.36.1338324250846;
	Tue, 29 May 2012 13:44:10 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fm1sm30464662wib.10.2012.05.29.13.44.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:44:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 21:43:53 +0100
Message-Id: <cover.1338323483.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQnifiqk6Oa1NWtigKD4damsJN2NPC8wsUE6HdD4yDwK7cUlzcgdHHvDx7NuildijkAvAjty
Subject: [PATCH 0/4] Upgrade connman to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 20:55:37 -0000

Below is a patch set upgrading connman to 1.0, and cleaning up the packaging somewhat.

It Works For Me, but my current available hardware is limited to qemux86 and
a headless Atom machine.  In particular the non-root-X permission changes
look to be correct (where they were previously obviously wrong) but I
haven't verified that they work.  Also the packaging has changed quite
dramatically since <0.79 becaus what used to be plugins is now in the core,
which has the potential to break any explicit dependencies on the plugin
packages.  I've added suitable RPROVIDES which should mitigate that.

(note that this is against poky master, not oe-core)

Ross

The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1bfa:

  cooker.py: terminate the Parser processes (2012-05-25 11:39:33 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=connman

Ross Burton (4):
  connman: just give xuser the extra rights it needs
  connman: remove a deliberate sed that breaks all DBus access control
    for connman
  connman: respect the 3g feature and enable/disable ofono support
  connman: upgrade to 1.0

 meta/recipes-connectivity/connman/connman.inc      |   34 +++++++-----
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ------------
 .../connman/add_xuser_dbus_permission.patch        |   14 ++---
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -----
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +++
 9 files changed, 34 insertions(+), 245 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb

-- 
1.7.7.6



