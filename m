Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7166D767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:25:22 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uz6so3744174obc.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 05:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eMsowZr+GehMNP8ls5QqlUiDFJO5LcGr1P4w7ANqs9Y=;
	b=cHLTQAsM6J63/vbCe2TSBvFpsMCGv+8L45ddctIJvC3bu8krfXDWhWhS9qnnlCU6R2
	adwZ9c7D9qZB2bLWeV7H91A0Z7nq4Qkqm2xNknYw/q+VH95BaYbNI61pQqbruMJcZxcb
	0q4n1pTgxEFrFckweQnsy9AgeqCTRtMz7SqsGiefOwgMKlByGfewPGdNPzXahWH3R9gb
	JaNzJLLjx1FIR4uMN4VvM9ONbAVTKOOOpsbltaTxQNdWIQMGX0lTbSdikZyOgn6KhAFe
	m3sZvoE4jcMJxuKlPm4nwZcxxGrQsYQqsZA7n2LXs0bdVwbgPxdYONV0jVVoJRjIi7iF
	22vg==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr6778348obb.63.1384521923670;
	Fri, 15 Nov 2013 05:25:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 15 Nov 2013 05:25:23 -0800 (PST)
In-Reply-To: <1384517930.6460.151.camel@ted>
References: <52859586.5040001@windriver.com>
	<1384517930.6460.151.camel@ted>
Date: Fri, 15 Nov 2013 11:25:23 -0200
X-Google-Sender-Auth: SYj4fTIhyYaXD-LPdskfyOXFxYc
Message-ID: <CAP9ODKqt_jfNPE=FhtRrwDWospD1KZF7N1hP58kAJi7c1jtxzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] let PACKAGES_DYNAMIC be optional ?
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
X-List-Received-Date: Fri, 15 Nov 2013 13:25:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 15, 2013 at 10:18 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-15 at 11:31 +0800, Robert Yang wrote:
>> Currently, the recipe which uses PACKAGES_DYNAMIC usually generates
>> a lot of packages which costs a lot of time on building the recipe
>> and do_rootfs, for example, the perl and kernel:
>>
>> $ ls tmp/deploy/rpm/armv5te/perl-module-* | wc -l
>> 621
>>
>> $ ls tmp/deploy/rpm/qemux86/kernel-module-* | wc -l
>> 268
>>
>> Also, the eglibc-locale generates more than 300 packages.
>>
>> Take perl as an example:
>>
>> 1) We generate 621 perl-module-* packages, but the package *perl-modules*
>>     requires all of them, so once *perl-modules* is installed, all the other
>>     perl-module-* will be installed and we can't remove any of them since
>>     perl-modules rdepends on it, if there is a way to package all of these
>>     perl-module-* into one package (they are about 10MB), it would save a lot
>>     of time on do_package* and do_rootfs.
>>
>> 2) The nativesdk.bbclass can't support PACKAGES_DYNAMIC, for example, it can't
>>     change the perl-module-app-cpan to nativesdk-perl-module-app-cpan since
>>     there is no perl-module-app-cpan in PACKAGES when nativesdk.bbclass
>>     changes the variable's name.
>>
>> Can we add a way to let the PACKAGES_DYNAMIC be optional ? for example,
>>
>> PACKAGES_DYNAMIC[perl] = "0"
>>
>> will disable the perl's PACKAGES_DYNAMIC, and will pack the files as other
>> recipes do, and of course we need to do some work on the recipe.
>
> Before we consider doing this, I'd actually like to see real numbers
> about how big this problem is.
>
> Why? Speaking as someone who has looked specifically at perl and the
> kernel, I don't believe there is a huge amount of time spent dealing
> with the individual packages and that maintaining two build paths is
> actually worse than they minimal performance impact this has.
>
> In particular, I'd note that the locale generation happens in parallel
> with other parts of the build and is not a significant factor in overall
> build times.
>
> The time would be better spent reducing the size of the kernel source
> installed into the sysroot for example (Bruce is planning action on
> this).

I agree on Richard on this; keeping too many different build routes
introduces more test burden and it's only worth if the gain is huge.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

