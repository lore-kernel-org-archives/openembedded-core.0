Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2827B731AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:52:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 11 Jan 2016 18:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,556,1444719600"; d="scan'208";a="888591897"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by orsmga002.jf.intel.com with ESMTP; 11 Jan 2016 18:52:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, "Burton,
	Ross" <ross.burton@intel.com>
Date: Tue, 12 Jan 2016 15:52:50 +1300
Message-ID: <4152432.VEWvmsyppU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <20151223120303.7a2bb7df@adi-pc-linux>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LbnFsAVPv6r_vh8EX9m7Kir-WW-zq+24FJS1Cr4-vVKZA@mail.gmail.com>
	<20151223120303.7a2bb7df@adi-pc-linux>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RESEND PATCH v3] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Tue, 12 Jan 2016 02:52:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 23 Dec 2015 12:03:03 Ioan-Adrian Ratiu wrote:
> On Tue, 22 Dec 2015 17:34:12 +0000
> 
> "Burton, Ross" <ross.burton@intel.com> wrote:
> > On 15 December 2015 at 09:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> 
wrote:
> > > Split runuser into its own package (previously provided by util-linux).
> > > Since runuser is compiled only when DISTRO_FEATURES includes pam,
> > > the creation of util-linux-runuser is also constrained by this.
> > 
> > What's the rationale for pulling this out into a separate package?
> 
> I need runuser on a busybox image and can't install the entire util-linux
> package.
> > >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> > > 
> > > 'util-linux-pylibmount', '', d)}"
> > > +PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > > 'util-linux-runuser', '', d)}"
> > 
> > No need for conditionals: empty packages are not created.
> 
> Thank you for this tip, I've modified and sent v4.

Unfortunately this wasn't right - the package being excluded from PACKAGES was 
serving to avoid the libpam dependency when pam was not in DISTRO_FEATURES; as 
of this patch we are now building it unconditionally leading to a warning.

Ioan-Adrian, could you please send a patch that changes it back to how you had 
it in v3?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

