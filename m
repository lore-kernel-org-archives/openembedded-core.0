Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E421755F8;
	Fri,  4 Mar 2016 17:02:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u24H2eoD011871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Mar 2016 09:02:40 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 4 Mar 2016 09:02:39 -0800
To: <openembedded-devel@lists.openembedded.org>, akuster <akuster@mvista.com>
References: <1456904241-17157-1-git-send-email-akuster808@gmail.com>
	<20160304153952.GC13743@denix.org> <56D9BBC9.6010707@mvista.com>
	<20160304165116.GE13743@denix.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56D9BFAE.5030509@windriver.com>
Date: Fri, 4 Mar 2016 11:02:38 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160304165116.GE13743@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [jethro][fido][PATCH] openssl: Security fix CVE-2016-0800
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
X-List-Received-Date: Fri, 04 Mar 2016 17:02:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/4/16 10:51 AM, Denys Dmytriyenko wrote:
> On Fri, Mar 04, 2016 at 08:46:01AM -0800, akuster wrote:
>>
>>
>> On 03/04/2016 07:39 AM, Denys Dmytriyenko wrote:
>>> On Tue, Mar 01, 2016 at 11:37:21PM -0800, Armin Kuster wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> CVE-2016-0800 SSL/TLS: Cross-protocol attack on TLS using SSLv2 (DROWN)
>>>>
>>>> https://www.openssl.org/news/secadv/20160301.txt
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>  .../openssl/openssl/CVE-2016-0800.patch            | 198 +++++++
>>>>  .../openssl/openssl/CVE-2016-0800_2.patch          | 592 +++++++++++++++++++++
>>>>  .../openssl/openssl/CVE-2016-0800_3.patch          | 503 +++++++++++++++++
>>>>  .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   3 +
>>>>  4 files changed, 1296 insertions(+)
>>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
>>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
>>>>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
>>>>
>>>> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
>>>> new file mode 100644
>>>> index 0000000..e5635fe
>>>> --- /dev/null
>>>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
>>>> @@ -0,0 +1,198 @@
>>>> +From 9dfd2be8a1761fffd152a92d8f1b356ad667eea7 Mon Sep 17 00:00:00 2001
>>>> +From: Viktor Dukhovni <openssl-users@dukhovni.org>
>>>> +Date: Wed, 17 Feb 2016 21:07:48 -0500
>>>> +Subject: [PATCH] Disable SSLv2 default build, default negotiation and weak
>>>> + ciphers.
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=UTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +SSLv2 is by default disabled at build-time.  Builds that are not
>>>> +configured with "enable-ssl2" will not support SSLv2.  Even if
>>>> +"enable-ssl2" is used, users who want to negotiate SSLv2 via the
>>>> +version-flexible SSLv23_method() will need to explicitly call either
>>>> +of:
>>>> +
>>>> +    SSL_CTX_clear_options(ctx, SSL_OP_NO_SSLv2);
>>>> +or
>>>> +    SSL_clear_options(ssl, SSL_OP_NO_SSLv2);
>>>> +
>>>> +as appropriate.  Even if either of those is used, or the application
>>>> +explicitly uses the version-specific SSLv2_method() or its client
>>>> +or server variants, SSLv2 ciphers vulnerable to exhaustive search
>>>> +key recovery have been removed.  Specifically, the SSLv2 40-bit
>>>> +EXPORT ciphers, and SSLv2 56-bit DES are no longer available.
>>>> +
>>>> +Mitigation for CVE-2016-0800
>>>
>>> So, this CVE is all nice and good, but it breaks things and other OE recipes.
>>>
>>> For starters, python-m2crypto and crda from meta-openembedded:
>>>
>>> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>>
>> well we built that internally and it pass because we are using the one
>> from meta-virt. its a newer version (0.22.3) than the one in meta-python
>> (0.21.1).
>>
>> working on the one in meta-python.
> 
> Ah, thanks! So, what would be the approach to fix it in meta-python? Would 
> version update be allowed for backport to fido/dizzy? It's rather against the 
> policy, but in this case it's broken w/o the update...

I think in this case, it makes sense to backport a python first for the issue.

SSLv2 really isn't secure any longer.  Anything using cryptography should not be
using SSLv2, but if it available should be switching based on OpenSSL having (or
not) the necessary symbols.

For reference the CVE-2016-0800 change disables SSLv2 and various 'weak' SSLv3+
cryptographic functions.  This can be re-enabled, with a simple build switch in
OpenSSL -- but I'd caution against doing so.  Previous patches have mitigated a
related problem that would allow an attacker to get OpenSSL to downgrade to a
weak SSLv2 encryption, the 0800 patch takes it one further and just disables
SSLv2 completely.  So the previous fixes will help mitigate the problem, but
only disabling will remove potential reliance on less then secure methods.

> 
>>> Are there any plans to go and ensure that other recipes using SSLv2 are not 
>>> broken now?
>>
>> yes, as I find time and not _all_ meta layers.
>>
>> thanks for letting me know. it will make this task go by faster.
> 
> I'll let you know if anything else is broken :)
> 


