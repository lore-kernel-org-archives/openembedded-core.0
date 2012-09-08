Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TANTo-0002hJ-QA
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 18:01:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q88FnSv6013754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Sep 2012 08:49:28 -0700 (PDT)
Received: from msp-dhcp24.wrs.com (172.25.34.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sat, 8 Sep 2012 08:49:28 -0700
Message-ID: <504B6907.6080704@windriver.com>
Date: Sat, 8 Sep 2012 10:49:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347033943.8619.0.camel@ted> <1347119094.2583.20.camel@lenny>
In-Reply-To: <1347119094.2583.20.camel@lenny>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 16:01:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/12 10:44 AM, Colin Walters wrote:
> On Fri, 2012-09-07 at 17:05 +0100, Richard Purdie wrote:
>> Unfortunately whilst reruning configure and make against a project will mostly
>> work there are situations where it does not correctly do the right thing.
>>
>> In particular, eglibc and gcc will fail out with errors where settings
>> do not match a previously built configuration. It could be argued they are
>> broken but the situation is what it is. There is the possibility of more subtle
>> errors too.
>>
>> This patch adds a "make distclean" call to recipes where configure is
>> rerunning and the sstate checksum for do_configure has changed. We could
>> simply use a stamp but saving out the previous configuration checksum
>> adds some data at no real overhead.
>
> The major problem with distclean is that it completely falls over in the
> scenario where the source code has changed; the new distclean won't know
> about *old* object files it no longer builds, files renamed, etc.
>
> In GNOME we just this cycle landed this patch to use "git clean -dfx"
> instead of "make distclean" if possible:
> https://bugzilla.gnome.org/show_bug.cgi?id=656081
>
> It might be interesting to have an option to run:
> "git init; git add .; git commit -a -m auto-import" on each tarball
> build in OE.  I've been considering doing this for jhbuild.
>
> (My latest build system *only* builds from git repositories, so
>   it works there =) )

While we're not managing the patching w/ git.. we are with quilt.  Does quilt 
have any facilities for restoring to the pristine last copy vs whatever is in 
the current tree?  (I don't think it does BTW.)

--Mark

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



