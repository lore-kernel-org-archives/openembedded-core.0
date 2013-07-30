Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D68E6B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 05:23:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6U5NuWl018229
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jul 2013 22:23:56 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 29 Jul 2013 22:23:56 -0700
Message-ID: <51F74DF3.9020602@windriver.com>
Date: Tue, 30 Jul 2013 13:24:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<6e09df864b4a870ac23c7e443dfee302962b811b.1375065009.git.Qi.Chen@windriver.com>
	<CAJTo0LZNX0DXiZVu6cL+7dEbD77g1c6KPj7XXT59VV6Tm4sX4g@mail.gmail.com>
In-Reply-To: <CAJTo0LZNX0DXiZVu6cL+7dEbD77g1c6KPj7XXT59VV6Tm4sX4g@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 10/10] openssh: make /etc/ssh directory writable in read-only rootfs
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
X-List-Received-Date: Tue, 30 Jul 2013 05:23:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2013 11:59 PM, Burton, Ross wrote:
> On 29 July 2013 03:33,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> If the rootfs is read-only and the ssh keys are not available at system
>> start-up, the init script will generate ssh keys into /etc/ssh, thus
>> causing a 'read-only file system' error.
>>
>> Make this directory writable in case of a read-only rootfs.
>> Note that if the ssh keys are pregenerated, they will not be lost,
>> as there's a copying process before bind mounting.
> I'm not very keen on the idea of every oe-core system having a tmpfs
> on /etc/openssh just for read-only-root configurations

I agree, especially when the configuration is not likely to change at 
runtime.

>   where there
> isn't a pre-generated key.
>
> At least one better option would be to handle the read-only / with no
> pre-generated keys situation in the init script, and write keys to
> /run.
For now, I want to use the following logic.

If the rootfs is not read-only, everything remains the same as before.

If the rootfs is read-only and there are pre-generated keys under 
/etc/ssh, we use the pre-generated keys. The pre-generated keys are 
mainly for debugging or development purpose.

If the rootfs is read-only and there are no pre-generated keys under 
/etc/ssh, we use /var/run/ssh as the location for ssh keys. That is, at 
system boot-up, the generated ssh keys will be put into /var/run/ssh.

What do you think about it? If it's OK, I'll send out a V3.

Best Regards,
Chen Qi



