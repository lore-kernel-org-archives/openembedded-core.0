Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UE4ld-0001MA-C8
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 22:24:08 +0100
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJC00DJ8YITIK81@vms173005.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 14:06:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3FA08200BE; Fri,
	08 Mar 2013 15:06:28 -0500 (EST)
Date: Fri, 08 Mar 2013 15:06:28 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20130308200628.GB15481@denix.org>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 21:24:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 08, 2013 at 03:52:57PM -0300, Otavio Salvador wrote:
> On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> > * the current order has SOC_FAMILY settings, which are generic
> >   settings for a group of devices, overriding the machine specific
> >   settings.  For example:
> >
> >   KERNEL_DEVICETREE_ti33x = "xxxx"
> >   KERNEL_DEVICETREE_beaglebone = "yyyy"
> >
> >   Should yield "yyyy" when building for the beaglebone because
> >   that is a more specific device than ti33x.  However, without this
> >   change the result is that the value is set to "xxxx" meaning the
> >   more generic setting overrides the more specific setting.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> Maybe while on that you could look at supporting xx:yy as SoC family?
> like am37xx:am3715 ?

Did you mean am3517? That's a slightly different variant of am35x/omap35x SoC.

But if you really meant am3715 (as well as am3705, am3725 and am3730), then 
those are variants of am37x SoC, just with some subsystems, like SGX or DSP, 
being absent or present. Having those variants handled by SOC_FAMILY would be 
an overkill. Instead, we've started using MACHINE_FEATURES to distinguish 
between those variants of the same SoC, by checking for "sgx" and/or "dsp" 
flags there and pulling in needed software components accordingly.

-- 
Denys


