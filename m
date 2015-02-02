Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DBD1F606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 14:29:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2015 06:26:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,507,1418112000"; d="scan'208";a="521330367"
Received: from mtan35-mobl.amr.corp.intel.com (HELO [10.252.203.51])
	([10.252.203.51])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2015 06:22:18 -0800
Message-ID: <1422887389.9587.13.camel@picadillo>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Mon, 02 Feb 2015 08:29:49 -0600
In-Reply-To: <20150202073734.GB3594@localhost.localdomain>
References: <1420809842-516-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420809842-516-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<20150202073734.GB3594@localhost.localdomain>
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
X-List-Received-Date: Mon, 02 Feb 2015 14:29:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-02-02 at 08:37 +0100, Maciej Borzecki wrote:
> ping
> 

This looks reasonable, but I haven't been able to verify it due to wic
problems introduced by the recent kernel changes in oe-core.

If you have test cases e.g. the kickstart file(s) that you used for
testing the fix, please include them.  Also, any testing you may have
done to show it doesn't cause regressions in existing use cases.

Thanks,

Tom

> On 01/09 14:24, Maciej Borzecki wrote:
> > The patch fixes an issue in laying out extended and logical partitions
> > by wic. The original code produced disk images in which the size 3rd
> > partition as described in MBR was incorrect. Depending on the type of
> > file system used for that partition and size of the partition, it would
> > be impossible to mount the partition correctly. For instance, kickstart
> > file in which the 3rd partition had size of 1GB and used ext4 fs, would
> > result in an image with an umountable partition. The root cause is
> > reservation of sectors for EBR through stealing of last sector from the
> > last primary partition.
> >
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > ---
> >  scripts/lib/wic/utils/partitionedfs.py | 40 ++++++++++++++++------------------
> >  1 file changed, 19 insertions(+), 21 deletions(-)
> >
> > diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> > index fb95cc7..9df93dc 100644
> > --- a/scripts/lib/wic/utils/partitionedfs.py
> > +++ b/scripts/lib/wic/utils/partitionedfs.py
> > @@ -156,6 +156,13 @@ class Image:
> >                  # Skip one sector required for the partitioning scheme overhead
> >                  d['offset'] += overhead
> >
> > +            elif d['numpart'] > 3:
> > +                # Reserve a sector for EBR for every logical partition
> > +                # before alignment is performed.
> > +                if ptable_format == "msdos":
> > +                    d['offset'] += 1
> > +
> > +
> >              if p['align']:
> >                  # If not first partition and we do have alignment set we need
> >                  # to align the partition.
> > @@ -185,14 +192,6 @@ class Image:
> >              p['num'] = d['numpart']
> >
> >              if d['ptable_format'] == "msdos":
> > -                if d['numpart'] > 2:
> > -                    # Every logical partition requires an additional sector for
> > -                    # the EBR, so steal the last sector from the end of each
> > -                    # partition starting from the 3rd one for the EBR. This
> > -                    # will make sure the logical partitions are aligned
> > -                    # correctly.
> > -                    p['size'] -= 1
> > -
> >                  if d['numpart'] > 3:
> >                      p['type'] = 'logical'
> >                      p['num'] = d['numpart'] + 1
> > @@ -259,13 +258,20 @@ class Image:
> >          for p in self.partitions:
> >              d = self.disks[p['disk_name']]
> >              if d['ptable_format'] == "msdos" and p['num'] == 5:
> > -                # The last sector of the 3rd partition was reserved for the EBR
> > -                # of the first _logical_ partition. This is why the extended
> > -                # partition should start one sector before the first logical
> > -                # partition.
> > +                # Create an extended partition (note: extended
> > +                # partition is described in MBR and contains all
> > +                # logical partitions). The logical partitions save a
> > +                # sector for an EBR just before the start of a
> > +                # partition. The extended partition must start one
> > +                # sector before the start of the first logical
> > +                # partition. This way the first EBR is inside of the
> > +                # extended partition. Since the extended partitions
> > +                # starts a sector before the first logical partition,
> > +                # add a sector at the back, so that there is enough
> > +                # room for all logical partitions.
> >                  self.__create_partition(d['disk'].device, "extended",
> >                                          None, p['start'] - 1,
> > -                                        d['offset'] - p['start'])
> > +                                        d['offset'] - p['start'] + 1)
> >
> >              if p['fstype'] == "swap":
> >                  parted_fs_type = "linux-swap"
> > @@ -338,14 +344,6 @@ class Image:
> >
> >          for p in self.partitions:
> >              d = self.disks[p['disk_name']]
> > -            if d['ptable_format'] == "msdos" and p['num'] == 5:
> > -                # The last sector of the 3rd partition was reserved for the EBR
> > -                # of the first _logical_ partition. This is why the extended
> > -                # partition should start one sector before the first logical
> > -                # partition.
> > -                self.__write_partition(p['num'], p['source_file'],
> > -                                       p['start'] - 1,
> > -                                       d['offset'] - p['start'])
> >
> >              self.__write_partition(p['num'], p['source_file'],
> >                                     p['start'], p['size'])
> > --
> > 1.9.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
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



