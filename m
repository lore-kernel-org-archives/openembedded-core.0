Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 6987577EA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:08:01 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7NC7xZ3004985
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 23 Aug 2017 14:08:00 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v7NC7mFf024843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Aug 2017 14:07:49 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
	<dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
Message-ID: <1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
Date: Wed, 23 Aug 2017 14:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Wed, 23 Aug 2017 12:08:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hello Richard,

I have found out that even master with HOSTTOOLS does not fix my problem.
We use ASSUME_PROVIDED for ca-certificates-native due to corporate
environment CAs.
Since nativesdk-ca-certificates depends on ca-certificates-native which
is not built, so it could not be found.
Unfortunately adding update-ca-certificates to HOSTTOOLS is not working,
since build user does not have permissions to modify system CAs and also
is in /usr/sbin/ which is not in usual system path.

Therefore I think that this patch applies for master branch, too.
Possible improvement would be also removing ca-certificates-native from
DEPENDS of class-nativesdk.

Solution of installing corporate CAs within OE recipe does not seem to
be ideal, because the CAs have short expiration date. So using system
CAs assures reachability of resources over https.
We had to do this because svn fetcher uses https without option to
ignore errors (unlike wget which ignores certificates by default).

Regards,
Andrej

On 08/21/2017 08:12 AM, [ext] Andrej Valek wrote:
> Hello Armin,
> 
> Could You please merge it into krogoth and morty branch?
> 
> @Randy: last commit into those branches was ~5weeks ago, so they are
> still maintained.
> 
> Regards,
> Andrej
> 
> On 08/18/2017 05:46 PM, Randy MacLeod wrote:
>> On 2017-08-18 06:05 AM, Andrej Valek wrote:
>>> OK thank You, so please merge it into these branches.
>>
>> Add Armin, who maintains those branches:
>>     https://wiki.yoctoproject.org/wiki/Releases
>> Is Krogoth still maintained? It's listed at Stable in the link above.
>>
>> ../Randy
>>
>>
>>
>>>
>>> Regards,
>>> Andrej
>>>
>>> On 08/18/2017 11:35 AM, Richard Purdie wrote:
>>>> On Fri, 2017-08-18 at 08:26 +0200, Andrej Valek wrote:
>>>>> Yes, for actual branch is not required. But for branches like krogoth
>>>>> and morty, where HOSTTOOLS is not implemented, is this necessary.
>>>>
>>>> Lets just apply this to krogoth/morty then...
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>
>>

