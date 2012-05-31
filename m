Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sa8ED-0002r2-3F
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 18:28:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4VGHdol005713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 09:17:39 -0700 (PDT)
Received: from msp-dhcp42.wrs.com (172.25.34.42) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 31 May 2012 09:17:38 -0700
Message-ID: <4FC799A2.2020202@windriver.com>
Date: Thu, 31 May 2012 11:17:38 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
	<CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
In-Reply-To: <CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 16:28:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/12 9:47 AM, Giuseppe Condorelli wrote:
> because the current distribution I manage (not oe based) is rpm based so in my
> intention I want to furnish (for a while) both installtion methods: via oe build
> system and via rpm (chrooted or similar).
> And to do the second I need to have the possibility to access to the dbpath oe
> build system manages during image cretion/installation.
> Adding "package-management" to IMAGE_FEATURES I'll have this available. But it
> includes also target rpm build (honestly I don't need it) that is failing.
> Have new suggestions?

uclibc and glibc are incompatible with each other from a binary perspective. 
I've not seen anyone distribution an RPM based uclibc distribution before.  It's 
always been glibc based -- or some other package method on uclibc due to size 
and dependency requirements.

If you really need rpm (on the target) with uclibc, you'll have to go through 
RPM and all of it's dependencies and patch them for uclibc.  I'm happy to review 
the patches, and I don't see why they wouldn't be accepted into OE-core... but 
it wasn't the expectation when RPM functionality was added and tested.  (ipkg 
was expected to be used with uclibc, or no package manager on the target.)

--Mark

> Many thanks,
> Giuseppe
>
> 2012/5/31 Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>>
>
>     On 2012-05-31 07:57, Giuseppe Condorelli wrote:
>
>         Thanks for the reply,
>         unfortunately I depend from rpm, I need just rpm packages.
>
>
>     Why do you need RPM?
>
>         So can you confirm the target rpm for uclibc is not building?
>         Thanks again,
>         Giuseppe
>
>         2012/5/31 Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>
>         <mailto:raj.khem@gmail.com <mailto:raj.khem@gmail.com>>>
>
>
>         On Thu, May 31, 2012 at 5:35 AM, Giuseppe Condorelli
>         <giuseppe.condorelli@gmail.com <mailto:giuseppe.condorelli@gmail.com>
>         <mailto:giuseppe.condorelli@__gmail.com
>         <mailto:giuseppe.condorelli@gmail.com>>> wrote:
>          > Is there some difference for uclibc? Please let me know.
>
>         opkg works well with uclibc based systems. Those functions are not
>         implemented in uclibc I am sure it can be fixed
>         by linking in other libs or may be creating one. However if you are
>         not bound to rpm then I would suggest to use opkg
>
>         in your local.conf set it
>
>         PACKAGE_CLASSES = "package_ipk"
>
>
>     --
>     ------------------------------__------------------------------
>     Gary Thomas | Consulting for the
>     MLB Associates | Embedded world
>     ------------------------------__------------------------------
>
>
>     _________________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.__openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/__cgi-bin/mailman/listinfo/__openembedded-core
>     <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



