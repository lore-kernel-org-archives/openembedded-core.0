Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8C52060557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 07:42:39 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id z6so886234qkl.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 00:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4YDnJxwRM68x8CZrG8a3gBoigmGpMuqmmg1HVd28N74=;
	b=KEEMhmp16ImUNqAqwbv8udhaGaFO37bElE5mswSZ/Lwvc/B+MR9WHtWiTjXNWwKQ6/
	GJuZeRAotSSfUSdP34fVNEZ9A2hVAxbKssUgjzuh5u91TmKlXKkkD/c8FnryYHzACDSz
	gRSCLWOq6N3GmymQRYNZAkP1VbcY3ds9d4tez3Q/HpSM0pITSjVAVMK9fhp99cbLHmil
	nHSk3lJdbB4flrXfdRM8O0H8hUpduBNKhmsPIWTbKHskZ2h3lBp+LUr+5u9hh4ne4N5Q
	dtdBvKAU9Y7URX2je58hKak0wrvsy74l6giKPw+8o7JCWKpFG1UVYf9LHBxhU2E6CvJ5
	evlg==
X-Gm-Message-State: APjAAAWEed0Nr06oAIko4U10hhQW8OS5zgTOqgjPQNyvrQ3dULy38IeV
	g/vgT7CvHSp3vYRkQZWrwr6PbKrWUnY=
X-Google-Smtp-Source: APXvYqw8xqfCF1ejjhcO8quo2g8k1O6p64bUrOFuQ20yhUbdeQQVVC3goPXlWdVMFJrRcWvfCGUBOA==
X-Received: by 2002:a05:620a:103c:: with SMTP id
	a28mr32335589qkk.246.1557906160605; 
	Wed, 15 May 2019 00:42:40 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id z38sm789459qtz.13.2019.05.15.00.42.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 15 May 2019 00:42:40 -0700 (PDT)
Message-ID: <1c75084ba7c59399d92ebc24cb443aea92402442.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 May 2019 08:42:38 +0100
In-Reply-To: <CADkTA4PNCf7+vw8i89R0OaZb_Swkp1tn6as557pHFRR7WbE+Yg@mail.gmail.com>
References: <4ac2274b49372290718a2b59175407bc736118ff.camel@andred.net>
	<d5bed9dff4f06727fe947fa8516d1b8e537c159e.camel@andred.net>
	<CADkTA4PNCf7+vw8i89R0OaZb_Swkp1tn6as557pHFRR7WbE+Yg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RDEPENDS kernel-image-zimage & kernel.bbclass PKG name
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
X-List-Received-Date: Wed, 15 May 2019 07:42:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Bruce,

On Tue, 2019-05-14 at 20:50 -0400, Bruce Ashfield wrote:
> 
> 
> On Tue, May 14, 2019 at 12:32 PM André Draszik <git@andred.net> wrote:
> > On Tue, 2019-05-14 at 14:35 +0100, André Draszik wrote:
> > > Hi,
> > > 
> > > As part of the build, kernel packages are renamed, e.g.
> > > kernel-image-zimage basically becomes
> > > kernel-image-zimage-${KERNEL_VERSION}
> > > 
> > > When a package created by recipe B RDEPENDS on kernel-image-zimage,
> > > the ipk generated ultimately depends on
> > > kernel-image-zimage-${KERNEL_VERSION} (not kernel-image-zimage).
> > > Once the kernel is updated, it appears as though recipe B is not
> > > repackaged, so the package still runtime depends on the original
> > > kernel, which doesn't exist anymore, and thus building the image
> > > fails.
> > > 
> > > Specifically, I have
> > > MACHINE_EXTRA_RDEPENDS += "kernel-image-zimage"
> > > in my BSP, and hence packagegroup-machine-base runtime depends on
> > > kernel-image-zimage-4.9.11-cl-som-imx7-5.1+gc27010d99a3d.
> > > Updating the kernel doesn't trigger a rebuild of packagegroup-machine-base,
> > > so things fail for me.
> > > 
> > > 
> > > Am I missing something in my BSP? I could probably do a bbappend
> > > on packagegroup-base.bb and add something like
> > > do_packagedata[depends] += "virtual/kernel:do_packagedata"
> > 
> > BTW, I've tried the following packagegroup-base.bbappend to no avail:
> > 
> > python do_get_kernel_zimage_name() {
> >     new_dep = get_package_mapping('kernel-image-zimage', 'packagegroup-machine-base', d)
> >     d.appendVarFlag('do_package_write_ipk', 'vardeps', new_dep)
> > }
> > addtask get_kernel_zimage_name after do_package before do_package_write_ipk
> > do_get_kernel_zimage_name[depends] += "virtual/kernel:do_packagedata"
> > 
> 
> 
> Hi Andre,
> 
> I chased (And fixed) something very similar to this with postinst scripts and kernel-image that showed a similar
> symptom (you couldn't add a postinst to kernel-image-<type> without throwing an error since the PKG_ variables change
> the package name to kernel-image-<type>-version).
> 
> My fix was specific to the postinst, but I bet this would be a similar fix.
> 
> I don't suppose you have a sample set of layers and a build config that I could kick off here ? That would make it a
> lot easier to test my theory.

Thanks for the offer Bruce, I'll try. Shouldn't be too hard I hope.

A.



