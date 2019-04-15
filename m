Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 222907D907
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:40:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jMPq6LzSzB7;
	Mon, 15 Apr 2019 10:39:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555317601;
	bh=4p+ux+aV9XahlXakjizaQwDI4R+RuqZVHjidha+y+fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL/IUWQxrDctpSoYvbZXVnJJ6RdAHWEwo9Ia++tdtL0A5wBwJNvLUqekjh4nQAjvd
	w9LDVxhpTrYQwwLuS9Bame2bKmJYYldruPfcv2TELVgxcwloYapE0GTYLZ4AxorOgX
	l+JTnHx5Ni+3wanWyfCB3VqXpTFsC2MMKXrdc4IFujCgXkuHMSSvc/cbpdOvttPB7d
	xQQrWH8+/YXoTH+RK00ixkF/Dk2K7awNfdIc7uRK7Y+4dvWDzRXUWaYUwTV6orznrA
	cSaML4pg3GcuoabM8QxyawdmJRtQ01iA0rXx8bL7iXdNxhMd2od5/Zoya8cuQkTyZe
	PpkhyGGj5u0rS7TmHe8GdG5R9Ep8+9mu2V6j8r9rpm23FW+wC0TfmLgXOaZURqEvkK
	vzFiF3dLaOlWz3KDCmD4PydfHvaY2TlqwSc5pRPBYUrpukqqEqoC/EYvMxi3PHW4UM
	oaTJV7HXkIhnsE8tIaZfoHRpYCilreND4cxZHCZ4uPO4A/afLqX9K4VaHdJxwAE7eD
	LW0C8WEREvSwWKxvZD+5MHuPBDjlwckNe1muRfONZin0t9ip8doyyNTNrn8c/uT7+T
	n92v9DVpdbbMWNWvhd07nZg+D6DsarPVNiW6av9sRE2yz9ZOEaNKs9VzZnyDu3kafI
	Sj2zGfdqNKG91dfxdXD8xzXU=
Date: Mon, 15 Apr 2019 11:39:57 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190415083957.GA4317@localhost>
References: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
	<1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
	<8879daf5747ec05fa2430354dbd38cc3ae5e1cd5.camel@linuxfoundation.org>
	<5CB43C2A.4050908@windriver.com>
	<21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 08:40:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 15, 2019 at 09:06:12AM +0100, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2019-04-15 at 16:09 +0800, Yu, Mingli wrote:
> > 
> > On 2019年04月15日 15:59, richard.purdie@linuxfoundation.org wrote:
> > > On Mon, 2019-04-15 at 15:40 +0800, mingli.yu@windriver.com wrote:
> > > > ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
> > > > -0700
> > > > -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
> > > > -0700
> > > > -@@ -9,7 +9,7 @@
> > > > +diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
> > > > +index 99d3535..92de9f8 100644
> > > > +--- a/testsuite/dlopen-test.c
> > > > ++++ b/testsuite/dlopen-test.c
> > > > +@@ -9,7 +9,9 @@ int
> > > >    main (int argc UNUSED, char **argv UNUSED)
> > > >    {
> > > >    #if HAVE_LIBDL
> > > >   -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
> > > >   +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> > > > ++  if (!handle)
> > > > ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
> > > >      int (*get_version)(void);
> > > >      if (!handle)
> > > >        {
> > > 
> > > What happens on a 32 bit system?
> > > 
> > > You can't hardcode a specific libdir like that!
> > 
> > I just rework the patch dlopen-test.patch which Juro Bystricky
> > generated 
> > before, the previous patch only check /usr/lib/libnettle.so and I 
> > updated it also to check /usr/lib64/libnettle.so if no 
> > /usr/lib/libnettle.so exist.
> >   -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
> >   +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> > ++  if (!handle)
> > ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
> 
> What happens on x32? n32? or if I set libdir to lib32?

dlopen("libnettle.so", RTLD_NOW) should work,
this uses the normal library search path.

But is it actually worth permanently carrying a patch here?
run-ptest already skips one test for unrelated reasons,
and skipping another one would also be an option.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


