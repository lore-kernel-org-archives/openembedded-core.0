Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B92D76039
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 08:51:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w628p7hO029714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 01:51:07 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 2 Jul 2018 01:51:06 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <969ccd61-7a03-a81f-c36f-04c5d806d3e2@windriver.com>
	<22df428a-c981-bd8f-254d-739296926401@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <1018c740-a3f2-2fb3-366e-f93615beef51@windriver.com>
Date: Mon, 2 Jul 2018 16:50:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <22df428a-c981-bd8f-254d-739296926401@windriver.com>
Subject: Re: [RFC] How to deal allarch packages in dependency chain for multilib rootfs?
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
X-List-Received-Date: Mon, 02 Jul 2018 08:51:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年06月28日 22:26, Mark Hatle wrote:
> On 6/28/18 3:48 AM, Kang Kai wrote:
>> Hi all,
>>
>> When build 32 bits rootfs with 64 bits bsp, if an allarch/noarch package is
>> installed to lib32 rootfs, it causes
>> unexpected 64 bits packages which is required by the allarch package installed
>> to lib32 rootfs.
>>
>> Take ca-certificates as example. ca-certificates rdepends on openssl, so if
>> ca-certificates is installed to image,
>> 64 bits package openssl will be installed too no matter what the rootfs is. But
>> only 32 bits openssl package should
>> be installed to 32 bits rootfs.

Hi Mark,

Thanks for your detailed reply.

> With -RPM-, and using names that do not include 'lib32' or other multilib
> prefixes.  RPM doesn't care 'who' provides openssl, as long as someone provides
> openssl.  There is a series of weights added to the available providers of
> openssl.  The package with the highest weight (or maybe lowest) is what ends up
> being installed.
>
> In the case where there are two multilibs providing openssl, the system will
> usually do one of two things:
>
> 1) Look to see if an existing openssl is set to be installed (just use that version)
>
> 2) Look to see if the default architecture has the package and use that,
> otherwise fall back to less priority architectures.  (Again, this is stock RPM
> behavior.)
>
> OE has modified the behaviors slightly, so I can't be 100% confident as to how
> it works in OE in all cases.

Do you mean make lib32-openssl also provides openssl? It should work for 
do rootfs with repo priorities. But my concern is that
install package -foo- which requires openssl during runtime by command 
rpm. If lib32-openssl is installed and it also provides 'openssl',
then package -foo- could be installed without real 64bits openssl. It 
may cause malfunction.

>> There are 2 ways to fixed the issue.
>>
>> 1 expand allarch/noarch packages with multilib. So if add ca-certificates to
>> image, lib32-ca-certificates will be
>>     installed to 32bits rootfs. And then also the dependency lib32-openssl is
>> installed. That is what we expected.
> This really isn't the right way to do it, because then you end up with two
> packages with identical content -- and you then need to ensure that the internal
> dependencies all 'match'.
>
> So you've added another layer where you need to ensure that the multilib
> rdepends are 'specified' and managed properly.  [Yes this can be handled by OE
> automaticallly], but it doubles the size of the package respository (for no-arch
> packages), as well as any field upgrades BOTH have to be upgraded together or
> you will get an error.

Got it.

>
>> 2 expand DEPENDS/RDEPENDS of allarch/noarch packages with a prefix 'noarch-'
>> when multilib is enabled. So then
>>     ca-certificates requires 'noarch-openssl'. And make both lib32-openssl and
>> openssl provides 'noarch-openssl'.
> -today- it should be depending on 'openssl', and all variants of openssl SHOULD
> be calling themselves/providing 'openssl'.  (The other components of the
> dependency system will ensure the right 32-bit/64-bit version is selected if
> needed.)
>
> And unless the image creator is explicit in their check they may end up with
> BOTH the 32-bit and 64-bit versions...
>
>>     When do_rootfs, there is only one rpm repo 'oe-rootfs-repo' now. We will
>> create repos with different priorities
> And this is creating problems.  This is why the priority system (order for
> dependencies) was put into place originally.  So it would start at the highest
> priority components and work it's way until it found the right set of matches.
>
> With DNF and RPM(4), things have changed..  I'm not sure how the priorities are
> defined in this system -- but really each arch type should be it's own
> repository in DNF.. and the priorities for each should be ordered to match the
> user's preferred order for package installation.  (The default behavior is fine
> for most users, but a way to say -- no really I want 32-bit installed first.. is
> needed for the multilib image cases..)

Thanks. I'll figure out the priority in DNF and RPM(4).

>
> The reality though for most multilib users is they have one of two use-cases:
>
> 1) 64-bit kernel, 32-bit userspace (and possibly a 'few' 64-bit binaries)
>
> 2) 64-bit kernel, 64-bit userspace... They want a small number of libraries from
> the multilib installed into their main system
>
> It's the second case where we often get into problems, because the system is
> really intended for that -- where you would say I expect BOTH openssl 32-bit and
> 64-bit installed, but many of our users are trying to do I want only the openssl
> installed for the executables I need.  (reasonable request, just not exactly
> what RPM was intended to be doing.)
>
>>     according to different archs/subdirectories. For 32 bits image, make 32 bits
>> rpm repo has  higher priority, so lib32-openssl
>>     will be installed to 32 bits rootfs rather than 64bits.
> Yes, this covers the use case #1 better then anything else we have at this point.
>
>> I know these 2 ways are not perfect, but only possible ways I have in mind to
>> solve the problem.
>>
>> Any comment or suggestion is greatly appreciated. Thanks a lot.
> So I can sum this up to:
>
> Use case 1.. kernel and primary userspace library type don't match is
> problematic, but not used by a lot of people (AFAIK).

I am sorry that it is the Use case 1 (64-bit kernel, 32-bit userspace) 
that we want to solve. Because both lib32 (imported by other lib32 
packages) and
64bits (imported by noarch pacakge) packages such as perl may be 
installed to image at same time , it causes some runtime failures such 
as some perl
modules don't work.

I once thought to solve the dependency issue in package libsolv. The 
original thought is to pass a environment variable to identify whether 
build a lib32 image.
When resolve the dependencies of noarch package, expand the dependencies 
according the environment variable. But it seems libsolv treats "all 
strings and
relations as unique 32-bit numbers". So it seems it doesn't work this way.


Thanks a lot.

--Kai

>
> Use case 2.. the embedded nature of trying to develop 'small' [in terms of
> number of packages installed] filesystems is causing some odd behavior, but a
> workaround of specifying the -exact- packages you want when this oddity arrives
> is available.
>
> --Mark
>
>> -- 
>> Regards,
>> Neil | Kai Kang
>>
>

-- 
Regards,
Neil | Kai Kang


