Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 15B7672027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 13:24:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 956A4426A60;
	Fri,  9 Jan 2015 14:24:08 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Fri,  9 Jan 2015 14:24:01 +0100
Message-Id: <1420809842-516-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/1] wic: fix extended/logical partition layout
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
X-List-Received-Date: Fri, 09 Jan 2015 13:24:15 -0000

The patch fixes a problem with laying out partitions in wic. The
original code would steal sectors from the last primary partition to
accommodate for EBR. This would originally work in mic, but fails with
wic (reasons discussed further down this email).

The patch removes the sector stealing from the last primary partition,
replacing it with reservation of sectors for EBR before every logical
partition. The reservation is done before the partition is aligned so
that the fs inside the partition starts at desired alignment. The
extended partition is created taking into account the EBR sector
reservation. Since the extended partition is described in MBR and
requires no additional sectors, the EBR from the first logical partition
is accounted for when calculating extended partition size.

The root cause is a fundamental difference in the preparation of disk
image between the original mic code and wic. In mic, the disk image was
created beforehand, mounted via loopback (thus requiring sudo),
partitioned and then the file systems were created. For comparison in
wic, we first create partition images, followed by preparation of a
complete empty disk image file. The partitions (or in fact MBR entries)
are created using parted. Only after this step is complete, the original
partition image files are copied into the disk image using
dd. Discrepancy between the MBR/EBR entries and locations where dd puts
the data to is likely to produce either a faulty image or an unmountable
partitions. Hopefully this list is the last patch fixing sector
stealing.

Maciej Borzecki (1):
  wic: fix extended/logical partition layout

 scripts/lib/wic/utils/partitionedfs.py | 40 ++++++++++++++++------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

--
1.9.3


