Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TbjpQ-0002fW-RM
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 04:21:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAN378S8016949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Nov 2012 19:07:09 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 22 Nov 2012 19:07:08 -0800
Message-ID: <50AEE869.7010801@windriver.com>
Date: Fri, 23 Nov 2012 11:07:21 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1353311649.git.Qi.Chen@windriver.com>
	<442aa8576f4be75369fe4068794573f257a4d083.1353311649.git.Qi.Chen@windriver.com>
	<1353413229.23758.5.camel@ted>
In-Reply-To: <1353413229.23758.5.camel@ted>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] mdadm: make udev rules dir configurable
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
X-List-Received-Date: Fri, 23 Nov 2012 03:21:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2012 08:07 PM, Richard Purdie wrote:
> On Tue, 2012-11-20 at 17:34 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi<Qi.Chen@windriver.com>
>>
>> mdadm hardcodes the udev rules dir to be '/lib/udev/rules.d'.
>> However, udev configs its base library directory to be ${base_libdir}
>> instead of '/lib'. Thus if the target has powerpc64 architecture,
>> the mdraid.rules file will be missing on the target, as the library
>> directory is 'lib64'.
>>
>> This patch makes the udev rules dir of mdadm configurable, so that
>> the mdraid.rules file will not be missing on any target.
>>
>> [YOCTO #2804]
> This is a bit of a tricky one. I suspect in this case we need to install
> all the udev rules to one place and have an udev look in that place,
> regardless of which multilib it was compiled for.
>
> We already have this problem with systemd_unitdir. I think we need to do
> something like set:
>
> nonarchlib = "/lib"
>
> and then use this value in places where we want it to be invariant (yet
> still allow the layout to be configurable).
>
> So your patch starts to help with this but there is more we need to do.
>
> Cheers,
>
> Richard
>
>
Hi Richard,

Do you mean that what needs to be fixed is udev instead of mdadm?
Should I rework on this patch?

Thanks,

Chen Qi


