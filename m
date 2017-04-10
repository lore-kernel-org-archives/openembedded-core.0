Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 93DBC71C72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 22:31:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 Apr 2017 15:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,183,1488873600"; d="scan'208";a="1154063009"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.112.101])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2017 15:31:38 -0700
Message-ID: <1491863493.4358.121.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 10 Apr 2017 15:31:33 -0700
In-Reply-To: <4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
	<4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH] gnu-efi: copy header files for x32 build
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
X-List-Received-Date: Mon, 10 Apr 2017 22:31:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-10 at 12:57 -0700, Khem Raj wrote:
> 
> On 4/10/17 8:58 AM, Saul Wold wrote:
> > 
> > Gnu-efi needs to be build for 64bit since it is a boot time tool.
> > It
> > needs these 2 headers to be in 64 bit versions, we can use the
> > existing
> > 32bit ones as there is not really any difference.
> > 
> > [YOCTO #11051]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > index f46381d..6f235b7 100644
> > --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > @@ -24,6 +24,11 @@ SRC_URI[sha256sum] =
> > "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef
> >  COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> >  COMPATIBLE_HOST_armv4 = 'null'
> >  
> > +do_configure_linux-gnux32_prepend() {
> > +	cp ${STAGING_INCDIR}/gnu/stubs-x32.h
> > ${STAGING_INCDIR}/gnu/stubs-64.h
> > +	cp ${STAGING_INCDIR}/bits/long-double-32.h
> > ${STAGING_INCDIR}/bits/long-double-64.h
> > +}
> > +
> making long-double-32.h pretend long-double-64.h seems wrong to me.
> but
> if you were to do that then symlinking might be better
> 
I guess I could symlink it, as it turns out with glibc it's an empty
header file other than boilerplate, I did not check musl, which I guess
I will do now!

Even the stubs file is pretty much the same file.

Sau!

> > 
> >  def gnu_efi_arch(d):
> >      import re
> >      tarch = d.getVar("TARGET_ARCH")
> > 
> 

