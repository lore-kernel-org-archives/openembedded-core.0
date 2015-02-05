Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id BD3F660169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 08:36:15 +0000 (UTC)
Received: from localhost (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 3122043ED4D;
	Thu,  5 Feb 2015 09:36:14 +0100 (CET)
Date: Thu, 5 Feb 2015 09:36:13 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150205083613.GB3628@localhost.localdomain>
References: <1423090155-14149-1-git-send-email-alexandre.belloni@free-electrons.com>
	<1423091895.18649.26.camel@picadillo>
	<20150204233918.GC4443@piout.net>
MIME-Version: 1.0
In-Reply-To: <20150204233918.GC4443@piout.net>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: bootimg-partition: Stop removing whole workdir
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
X-List-Received-Date: Thu, 05 Feb 2015 08:36:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/05 00:39, Alexandre Belloni wrote:
> On 04/02/2015 at 17:18:15 -0600, Tom Zanussi wrote :
> > On Wed, 2015-02-04 at 23:49 +0100, Alexandre Belloni wrote:
> > > Stop removing the whole working directory as this is also removing
> > > eventual previously created partition images, leading to image creation
> > > failures.
> > >
> >
> > I'm surprised - I've never run into a problem like this.  Can you give
> > more details and/or a reproducer?
> >
>
> Sure, something like that in your wks will fail:
> part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4
> part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
>
> The error being:
> Error: exec_cmd: dd if=/var/tmp/wic/build/rootfs_root.ext4
> of=/var/tmp/wic/build/test-201502050034-mmcblk.direct bs=512 seek=8
> count=294174 conv=notrunc returned '1' instead of 0
>
> Using bootimg-partition anywhere but in the first position will fail
> because the previously generated fs images (in my example
> rootfs_root.ext4) will be removed.
>

Acked-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>

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

