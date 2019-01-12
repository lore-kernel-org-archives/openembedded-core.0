Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 07BEB7BE41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:11:58 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id x85-v6so15057027ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=/sklKk1ebAZkyB+6XwumWGnrGqIYpMhL6g7OJor45Ho=;
	b=AY79H244z0SXKseRED2IhNqSmteRLs7mIQ85TwNCx98Jj04PwxYL4mTmROFwlb50qC
	8yynzPQDRwI1yS2iAgwUyJK8CxxmL8OKtw+iAh8XH4YpLrwKrmJnWdbXoeOixHfMBd+Z
	bvdGk5A6VeoNpU0Ps6Sal2aIV6WngdvvVkmcTcvX//mgiUCqVR/9BzZRG9sN59v0UKgr
	YH4OfrFQ8JID18PAqmZBI3ZY5LavqvindUc27uisg0OYPEvjFCtiywOWSb48skeC9qGn
	tLcllVSN+5rBmrMyv32oYSWCp2Gp/Ep3oKlCtq7UO9AwIvruCG64DA7XmMciHkoJ85aK
	aPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/sklKk1ebAZkyB+6XwumWGnrGqIYpMhL6g7OJor45Ho=;
	b=B4bkl/UU0nCAj8uV/mYrlKwIIpZ94QhybHP8/9NlK5hv1VWMg+wkZn57Qbwp19l0Dz
	cOtK6kuSf6PeG6su1eO8GdP3OaiAbJ43ortO9+TRcaoQ4j0FH5jzaSJHXaqAzY5fqyPk
	+xxd4E5UTH+vjtXT2pl4zgUgGtb/MZb64ZkADL/hkLv5bIXj+SmHhyH3VIXVSfoThiyZ
	OuM6+FJzHS3kVbLc7JOFYV8JYRM4SpOJVN6akfwsbJ8dCfwSfOAafb05y3lBiMfUvmp2
	/vl4Jk8eemhtDGcAYGnehbppVrmfTqjXqjYKOEBAXvh5FAINMw9EYHaJtRJYwejNeqvn
	NhlQ==
X-Gm-Message-State: AJcUukckeA7xXd56eHCAAdq34PSYdrOfGtL2Zrup3wGj4yOBG7iFSax8
	VD1DskFO7cfKMFzcEaCJG8vj7VNK
X-Google-Smtp-Source: ALg8bN6OrRx3fA1zcIVUFSsL3vL8z88973lHh5dS+iNv25C3IHFzXM9qc+TolQnjpyI/6RMWj8JHug==
X-Received: by 2002:a2e:9107:: with SMTP id
	m7-v6mr10388084ljg.23.1547287919181; 
	Sat, 12 Jan 2019 02:11:59 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r7-v6sm16282314ljc.10.2019.01.12.02.11.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 02:11:58 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 12:11:51 +0200
Message-Id: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] ppc/native: Fix native builds with PowerPC 32-bit host system
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
X-List-Received-Date: Sat, 12 Jan 2019 10:11:59 -0000

In some specific environments on PowerPC native builds failing due to:

  a) libgpg-error requires TARGET_ARCH tuple mapping to supported tuple
  b) binutils fails to build with --enable-targets=all due to small bss
     and data relocation failures.

To fix a) is trivial: we need to add tuple mapping for TARGET_ARCH=ppc.

Fixing b) isn't simple because with --enable-targets=all binary becomes
too big to support R_PPC_GOT16 relocations against small bss/data. Since
for native builds we only need libbfd, libiberty and libopcodes we can
build only these three archives and their dependencies.

See individual commit message for details on each change presented.

Serhey Popovych (2):
  libgpg-error: Support build for native on ppc host
  binutils: Speed up and fix native builds

 meta/recipes-devtools/binutils/binutils_2.31.bb    | 33 +++++++++++++---------
 .../libgpg-error/libgpg-error_1.33.bb              |  1 +
 2 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.7.4


