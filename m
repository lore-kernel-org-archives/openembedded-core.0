Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7BAD73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 02:24:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8F2OjYf025783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Sep 2016 19:24:45 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 19:24:45 -0700
To: "Bystricky, Juro" <juro.bystricky@intel.com>, Seebs <seebs@seebs.net>,
	"Fan, Wenzong (Wind River)" <wenzong.fan@windriver.com>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
	<b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
	<BDCB4B3D-E034-4AFD-915C-8DDE5B66D76D@seebs.net>
	<c4af9282-ed95-b7fc-f263-4a66eccfa4bf@windriver.com>
	<9478781A-C1DD-46F5-B447-04D324E9EBA6@seebs.net>
	<6E51916E4A1F32428260031F4C7CD2B61188FFD1@ORSMSX112.amr.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <749c93dd-be45-76d7-921e-f8efd37223bd@windriver.com>
Date: Wed, 14 Sep 2016 22:24:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61188FFD1@ORSMSX112.amr.corp.intel.com>
X-Originating-IP: [172.25.44.6]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Thu, 15 Sep 2016 02:24:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-14 04:46 PM, Bystricky, Juro wrote:
> I am pretty sure I glimpsed the messages:
> 	Child process timeout after 2 seconds.
>     	Child process exit status 4: lock_held
> on several occasions recently, just before my Xserver was restarted and I was kicked back to the login prompt.
> I typically ran several parallel bitbake builds. Ubuntu 16.04, not using container. The last message in the syslog (first error message) was always:
> Fatal IO error 11 (Resource temporarily unavailable) on X server :0
>
> Possibly not related to this problem, nevertheless worth mentioning.

Yes, it may be. Thanks for reporting it.

Two  weeks ago, I was building a qemuarm64 image on my laptop
(i7, 16 GB, SSD running Ubuntu-16.04)
and I saw a similarity bizarre result from running a build
in that chrome and then the X server were both killed.
I wasn't in front of the system when this happened so
I can't say exactly what was going on.

I did collect some of the logs from my IRC client and chrome:


[423679.028437] konversation[23416]: segfault at 7f72d2c33ce0 ip 
00007f72eca4e818 sp 00007ffc7f450ae0 error 4 in 
libQt5Gui.so.5.5.1[7f72ec8da000+527000]
[423679.325315] chrome[28083]: segfault at 968 ip 00007f63f7615643 sp 
00007ffd26c25af0 error 4 in libX11.so.6.3.0[7f63f75ed000+135000]


and then from the X server:

Aug 29 16:11:59 laptop org.a11y.atspi.Registry[4763]: XIO:  fatal IO 
error 11 (Resource temporarily unavailable) on X server ":0"
Aug 29 16:11:59 laptop org.a11y.atspi.Registry[4763]:       after 67649 
requests (67649 known processed) with 0 events remaining.
Aug 29 16:11:59 laptop gnome-session[4748]: (diodon:4925): Gdk-WARNING 
**: diodon: Fatal IO error 11 (Resource temporarily unavailable) on X 
server :0
.
...
Aug 29 16:11:59 laptop systemd[1]: Started Process Core Dump (PID 
28084/UID 0).
Aug 29 16:11:59 laptop gnome-session[4748]: Failed to connect to Mir: 
Failed to connect to server socket: No such file or directory
Aug 29 16:11:59 laptop kernel: [423679.325315] chrome[28083]: segfault 
at 968 ip 00007f63f7615643 sp 00007ffd26c25af0 error 4 in 
libX11.so.6.3.0[7f63f75ed000+135000]



In my case, I had added meta-oe to oe-core and was building:
    MACHINE=qemuarm64 bitbake imagemagick

I reproduced it once in X then did NOT see it happen when
I built with an X session running but building on the console.
i.e. the build of imagemagick for qemuarm64 succeeded.

I've removed the build logs it seems but I'll see if I can reproduce
the failure overnight.

../Randy

>
> Thanks
>
> Juro
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Seebs
>> Sent: Tuesday, September 6, 2016 11:40 PM
>> To: Fan, Wenzong (Wind River) <wenzong.fan@windriver.com>
>> Cc: Patches and discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] pseudo 1.8.1 doesn't work with docker & dumb-init
>>
>> On 7 Sep 2016, at 1:32, wenzong fan wrote:
>>
>>> Yes, I believe it's not a 100 reproducible issue. Maybe you could run
>>> it with other builds in parallel and try it 3 times or more.
>>
>> I can try, but that might need bigger hardware than I have to hand at
>> the moment.
>>
>> -s
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

