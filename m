Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D18BD78366
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 05:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AC60A18512
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yioyZ8Xw5B9R
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:48 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1E4A918399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06CCA1E06E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F03D21E06A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:47 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:47 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id E48ED1A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 07:12:47 +0200 (CEST)
Received: from [10.94.62.1] (10.0.5.60) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 16 Jun 2017 07:12:48 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
	<1497432535.3942.40.camel@linuxfoundation.org>
	<a7b43ac4-0c9a-b6df-bd97-3a0de1d1be47@axis.com>
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
Message-ID: <23486835-eebd-890a-4698-9599dfb787e1@axis.com>
Date: Fri, 16 Jun 2017 07:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <a7b43ac4-0c9a-b6df-bd97-3a0de1d1be47@axis.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Fri, 16 Jun 2017 05:12:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2017 01:35 PM, Tobias Hagelborn wrote:
> On 06/14/2017 11:28 AM, Richard Purdie wrote:
>> On Wed, 2017-06-14 at 08:24 +0200, Tobias Hagelborn wrote:
>>> New devtool deploy-target option --strip which enables deploying
>>> stripped binaries, saving some space on target.
>>>
>>> * Copies the files of ${D} into a new directory and strips them in
>>> place
>>> * Based on sysroot_strip from staging.bbclass
>>> * Added devtool.conf option "strip" for changing default behavior
>>> * Added .ko strip support compared to original function sysroot_strip
>>
>> This looks very like the original strip function. Would it be possible
>> to create one generic strip function in lib/oe which we could call from
>> the various places rather than duplicating this again?
>>
>> (I think staging.bbclass and lib/oe/package.py:runstrip() are already
>> similar code).
>>
>> Cheers,
>>
>> Richard
>>
> I did think if this but I felt these are quite central functions and I
> didn't have enough tests locally to cover for those classes (staging /
> package)
>
> I can supply another version of this patch where the strip function is
> merged into lib/oe.
>
> //Tobias

It should be fairly straightforward to do for staging.bbclass.
I also looked into package.bbclass which has a similar one 
(split_and_strip_files) but that one is very convoluted with the package 
splitting so I want to leave that one for now.

