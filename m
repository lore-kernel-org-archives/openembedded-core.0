Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3E65674884
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 09:13:59 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3D97A5C17F2;
	Wed, 16 May 2018 11:13:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526462039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=xG5r0JSa8qgxxRHI9MmX1oeqF18+oALVIZQgvtfDbbA=;
	b=wMQvlag0cenfJ3sVviafRySC8xvDAC6ZdbU5jDiPWDgW+uGs809Be52D9aOD3PJQW4JB8H
	N9vBS1UK/VAwPUBRspQjOZ9FOoM1GcZ21wtwTmXfK2OaAbMQE2Opibpn/vzIpK1VgyJKTl
	O/s+vx5cL7xufzJRpOJTipooiTbZbes=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org, alexander.kanavin@linux.intel.com
Date: Wed, 16 May 2018 11:13:49 +0200
Message-Id: <20180516091352.29279-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
X-Spamd-Result: default: False [-1.93 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	BAYES_HAM(-2.83)[99.27%]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	MID_CONTAINS_FROM(1.00)[];
	ASN(0.00)[asn:6830, ipnet:46.140.0.0/17, country:AT];
	RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 0/3] postinst fixes for opgk/dpkg
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
X-List-Received-Date: Wed, 16 May 2018 09:14:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Hi,

This follows up on the discussion a while ago:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg104996.html

Patch 1 is rather simple and really fixes the main issue. The patch
by itself has been tested with the relevant self test and passes.

Patch 2/3 get rid of /etc/*-postinsts script in cases where the package
management is present. This avoids a bunch of unnecessary scripts to be
present on the rootfs. It also avoids the systemd service to be present
forever with in case no postinst scripts have been deployed:
Condition: start condition failed at Tue 2018-05-15 10:57:43 UTC; 42s ago
           └─ ConditionPathExistsGlob=/etc/*-postinsts was not met

Self test executed using:
$ oe-selftest --run-tests runtime_test.Postinst.test_postinst_rootfs_and_boot

Changes since v1:
- Note that patches are specific for opkg/dpkg

Stefan Agner (3):
  opkg: avoid running postinst scripts twice when using systemd
  run-postinsts: for dpkg/opkg, do not rely on /etc/*-postinsts
  rootfs.py: for dpkg/opkg, don't install postinsts if package
    management is present

 meta/lib/oe/rootfs.py                               |  3 +++
 .../opkg/opkg/opkg-configure.service                | 17 -----------------
 meta/recipes-devtools/opkg/opkg_0.3.6.bb            | 14 --------------
 .../run-postinsts/run-postinsts/run-postinsts       | 21 ++++++++++++---------
 .../run-postinsts/run-postinsts.service             |  1 -
 5 files changed, 15 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/opkg-configure.service

-- 
2.13.6


