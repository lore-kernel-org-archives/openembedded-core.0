Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1218 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jun 2016 09:21:18 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD5060589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:21:18 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u5K90swZ010533
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 11:00:55 +0200
Received: from [139.16.77.141] (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u5K90swD020494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 11:00:54 +0200
To: openembedded-core@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <924accb8-02c7-4a8f-81db-eb4a173bbc3e@siemens.com>
Date: Mon, 20 Jun 2016 11:00:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: Problematic IMAGE_FEATURES combination for core-image
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
X-List-Received-Date: Mon, 20 Jun 2016 09:21:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello

It tried to build an image deived from core-image-minimal-dev with the following image features:

IMAGE_FEATURES += "ssh-server-dropbear eclipse-debug dev-pkgs"

But it seems like this combination is not possible as the do_rootfs task fails with the following message:

ERROR: core-image-minimal-dev-1.0-r0 do_rootfs:

Collected errors:
 
 * check_conflicts_for: The following packages conflict with openssh:
 
 * check_conflicts_for:         dropbear *
 
 * opkg_install: Cannot install package openssh-dev.
 
tetime.
 
 
ERROR: core-image-minimal-dev-1.0-r0 do_rootfs: Function failed: do_rootfs


As far as I understand the problem is the following:

1. ssh-server-dropbear installs dropbear on the target
2. eclipse-debug installs openssh-sftp-server to make dropbear support sftp
3. dev-pkgs installs the dev packages, which causes openssh to be installed as well
This then leads to a conflict between openssh and dropbear causing the above error message.

Is the above image feature combination supported? If yes what is the correct way to do this?

Regards
Pascal


