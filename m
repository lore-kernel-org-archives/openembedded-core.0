Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 27A28731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:30:37 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3phJhs4fT0z3hjJt;
	Thu, 14 Jan 2016 22:30:37 +0100 (CET)
X-Auth-Info: BGHrTF1LX1PMlRaRS0qJkttzqLuAwR83pNhiOEaxXZI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3phJhs1X44zvdWt; 
	Thu, 14 Jan 2016 22:30:37 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 14 Jan 2016 22:15:19 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<20160113220943.GS3359@bill-the-cat>
	<CAP9ODKrwXxORtat0pP_J3MgQ2CkfYrBMuGPCnAynEM__xZmjnw@mail.gmail.com>
In-Reply-To: <CAP9ODKrwXxORtat0pP_J3MgQ2CkfYrBMuGPCnAynEM__xZmjnw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601142215.19475.marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 21:30:40 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, January 14, 2016 at 09:43:24 PM, Otavio Salvador wrote:
> On Wed, Jan 13, 2016 at 8:09 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Wed, Jan 13, 2016 at 01:55:56PM -0200, Otavio Salvador wrote:
> >> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
> >> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
> >> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
> >> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
> >> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
> >> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
> >> >> >> > 
> >> >> >> > Repair configuration of U-Boot during build. It is no longer
> >> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
> >> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
> >> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
> >> >> >> 
> >> >> >> Please drop this config suffix, from u-boot.inc. The config value
> >> >> >> should be used as is and the respective BSP ought to be fixed to
> >> >> >> change _config to _defconfig.
> >> >> > 
> >> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in
> >> >> > my machine file, it will call "make machine", which no longer
> >> >> > works.
> >> >> 
> >> >> I know and the right fix is to use the right value to UBOOT_MACHINE
> >> >> as we do for KERNEL_DEVICETREE.
> >> > 
> >> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This
> >> > does not sound right at all.
> >> > 
> >> > And what is the right value of UBOOT_CONFIG then ?
> >> 
> >> foo_defconfig.
> >> 
> >> This is what we pass for make to configure the board and should be the
> >> given value.
> >> 
> >> As we does for device tree, where we pass for KERNEL_DEVICETREE:
> >> 
> >> foo-bar.dtb
> >> 
> >> and this is also given for the make, for the kernel.
> > 
> > This is not the same thing in my view.  In the kernel you're also
> > getting that as the output file.
> > 
> > What we should do, and I've wanted to do for ages but always never get
> > around to it is:
> > 
> > do_configure() {
> > 
> >         oe_runmake ${UBOOT_MACHINE}_config
> > 
> > }
> > 
> > do_compile() {
> > 
> >         oe_runmake
> > 
> > }
> > 
> > As _config has worked for forever.  And modify the above as-needed for
> > the env recipes and so forth.
> 
> Any change like this need to be proposed as another patch; please
> split this patch in upgrade and logic change. So we review and test
> them separated.

The change would be more involved, because the u-boot build scripts are 
seriously misdesigned and for example somehow expect that you can invoke 
do_compile() and expect it to produce multiple u-boot binaries for different 
configurations.

Taking a look at u-boot.inc and uboot-config.bbclass makes me wonder how all 
that could work at all. It's either a stackpile of legacy cruft or just poor 
design.

Best regards,
Marek Vasut

