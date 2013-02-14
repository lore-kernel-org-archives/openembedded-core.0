Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5yqJ-00075N-Tg for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 14:27:21 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5yan-0005wW-0n; Thu, 14 Feb 2013 14:11:13 +0100
Message-ID: <1360847436.4246.122.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 14 Feb 2013 13:10:36 +0000
In-Reply-To: <511CDA28.5040504@mlbassoc.com>
References: <511CDA28.5040504@mlbassoc.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What do these warnings mean?
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
X-List-Received-Date: Thu, 14 Feb 2013 13:27:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-14 at 05:35 -0700, Gary Thomas wrote:
> WARNING: QA Issue: ELF binary 
> '/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/gst-plugins-bad/0.10.23-r3.ti1.6.4.3/packages-split/gst-plugins-bad-vp8/usr/lib/gstreamer-0.10/libgstvp8.so' 
> has relocations in .text
> WARNING: QA Issue: ELF binary '/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/libav/0.8.3-r0/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has 
> relocations in .text
> 
> Exactly what do these mean?  What do I do to get rid of them?

Generally they mean that some non-PIC code has leaked into a shared
library.  The most common way for that to happen is for a DSO final link
to accidentally pull in some members from a static library.  There are a
few other possible causes as well, mostly toolchain bugs or limitations
(you used to get this under some circumstances when enabling full unwind
tables on MIPS for example), but non-PIC code is the most likely one.

You can use readelf or objdump to inspect the relocation table for the
files in question.  In most cases there is a fairly obvious culprit,
e.g. an R_ARM_PC24 reloc with an incriminating function name. 

Having relocations in .text is undesirable because it wastes memory and
slows down program startup.  They can occasionally cause more severe
problems: for example, if were using SELinux then you might find that
your security policy didn't allow those binaries to be run at all.
(This was the default policy on Fedora for a while; I've no idea if it
still is.)

p.




