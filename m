Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65D4265C66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 01:33:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t051Xi60002587
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 4 Jan 2015 17:33:46 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 4 Jan 2015 17:33:44 -0800
Message-ID: <54A9EA06.9090506@windriver.com>
Date: Mon, 5 Jan 2015 09:33:58 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1420337434.git.Qi.Chen@windriver.com>	<24dbafa66cc993d1b626ae27ea3e462c0af54718.1420337434.git.Qi.Chen@windriver.com>
	<54A90364.6060906@topic.nl>
In-Reply-To: <54A90364.6060906@topic.nl>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 3/3] libsm: remove dependency on e2fsprogs
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
X-List-Received-Date: Mon, 05 Jan 2015 01:33:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2015 05:09 PM, Mike Looijmans wrote:
> On 01/04/2015 03:11 AM, Chen Qi wrote:
>> This patch is to solve the following circular dependency problem.
>>
>>       systemd -> dbus -> libsm -> e2fsprogs -> util-linux -> systemd
>>
>> libsm doesn't have any dependency on e2fsprogs. It might be some 
>> dependency
>> on util-linux's libuuid, controlled by configure options. So 
>> e2fsprogs should
>> be removed from the DEPENDS variable.
>>
>> Ideally, we should add a PACKAGECONFIG for 'libuuid' for libsm. 
>> However, if
>> libsm depends on util-linux, we would have the circular dependency 
>> described
>> above. That's why this patch explicitly set '--without-libuuid' in 
>> EXTRA_OECONF.
>> libsm would still be working well because it would fall back to an 
>> internal
>> algorithm to do the uuid stuff.
>
> Maybe libuuid should get its own recipe. It can be built from the 
> util-linux sources. Other packages can then just depend on that 
> libuuid recipe instead of util-linux itself.
>
> Only problem would be util-linux I guess, you'd get two providers for 
> libuuid.
>

I thought about this approach too. I didn't use it because of the 
following reasons.

1) IMHO, we haven't reached a point that a separate libuuid recipe 
becomes a necessity.
     Splitting a recipe may need more compelling reasons.
2) If we are really going to do so, I think we may need an RFC in other 
patches. I don't want to make a patchset regarding package upgrades 
involve too many changes.

Best Regards,
Chen Qi

