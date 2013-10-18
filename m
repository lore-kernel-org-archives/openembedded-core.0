Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 387276D267
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 15:12:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IFCJCf029558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:12:19 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 08:12:18 -0700
Message-ID: <52614FD4.1030006@windriver.com>
Date: Fri, 18 Oct 2013 10:12:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1382094700-17805-1-git-send-email-ming.liu@windriver.com>	<1382094700-17805-3-git-send-email-ming.liu@windriver.com>
	<1382108376.529.6.camel@phil-desktop.brightsign>
In-Reply-To: <1382108376.529.6.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Fri, 18 Oct 2013 15:12:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/13 9:59 AM, Phil Blundell wrote:
> On Fri, 2013-10-18 at 19:11 +0800, Ming Liu wrote:
>>   pkg_postinst_${PN} () {
>> -	touch $D${sysconfdir}/shells
>> -	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
>> -	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
>> +	if [ ! -f $D${sysconfdir}/shells ]; then

One note with the above check.  Whichever package is responsible for providing 
the 'shells' file needs to be installed -first-.  So anything that manipulates 
the 'shells' file will need an RDEPENDS on that package.

--Mark

>> +		touch $D${sysconfdir}/shells
>> +	fi
>> +
>> +	grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
>> +}
>
> This patch contains significant changes to the postinst script which
> aren't described in the commit message.
>
> p.
>
>> +
>> +pkg_postrm_${PN} () {
>> +	if [ -f $D${sysconfdir}/shells ]; then
>> +		printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
>> +
>> +		if [ ! -s $D${sysconfdir}/shells ]; then
>> +			rm $D${sysconfdir}/shells
>> +		fi
>> +	fi
>>   }
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


