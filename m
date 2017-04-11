Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 05C3877C9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BHP2XX012219; 
	Tue, 11 Apr 2017 18:25:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7C2TMtjMhpAy; Tue, 11 Apr 2017 18:25:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BHGRiL011638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 18:16:28 +0100
Message-ID: <1491930987.12091.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Jussi Kukkonen
	<jussi.kukkonen@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 18:16:27 +0100
In-Reply-To: <8f6fdae166cb44babe9c975f584df839@XBOX02.axis.com>
References: <cover.1491920909.git.jussi.kukkonen@intel.com>
	<ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
	<8f6fdae166cb44babe9c975f584df839@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv3 1/1] native/nativesdk: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 17:25:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 15:32 +0000, Peter Kjellerstedt wrote:
> > 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Jussi Kukkonen
> > Sent: den 11 april 2017 16:36
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCHv3 1/1] native/nativesdk: Use fixed
> > DISTRO_FEATURES
> > 
> > There seems to be little advantage to letting distro features
> > affect
> > native builds. There is a significant disadvantage: a change to
> > DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In
> > a
> > test like this:
> >   $ bitbake core-image-minimal
> >   # append " systemd" to DISTRO_FEATURES
> >   $ bitbake core-image-minimal
> > The latter build takes 44 minutes (28%) of cpu-time less with this
> > patch (skipping 135 native tasks). Sadly wall clock time was not
> > affected as glibc remains the bottleneck.
> > 
> > Set native distro features to DISTRO_FEATURES_NATIVE appended with
> > an intersection of DISTRO_FEATURES and
> > DISTRO_FEATURES_FILTER_NATIVE.
> > Current default values (baitbake.conf) are
> > * DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation" (as gtk-doc-
> > native
> > has much less dependencies when built without it)
> > * DISTRO_FEATURES_NATIVE ?= "x11" (to enable native UIs even if
> > target
> > does not containe them)
> > 
> > Do the variable setting in native_virtclass_handler() because
> > otherwise
> > it could still be overridden by appends and the feature
> > backfilling.
> > Shuffle the early returns so DISTRO_FEATURES gets set as long as
> > the packagename ends with "-native".
> > 
> > Add similar variables for nativesdk.
> > 
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >  meta/classes/native.bbclass    | 14 ++++++++++----
> >  meta/classes/nativesdk.bbclass |  6 ++++++
> >  meta/conf/bitbake.conf         |  9 +++++++++
> >  3 files changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/native.bbclass
> > b/meta/classes/native.bbclass
> > index 1919fbc..aec1087 100644
> > --- a/meta/classes/native.bbclass
> > +++ b/meta/classes/native.bbclass
> > @@ -121,14 +121,20 @@ PATH_prepend = "${COREBASE}/scripts/native-
> > intercept:"
> >  SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
> > 
> >  python native_virtclass_handler () {
> > -    classextend = e.data.getVar('BBCLASSEXTEND') or ""
> > -    if "native" not in classextend:
> > -        return
> > -
> >      pn = e.data.getVar("PN")
> >      if not pn.endswith("-native"):
> >          return
> > 
> > +    # Set features here to prevent appends and distro features
> > backfill
> > +    # from modifying native distro features
> > +    features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
> > +    filtered = set(bb.utils.filter("DISTRO_FEATURES",
> > d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
> > +    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
> You should sort the list of features to make it deterministic.

Do we sort DISTRO_FEATURES anywhere else?

I thought we only accessed DISTRO_FEATURES with functions which have
support in bitbake (contains/filter) which means that should be
unnecessary?

Cheers,

Richard



