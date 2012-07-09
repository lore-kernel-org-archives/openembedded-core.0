Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1So61r-0002XS-JO
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 06:56:59 +0200
Received: by eaal1 with SMTP id l1so3919401eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 21:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=vDv+5OEQtq6+OweRkk0qAS+U0VeQmNzrkXLgL9veJ9A=;
	b=MPOwyKMWqJLX8I7z+ZImkYu1zRZBZuHoowF+FfRr5DzbTzwTsf/UmQo1UAv13NlO3B
	KnkU0E7zrLhWDPfX6WeVneHtISZ7Yyh7nHJ7xNBg+d3wHLhS6ljXOzoqG+Ioh1lXoeT7
	lExNEDaqbcs1v07wk0NQMq8sztAbBc6eOesbuKbLjK63I5kqWY3bOa3JpXgWB5+tZ4pJ
	GCi91Jqm+8GWxxPBfC88cc9NOGHN7QTHfcqEHJFCPhngZcRofQH6irsJRg9MG3oFU6vV
	gukKPHSmB6edxldQO6vj9Bh7/clUc3jizYo5ef/jsUf0qgcxR0x2T16/JlSPY3hxOs5J
	OuxQ==
Received: by 10.14.95.138 with SMTP id p10mr9392185eef.110.1341809150698; Sun,
	08 Jul 2012 21:45:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Sun, 8 Jul 2012 21:45:20 -0700 (PDT)
In-Reply-To: <CADL+O9vNrqgVcwHOCbtFTUAV3fOe3hnH5PwGK96+fGgQKQcV1g@mail.gmail.com>
References: <1341615750-25579-1-git-send-email-iyadkq@gmail.com>
	<20120707023136.GH3708@jama.jama.net>
	<CADL+O9vNrqgVcwHOCbtFTUAV3fOe3hnH5PwGK96+fGgQKQcV1g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jul 2012 21:45:20 -0700
Message-ID: <CAMKF1so_NssDgXZcJyB8poXfKhhOyFRg+PYJ8jeQjzg5XxSfQg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATH] fix build failure due to lic_files_chksum mismatch. The correction unpacks the source in the correct directory.
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
X-List-Received-Date: Mon, 09 Jul 2012 04:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 8, 2012 at 8:39 PM, Iyad Qumei <iyadkq@gmail.com> wrote:
>>
>> This is default, so it shouldn't change anything (and it checks
>> lic_files fine here).
>
> in my case, the error is caused by the fact the oe-core is setting up
> the work-directory under i586-xx ( the architecture area ) while the
> unpacking was done in qemux86-xxx ( the machine area ).

interesting scenario. Recipe does use MACHINE variable during
do_install which essentially makes this recipe
machine specific so  I would expect it to build completely under the
machinedir. Case you are explaining above
is strange. I wonder if you have some bbappend which is changing some
properties.

 The only way
> to fix it was to explicitly define the S= in the recipe.
>

the patch is not needed since S is set to WORKDIR/P by default.

> Thanks for the feedback.
> Iyad
>
> On Fri, Jul 6, 2012 at 7:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Fri, Jul 06, 2012 at 04:02:30PM -0700, Iyad Qumei wrote:
>>> Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
>>> ---
>>>  meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
>>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
>>> index 3aea874..ad80ef6 100644
>>> --- a/meta/recipes-core/netbase/netbase_5.0.bb
>>> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
>>> @@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
>>>  SECTION = "base"
>>>  LICENSE = "GPLv2"
>>>  LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>>> -PR = "r0"
>>> +PR = "r1"
>>>
>>>  inherit update-rc.d
>>>
>>> @@ -17,6 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
>>>             file://interfaces \
>>>             file://nfsroot"
>>>
>>> +S = "${WORKDIR}/${P}"
>>> +
>>
>> This is default, so it shouldn't change anything (and it checks
>> lic_files fine here).
>>
>> Cheers,
>>
>>>  SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
>>>  SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
>>>
>>> --
>>> 1.7.4.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


