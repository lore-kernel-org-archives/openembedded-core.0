Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F16E60EE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 18:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBAIWSNG023627
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:32:28 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 10 Dec 2013 10:32:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2013 12:31:26 -0600
Message-ID: <cover.1386700055.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 0/2] RFC: Implement deterministic uid/gid
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
X-List-Received-Date: Tue, 10 Dec 2013 18:32:29 -0000
Content-Type: text/plain

The following series implements the deterministic uid/gid setting for a
distribution.  Currently when a filesystem is generated the uid/gid values
are generally set at install time, so the install order determines what
the actual uid/gid values become.  In order to create a deterministic uid/gid
set, that still dynamically constructs the passwd/group file, we add an
option to read a special passwd/group file to allow the system to determine
the values.

It uses the existing parameters, and the values from the special passwd/group
files to reconstruct the parameter set to ensure these items are fully
defined with static values.

The first patch (01/02) is generally applicable.  It fixes a real bug in
the way the user/group adds occur today within the system.

Patch 02/02 implements the new functionality.


The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b46a44:

  libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/uidgid
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/uidgid

Mark Hatle (2):
  useradd.bbclass: Fix build time install issues
  useradd.bbclass: Add ability to select a static uid/gid automatically

 meta/classes/useradd.bbclass         | 247 ++++++++++++++++++++++++++++++++++-
 meta/conf/local.conf.sample.extended |  24 ++++
 2 files changed, 265 insertions(+), 6 deletions(-)

-- 
1.8.1.2.545.g2f19ada


