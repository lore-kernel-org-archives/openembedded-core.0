Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UP8kj-0000lF-Qg
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:52:45 +0200
Received: by mail-vb0-f49.google.com with SMTP id 11so3579907vbf.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 02:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=WGSqGXb5FIHwDiFEyvfj0g5weCVdCIKOal9nvhB3TsY=;
	b=oM4tH2f/ht20GIcveQrIBNW5s9Mwtv5Pit7lIUrFhqTAc51M2dcg8JAFmhG6fKIgNE
	lHaaoij0DAAnLf399nAsHBqUXRuwWxVk5iFhKBuCovY+bomINLBUuja5MzgWDL5K1T6N
	HvnzMXpR0wHWJciMsbsIZlVCh9q96NvtDd+aBKcVSYc8CDJtHEvx/S59Tv77mVIdqf2a
	yvT4losTkbqlzO2SvrIy7fLbBZGBsXUKCXK1WqmzXXosnIggQjKa53VUritz7bxdAnX3
	RdmIbf0DjBejB/VS5/gDvevQAWZpv9LKHBQRRUM9pOm385G5YdaQ6eEeLTmnfqTBBqAy
	WuiA==
X-Received: by 10.52.108.10 with SMTP id hg10mr241681vdb.34.1365413723053;
	Mon, 08 Apr 2013 02:35:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 8 Apr 2013 02:35:03 -0700 (PDT)
In-Reply-To: <9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
References: <5162038C.2020706@pseudoterminal.org>
	<9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Apr 2013 10:35:03 +0100
Message-ID: <CAJTo0LbOMz+MninSBv6d8UjeQ3cJMn-WXfq1v5Cqu4npDh+eng@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn4gaQtpGRr1YqD9aZf9nCnmWPvBC3JS6SKrO7mCRKFzAcndFULRhUhwe99kcy2O6n/azhy
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 09:52:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Op 8 apr. 2013, om 01:38 heeft Carlos Rafael Giani
<dv@pseudoterminal.org> het volgende geschreven:
> to start working with GStreamer 1.0 on several embedded platforms, I deci=
ded to
> adapt the existing GStreamer recipes from danny for 1.0. Out of this I cr=
eated a layer,
> which is hosted at https://github.com/dv1/meta-gstreamer1.0 .
>
> I write this RFC, because I figure that GStreamer 1.0 support is already =
on TODO lists
> of several people, and will eventually end up in OE-Core, just like GStre=
amer 0.10 did.

Excellent!  I'd love to see this merged into oe-core as soon as we've
branched for 1.4.

> I built the packages for several platforms (cubox, beagleboard, imx6), an=
d they worked
> well. Since 1.0 has been designed to be able to coexist with 0.10 in the =
same rootfs, I
> changed the naming convention for the packages: they all start with "gstr=
eamer1.0-" .

Perfect.

>> * gstreamer: check_fix.patch (I could not reproduce the documented probl=
em), and gstregistrybin.c/.h (why are these present?)

The binary registry stuff is upstream now I think.

>> * gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure wha=
t this is trying to fix, and this line does not exist in 1.0), and gst-plug=
ins-base-tremor.patch (again, works well without it)

Fine, is there are problems we'll soon find them again. :)

>> I am also considering some kind of autodetection for when yasm and libor=
c are available (for example, because meta-oe was added to bblayers.conf), =
and then switches on Orc and enables yasm in gst-libav. Or better yet, if l=
ibav is available as a recipe, it lets gst-libav use it instead of its inte=
rnal copy. These autodetections would improve performance significantly.

Build-time autodetection has to also be deterministic, i.e. it
examines the MACHINE and layers instead of poking at the sysroot.

So...

On 8 April 2013 08:57, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I've been meaning to ask the same questions, since I need both orc and ex=
ternal libav to make gstreamer  (0.10, but still) useable on my platforms. =
I came up with the following ideas:
>
> 1) Make every external dep a PACKAGECONFIG option in OE-core gstreamer
> 2) Add bbappends with extra PACKAGECONFIG options for gstreamer in the la=
yer that has the external dep
> 3) add bbappens in the DISTRO layer that enables extra external dependenc=
ies.
>
> Angstrom is currently using 3) and I absolutely hate it. 2) is scales a l=
ot better, but apparently is verboten judging from the patches sent that re=
move the qt bbappends that do the same.
> Which leaves 1), which will cause problems for most users, since they wil=
l spot the PACKAGECONFIG options but not bother to read the comments saying=
 they need to enable extra layers.
>
> I favour 1) since that has all the knowledge in a single place, looked af=
ter by the OE gst maintainer (which we don't have yet, but still).

(1) definitely needs to happen in my opinion  I'm not a massive fan of
(2) in general as it leads to stuff changing simply by adding a layer
- you may pull in meta-oe for some other packages but suddenly the
GStreamer package is pulling in more dependencies.  I guess for things
like GStreamer where the dependencies are generally isolated into
separate packages this is less of an issue though.

Ross


