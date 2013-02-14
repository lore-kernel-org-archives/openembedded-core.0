Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5yRr-0006Yj-EK for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 14:02:00 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ECpxWe008514; Thu, 14 Feb 2013 12:52:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vflseFbDf2qp; Thu, 14 Feb 2013 12:51:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1ECpocl008504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 14 Feb 2013 12:51:53 GMT
Message-ID: <1360845941.11225.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 14 Feb 2013 12:45:41 +0000
In-Reply-To: <511CDA28.5040504@mlbassoc.com>
References: <511CDA28.5040504@mlbassoc.com>
X-Mailer: Evolution 3.6.3-1 
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
X-List-Received-Date: Thu, 14 Feb 2013 13:02:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-14 at 05:35 -0700, Gary Thomas wrote:
> I imported libav from meta-oe into my build so I can have additional
> gstreamer support.  Now I'm seeing these warnings:
> 
> WARNING: QA Issue: ELF binary 
> '/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/gst-plugins-bad/0.10.23-r3.ti1.6.4.3/packages-split/gst-plugins-bad-vp8/usr/lib/gstreamer-0.10/libgstvp8.so' 
> has relocations in .text
> WARNING: QA Issue: ELF binary '/home/local/p82_soft/tmp/work/cortexa9-vfp-neon-amltd-linux-gnueabi/libav/0.8.3-r0/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0' has 
> relocations in .text
> 
> Exactly what do these mean?  What do I do to get rid of them?

It means the linker has to perform relocations on the .text segment at
runtime. This slows down loads and means more memory usage if two
applications use the library since the kernel can't share the mappings.
It will work its just inefficient.

The fix us usually to compile as position independent code using the pic
compiler option.

Cheers,

Richard (far from an expert on this)



