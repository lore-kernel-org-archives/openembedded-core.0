Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA0DB60190
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:41:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v661fQpl009623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Jul 2017 18:41:26 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 18:41:25 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<35164d05e9ab2505c931424d4b7c7b9fea9c65f8.1499241206.git.kai.kang@windriver.com>
	<1499264918.9571.180.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <165f0567-b31b-966f-5728-4b0d5bd86bf4@windriver.com>
Date: Thu, 6 Jul 2017 09:44:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1499264918.9571.180.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] bind: disable ecdsa if openssl doesn't support it
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
X-List-Received-Date: Thu, 06 Jul 2017 01:41:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月05日 22:28, Richard Purdie wrote:
> On Wed, 2017-07-05 at 15:58 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Distro feature 'openssl-no-weak-ciphers' is introduced to disable
>> openssl weak ciphers support which include ecdsa. So configure bind
>> without ecdsa if openssl doesn't support it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
>> b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
>> index 7eb79b0..e10cffc 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
>> @@ -41,6 +41,7 @@ ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('
>> DISTRO_FEATURES', 'ipv6', 'ye
>>   EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>>                    --disable-devpoll --enable-epoll --with-gost=no \
>>                    --with-gssapi=no --with-ecdsa=yes \
>> +                 --with-ecdsa=${@bb.utils.contains('DISTRO_FEATURES'
>> , 'openssl-no-weak-ciphers', 'no', 'yes', d)} \
>>                    --sysconfdir=${sysconfdir}/bind \
>>                    --with-openssl=${STAGING_LIBDIR}/.. \
>>                  "
>>
> I think there are a few more questions that need answering about this,
> like why ecdsa is considered weak but this patch leaves --with-
> ecdsa=yes  in there which is confusing at best.
>
> I do think these are best controlled as individual PACKAGECONFIG
> options rather than a distro setting which is ambigous (what is
> 'weak').

Maybe I didn't express clearly. The original requirement is that disable 
weak ciphers(maybe we should discuss the scope of weak ciphers)
for openssl. And then other packages depends on openssl. For bind, if 
openssl configured with 'no-ecdsa', bind will compile failed. So add
a distro feature to sync openssl and other packages depends on it.


Thanks,
Kai
>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


