Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0D0677C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 23:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3ANKQEg022726; 
	Tue, 11 Apr 2017 00:20:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jIyaYCDo2iTJ; Tue, 11 Apr 2017 00:20:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AN9FqA022253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 00:09:16 +0100
Message-ID: <1491865755.12091.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 00:09:15 +0100
In-Reply-To: <1491863493.4358.121.camel@linux.intel.com>
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
	<4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
	<1491863493.4358.121.camel@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
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
X-List-Received-Date: Mon, 10 Apr 2017 23:20:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-10 at 15:31 -0700, Saul Wold wrote:
> On Mon, 2017-04-10 at 12:57 -0700, Khem Raj wrote:
> > 
> > 
> > On 4/10/17 8:58 AM, Saul Wold wrote:
> > > 
> > > 
> > > Gnu-efi needs to be build for 64bit since it is a boot time tool.
> > > It
> > > needs these 2 headers to be in 64 bit versions, we can use the
> > > existing
> > > 32bit ones as there is not really any difference.
> > > 
> > > [YOCTO #11051]
> > > 
> > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > > ---
> > >  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > > b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > > index f46381d..6f235b7 100644
> > > --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > > +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> > > @@ -24,6 +24,11 @@ SRC_URI[sha256sum] =
> > > "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef
> > >  COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
> > >  COMPATIBLE_HOST_armv4 = 'null'
> > >  
> > > +do_configure_linux-gnux32_prepend() {
> > > +	cp ${STAGING_INCDIR}/gnu/stubs-x32.h
> > > ${STAGING_INCDIR}/gnu/stubs-64.h
> > > +	cp ${STAGING_INCDIR}/bits/long-double-32.h
> > > ${STAGING_INCDIR}/bits/long-double-64.h
> > > +}
> > > +
> > making long-double-32.h pretend long-double-64.h seems wrong to me.
> > but
> > if you were to do that then symlinking might be better
> > 
> I guess I could symlink it, as it turns out with glibc it's an empty
> header file other than boilerplate, I did not check musl, which I
> guess
> I will do now!
> 
> Even the stubs file is pretty much the same file.

FWIW, the copy makes the task re-executable. If you make symlinks, the
code gets a bit more ugly so the task can be re-executed.

Cheers,

Richard

