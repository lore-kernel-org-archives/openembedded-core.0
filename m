Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id A1CC4608B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 21:14:55 +0000 (UTC)
Received: by pfnn128 with SMTP id n128so84177325pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=M2JMZsg7b2m0ZXf9OLMqGHKuk5JiqX/jrxMeGT/O1DQ=;
	b=Aj8oTpf9vHNU84JwEC3mZ7r8f0Tq2CYrHVVsHeWfue7X+RlUSXPVJDmUSRVbJ3a42g
	icMVUvNzjq/9PcTL7GLvQXgtawDnJ87BHSYHgo9TkQwIRbr1VTgYQpigi6shpHqOH35Q
	BDHYuyyPYN7d2/lTr0Cpm+r8sueJ1ioGo51fKkFQzwQelzRnAKx6aB6hM9vM3tOQL2zR
	RSv5SUoXkbPKQhiSvUCpEDkUdtcb6szJzXkHF0PSz83jUvwatwTaqGdK97poQQri1h7/
	y4L23LwDaXlq7B3ymFCTru1CNaEF15Ntl+GQ7JIK+JK7sO6DnTkI16CKM/+5mDozMCLR
	OYFQ==
X-Received: by 10.98.16.67 with SMTP id y64mr21985597pfi.152.1449954895778;
	Sat, 12 Dec 2015 13:14:55 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b850:fd27:ad42:7471?
	([2601:202:4000:1239:b850:fd27:ad42:7471])
	by smtp.googlemail.com with ESMTPSA id
	w8sm33011409pfi.41.2015.12.12.13.14.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Dec 2015 13:14:54 -0800 (PST)
To: openembedded-core@lists.openembedded.org, anders@chargestorm.se
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
	<1449539278-20070-4-git-send-email-akuster808@gmail.com>
	<20151208074923.GB8707@ad.chargestorm.se>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <566C8E4C.102@gmail.com>
Date: Sat, 12 Dec 2015 13:14:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151208074923.GB8707@ad.chargestorm.se>
Subject: Re: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Sat, 12 Dec 2015 21:14:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 12/07/2015 11:49 PM, Anders Darander wrote:
> Hi,
> 
> * Armin Kuster <akuster808@gmail.com> [151208 02:49]:
> 
>>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> I'm just a little curious about this serious, and a few others that I've
> seen recently. They all add a number of CVE-patches, with one commit per
> patch, and as the last commit, they all get added to SRC_URI in a single
> patch.
> 
> What's the reason to do it like this? i

Each CVE patch can be leveraged independently so back porting to other
branches is simpler and less work.  The recipe file is  where merge
conflicts will occur. Not all CVE's are weighted the same so someone who
has a product in the field can easily cherry pick the CVE's they want or
need. This was talked about on IRC a few weeks ago.

> 
> I'd personally prefer to have each CVE-path also add the patch to
> SRC_URI, as that make cherry-picking more straightforward. And it also
> ensures that if we have a need to bisect some issue, that'll work. At
> the same time that will make the meta-data consistent, i.e. no dead
> patches.
> 
> I'd personally even prefer that whole series squashed to one commit,
> compared to this adding a lot of un-applied patches.

That would add more overhead to the work I do internally as I need them
in the format you have seen here.

Are this patches not in the preferred method as described on wiki?

Regards,
- armin

> Any comments on this?


> 
> Cheers,
> Anders
> 
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> index fd56841..3864e88 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> @@ -37,6 +37,10 @@ SRC_URI += "file://configure-targets.patch \
>>              file://crypto_use_bigint_in_x86-64_perl.patch \
>>              file://openssl-1.0.2a-x32-asm.patch \
>>              file://ptest_makefile_deps.patch  \
>> +            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
>> +            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
>> +            file://0001-Add-test-for-CVE-2015-3194.patch \
>> +            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
>>             "
> 

