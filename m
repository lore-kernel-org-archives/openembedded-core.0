Return-Path: <bruno.bottazzini@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5F11360144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 21:27:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2015 13:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,689,1422950400"; d="scan'208";a="462589795"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2015 13:21:40 -0800
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Mar 2015 13:27:56 -0800
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.51) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Wed, 4 Mar 2015 13:27:55 -0800
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 18:27:39 -0300
Message-ID: <1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.51]
Subject: [PATCH 0/3] systemd and dbus split into packages
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
X-List-Received-Date: Wed, 04 Mar 2015 21:27:57 -0000
Content-Type: text/plain

In this patchset we include the following:

1- dbus: split tools package
   Most tools are not required if one is launching a simple daemon.
   So, we split it into two packages dbus and dbus-tools which the user
   will be to exclude it from the image if he wants to.

2- systemd: verify if files test-udev and systemd-journal-flush exists
   If the user put --disable-tests on EXTRA_OECONF for systemd, some files will
   not be created and systemd do_install phase
   will fail.
   This patch will give this flexibility for the user

3- systemd: split modules into packages
   Since systemd repo grows with more and more tools, the recipe will provide
   a customizable layer and he will be able to choose what he wants to ship
   to the final image.
   He will be able to save space and exclude unwanted packages from the
   final image.

Bruno Bottazzini (2):
  systemd: verify if files test-udev and systemd-journal-flush exists
  systemd: split modules into packages

Gustavo Sverzut Barbieri (1):
  dbus: split tools package.

 meta/recipes-core/dbus/dbus.inc          |   10 +-
 meta/recipes-core/systemd/systemd_219.bb | 1079 ++++++++++++++++++++++++++----
 2 files changed, 956 insertions(+), 133 deletions(-)

--
1.9.1


