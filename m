Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RuVbr-0003Z2-1v
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 21:56:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q16KmJa7029587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 12:48:20 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Feb 2012 12:48:19 -0800
Message-ID: <4F303C92.8050706@windriver.com>
Date: Mon, 6 Feb 2012 14:48:18 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios>
	<1328543751.14363.11.camel@phil-desktop>
	<4F302D77.7030902@balister.org>
	<1328559652.2716.217.camel@x121e.pbcl.net>
In-Reply-To: <1328559652.2716.217.camel@x121e.pbcl.net>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q16KmJa7029587
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 20:56:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2/6/12 2:20 PM, Phil Blundell wrote:
> On Mon, 2012-02-06 at 14:43 -0500, Philip Balister wrote:
>> On 02/06/2012 10:55 AM, Phil Blundell wrote:
>>> On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
>>>> I talked to Koen at FOSDEM and apparently he prefers having a symlin=
k rather
>>>> than a copy for the timezone file. I can't express an opinion one wa=
y or
>>>> another but it sounds like this one aspect still needs to be resolve=
d - should
>>>> this be selectable?
>>>
>>> I guess this is all bound up with the "/usr on a separate partition"
>>> thing.  If your position is that the root filesystem is meant to work
>>> without /usr mounted then having /etc/localtime be a symlink
>>> into /usr/share is probably not going to fly.  Conversely, one were t=
o
>>> take the view that any reasonable system in the 21st century is going=
 to
>>> have / and=CC=A3 /usr on the same device, making it be a symlink woul=
d be a
>>> fine idea.
>>>
>>> I think probably the right answer is to make "1970s-usr" be a
>>> DISTRO_FEATURE and then the timezone recipes (and others) can adapt
>>> themselves accordingly.
>>
>> Does anyone use a system where /usr is on a separate partition?
>
> I'm not aware of any systems that work that way, but I do know that
> there have been some patches submitted recently (by Intel folks I think=
)
> to move files around in order to avoid binaries in / linking against
> shared libraries in /usr.  Presumably the fact that they're running int=
o
> these issues indicates that they've got some systems which are using
> that sort of filesystem configuration.
>
> And, given that the idea of a separate /usr does still have some
> currency in the Unix world, it doesn't seem unreasonable for oe-core to
> support it.  But equally, where that support carries a cost, I think it
> would make sense for there to be an easy way for DISTROs to opt out of
> it.  Obviously in the case of micro the idea of a separate /usr is
> meaningless, but I imagine there are plenty of folks who would want to
> keep the /usr filesystem layout but don't need to take special measures
> to cope with it being on a different storage device.

All existing patches should support / and "usr" being merged as in the mi=
cro=20
system design.  If that doesn't work, it's an error in the recipe integra=
tion.

With that said, a check was added to the oe-core a while back to generate=
 a=20
warning with a shared library, or shell script "obviously" referenced an =
item=20
from /bin, /sbin, /lib to /usr/*.  Both of which are warnings.  On a syst=
em=20
where there is no /usr  (i.e. execprefix is "/") then no warnings are giv=
en.

The issue that needs to be solved is that there is no reason this shouldn=
't=20
work.  Things need to be adjusted so the right files are on the right=20
partitions, and beyond that the system is still functional.  (Definition =
of=20
function to -me- is can minimally boot and get to a shell... there should=
 be=20
enough there to mount /usr and enable a full system -- if /usr is a separ=
ate=20
partition.)

My personal expectations are that /bin, /sbin, /etc, and /lib are all on =
"/".=20
Anything else can be mounted from virtual systems or actual partitions.  =
I do=20
agree the majority of designs these days will have most if not all items =
on the=20
same partition.  (Possible exception of some /var elements.)

The problem with my expectations though.. we can automatically check for =
the=20
things we already do.. (symlinks and above greps).  But what we can't eas=
ily=20
check for is things being dynamically loaded or run from say the init pro=
gram.=20
These are the true "bugs" that I see in the system.  Things we need to fi=
gure=20
out and resolve.

In the end it's going to enable a more configurable system.  Nothing bein=
g done=20
to support this should ever preclude a system with a single partition or =
a=20
system where base_prefix and exec_prefix are equal.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



