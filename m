Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5E04260071
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:27:59 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz11so4618959vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 04:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=b9CRphY7+5h3I5mAz4T2czZeF6W/YKLE7kTTv+h+XtQ=;
	b=W0npkKmuGS0h8kXwUAmNdEZMYW2R0vtFZ3mKa6ktQReNDKEA0UcvmqCV4gk71vcn7C
	rCtr1jedHE5U+N+8cPSJ94dAde7/aE3ewawaJTr+9opbqKPLLpF9I65fY+quo1ScUWav
	12ORJITUtctCGnhz5+z7aMuIQ5QEzyVtISn+v5FrsV5N5eW3aka6fSQvzOo+GQ/pGmWZ
	AmPz6TgWY3Tq8GGQtGwVLFEbELIrrI3knWXdBeIgQu2S/vz8CMMzjR6ic2Pif0PyGa4I
	ap5VmoKJ5LT02VTUlqjajGOx3rxiqV74rvpPVT4HsniPXUgouySwbWYzw1gDi9hPsU0p
	DbSg==
X-Received: by 10.220.73.66 with SMTP id p2mr898235vcj.94.1371727679990; Thu,
	20 Jun 2013 04:27:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 20 Jun 2013 04:27:39 -0700 (PDT)
In-Reply-To: <1371726864.20823.227.camel@ted>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
	<CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
	<1371726864.20823.227.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 12:27:39 +0100
Message-ID: <CAJTo0LY=UNKzDafgo_fTqXrhirJs8F+R9U7TB93DFwHfNbff0A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQntWv/2u+R4QokZPTdahZK2yDRnrouJwUW6BicFBpJ+HNKaIw7hrQDSi6WDPLgIo5ATRwXF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] dbus: move libdbus-1.so* to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 11:28:00 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 12:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I have to admit I'm not happy with the piece by piece approach this is
> taking. We're going to end up with nearly everything moving to
> base_libdir at this rate. If we're going to do this, I want someone to
> come up with a definitive list of what needs to move before any more of
> these merge.

The "fun" is stuff like udev helpers, which can link to whatever they
want. If the hardware is probed before /usr is mounted, they'll fail
to run and the work they should have done won't have happened.

Stock oe-core doesn't ship any interesting helpers, but on my Debian
system there is mtp-probe linking to /usr/lib/libmtp.so, and
udev-configure-printer (CUPS hotplug support) linking to (deep breath)
libcups gnutls avahi kerberos p11-kit.  So, all of those (and their
dependencies) probably have to move to /lib, or you put in the
documentation that printers and cameras can't be attached at boot.

Ross

