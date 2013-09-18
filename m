Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91C8F6105E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:03:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8I23KcD009620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 19:03:20 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 17 Sep 2013 19:03:19 -0700
Message-ID: <523909E7.8020603@windriver.com>
Date: Tue, 17 Sep 2013 21:03:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CABcZANkGd7riMtRE2KfAz+WufoMjr=GYxXHsO2tFSaxXXxS7BQ@mail.gmail.com>
In-Reply-To: <CABcZANkGd7riMtRE2KfAz+WufoMjr=GYxXHsO2tFSaxXXxS7BQ@mail.gmail.com>
Subject: Re: [RFC] Common code/framework for automatic runtime dependencies
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
X-List-Received-Date: Wed, 18 Sep 2013 02:03:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/13 6:23 PM, Chris Larson wrote:
> Greetings,
>
> I recently found myself wanting to implement a prototype of automatic python
> dependencies. In so doing, I realized that there's a certain pattern followed by
> each of these (shlibs, pkgconfig, kernel modules, ..), so I'd like to propose,
> in the 1.6 timeframe, consolidating this into common core code to make it easier
> to implement additional types of automatic rdepends where appopriate. This would
> also make it easy to enable a sanity check across all types to warn/fail if an
> automatic rdepend was generated for a recipe which isn't also explicitly
> included in the depends, to catch non-deterministic build issues.

The rpmdeps that is run, as part of the RPM packaging, has a series of these 
types of checks already.

We really should try to come up with a single instance of dependency 
information, be it SONAME, #!, etc..  For things that can't be represented in 
some package types (like specific filenames), a way to set the rules and filter 
those would be needed.

> Does this concept seem relatively sane? I have a prototype of this in a layer
> that I've been playing with. I have so far added two modules for it, a
> pkg-config one that I've confirmed is behaving the same as the existing
> pkg-config dep handling, and a prototype python one which works for the most
> part, but is still a work-in-progress. I'd appreciate any comments on this. If
> folks don't think this is a good approach, I'm open to that too, but it seemed
> silly to have these things reimplemented or duplicated when the logic appears to
> be the same.

Yes, I think this is needed.  RPM is covering some of this work already, but 
there is much duplicated logic already, and I'd love to get rid of the 
duplication, but retain the additional checks RPM gives the user (when rpm 
packaging is enabled.)

--Mark

> See https://github.com/kergoth/meta-package-auto-deps for the prototype.
> https://github.com/kergoth/meta-package-auto-deps/blob/master/TODO.md shows my
> next steps.
>
> Thanks for your time,
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


