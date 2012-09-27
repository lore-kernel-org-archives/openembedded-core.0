Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1THMxy-0003Cn-2V
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 00:53:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8RMf40Z017358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 15:41:04 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 27 Sep 2012 15:41:04 -0700
Message-ID: <5064D5FF.2050409@windriver.com>
Date: Thu, 27 Sep 2012 17:41:03 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120927142926.CA9C5103AC@opal>
	<20120927153419.GD3454@jama.jama.net>
	<20120927175531.GF3454@jama.jama.net>
	<CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
In-Reply-To: <CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Thu, 27 Sep 2012 22:53:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Just an FYI -- Martin Jansa found a problem with the implement of the package 
version comparison.

In deb and ipk, they do not support '<' or '>', instead it's '<<' and '>>'. 
(Odd, historical reasons apparently).

While RPM doesn't have any idea what '<<' or '>>' is.

Talking with RP and others it seems like the best approach is to implement a 
conversion, in the deb and ipk packaging classes, to convert '<' and '>' to the 
'<<' and '>>' equivalents.  As well as add a sanity check that nobody is using 
'<<' or '>>'.

I'm in the process of doing that now.

--Mark

On 9/27/12 1:08 PM, Otavio Salvador wrote:
> On Thu, Sep 27, 2012 at 2:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Thu, Sep 27, 2012 at 05:34:19PM +0200, Martin Jansa wrote:
>>> On Thu, Sep 27, 2012 at 02:29:25PM +0000, git@git.openembedded.org wrote:
>>>> Module: openembedded-core.git
>>>> Branch: master
>>>> Commit: ed0216d29fc4355c5220f3ad51df04a63cacb0c3
>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=ed0216d29fc4355c5220f3ad51df04a63cacb0c3
>>>>
>>>> Author: Martin Jansa <martin.jansa@gmail.com>
>>>> Date:   Sat Sep 22 19:13:14 2012 +0200
>>>>
>>>> xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
>>>>
>>>> * it doesn't make much sense with PV, because xserver-xorg-module-exa
>>>>    was introduced in
>>>>    http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66
>>>>    so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<= 1.11.2-r4)
>>>>    and (< 1.11.2) is not good enough
>>>>
>>>> * because we don't know how many PRINC are in BSP/DISTRO layers,
>>>>    then it's safer to RCONFLICTS with every older version then current
>>>>    EXTENDPKGV
>>>>
>>>> Also fixes whitespace to work correctly with opkg
>>>
>>> The whitespace problem wasn't opkg fault AFAIK, but
>>> bb.utils.explode_dep_versions as shown in
>>> http://patchwork.openembedded.org/patch/37069/
>>
>> Ah and it was meant to be applied together with this patch, so now it's
>> missing PR bump..
>
> It keeps failing for me.
>



