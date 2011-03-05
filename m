Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pvi3f-0008Tj-8u
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Mar 2011 04:21:33 +0100
Received: by pxi17 with SMTP id 17so409888pxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 19:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=8Hug/v8MisYoAFrjngSQ5K7StGa2WU6rc9dRu4x/m64=;
	b=vZiTqmQHeFjub1FGbd6EygvyHUmNShNhZi+Q3bI5XuzNjEZByZxC7z3gER6ZiDxQs0
	xQpsZRdwqqzml4SBsPc7JbqAxdR6EB7/bLX8YmqGEn+Xn9My0bsl7BQFoMcd+5TwlPnO
	zfYCyNsLhbf9YO8JTG7fS8X6x6y5xY2J7pWzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=LGnR9rhpif6wu5WZrHk9AZqWdJKS2FqtG9yJMrSYevc/530FT7pGNHi4QiPQjdlebF
	5A8cAOHmhdsHqRg301kHbOZOTIrxy/73rcOdTy5h+EdXAODl6MgX1fJbXtN4xJKPKehU
	iTALGlbua9gRR3bxex+aGghg7lo4/7YkL8rls=
Received: by 10.142.195.3 with SMTP id s3mr1056112wff.22.1299295192533;
	Fri, 04 Mar 2011 19:19:52 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d35sm147792wfj.9.2011.03.04.19.19.50
	(version=SSLv3 cipher=OTHER); Fri, 04 Mar 2011 19:19:51 -0800 (PST)
Message-ID: <4D71ABD3.1080804@gmail.com>
Date: Fri, 04 Mar 2011 19:19:47 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1299276952-24941-1-git-send-email-Martin.Jansa@gmail.com>
	<A78CAF16-DD5D-4D87-803C-313D07290422@dominion.thruhere.net>
In-Reply-To: <A78CAF16-DD5D-4D87-803C-313D07290422@dominion.thruhere.net>
Subject: Re: [PATCH] distutils-base: Only RDEPEND python-core on target packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Mar 2011 03:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/2011 2:41 PM, Koen Kooi wrote:
>
> Op 4 mrt 2011, om 23:15 heeft Martin Jansa het volgende geschreven:
>
>> * fixes ie setuptools, without this patch it RDEPENDs on python-core-native, which is not RPROVIDED by anything
>> * imported from OE 8377b8ec57f35b9e5b81a74c77f68fd6e02949c8
>>
>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> ---
>> meta/classes/distutils-base.bbclass |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
>> index 2e151de..e84b0fc 100644
>> --- a/meta/classes/distutils-base.bbclass
>> +++ b/meta/classes/distutils-base.bbclass
>> @@ -1,5 +1,5 @@
>> DEPENDS  += "${@["python-native python", ""][(bb.data.getVar('PACKAGES', d, 1) == '')]}"
>> -RDEPENDS += "python-core"
>> +RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
>
> Minor nit: the two check seem to do the same, should we make them the same?
>

Do you mean checks for DEPENDS and RDEPEND_${PN}

> For this patch:
>
> Acked-by: Koen Kooi<koen@dominion.thruhere.net>
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



