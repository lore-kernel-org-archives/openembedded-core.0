Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1URRJt-0002u0-Kp
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 20:06:49 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1URR31-000T7a-IO>; Sun, 14 Apr 2013 19:49:03 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.80.1)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1URR31-003K87-DE>; Sun, 14 Apr 2013 19:49:03 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1URR30-0005lg-AO
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 19:49:02 +0200
Date: Sun, 14 Apr 2013 19:49:02 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130414174901.GA13492@mi.fu-berlin.de>
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
	<2868224.qKIdN0gebe@helios> <516AC6D3.2030102@communistcode.co.uk>
	<6800403.eSx3nnyBtB@helios>
MIME-Version: 1.0
In-Reply-To: <6800403.eSx3nnyBtB@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH] qemu: define fdt_t types in libfdt_env.h from qemu
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
X-List-Received-Date: Sun, 14 Apr 2013 18:06:49 -0000
X-List-Received-Date: Sun, 14 Apr 2013 18:06:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 14, 2013 at 04:25:30PM +0100, Paul Eggleton wrote:
> FWIW, the reason I asked is not because I think the fix is wrong, but to try to 
> determine - given that I couldn't reproduce the issue and the lack of 
> information about what might cause it given in the patch header - whether this 
> fix ought to be merged into the dylan branch immediately or not.
> 
> Cheers,
> Paul

Hi Paul,

okay now I see the problem, why you do not see the problem.

meta-beagleboard overrides dtc/libdtc for the latest git version.

dtc changed the following 3 headers

libenv_fdt.h
fdt.h
libfdt.h

to typedef fdt16_t, fdt32_t and fdt64_t. The typedef happens in libenv_fdt.h.
Now qemu ships its own version of libenv_fdt.h, which does not have the typedefs.

The right solution would have been letting meta-beagleboard append the patch for qemu.

On the other hand the typedefs now in qemu's version of libenv_fdt.h does not
hurt something and Richard already applied it.

Bye Henning


