Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51FF76E7C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 13:17:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2014 06:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,685,1389772800"; d="scan'208";a="501971735"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.192])
	by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2014 06:17:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>, "Wold,
	Saul" <sgw@linux.intel.com>
Date: Wed, 19 Mar 2014 13:17:09 +0000
Message-ID: <1803761.bM8W6F0XkC@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1395231830.31252.10.camel@firebird.rb.intel.com>
References: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
	<1395231830.31252.10.camel@firebird.rb.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 13:18:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 19 March 2014 12:23:37 Stanacar, StefanX wrote:
> On Tue, 2014-03-18 at 17:31 -0700, Saul Wold wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > 
> >  meta/classes/testimage.bbclass | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/meta/classes/testimage.bbclass
> > b/meta/classes/testimage.bbclass index 691c7f6..ee028e1 100644
> > --- a/meta/classes/testimage.bbclass
> > +++ b/meta/classes/testimage.bbclass
> > @@ -45,6 +45,16 @@ TESTIMAGEDEPENDS_qemuall =
> > "qemu-native:do_populate_sysroot qemu-helper-native:d> 
> >  TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
> >  TESTIMAGELOCK_qemuall = ""
> > 
> > +IMAGE_POSTPROCESS_COMMAND_qemuall += "fix_dns_lookup_for_qemu"
> > +
> 
> I might be wrong, but this won't have any effect with the default
> (manual) way we use testimage. The testimage class isn't in the global
> inherit, so that  IMAGE_POSTPROCESS_COMMAND won't run as the image isn't
> reconstructed.
> 
> The AB does: bitbake core-image-sato on one step and then adds INHERIT
> +="testimage" in local.conf in the next step and runs bitbake
> core-image-sato -c testimage, no more do_rootfs here.
> 
> As it this it will only work with testimage-auto when you have
> TEST_IMAGE="1" in local.conf in the first build step so you only need to
> do bitbake core-image-sato and do_testimage gets run after do_rootfs,
> but we don't use this. And the fix should work for running the task
> manually too.

I have to say I agree; this is not the right fix.
 
> I liked v1, I don't really see what the problem was there. No mattter
> the way you run our qemu images, you still have to set a proper DNS, and
> have network connectivity in the image (which usually involves the host
> too) so defaulting to UseDNS no for qemu images seems a sensible default
> to me.

Well, v1 was unconditional in the openssh recipe; I think it still needs to be 
just for qemuall.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

