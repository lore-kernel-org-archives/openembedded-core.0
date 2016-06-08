Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 028906057B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:05:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u58G5AFn011929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2016 09:05:10 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 8 Jun 2016 09:05:10 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1465381435600.39214@gin.de>
	<02b101d1c184$93336d80$b99a4880$@neuf.fr> <1465400599707.30401@gin.de>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <2ed9a471-32c1-5ec1-b5e1-fb019afa1dc2@windriver.com>
Date: Wed, 8 Jun 2016 11:05:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1465400599707.30401@gin.de>
Subject: Re: [PATCH] smartpm: Don't ignore error if RPM transaction fails without problems
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
X-List-Received-Date: Wed, 08 Jun 2016 16:05:13 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/8/16 10:43 AM, Klauer, Daniel wrote:
> Hello,
> 
>> You also need to add another check just before raising the error, or you
>> would end up getting an "unknown error" raised there.
>> I basically replaced:
>> -        if (probs is not None) and (not retry):
>> +       if (probs is not None) and ((len(probs) != 0) or not
>> sysconf.has("attempt-install", soft=True)) and (not retry):
> 
> Hmm, it sounds like the attempt mode wants to ignore installation failures
> (empty problems list) like before the patch, which makes sense to me. Afterall,
> attempt mode wants to try installation and ignore failures. So it seems good to
> fix this regression too.
> 
> However, I wonder why it never ignored a non-empty problems list, which would
> also trigger an error. Maybe that case just never happens in practice, because
> it's always just file conflicts. Those trigger a retry, which prevents the error
> from being raised.
> 
>> BUT reflecting on the whole scheme, I'm wondering how it will work in case
>> of file found conflict, since the problem package gets removed from the
>> list, but the list is committed again, with most packages already
>> installed...

File conflicts are discovered prior to the transaction being committed
(installation time).  Problems reported during installation are 'different' (and
generally do not happen).  I'm not sure if a pre/post install failure, bad
package (signature or otherwise) or whatever would do here.  I'm not sure it's
been tested.

(The items above can't generally happen based on the way the system is designed..)

--Mark

>> I therefore wonder that there could be the same error that I got in the end,
>> i.e failing with package already installed - which should not fail for
>> attempt only.
> 
> Indeed, I'm curious about that too...
> 
> If you could put together the patch, that would be great and fine with me.
> 
> Thanks,
> Daniel
> 


