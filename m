Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D25C607AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 16:44:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBAGigUk023915
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 08:44:43 -0800
Received: from yow-kscherer-d1.wrs.com (128.224.56.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 10 Dec 2015 08:44:42 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 11:44:40 -0500
Message-ID: <1449765882-15910-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 2.6.3
MIME-Version: 1.0
Subject: Support GPG_PATH when exporting gpg keys
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
X-List-Received-Date: Thu, 10 Dec 2015 16:44:45 -0000
Content-Type: text/plain

Summary: Fix exporting of gpg keys when using a temporary keyring

When I tried to sign rpms and feeds using a gpg key on a temporary
keyring, I got a build failure in os-release.bb due to missing
exported keys. I traced the failure back to signing-keys.bb. Even
though the task had logged successful completion, when I tried to run
bitbake -c do_export_public_keys signing-keys I found two problems:
missing sysroot path and no GPG_PATH support.

