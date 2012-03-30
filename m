Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDby2-0004It-3l for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 15:34:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UDPBjO013435
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:25:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12907-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:25:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UDP0L4013416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 14:25:01 +0100
Message-ID: <1333113898.18082.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 14:24:58 +0100
In-Reply-To: <4F69E9A1.2080505@windriver.com>
References: <cover.1332318835.git.liezhi.yang@windriver.com>
	<89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
	<1332333371.9740.150.camel@ted> <4F69E9A1.2080505@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 13:34:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 22:45 +0800, Robert Yang wrote:
> Hi Richard,
> 
> Please see my comments inline ...
> 
> On 03/21/2012 08:36 PM, Richard Purdie wrote:
> > On Wed, 2012-03-21 at 16:38 +0800, Robert Yang wrote:
> >> Remove the do_configure_prepend which is used for removing
> >> ${S}/m4/lib-link.m4 to compile under libtool 2.2.2, but our libtool has
> >> been upgraded to 2.4.2, and:
> >>
> >> for the 3 recipes:
> >>      gst-plugins-bad_0.10.22.bb
> >>      gst-plugins-base_0.10.35.bb
> >>      gst-plugins-good_0.10.30.bb
> >>
> >> They don't have m4/lib-link.m4 any more.
> >>
> >> For the gst-plugins-ugly_0.10.18.bb, though it has m4/lib-link.m4, our
> >> libtool version is now 2.4.2, so we can remove the do_configure_prepend
> >> from all of them.
> >>
> >> [YOCTO #2148]
> >>
> >> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> >> ---
> >>   .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
> >>   .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
> >>   .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
> >>   .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
> >>   4 files changed, 4 insertions(+), 24 deletions(-)
> >
> > Not so easy I'm afraid. We need to ensure our libtool is being used.
> > Even if the version matches, our libtool is patched to ensure the
> > sysroot and rpaths work correctly. I'm therefore a little nervous about
> > removing these at this point.
> >
> 
> Yes, I agree with you, though I checked the log.do_configure and log.do_compile, 
> it used our libtool. The safe way maybe just remove the
> do_configure_prepend from gst-plugins-bad, gst-plugins-base and
> gst-plugins-good since they don't have the ${S}/m4/lib-link.m4 any more.
> 
> For gst-plugins-ugly, we can remove when it would not have ${S}/m4/lib-link.m4.
> 
> I noticed this because there was error when build gst-plugins-base/bad/good:
> 
> rm: cannot remove `/path/to/m4/lib-link.m4': No such file or directory.
> 
> Here is an updated patch and pull request which only removes
> do_configure_prepend for gst-plugins-base/bad/good:
> (I'm not sure whether send a V2 is preferred or not for such case).
> 
> git://git.pokylinux.org/poky-contrib robert/gst_v2
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gst_v2
> 
> Subject: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
> 
> Remove the do_configure_prepend which is used for removing
> ${S}/m4/lib-link.m4, but the 3 recipes don't have m4/lib-link.m4 any
> more:
>      gst-plugins-bad_0.10.22.bb
>      gst-plugins-base_0.10.35.bb
>      gst-plugins-good_0.10.30.bb

For what its worth, I just looked at the tarballs for these and the .m4
files are still there in the two I checked. This patch is therefore not
right in its current form.

Cheers,

Richard



