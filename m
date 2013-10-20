Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8206B108
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 05:50:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9K5oDWv016885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2013 22:50:14 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sat, 19 Oct 2013 22:50:12 -0700
Message-ID: <52636F11.4080102@windriver.com>
Date: Sun, 20 Oct 2013 13:50:09 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@windriver.com>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>	<1382094700-17805-3-git-send-email-ming.liu@windriver.com>
	<1382108376.529.6.camel@phil-desktop.brightsign>
	<52614FD4.1030006@windriver.com>
In-Reply-To: <52614FD4.1030006@windriver.com>
X-Originating-IP: [128.224.162.145]
Subject: Re: [PATCH V3 3/3] bash: add pkg_postrm to remove the entry in /etc/shells
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
X-List-Received-Date: Sun, 20 Oct 2013 05:50:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2013 11:12 PM, Mark Hatle wrote:
> On 10/18/13 9:59 AM, Phil Blundell wrote:
>> On Fri, 2013-10-18 at 19:11 +0800, Ming Liu wrote:
>>>   pkg_postinst_${PN} () {
>>> -    touch $D${sysconfdir}/shells
>>> -    grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> 
>>> $D${sysconfdir}/shells
>>> -    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> 
>>> $D${sysconfdir}/shells
>>> +    if [ ! -f $D${sysconfdir}/shells ]; then
>
> One note with the above check.  Whichever package is responsible for 
> providing the 'shells' file needs to be installed -first-.  So 
> anything that manipulates the 'shells' file will need an RDEPENDS on 
> that package.
Yes, that is a good idea, I will change it as you suggest.

the best,
thank you

>
> --Mark
>
>>> +        touch $D${sysconfdir}/shells
>>> +    fi
>>> +
>>> +    grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo 
>>> ${base_bindir}/bash >> $D${sysconfdir}/shells
>>> +}
>>
>> This patch contains significant changes to the postinst script which
>> aren't described in the commit message.
>>
>> p.
>>
>>> +
>>> +pkg_postrm_${PN} () {
>>> +    if [ -f $D${sysconfdir}/shells ]; then
>>> +        printf "$(grep -v "^${base_bindir}/bash$" 
>>> $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
>>> +
>>> +        if [ ! -s $D${sysconfdir}/shells ]; then
>>> +            rm $D${sysconfdir}/shells
>>> +        fi
>>> +    fi
>>>   }
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


