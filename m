Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SZjWe-0007mk-17
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:05:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4UDt4gV004885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:55:04 -0700 (PDT)
Received: from msp-dhcp40.wrs.com (172.25.34.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 30 May 2012 06:55:03 -0700
Message-ID: <4FC626B6.70309@windriver.com>
Date: Wed, 30 May 2012 08:55:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337714416.git.mark.hatle@windriver.com>
	<1338379499.20169.140.camel@ted>
In-Reply-To: <1338379499.20169.140.camel@ted>
Subject: Re: [PATCH 00/30] Refactor update-alternatives
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
X-List-Received-Date: Wed, 30 May 2012 14:05:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/12 7:04 AM, Richard Purdie wrote:
> On Tue, 2012-05-22 at 14:30 -0500, Mark Hatle wrote:
>> This set of commits refactors update-alternatives.  The primary purpose
>> is to cover all of the corner cases currently in oe-core (and hopefully
>> other layers) so that recipes can all use the update-alternatives class,
>> instead of manual update-alternatives calls in man post install/remove
>> scripts.
>>
>> The refactored update-alternatives is compatible with the older methods,
>> but does indicate they are deprecated via a warning message.  One of the
>> key changes is that all referenced alternatives are not added to the
>> per-file dependency information.  For example, gawk sets up an
>> alternative for 'awk'.  The /bin/gawk binary now says it provides
>> /bin/awk, so that the package management systems that use per file
>> dependencies (i.e. RPM), will be able to find the minimum set of
>> packages to resolve the image.
>>
>> In addition, to all of that, the references have been changed from
>> ".${PN}" to ".${BPN}" for alternatives.  This will allow the multilib
>> system to work as intended by resolving multilib binaries.
>>
>> All of the work has been tested using buildhistory and building various
>> images.  Buildhistory indicated only expected changes were performed.
>>
>> (To avoid spamming the list, I have decided to only send the first 3
>> patches, lrzsz, busybox, util-linux and shadow-native as this is a
>> reasonable representation of the changes.  Please see the referenced
>> repository and branch below for full details on the series.)
>>
>> *** BLURB HERE ***
>> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
>>
>>    tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib mhatle/upd-alt-2
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/upd-alt-2
>>
>> Mark Hatle (30):
>>    update-alternatives.bbclass: Refactor the implementation
>>    update-alternatives.bbclass: Change from using PN to BPN
>>    which: use BPN for alternatives
>>    wget: use BPN for alternatives
>>    time: use BPN for alternatives
>>    shadow: use BPN for alternatives
>>    sed: use BPN for alternatives
>>    mktemp: use BPN for alternatives
>>    less: use BPN for alternatives
>>    patch: use BPN for alternatives
>>    tinylogin: use BPN for alternatives
>>    sysvinit: use new update-alternatives
>>    lrzsz: use new update-alternatives
>>    openssh: use new update-alternatives
>>    busybox: use new update-alternatives
>>    coreutils: use new update-alternatives
>>    dropbear: use new update-alternatives
>>    ncurses: use new update-alternatives
>>    psplash: use new update-alternatives
>>    util-linux: use new update-alternatives
>>    binutils: use new update-alternatives
>>    tar: use new update-alternatives
>>    opkg: use new update-alternatives
>>    cpio: use new update-alternatives
>>    grep: use new update-alternatives
>>    iputils: use new update-alternatives
>>    psmisc: use new update-alternatives
>>    sysklogd: use new update-alternatives
>>    kmod: use new update-alternatives
>>    shadow-utils-native: remove unnecessary alternatives
>
> Merged to master, thanks.
>
> I've noticed a few issues and this obviously introduces a lot of warning
> messages. I've posted a couple of fixes but we need a plan to get the
> warnings resolved...

I can work through the warnings fairly quickly.  I left them there 
intentionally.  I wanted to proved the deprecated functionality was complete and 
worked as expected.  (I forgot to note that in the original submission.)

If nobody else is working on revising the other items I'll start working through 
them.

--Mark

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



