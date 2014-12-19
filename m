Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75CD5725E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJBoLLm010311; Fri, 19 Dec 2014 11:51:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iZhKM-9kRPK7; Fri, 19 Dec 2014 11:51:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJBotMY010334
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Dec 2014 11:51:06 GMT
Message-ID: <1418989891.13316.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 19 Dec 2014 11:51:31 +0000
In-Reply-To: <lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Fri, 19 Dec 2014 11:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-12-19 at 12:05 +0100, Enrico Scholz wrote:
> Bruce Ashfield <bruce.ashfield-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
> writes:
> 
> > With the kernel build optimizations, we no longer copy the source from
> > the built kernel into the staging dir, since the kernel is unpacked and built
> > directly from the staging dir.
> >
> > This means that a few build artifacts need to be restored to allow out of
> > tree modules to once again build.
> > ...
> > +	
> > +	# Copy files required for module builds
> > +	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > +	cp Module.symvers $kerneldir/
> > +	cp .config $kerneldir/
> 
> This and the following lines seem to void the whole idea of the patchset
> because it means that only one kernel can be built.  In our usecase we
> build usually two kernels: a full featured one for the main system and a
> minimal, initramfs based for a rescue system.
> 
> With this change and building both kernels, it is ambiguous which
> System.map is used.

Regardless of how you do this, if you build two kernels, you still need
to choose one to build the main set of modules against. I'm therefore
not sure how this change makes anything particularly worst than what
existed before?

Building two kernels is currently fraught with difficulty anyway, to the
point of not being a currently well supported use case and the classes
would probably need to be refactored to allow such things to be well
supported. These changes do bring significant benefit to the most common
case users so we probably need to find a way to allow your use case to
work with the new model.

Cheers,

Richard


