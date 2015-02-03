Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 703A76E635
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 12:49:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 03 Feb 2015 04:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,512,1418112000"; d="scan'208";a="672007767"
Received: from mtbauma1-mobl1.amr.corp.intel.com (HELO [10.252.136.235])
	([10.252.136.235])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 04:49:54 -0800
Message-ID: <1422967794.18649.1.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Tue, 03 Feb 2015 06:49:54 -0600
In-Reply-To: <20150203100536.GA3972@localhost.localdomain>
References: <1420809842-516-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420809842-516-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<20150202073734.GB3594@localhost.localdomain>
	<1422887389.9587.13.camel@picadillo>
	<20150203100536.GA3972@localhost.localdomain>
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wic: fix extended/logical partition layout
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
X-List-Received-Date: Tue, 03 Feb 2015 12:49:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-02-03 at 11:05 +0100, Maciej Borzecki wrote:
> On 02/02 08:29, Tom Zanussi wrote:
> > On Mon, 2015-02-02 at 08:37 +0100, Maciej Borzecki wrote:
> > > ping
> > >
> >
> > This looks reasonable, but I haven't been able to verify it due to wic
> > problems introduced by the recent kernel changes in oe-core.
> >
> > If you have test cases e.g. the kickstart file(s) that you used for
> > testing the fix, please include them.  Also, any testing you may have
> > done to show it doesn't cause regressions in existing use cases.
> 
> Kickstart that fails without the patch:
> 
> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
> part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 4
> part /var/lib/misc --ondisk mmcblk0 --fstype=ext4 --label misc --size 128
> part /mnt --ondisk mmcblk0 --fstype=ext4 --label fakedata --size 128
> 
> When mounting kernel ext4 complains about bad geometry of the 3rd
> partition (i.e. ext4 partition image was exactly 131072 blocks, but
> parted entry states 131071 blocks, wic stole the last sector of this
> partition, to account for EBR for the first extended):
> 
> EXT4-fs (mmcblk0p3): bad geometry: block count 131072 exceeds size of
> device (131071 blocks)
> 
> Then the first extended partition is not found, logical partition
> /dev/mmcblk0p4 is the last one visible. I'm guessing the EBR was
> overwritten by the last block of the 3rd partition image, hence the
> kerel cannot figure out the location of the extended partition.
> 
> The problem won't be triggered unless there is a logical parition in
> kickstart. The only other kickstart using MBR is directdisk.wks, but it
> has only 2 partitions defined there.
> 
> With the patch you can go on and define more crazy layout like this one
> below and it mounts properly:
> 
> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16
> part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 4
> part /var/lib/misc --ondisk mmcblk0 --fstype=ext4 --label misc --size 128
> part /mnt --ondisk mmcblk0 --fstype=ext4 --label fakedata --size 128
> part /mnt2 --ondisk mmcblk0 --fstype=ext4 --label fakedata2 --size 13
> part /mnt3 --ondisk mmcblk0 --fstype=ext4 --label fakedata3 --size 64
> 
> 

Great, thanks for the detailed info.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> --
> Maciej Borzęcki
> Senior Software Developer at Open-RnD Sp. z o.o., Poland
> www.open-rnd.pl
> mobile: +48 889 117 365, fax: +48 42 657 9079
> 
> 
> Niniejsza wiadomość wraz z załącznikami może
> zawierać chronione prawem lub poufne informacje i została
> wysłana wyłącznie do wiadomości i użytku osób, do których
> została zaadresowana. Jeśli wiadomość została otrzymana
> przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
> trzecich. W takim przypadku uprasza się o natychmiastowe
> zniszczenie wiadomości oraz poinformowanie nadawcy o
> zaistniałej sytuacji za pomocą wiadomości zwrotnej.
> Dziękujemy.
> 
> This message, including any attachments hereto,
> may contain privileged or confidential information and is sent
> solely for the attention and use of the intended addressee(s).
> If you are not an intended addressee, you may neither use this
> message nor copy or deliver it to anyone. In such case, you
> should immediately destroy this message and kindly notify the
> sender by reply email. Thank you.



