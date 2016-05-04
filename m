Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6713F60745
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:17:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2016 15:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,579,1455004800"; d="scan'208";a="968908562"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.24.244])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 15:17:13 -0700
Message-ID: <1462400231.6485.19.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: akuster <akuster@mvista.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 May 2016 23:17:11 +0100
In-Reply-To: <572A0450.10100@mvista.com>
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
	<1462355553.6485.5.camel@linux.intel.com> <572A0450.10100@mvista.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Wed, 04 May 2016 22:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-05-04 at 07:16 -0700, akuster wrote:
> 
> On 05/04/2016 02:52 AM, Joshua G Lock wrote:
> > 
> > Hi Armin,
> > 
> > On Thu, 2016-04-28 at 11:23 -0700, Armin Kuster wrote:
> > > 
> > > From: Armin Kuster <akuster@mvista.com>
> > > 
> > I've been seeing:
> > 
> > "qemu: uncaught target signal 11 (Segmentation fault) - core
> > dumped"
> > 
> > when trying to build gobject-introspection for qemux86 recently and
> > narrowed it down to this change, if I revert this patch the use of
> > qemu-native by gobject-introspection no longer causes a
> > segmentation
> > fault.
> well that is not good. To be clear, this is a build issue not an
> execution issue? I would like to better understand what went wrong to
> tighten up my processes.

It's an execution issue for qemu-native, the segmentation error occurs
when trying to build gobject-introspection (which calls qemu-native).

I didn't try calling qemu-native any other way (runqemu, etc) to see
whether it was something specific to the way gobject-introspection
calls qemu.

> > 
> > 
> > Are we missing some related patches for this CVE fix? 
> The only commit identified for is the on this patch came from.
> 
> I haven't dug
> > 
> > into the details, but noticed that Fedora's CVE-2016-2857
> > diffstat[1]
> > is much larger than ours[2].
> The Fedora change includes several other CVE fixes
> +# CVE-2016-2538: Integer overflow in usb module (bz #1305815)
> +Patch0103: 0103-usb-check-RNDIS-message-length.patch
> +Patch0104: 0104-usb-check-RNDIS-buffer-offsets-length.patch
> +# CVE-2016-2841: ne2000: infinite loop (bz #1304047)
> +Patch0105: 0105-net-ne2000-check-ring-buffer-control-registers.patch
> +# CVE-2016-2857: net: out of bounds read (bz #1309564)
> +Patch0106: 0106-net-check-packet-payload-length.patch
> +# CVE-2016-2392: usb: null pointer dereference (bz #1307115)
> +Patch0107: 0107-usb-check-USB-configuration-descriptor-object.patch
> +# Fix external snapshot any more after active committing (bz
> #1300209)
> +Patch0108: 0108-block-set-device_list.tqe_prev-to-NULL-on-BDS-
> remova.patch
> 
> which we seem to be missing some as well.

Several (possibly all) of those are in the 2.5.1 upgrade I proposed. 

Regards,

Joshua

