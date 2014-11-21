Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75D546B7CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:17:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAL9HHu4011152
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:17:18 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 01:17:17 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 17:17:09 +0800
Message-ID: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH V2 0/6] Avoid overwritting editable files during package updating
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
X-List-Received-Date: Fri, 21 Nov 2014 09:17:18 -0000
Content-Type: text/plain

For example, if updating base-files with a new version of rpm, the file 
/etc/nsswitch.conf which is created by base-files will be substituted by a new file.

This is not what we want since our configuration may be lost after updating. 

A resolution is to revise spec file of rpm and put %config before config files 
like "%config /etc/nsswitch.conf".

Theoretically all editable files should be protected with "%config". But currently 
we only concern about the following packages:
  base-files
  initscripts
  logrotate
  lvm2
  libpam
  nfs-utils

---
 recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb |    2 ++
 recipes-core/base-files/base-files_3.0.14.bb      |    1 +
 recipes-core/initscripts/initscripts_1.0.bb       |    2 ++
 recipes-extended/logrotate/logrotate_3.8.7.bb     |    2 ++
 recipes-extended/pam/libpam_1.1.6.bb              |    6 ++++++
 5 files changed, 13 insertions(+)



