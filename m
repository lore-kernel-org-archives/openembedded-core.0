Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36DE86D64B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 03:19:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBB3J0wJ010504
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:19:00 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 10 Dec 2013 19:19:00 -0800
Message-ID: <52A7D9D7.1090408@windriver.com>
Date: Wed, 11 Dec 2013 11:19:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1386669285.git.Qi.Chen@windriver.com>	<51a89b7ff6efb35278daf3373040434a9673dba8.1386669285.git.Qi.Chen@windriver.com>
	<3004077.UQdCbJxAtD@helios> <52A734FC.4020306@windriver.com>
In-Reply-To: <52A734FC.4020306@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 2/3] image.bbclass: remove zap_root_password
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
X-List-Received-Date: Wed, 11 Dec 2013 03:19:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2013 11:36 PM, Mark Hatle wrote:
> On 12/10/13, 6:15 AM, Paul Eggleton wrote:
>> Hi Qi,
>>
>> On Tuesday 10 December 2013 17:58:51 Qi.Chen@windriver.com wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> This function replaces the root password with '*' if 'debug-tweaks'
>>> is not in IMAGE_FEATURES. As a result, if we don't have 'debug-tweaks',
>>> we would be locked out of the system. That means, if the user uses a
>>> bbappend file for base-passwd to set the root password, he would not be
>>> able to login as root; if the user uses 'EXTRA_USERS_PARAMS' to set
>>> the root password, he would still not be able to login as root.
>>>
>>> In a word, this function should be removed to make things work 
>>> correctly.
>>
>> Er, unless I'm missing something about what you're adding in the 
>> other patch,
>> you *cannot* simply remove this. The intentional design of the 
>> existing code
>> is that having "debug-tweaks" in IMAGE_FEATURES means that you can 
>> log in as
>> root with no password; but most importantly if "debug-tweaks" is not 
>> present
>> you cannot log in at all as root (in the absence of anything that 
>> sets the
>> root password, of course). Any changes must preserve this behaviour.
>
> I agree.  The default behavior on most systems should be absolutely no 
> way to directly login as root.  Instead logins should occur based on a 
> non-privileged user.  (The other patches in that set look good to me.)
>
> --Mark
>
>> Cheers,
>> Paul
>>
>

Mark & Paul,

Thanks for your explanation.

I think what we really want is to disallow *empty* root password if 
'debug-tweaks' is not in IMAGE_FEATRUES. And if the root password has 
already been set (via bbappend file or via EXTRA_USERS_PARAMS), we 
should not zap that password. Maybe the function should be 
zap_empty_root_password?

What do you think?

Best Regards,
Chen Qi

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


