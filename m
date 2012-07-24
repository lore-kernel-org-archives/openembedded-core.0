Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1StkCC-00083n-Qz
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 20:51:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OIdWJE011077
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 11:39:32 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.30) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 24 Jul 2012 11:39:31 -0700
Message-ID: <500EEBE2.5020106@windriver.com>
Date: Tue, 24 Jul 2012 13:39:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Yao Zhao
	<yao.zhao@windriver.com>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
In-Reply-To: <CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 Jul 2012 18:51:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/12 8:57 AM, Burton, Ross wrote:
> On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
>> when bzip2-native is installed in parallel to sysroot, it is possible that
>> some packages are using bzip2 to unpack, there are chances that bzip2 is
>> installed to sysroot but libbz2.so.0 not installed yet because parallel
>> installation.
>> link bzip2 and bzip2recover statically to avoid this problem and don't lose
>> parallel installation. libbz2.so is still available.
>
> Is it me, or is this officially getting silly?  This probably happens
> for *every* binary in the sysroot that links to a library, which is
> probably a fair proportion of them.  Statically linking every single
> one and then special-casing further problems where a static link isn't
> sufficient (see pythonnative) just isn't going to scale.

The problem is that there are a handful of things that are needed, and for some 
reason (valid or not) packages are not "requiring", either because they assume 
the system is valid or they simply don't know they have the requirement.

Both python and perl may be used by a number of auto* utilities as well as by 
packages themselves.  We could attempt to add DEPENDS for all of the cases, but 
is it really worth it?  I suspect we'll end up specify the DEPENDS for 90% of 
the things in the system, simply due to them incidentally running some system 
level python or perl script.  If we make the python/perl into external items 
that only get loaded into the environment when we're building python/perl 
modules then things become increasingly easy.

As for the bzip2 issue.. This is another of those "we assume it's valid 
binaries"..  And the problem appears to be when it gets build, it's not valid 
for a small window of time.

 From what Yao has explained to me (offline) the issue is that the 
assume_provided for bzip2-native works just fine, we use the system 
version...but then python (or other) utilities come in and say they need 
"bzip2-full-native".  Which triggers the build.. and opens a small window of 
time where bzip2 is being installed, where it isn't functional -- something else 
comes in and has a requirement of bzip2-native, which is satisfied by the 
assume_provided and we get into the race where it executes a broken binary.

The underlying issue is simply that if we're installing tooling that is either 
assume-provided (based on an alternative 'full' version) or incidental usage 
like python or perl we need to take precautions to ensure that the build system 
never sees the "broken" version during the short install window triggering the 
race condition.

I'll let Yao comment further on this particular issue, but there is an overall 
class of issues with -native that we need to track to get rid of these subtle races.

--Mark

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



