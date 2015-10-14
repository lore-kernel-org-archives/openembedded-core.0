Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D79D073232;
	Wed, 14 Oct 2015 14:42:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Oct 2015 07:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,681,1437462000"; d="scan'208";a="826788994"
Received: from apalani1-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.185])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2015 07:41:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 15:41:55 +0100
Message-ID: <2371185.tThFydMRSC@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <561E67B3.7010304@ni.com>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<20151014141650.GC22448@jama> <561E67B3.7010304@ni.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Wed, 14 Oct 2015 14:42:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 October 2015 17:33:23 Ioan-Adrian Ratiu wrote:
> On 14.10.2015 17:16, Martin Jansa wrote:
> > On Wed, Oct 14, 2015 at 05:06:07PM +0300, Ioan-Adrian Ratiu wrote:
> >> On 13.10.2015 16:08, Martin Jansa wrote:
> >>> On Tue, Oct 13, 2015 at 03:40:20PM +0300, Ioan-Adrian Ratiu wrote:
> >>>> On 13.10.2015 13:53, Martin Jansa wrote:
> >>>>> On Fri, Oct 09, 2015 at 09:58:07AM +0300, Ioan-Adrian Ratiu wrote:
> >>>>>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> >>>>>> ---
> >>>>>> 
> >>>>>>     .../libvncserver/libvncserver_0.9.10.bb               | 19
> >>>>>>     +++++++++++++++++++ 1 file changed, 19 insertions(+)
> >>>>>>     create mode 100644
> >>>>>>     meta-oe/recipes-
graphics/libvncserver/libvncserver_0.9.10.bb>>>>>> 
> >>>>>> diff --git
> >>>>>> a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >>>>>> b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb new
> >>>>>> file mode 100644
> >>>>>> index 0000000..afa303c
> >>>>>> --- /dev/null
> >>>>>> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
> >>>>>> @@ -0,0 +1,19 @@
> >>>>>> +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> >>> 
> >>> Use SUMMARY for such short description.
> >>> 
> >>>>>> +HOMEPAGE = "https://libvnc.github.io"
> >>>>>> +SECTION = "libs"
> >>>>>> +PRIORITY = "optional"
> >>> 
> >>> Drop PRIORITY, we don't use it anywhere.
> >>> 
> >>>>>> +LICENSE = "GPLv2"
> >>>>>> +LIC_FILES_CHKSUM =
> >>>>>> "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> >>>>>> +
> >>>>>> +DEPENDS += "zlib jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> >>>>>> +RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
> >>>>>> +
> >>>>>> +RCONFLICTS_${PN} = "x11vnc"
> >>>>> 
> >>>>> This isn't enough to resolve conflicts with x11vnc in sysroot, this
> >>>>> only
> >>>>> prevent installing both packages in the same image.
> >>>>> 
> >>>>>> +
> >>>>>> +inherit autotools pkgconfig
> >>>>>> +
> >>>>>> +SRC_URI  =
> >>>>>> 
"git://github.com/LibVNC/libvncserver.git;tag=LibVNCServer-0.9.10">>>>> 
> >>>>> Set SRCREV matching with this tag, otherwise bitbake will always use
> >>>>> git
> >>>>> ls-remote to convert tag name to git SHA, which won't work for builds
> >>>>> from premirror (possibly without access to network)
> >>>> 
> >>>> This is easy to fix, however the above x11vnc conflict is not and I
> >>>> have
> >>>> to check with upstream developers which might take awhile.
> >>>> 
> >>>> Is it ok to blacklist libvncserver in patch v3 in order to not break
> >>>> x11vnc until this is solved?
> >>> 
> >>> I don't want to introduce more blacklisted recipes in meta-oe, so this
> >>> won't be merged until it's resolved.
> >> 
> >> Quick question: Fixing this involves adding a PACKAGECONFIG dependency
> >> inside x11vnc on libvncserver. x11vnc is in the openembedded-core layer.
> > 
> > If such PACKAGECONFIG can be disabled by default, then it's ok.
> > 
> >> Should I move libvncserver to oe-core, move x11vnc in meta-oe or should
> >> I just let them reside in separate layers even though there is this
> >> dependency?
> > 
> > oe-core (x11vnc) cannot by default depend on meta-oe (libvncserver), it
> > can be optional dependency, but without looking at the code my guess is
> > that this won't fix the issue.
> > 
> > Is the PACKAGECONFIG about using external libvncserver instead of
> > building own version inside x11vnc recipe? If my guess is right, then
> > oe-core will need to build own and meta-oe will need to remove such
> > PACKAGECONFIG in order to unblock building separate libvncserver.
> > 
> > If that's the case then moving libvncserver to oe-core or x11vnc to
> > meta-oe would be easier way forward.
> 
> Yes, this is correct (x11vnc's configured --with-system-libvncserver)

FWIW assuming it works and isn't specially patched, I think for x11vnc we'd 
probably be better off using an external lib we can keep up-to-date rather than 
a bundled one that might be out-of-date; that is to say, if we are to keep 
x11vnc in OE-Core then we might as well also have libvncserver. (One might 
possibly ask if we really need x11vnc there though, I don't have an answer to 
that).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

