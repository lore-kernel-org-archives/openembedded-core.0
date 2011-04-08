Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q8ElR-0006Gy-4d
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 18:42:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p38GeIrw015807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2011 09:40:18 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.73]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.01.0255.000;
	Fri, 8 Apr 2011 09:40:18 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [poky] Early image startup
Thread-Index: AQHL9e+zAk/6LsnW5kaIYPHzPGDkDpRUa52AgAAFm4CAAAMzAIAAAaCAgAAC44D//7J8kQ==
Date: Fri, 8 Apr 2011 16:40:18 +0000
Message-ID: <3598D5EC-C050-461B-B540-5B20CB79B936@windriver.com>
References: <4D9F0B82.9080803@mlbassoc.com>
	<8B7010C5-9902-4372-BF78-252D85C4BF46@dominion.thruhere.net>
	<1302270609.22904.128.camel@rex>	<4D9F1540.6020902@mlbassoc.com>
	<4D9F169D.9020502@mlbassoc.com>,<4D9F1909.1060403@mlbassoc.com>
In-Reply-To: <4D9F1909.1060403@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: [poky] Early image startup
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
X-List-Received-Date: Fri, 08 Apr 2011 16:42:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As for the rpm ordering this was preserved from an earlier version.  If the=
re is a more appropriate place to run the late configuration scripts, let's=
 move it.  I think that it's likely a good place to move it to soon after t=
he filesystem has been mounted RW.  Do any of the scripts normally require =
networking or other system resources?



On Apr 8, 2011, at 7:18 AM, "Gary Thomas" <gary@mlbassoc.com> wrote:

> On 04/08/2011 08:07 AM, Gary Thomas wrote:
>> On 04/08/2011 08:01 AM, Gary Thomas wrote:
>>> On 04/08/2011 07:50 AM, Richard Purdie wrote:
>>>> On Fri, 2011-04-08 at 15:30 +0200, Koen Kooi wrote:
>>>>> Op 8 apr 2011, om 15:20 heeft Gary Thomas het volgende geschreven:
>>>>>=20
>>>>>> I have a Poky image which uses a number of kernel modules. For
>>>>>> whatever reason, the raw image has not had the modules configured
>>>>>> (no /lib/modules/.../modules.dep) This file is created by 'update-mo=
dules'
>>>>>> but that is run too late in the boot process. The problem is that
>>>>>> other code, e.g. I'm using iptables via modules, requires the module=
s
>>>>>> be configured early and this fails. If I reboot (after 'update-modul=
es'
>>>>>> has run), everything is fine.
>>>>>=20
>>>>> Sound like you need http://patches.openembedded.org/patch/1917/
>>>>=20
>>>> To be honest that sounds like a more fundamental problem as if the use=
r
>>>> cares which rtc should be rtc0, there are other ordering constraints
>>>> being imposed such as a symlink to the "best" rtc device...
>>>=20
>>> Indeed, this patch did not help my situation at all.
>>>=20
>>> I think my problem is that of post-install package scripts (hence
>>> 'Configuring ...') not being run until quite late.
>>=20
>> Looking at the pre-run image, I see that there is /etc/rcS.d/S98configur=
e
>> which runs these scripts. Is there any reason I can't move it earlier?
>=20
> Found it:
>  ipk systems - meta/recipes-devtools/opkg/opkg_0.1.8.bb
>  rpm systems - meta/classes/rootfs_rpm.bbclass
>=20
> Note: the ipk version is quasi-configurable, the rpm version hardwired at=
 98.
> Since these are package install scripts, which presumable could have been=
 run
> at image creation time but needed to run on the target hardware, why put =
it
> off to so late?  I would think that this should be done _first_, not _las=
t_
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


