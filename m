Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0B57C5F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 07:15:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5Q7FfEx012750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 00:15:41 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 00:15:41 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1561465895.git.liezhi.yang@windriver.com>
	<d60c082c2c60c704d0d050c62ee91667c90a4eef.1561465895.git.liezhi.yang@windriver.com>
	<d03b1b52ce889724523ea4bb22b1359cf0fe399d.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5561b251-141e-a276-5100-24df278a4203@windriver.com>
Date: Wed, 26 Jun 2019 15:16:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d03b1b52ce889724523ea4bb22b1359cf0fe399d.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] update-alternatives.bbclass: run update-alternatives firstly in postinst script
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
X-List-Received-Date: Wed, 26 Jun 2019 07:15:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/25/19 10:14 PM, Richard Purdie wrote:
> On Tue, 2019-06-25 at 20:44 +0800, Robert Yang wrote:
>> Recipes like postfix run command newaliases in postinst, but newaliases is
>> installed as newaliases.postfix, it needs run update-alternatives to update it
>> to newaliases, so there was an error when installed postinst on target.
>>
>> Fixed:
>> $ opkg install postfix
>> Configuring postfix.
>> ///var/lib/opkg/info/postfix.postinst: line 4: newaliases: command not found
>>
>> Run update-alternatives firstly will fix the problem. And handle busybox as an
>> exception since it needs set basic tools such as sed command firstly, otherwise
>> update-alternatives doesn't work.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/update-alternatives.bbclass | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
>> index b702e77..9ab9298 100644
>> --- a/meta/classes/update-alternatives.bbclass
>> +++ b/meta/classes/update-alternatives.bbclass
>> @@ -265,6 +265,7 @@ python populate_packages_updatealternatives () {
>>       if not update_alternatives_enabled(d):
>>           return
>>   
>> +    bpn = d.getVar('BPN')
>>       # Do actual update alternatives processing
>>       for pkg in (d.getVar('PACKAGES') or "").split():
>>           # Create post install/removal scripts
>> @@ -284,8 +285,16 @@ python populate_packages_updatealternatives () {
>>   
>>               bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
>>               bb.note('%s' % alt_setup_links)
>> -            postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
>> -            postinst += alt_setup_links
>> +            postinst = d.getVar('pkg_postinst_%s' % pkg)
>> +            if postinst:
>> +                # Busybox needs handle basic tools such as sed command
>> +                # firstly, otherwise, update-alternatives doesn't work.
>> +                if bpn == 'busybox':
>> +                    postinst += alt_setup_links
>> +                else:
>> +                    postinst = alt_setup_links + postinst
>> +            else:
>> +                postinst = '#!/bin/sh\n' + alt_setup_links
>>               d.setVar('pkg_postinst_%s' % pkg, postinst)
>>   
>>               bb.note('%s' % alt_remove_links)
> 
> We don't write classes like this. We could just keep piling special
> cases one on top of the other and it becomes a horrible unmaintainable
> mess. I therefore don't want to see recipes "special cased" like this
> in core code and we need to find another, better way to handle this.

Yes, make sense, I was also worried about. My first fix was in busybox.inc,
but looks a little tricky (Add a populate_packages_updatealternatives_append()
in busybox.inc) to make it work. Please see the V3.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

