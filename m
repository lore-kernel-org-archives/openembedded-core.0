Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB2678469
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 17:56:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IHuv5c026173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 10:56:57 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 10:56:57 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <CA+chaQc_oKOja+s54Ku-sCQqxdrqi8d16Dkj2=dJHofYnOR1xA@mail.gmail.com>
	<1502969638.13978.209.camel@linuxfoundation.org>
	<CA+chaQcZKA=x1_O88h=Akjh=Cr2Rtt_8GqgRrm61fuLnT_myRw@mail.gmail.com>
	<d2851cd0-1a15-f5aa-1e9b-dda654978178@linux.intel.com>
	<CAMKF1sryybJQXYvkQVbSEciBhYY1s7Xc-k+qhFJSRbbRxi1DJQ@mail.gmail.com>
	<fe1575c3-4e74-1a5d-b48e-86c6908b2e63@linux.intel.com>
	<CAMKF1soQw0VVy0RKe4w-qsCwPh_OTgatYLrx6mPpapBGooy-Ew@mail.gmail.com>
	<CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <de4a91fe-0dc0-208e-1b2e-3e0e897fdd12@windriver.com>
Date: Fri, 18 Aug 2017 12:56:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcQNkYbnSpVzA5xceo=CTpWDnKd8n3WaZM6zbUOe5m_XA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: openssl10 unusable for many components
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
X-List-Received-Date: Fri, 18 Aug 2017 17:56:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/18/17 12:29 PM, Martin Jansa wrote:
> Even with that patch to rename openssl10 back to openssl we still need to solve
> the openssl-native which wasn't reverted back to 1.0.
> 
> Upstream nodejs isn't going to be openssl-1.1 for a bit longer as explained:
> https://github.com/nodejs/node/pull/14761

I wanted to pull out a specific comment from the above link that shows one of
the reasons why OpenSSL 1.1 support is delayed by many:

7 days ago: shigeki commented:
> We're also waiting for FIPS support of 1.1.x. They are now working on it as https://www.openssl.org/blog/blog/2017/07/25/fips/.> ...

Until the OpenSSL 1.1.x FIPS work is further along, a lot of projects (and major
distributions) are going to wait to deploy it.

--Mark

> https://github.com/nodejs/node/pull/11828
> so it would make sense to revert native and nativesdk versions as well - if it
> isn't done in oe-core, I'll do it in our own layers to keep the builds going.
> 
> On Fri, Aug 18, 2017 at 4:41 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Fri, Aug 18, 2017 at 3:53 AM, Alexander Kanavin
>     <alexander.kanavin@linux.intel.com
>     <mailto:alexander.kanavin@linux.intel.com>> wrote:
>     > On 08/18/2017 08:56 AM, Khem Raj wrote:
>     >
>     >> I was trying nodejs and it seems its also broken by this openssl
>     >> upgrade. Meta-oe alone has amost 50 recipes that are broken. there are
>     >> hundreds of other layers.
>     >> Many large packages in external layers are now broken, and the fact
>     >> that openssl10
>     >> is almost useless since some package will pull in openssl11 and cause
>     >> conflicts. This
>     >> is not a a good solution at least it seems to early for release. It
>     >> might take a bit for packages to get working with openssl11, We should
>     >> have carefully thought and considered postponing using it as default
>     >> until next release ( april 2018). Its fine to keep it in if needed but
>     >> keep openssl 1.0 as default preferred version, I don't think whole
>     >> ecosystem is ready for it and we don't have man power to fix
>     >> everything. This alone has a potential to make
>     >> October release quite weak as far as external layers are concerned
>     >
>     >
>     > FWIW, nodejs from meta-oe does build just fine with openssl10 dependency.
> 
>     no it doesnt try building nodejs-native.
> 
>      So
>     > it's not exactly useless. And no one has established how many of the other
>     > 50 packages can be fixed by either doing that, or updating them to latest
>     > upstream releases.
> 
>     Thats not going to solve everything. Neither does pointing to fedora patches.
> 
>     >
>     > I'll send a patch that renames openssl10 recipe back to openssl and sets
>     > that as a preferred version, so anyone can experiment with 1.1 without
>     > widespread breakage.
>     >
>     > But at the start of next development cycle this will be reverted back; no
>     > more complaining then please, we have to do this at some point, and just
>     > after a new cycle has started is as good time as it gets.
> 
>     Just putting random deadlines is not going to solve this, there has to
>     be some look
>     at upstream packages and other distros switching to openssl11 and
>     dropping openssl10
>     completely. People have fielded products to support and they need some
>     assurance of
>     forward path, their ecosystem might involve a lot larger package set
>     then just oe-core.
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 
> 
> 


