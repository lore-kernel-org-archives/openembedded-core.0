Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2228A605F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 11:18:04 +0000 (UTC)
Received: from localhost (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 0D141443FA9;
	Thu,  5 Feb 2015 12:18:03 +0100 (CET)
Date: Thu, 5 Feb 2015 12:18:03 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150205111803.GE3628@localhost.localdomain>
References: <1423090996-14918-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20150205090226.GC3628@localhost.localdomain>
	<20150205102733.GA22965@piout.net>
MIME-Version: 1.0
In-Reply-To: <20150205102733.GA22965@piout.net>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: allow creation of partitions not in table
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
X-List-Received-Date: Thu, 05 Feb 2015 11:18:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/05 11:27, Alexandre Belloni wrote:
> Hi,
>
> On 05/02/2015 at 10:02:26 +0100, Maciej Borzecki wrote :
> > On 02/05 00:03, Alexandre Belloni wrote:
> > > For some architectures it is necessary to reserve space on disk without
> > > it being present in the partition table.
> > >
> > > For example, u-boot on i.mx is placed at an offset of 1kB on the sdcard.
> > > While it would be possible to create a partition at that offset and
> > > place u-boot there, it would then be necessary to update the default
> > > u-boot environment to use partition 2 on the mmc instead of partition
> > > 1.
> >
> > I'm wondering if reusing parition here is the right choice. How about
> > making this a separate command, since the operation of putting some
> > binary data at a particular location within the image sounds like
> > something very specific to wic.
> >
> > Could name it 'raw-copy', with options --source and --offset. The
> > command would be applied after image assembly is complete. Offset could
> > be expressed in bytes by default (plus k/M/G suffix). Source could
> > either be a 'bootloader', that implies a default bootloader for this
> > target, or a name of a file from $DEPLOY_DIR_IMAGE.
> >
> > Assuming IMAGE_BOOTLOADER='u-boot.img' is set somewhere, the kickstart
> > could look like:
> >
> > part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4 --start 1M
> > raw-copy --source bootloader --offset 1kB
> >
> >
> > If at some point we extend the bootloader command to include the name of
> > bootloader file:
> >
> > part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4 --start 1M
> > bootloader --name u-boot.img
> > raw-copy --source bootloader --offset 1kB
> >
> > What do you think?
> >
>
> I though about that, I actually created a rawcopy plugin to dump file
> into partitions.
>
> The main issue with what you suggest is that you lose the whole
> automatic offset calculations. What if the bootloader is larger than 1M
> in your example? It will overwrite / You also lose the alignment
> calculations unless you add them back in the new class.
>
> Another issue is that you may want to copy multiple files at different
> offsets. For example for am335x:
> SPL at 128k, backup SPL at 256k, u-boot at 384k in a partition, u-boot
> environment in a partition, rootfs.

Booting from eMMC?

>
> This would give something like:
> part SPL --source rawcopy --sourceparams="file=MLO" --ondisk mmcblk --no-table --align 128
> part SPL.backup --source rawcopy --sourceparams="file=MLO" --ondisk mmcblk --no-table --align 128
> part uboot --source rawcopy --sourceparams="file=u-boot.img" --ondisk mmcblk --align 128
> part uboot.env --source rawcopy --sourceparams="file=u-boot.env" --ondisk mmcblk --align 128
> part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
>

It makes sense now, rawcopy plugin is what I have been missing. I'd be
careful with --align though. It would be much more readable to have an
explicit --start or --offset option, but that has been sitting in my
TODO list for quite some time now.

Other than that the patch looks good to me.

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079


Niniejsza wiadomość wraz z załącznikami może
zawierać chronione prawem lub poufne informacje i została
wysłana wyłącznie do wiadomości i użytku osób, do których
została zaadresowana. Jeśli wiadomość została otrzymana
przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o
zaistniałej sytuacji za pomocą wiadomości zwrotnej.
Dziękujemy.

This message, including any attachments hereto,
may contain privileged or confidential information and is sent
solely for the attention and use of the intended addressee(s).
If you are not an intended addressee, you may neither use this
message nor copy or deliver it to anyone. In such case, you
should immediately destroy this message and kindly notify the
sender by reply email. Thank you.

