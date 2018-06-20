Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABDBC7717D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 09:54:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5K9sw1V023127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 20 Jun 2018 10:54:59 +0100
Message-ID: <e679e3237e1e9b57a5c92e809fb6e59c38f8f77f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 10:54:58 +0100
In-Reply-To: <4b8dea8f-7f02-98c1-f87b-8b4a80912736@windriver.com>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
	<4b8dea8f-7f02-98c1-f87b-8b4a80912736@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Wed, 20 Jun 2018 09:55:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-06-20 at 08:47 +0800, ChenQi wrote:
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -487,7 +487,7 @@ HOSTTOOLS += " \
> >   "
> >   
> >   # Tools needed to run testimage runtime image testing
> > -HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
> > (bb.data.inherits_class('testimage', d) or d.getVar('TEST_IMAGE')
> > == '1') else ''}"
> > +HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
> > (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True,
> > False, d)) else ''}"
>
> After this change, testimage and testsdk is limited to be used via 
> IMAGE_CLASSES. Using INHERIT directly will cause commands missing
> when testing.
> e.g.
> INHERIT += "testimage"
> 
> Is it designed to be so?

Using INHERIT += "testimage" is bad form since it adds the testimage
task to things that it makes no sense with. Consider "bitbake bash -c
testimage" for example.

So yes, it was designed to do this, unfortunately it breaks the
autobuilder though.

I will likely want to fix the autobuilder not to do this and use the
new test code. We're about to change a lot of the autobuilder codebase
around to the new one so it probably makes sense to make that change
after we move to the new codebase.

For that reason I'll probably temporarily fix INHERIT of testimage to
work again but going forward, that support will be removed as it
doesn't make sense and IMAGE_CLASSES is the correct way to do it.

Does that make sense?

Cheers,

Richard




