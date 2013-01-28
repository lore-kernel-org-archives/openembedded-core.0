Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TzeQV-0007Sw-AP
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 03:26:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0S2Ajaf011428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jan 2013 18:10:45 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Sun, 27 Jan 2013 18:10:45 -0800
Message-ID: <5105DE37.2090309@windriver.com>
Date: Mon, 28 Jan 2013 10:11:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<680bfa5f6dd8d3a3e77a18240caab373f03b8006.1359014474.git.Qi.Chen@windriver.com>
	<CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
	<1359123271.13917.1.camel@ted>
In-Reply-To: <1359123271.13917.1.camel@ted>
X-Originating-IP: [128.224.163.154]
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 09/12] initscripts: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Mon, 28 Jan 2013 02:26:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2013 10:14 PM, Richard Purdie wrote:
> On Fri, 2013-01-25 at 13:11 +0000, Burton, Ross wrote:
>> On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
>>> +VOLATILE_DIR = "/var/volatile/lib/urandom"
>>> +VOLATILE_LINK = "/var/lib/urandom"
>> A better solution would be to not attempt to save and restore a seed
>> value that is intended to persist across reboots when it's on a tmpfs.
>>   Putting the urandom seed into tmpfs is just a waste of time.
> I have to wonder why we don't put a union mount tmpfs over /var/lib to
> be honest...
>
> or if we don't want to depend on unionfs, a tmpfs over /var/lib...
>
> Cheers,
>
> Richard
>
>
>
A union mount tmpfs over /var/lib (and maybe /etc) was the first 
solution that came into my mind. Then I saw a bug related to unionfs 
about getcwd() call, and I saw the unionfs was still disabled for live 
images. So I thought "maybe I should not use unionfs".

A tmpfs over /var/lib.
Hmm... I thought about that too. The reason that I didn't use this 
method was that I thought that some directories under /etc might also 
need to be written to.
It turns out that this concern seems unnecessary.

Anyway, I'll try out the tmpfs-over-var-lib method and let you know the 
result.

Thanks,
Chen Qi


