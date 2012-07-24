Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1Stkv6-00068s-Su
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 21:37:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6OJPojA019709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2012 12:25:50 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 12:25:49 -0700
Message-ID: <500EF6B1.8040703@windriver.com>
Date: Tue, 24 Jul 2012 15:25:37 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
	<500EEBE2.5020106@windriver.com> <1343156850.22222.20.camel@ted>
In-Reply-To: <1343156850.22222.20.camel@ted>
X-Originating-IP: [128.224.147.210]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 19:37:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-24 03:07 PM, Richard Purdie wrote:
> On Tue, 2012-07-24 at 13:39 -0500, Mark Hatle wrote:
>> On 7/24/12 8:57 AM, Burton, Ross wrote:
>>> On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
>>>> when bzip2-native is installed in parallel to sysroot, it is possible that
>>>> some packages are using bzip2 to unpack, there are chances that bzip2 is
>>>> installed to sysroot but libbz2.so.0 not installed yet because parallel
>>>> installation.
>>>> link bzip2 and bzip2recover statically to avoid this problem and don't lose
>>>> parallel installation. libbz2.so is still available.
>>> Is it me, or is this officially getting silly?  This probably happens
>>> for *every* binary in the sysroot that links to a library, which is
>>> probably a fair proportion of them.  Statically linking every single
>>> one and then special-casing further problems where a static link isn't
>>> sufficient (see pythonnative) just isn't going to scale.
>> The problem is that there are a handful of things that are needed, and for some
>> reason (valid or not) packages are not "requiring", either because they assume
>> the system is valid or they simply don't know they have the requirement.
>>
>> Both python and perl may be used by a number of auto* utilities as well as by
>> packages themselves.  We could attempt to add DEPENDS for all of the cases, but
>> is it really worth it?  I suspect we'll end up specify the DEPENDS for 90% of
>> the things in the system, simply due to them incidentally running some system
>> level python or perl script.  If we make the python/perl into external items
>> that only get loaded into the environment when we're building python/perl
>> modules then things become increasingly easy.
>>
>> As for the bzip2 issue.. This is another of those "we assume it's valid
>> binaries"..  And the problem appears to be when it gets build, it's not valid
>> for a small window of time.
>>
>>   From what Yao has explained to me (offline) the issue is that the
>> assume_provided for bzip2-native works just fine, we use the system
>> version...but then python (or other) utilities come in and say they need
>> "bzip2-full-native".  Which triggers the build.. and opens a small window of
>> time where bzip2 is being installed, where it isn't functional -- something else
>> comes in and has a requirement of bzip2-native, which is satisfied by the
>> assume_provided and we get into the race where it executes a broken binary.
>>
>> The underlying issue is simply that if we're installing tooling that is either
>> assume-provided (based on an alternative 'full' version) or incidental usage
>> like python or perl we need to take precautions to ensure that the build system
>> never sees the "broken" version during the short install window triggering the
>> race condition.
>>
>> I'll let Yao comment further on this particular issue, but there is an overall
>> class of issues with -native that we need to track to get rid of these subtle races.
> The set of problems are cases where we have things in ASSUME_PROVIDED.
> It is near impossible to have an empty set there and sometimes we need
> to build things ourselves which are already listed there. python-native
> and perl-native are the pathological cases but as also have issues with
> bzip2, tar and likely undiscovered yet, now git.
>
> I'd been searching for bzip2-replacement-native rather than full which
> is why I didn't see this earlier. I suspect in the python/bzip2 case,
> not installing the bzip2 binary might well solve many of the problems as
> python really wants a native libbz2 and the host bzip2 binary is ok.
Hi Richard,

Can I provide a patch to change bzip2-full-native to bzip2-native to 
finish this problem?
I have tested that the bzip2-native is not built any more.

thanks,
yao
> The races themselves are over binaries in PATH. As far as I
> know/understand things we're close to having them resolved. What I am
> considering as an improvement is instead of the pythonnative/perlnative
> bbclass files, having a variable like "NATIVEPATHADDITIONS" which would
> take values like "python-native", "perl-native" and would simply add
> ${STAGING_BINDIR}/xxx to PATH for each item listed. The bbclass files
> are useful for the dependency additions too though which sometimes are
> not trivial. This would at least remove the case by case bbclass
> addition issue we currently have for the simple cases though.
>
> Cheers,
>
> Richard
>
>
>
>
>
>




