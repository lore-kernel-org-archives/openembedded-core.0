Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA10F771B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 06:55:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q6tBt9007386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 23:55:11 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 25 Jul 2018 23:55:10 -0700
To: <richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
References: <20180725164107.8891-1-kai.kang@windriver.com>
	<30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <0ca7463e-1966-0956-f21d-d23058a7a4ff@windriver.com>
Date: Thu, 26 Jul 2018 14:53:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <30c2f9cc5e10db824fb7df312bee88e17814221c.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Install rdependent of allarch package with same multilib variant of image
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
X-List-Received-Date: Thu, 26 Jul 2018 06:55:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年07月26日 06:47, richard.purdie@linuxfoundation.org wrote:
> Hi Kai,
>
> On Thu, 2018-07-26 at 00:41 +0800, kai.kang@windriver.com wrote:
>> The series rfc patch is trying to install 64bits packages which is
>> required by allarch package to 32 bits image. Work for rpm and need
>> little more work and test for dpkg and opkg.
>>
>> Take ca-certificates as example. It requires openssl. So it intalls
>> openssl for both core-image-sato and lib32-core-image-sato. But
>> lib32-openssl is expected to be installed to lib32-core-image-sato.
>>
>> So extend rdpendent of allarch package with all multilib variants and
>> 'noarch-' as well.
>>
>> Extend
>> ca-certificates -> openssl
>>
>> to
>>
>> ca-certificates -> openssl, lib32-openssl, noarch-openssl
>>
>> Rdepends on openssl and lib32-openssl make both of them exist in
>> oe-core-repo when do rootfs. And then make both openssl and
>> lib32-openssl provide noarch-openssl. And only keep noarch-openssl in
>> RDEPENDS when write package for ca-certificates. When do image rootfs
>> for lib32-core-image-sato, remove openssl if installed already and
>> install lib32-openssl to provide noarch-openssl for allarch pacakge
>> ca-certificates.
>>
>> And extend rprovides of allarch package with prefix 'noarch-' too
>> that
>> it may be required by other allarch packages. Put all dependent
>> packages
>> of all allarch recipes in oe-core to a new ariable
>> 'ALLARCH_RDEP_PKGS'.
>>
>> Any comment for this method is welcomed. Thanks a lot.

Hi Richard,

Thanks for detailed reply.

> I think this is kind of the right direction but its not ready in this
> form. Taking a step back and thinking about this problem, its actually
> similar to the allarch recipes signature problem.
>
> Normally if A DEPENDS on B, the taskhash of A includes the taskhash of
> B. In the allarch case this is problematic so you see ca-certificates-
>> openssl listed in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
> I think (but am not 100% sure) that everything you list in
> ALLARCH_RDEP_PKGS is already covered somewhere in
> SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
>
> I'd therefore propose using SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS instead of
> adding a ALLARCH_RDEP_PKGS which duplicates information. I can't see
> any case where you'd want an entry in one but not the other.
Yes, it seems ALLARCH_RDEP_PKGS and I'll try to use 
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS instead.

>
> Rather than changing the RPROVIDES/RDEPENDS in package_{deb|ipk|rpm},
> you should do this once in package.bbclass.
ok.

>
> There is a bigger problem though since the allarch recipe signature
> filtering doesn't change what bitbake will actually build, only how its
> represented in sstate and the circumstances under which it would
> rebuild it. If ca-certificates DEPENDS on openssl, it will build
> openssl whether you're targeting core-image-sato or lib32-core-image-
> sato. This potentially means you can end up in a situation where it
> wouldn't build lib32-openssl if nothing else in lib32-core-image-sato
> depended upon it more directly.

That's why extend rdepends of allarch package with all multilib variant. 
In bitbake inner environment, make
ca-certificates depends on openssl, lib32-openssl and even 
libn32-openssl for qemumips64. It may cost a little
more build time(I didn't test yet), but the dependency relationship is 
fixed and make sure that all multilib version
of openssl exist in 'oe-core-repo' which is used for do_rootfs.

When build ca-certificates, both openssl and lib32-openssl will be 
built. And when write package of ca-certificates,
remove openssl and lib32-openssl from RDEPENDS and keep noarch-openssl. 
And make both openssl and
lib32-openssl provides noarch-openssl. Then some tweak according image 
multilib type could be done at then end
of do_rootfs.


>
> There is no easy way to solve this problem since somehow, if you're
> building lib32-<image> it needs to build lib32-openssl and if you're
> building <image> it needs to build openssl. "pushing" that information
> back up the dependency chain is very hard, we have no such mechanism.
I once want to set 'PREFERRED_PROVIDER_noarch-openssl' in image.bbclass, 
and finally find that the setting only exists
in d of <image>, and can't pass to outer context of 'defaultpkgname'

>
> I'm afraid I don't have a solution for this piece, its a very hard
> problem to solve. Your current patches happen to work as there are
> other more direct dependencies which tend to ensure the right thing
> happens but we can't rely on that and it probably isn't the case for
> all the dependencies.
>
> Finally, the package manager shouldn't really need changes for this
> approach to work. If things RPROVIDE and RDEPEND on the noarch
> versions, the feed priorities should mean the right things happen. If
> that doesn't happen automatically, the feed prorities are not working
> correctly and that needs fixing, not the 2/2 patch you're proposing. I
> suspect this issue needs fixing regardless of anything else.
Make feed repo with different priority once was an option. But I 
selected this way first. I'll work on it.

Regards,
Kai

>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


