Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CF28B6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 13:53:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2015 06:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,471,1422950400"; d="scan'208";a="546700136"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.143])
	([10.218.99.143])
	by orsmga003.jf.intel.com with ESMTP; 26 Mar 2015 06:53:52 -0700
Message-ID: <1427378012.2918.9.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 26 Mar 2015 10:53:32 -0300
In-Reply-To: <CAP9ODKoLq6NUSMsAj8vow_kVoF+erxkF2+PRKpeDqmEqwEG_yw@mail.gmail.com>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
	<CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
	<1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
	<CAP9ODKoLq6NUSMsAj8vow_kVoF+erxkF2+PRKpeDqmEqwEG_yw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Thu, 26 Mar 2015 13:53:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qui, 2015-03-26 at 10:43 -0300, Otavio Salvador wrote:
> On Thu, Mar 26, 2015 at 10:40 AM, Bottazzini, Bruno
> <bruno.bottazzini@intel.com> wrote:
> > On Qui, 2015-03-26 at 08:56 -0300, Otavio Salvador wrote:
> >> On Thu, Mar 26, 2015 at 5:29 AM, Anders Darander <anders@chargestorm.se> wrote:
> >> > * Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:
> >> >
> >> >> if one wants to launch a simple deamon, most modules are not
> >> >> required.
> >> >> He will be able to save space and exclude unwanted packages
> >> >> from the final image.
> >> >
> >> > I like this, though I've got a few questions that I just noticed.
> >> >
> >> >> -PACKAGECONFIG ??= "xz ldconfig \
> >> >> +PACKAGECONFIG ??= " \
> >> >> +                   gcrypt \
> >> >> +                   kmod \
> >> >> +                   ldconfig \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> >> >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> >> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> >> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
> >> >
> >> > It might be worth noting that xz has gone from being explicitly enabled,
> >> > to depend on a DISTRO_FEATURES.
> >>
> >> Agreed and we shouldn't explode the number of possible dsitro
> >> features. I'd also prefer if xz were kept enable by default so we
> >> don't make a behavior change under the hood.
> >>
> >> ...
> >> >>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
> >> >> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
> >> >
> >> > Why do you remove networkd as a PACKAGECONFIG?
> >>
> >> If there is a real reason for this, it must be recorded in commit log as well.
> >
> > Firstly,
> >
> > Thank you a lot for reviewing this Patch. I'd like to ask you guys to
> > review the others patches too.
> > I know this on will be the more complicated but there others will be
> > faster to review.
> >
> >
> > Now:
> >
> > Guys, if you continue this patch you will see that networkd will always
> > be enabled. Systemd will always configure/make it however, the package
> > will not be installed if the user wants to.
> >
> > With PACKAGECONFIG, we may not get everything "for free" as some data
> > files will be installed regardless as well as some components from
> > systemd cannot be disabled by their build system but we can run without
> > them, for instance we can run without journald.
> >
> > The problem is understanding that although systemd is a single
> > repository it contains multiple services and daemons in it that can run
> > even without the core PID1, udev or the many helpers used to configure
> > the system such as resolved,
> > timedated, localed...
> >
> > All of these components are runtime independent, we can install or
> > remove them and they should not create problems.
> 
> I understand however you can remove the files if networkd, for
> example, is not in PACKAGECONFIG.

Nice! I can adapt the recipe.

How would I do this ?

> 



