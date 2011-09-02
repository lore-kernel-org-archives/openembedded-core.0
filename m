Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QzHI5-0006on-1A
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 02:07:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8202R5x005855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2011 17:02:27 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 1 Sep 2011 17:02:27 -0700
Message-ID: <4E601D12.6040004@windriver.com>
Date: Thu, 1 Sep 2011 19:02:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
In-Reply-To: <1314914360.5939.574.camel@rex>
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Fri, 02 Sep 2011 00:07:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/1/11 4:59 PM, Richard Purdie wrote:
> On Thu, 2011-09-01 at 20:44 +0100, Phil Blundell wrote:
>> On Thu, 2011-09-01 at 12:25 -0500, Mark Hatle wrote:
>>> On 9/1/11 11:58 AM, Phil Blundell wrote:
>>>> And, I guess, if you want to support online package management then it
>>>> does make some sense to have the shadow utils there.  But I don't
>>>> need/want that in my configuration.
>>>
>>> Does busybox or something else provide a compatible adduser?  If so maybe a
>>> virtual RDEPENDS is more reasonable in this case.
>>
>> I'm not sure offhand (it's actually useradd, not adduser, for what
>> that's worth) but, even if busybox does provide those applets, that
>> probably isn't quite the point.  The issue here is that I don't really
>> want to have any implementation of useradd at all on the target system;
>> using one from busybox would be a bit less bad than requiring standalone
>> shadow, but still not really ideal.
>>
>> One workaround would be to weaken the RDEPENDS to an RRECOMMENDS, which
>> would allow me to declare it as a BAD_RECOMMENDATION.  Or I guess we
>> could make it be a virtual and I could then provide a dummy-useradd
>> package which satisfies the dependency but doesn't actually install any
>> files.  
>>
>> The approach we take with update-rc.d is to let it be installed and then
>> have rootfs_ipk rip it back out again after image construction is done,
>> but this won't work with shadow as it stands due to the postinst issue
>> in that package.  So a third option would be to find a way to finesse
>> the postinst thing somehow and then use the same rootfs_ipk logic with
>> shadow too.
> 
> The latter sounds like what we'll need to do. I haven't looked at shadow
> to see what kind of finessing is required though...
> 
> Does opkg have any notion of bitbake's ASSUME_PROVIDED?

RPM has a mechanism to provide a list of "provided" items.  But there is not
currently any logic to seed that data.  If there is a standard list, it's
something we can add easily enough.

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



