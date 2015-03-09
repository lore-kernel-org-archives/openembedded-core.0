Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3B67393A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:08:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Mar 2015 09:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,368,1422950400"; d="scan'208";a="662587953"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.143])
	([10.218.99.143])
	by orsmga001.jf.intel.com with ESMTP; 09 Mar 2015 09:08:22 -0700
Message-ID: <1425917294.2831.23.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 09 Mar 2015 13:08:14 -0300
In-Reply-To: <2E350014-ECBF-4D57-AA63-76D63219611C@gmail.com>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
	<20150305142802.GA6833@ad.chargestorm.se>
	<1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
	<20150306082330.GA14309@ad.chargestorm.se>
	<1425650611.2831.20.camel@bottazzini-ThinkPad-T430>
	<CAMKF1sp4pDdt_rS223_YqmeyB0yAVFkafR7tnuq3uztm9vV56Q@mail.gmail.com>
	<1425908226.2831.22.camel@bottazzini-ThinkPad-T430>
	<2E350014-ECBF-4D57-AA63-76D63219611C@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Mon, 09 Mar 2015 16:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Seg, 2015-03-09 at 08:32 -0700, Khem Raj wrote:
> > On Mar 9, 2015, at 6:37 AM, Bottazzini, Bruno <bruno.bottazzini@intel.com> wrote:
> > 
> > On Sex, 2015-03-06 at 14:51 -0800, Khem Raj wrote:
> >> On Fri, Mar 6, 2015 at 6:03 AM, Bottazzini, Bruno
> >> <bruno.bottazzini@intel.com> wrote:
> >>> On Sex, 2015-03-06 at 09:23 +0100, Anders Darander wrote:
> >>>> * Bottazzini, Bruno <bruno.bottazzini@intel.com> [150305 17:15]:
> >>>> 
> >>>>> On Qui, 2015-03-05 at 15:28 +0100, Anders Darander wrote:
> >>>> 
> >>>>>> Just a quick question before I look into the patch in more detail.
> >>>> 
> >>>>>> Is the new setting of PACKAGECONFIG consistent with how systemd was
> >>>>>> built previously? I guess it is.
> >>>> 
> >>>>> Hi Anders,
> >>>> 
> >>>>> it is consistent with how systemd was built previously. If you apply the
> >>>>> patch and bitbake it. Systemd will be built and shipped normally.
> >>>> 
> >>>>> But now it will give some options on how to customize it by excluding
> >>>>> packages you don't want to be with systemd.
> >>>> 
> >>>> Nice, I'm really liking this! That's something I've planned on doing
> >>>> myself for a while.
> >>>> 
> >>>>>> Another comment, you should remove the dependcies that gets added using
> >>>>>> PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
> >>>>>> nevertheless?)
> >>>> 
> >>>>> You mean I should do the following ?
> >>>>> - PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
> >>>>> + PACKAGECONFIG[acl] = "--enable-acl,--disable-acl"
> >>>> 
> >>>> No, I  meant to remove them from the long
> >>>> DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> >>>> line. (Unless I overlooked that part in your patch?)
> >>>> 
> >>>>> If I get what you said correctly, yes they are required.
> >>>> 
> >>>> What I meant, was thas unless e.g. acl is required even when building
> >>>> with --disable-acl, it's better to add the acl dependency in the
> >>>> PACKAGECONFIG like you to. Though, at the same time, remove acl from the
> >>>> long DEPENDS-line. (As otherwise we'll build acl anyway).
> >>> 
> >>> Anders,
> >>> 
> >>> You are right.
> >>> 
> >>> It is not needed to specify the libs on depends.
> >>> 
> >>> I have removed it and as soon as we review the whole patch I will send a
> >>> new version with this corrected
> >>> 
> >> 
> >> On top of all this 'acl' is a distro feature so that should be
> >> accounted for too.
> > 
> > Hello Khem,
> > 
> > It will be accounted when acl flag is enabled on systemd.
> > 
> 
> 
> I am saying enabling this packagconfig should depend upon distro features something like
> PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', ‘acl', ‘acl', '', d)}

Alright, I got what you said and it looks good to me.

Next version will have it.

> 
> > Best Regards,
> > 
> > 
> > 
> > 
> > 
> 



