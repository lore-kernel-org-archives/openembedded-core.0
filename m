Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A412478EFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 14:23:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7AEMxXQ024632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Aug 2018 07:23:15 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 10 Aug 2018 07:22:52 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1533888808.git.kai.kang@windriver.com>
	<8aa373833d3e5f54689b8863f864c39dc90e5cab.1533888808.git.kai.kang@windriver.com>
	<fdafcc6cdd7abfa519ae59df871a844a07103e3f.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <54589b8c-b04f-3139-8b22-2b7781394bb7@windriver.com>
Date: Fri, 10 Aug 2018 22:20:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <fdafcc6cdd7abfa519ae59df871a844a07103e3f.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Fri, 10 Aug 2018 14:23:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月10日 17:24, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-08-10 at 16:14 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Some allarch packages rdepends non-allarch packages. When multilib is
>> used, it doesn't expand the dependency chain correctly, e.g.
>>
>> core-image-sato -> ca-certificates(allarch) -> openssl
>>
>> we expect dependency chain for lib32-core-image-sato:
>>
>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
>>
>> it should install lib32-openssl for ca-certificates but openssl is
>> still wrongly imported.
>>
>> Disable allarch when multilib is used.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/classes/allarch.bbclass         | 4 ++++
>>   meta/classes/icecc.bbclass           | 2 +-
>>   meta/classes/multilib.bbclass        | 3 ++-
>>   meta/classes/multilib_global.bbclass | 4 +---
>>   meta/classes/package.bbclass         | 9 ++++++---
>>   meta/classes/staging.bbclass         | 2 +-
>>   6 files changed, 15 insertions(+), 9 deletions(-)
> Looks good at a quick glance, I'll put it in for testing.
>
> Since I just saw it for other reasons, could you also see if we could
> remove the ${DEPLOY_DIR_RPM}/noarch/ mentioned as:
>
> # For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
> SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"
>
> from sstate.bbclass please?

OK. I'll check it.

Regards,
Kai


>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


