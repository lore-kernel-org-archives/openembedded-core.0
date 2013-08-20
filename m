Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 542826065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:06:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7K56MtU003433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2013 01:06:22 -0400 (EDT)
Received: from [128.224.163.210] (128.224.163.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 19 Aug 2013 22:06:21 -0700
Message-ID: <5212F9A1.3040609@windriver.com>
Date: Tue, 20 Aug 2013 13:07:45 +0800
From: Xufeng Zhang <xufeng.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5 ThunderBrowse/3.82
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1370326530-23464-1-git-send-email-xufeng.zhang@windriver.com>
	<5212CD79.3000509@windriver.com> <5212ED04.1030908@linux.intel.com>
In-Reply-To: <5212ED04.1030908@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: avoid NULL pointer dereference in three	places
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
X-List-Received-Date: Tue, 20 Aug 2013 05:06:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2013 12:13 PM, Saul Wold wrote:
> On 08/19/2013 06:59 PM, Xufeng Zhang wrote:
>> Hi All,
>>
>> Anybody help me review this?
>>
>>
>> Thanks,
>> Xufeng
>>
>> On 06/04/2013 02:15 PM, Xufeng Zhang wrote:
>>> There are three potential NULL pointer dereference in
>>> EVP_DigestInit_ex(), dh_pub_encode() and dsa_pub_encode()
>>> functions.
>>> Fix them by adding proper null pointer check.
>>>
>>> [YOCTO #4600]
>>> [ CQID: WIND00373257 ]
>>>
>>> Signed-off-by: Xufeng Zhang<xufeng.zhang@windriver.com>
>>> ---
>>>   ...-pointer-dereference-in-EVP_DigestInit_ex.patch |   16 +++++++++
>>>   ...NULL-pointer-dereference-in-dh_pub_encode.patch |   34
>>> ++++++++++++++++++++
>>>   meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
>>>   .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    2 +
>>>   4 files changed, 53 insertions(+), 1 deletions(-)
>>>   create mode 100644
>>> meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch 
>>>
>>>
>>>   create mode 100644
>>> meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch 
>>>
>>>
>>>
>>> diff --git
>>> a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch 
>>>
>>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch 
>>>
>>>
>>> new file mode 100644
>>> index 0000000..69924a4
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch 
>>>
>>>
>>> @@ -0,0 +1,16 @@
>>> +openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
>>> +
>>> +We should avoid accessing the type pointer if it's NULL,
>>> +this could happen if ctx->digest is not NULL.
>
> These patches both need Upstream-Status: and Signed-off-by: Tags

Ok, I'll add these stuff when I send V2.

>
>>> +---
>>> +--- a/crypto/evp/digest.c
>>> ++++ b/crypto/evp/digest.c
>>> +@@ -199,7 +199,7 @@
>>> +         return 0;
>>> +         }
>>> + #endif
>>> +-    if (ctx->digest != type)
>>> ++    if (type&&  (ctx->digest != type))
>>> +         {
>>> +         if (ctx->digest&&  ctx->digest->ctx_size)
>>> +             OPENSSL_free(ctx->md_data);
>
> I am more concerned about this patch as I do not know the code well, 
> but if ctx->digest is non-NULL and type is, this code would not be 
> executed which would be wrong, correct? 

No, that's correct, if type is NULL, we should not execute the below 
code as type pointer is accessed in the following code, see:
int EVP_DigestInit_ex()
{
...
     if (ctx->digest != type)
    {
         if (ctx->digest && ctx->digest->ctx_size)
                         OPENSSL_free(ctx->md_data);
         ctx->digest=type;
         if (!(ctx->flags & EVP_MD_CTX_FLAG_NO_INIT) && type->ctx_size)
             {
                         ctx->update = type->update;
     ...
    }
...
}


> Your changing the behavior of the code here. 

But if we don't change, NULL pointer dereference would appear.

> Also reading the code, it should be be possible for type to be NULL, 
I think you are saying "it should not be possible"

> unless some memory corruption occurs earlier as there is a check at 
> line 153 for !type, which should cause it to goto skip_to_init.

Yes, it's true, but such code is executed only when OPENSSL_NO_ENGINE is 
not defined.

>
> Please verify this patch is really needed.
>
>
>>> diff --git
>>> a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch 
>>>
>>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch 
>>>
>>>
>>> new file mode 100644
>>> index 0000000..642b0ea
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch 
>>>
>>>
>>> @@ -0,0 +1,34 @@
>>> +openssl: avoid NULL pointer dereference in
>>> dh_pub_encode()/dsa_pub_encode()
>>> +
>>> +We should avoid accessing the pointer if ASN1_STRING_new()
>>> +allocates memory failed.
>>> +---
>>> +--- a/crypto/dh/dh_ameth.c
>>> ++++ b/crypto/dh/dh_ameth.c
>>> +@@ -139,6 +139,12 @@
>>> +     dh=pkey->pkey.dh;
>>> +
>>> +     str = ASN1_STRING_new();
>>> ++    if (!str)
>>> ++        {
>>> ++        DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
>>> ++        goto err;
>>> ++        }
>>> ++
>>> +     str->length = i2d_DHparams(dh,&str->data);
>>> +     if (str->length<= 0)
>>> +         {
>>> +--- a/crypto/dsa/dsa_ameth.c
>>> ++++ b/crypto/dsa/dsa_ameth.c
>>> +@@ -148,6 +148,11 @@
>>> +         {
>>> +         ASN1_STRING *str;
>>> +         str = ASN1_STRING_new();
>>> ++        if (!str)
>>> ++            {
>>> ++            DSAerr(DSA_F_DSA_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
>>> ++            goto err;
>>> ++            }
>>> +         str->length = i2d_DSAparams(dsa,&str->data);
>>> +         if (str->length<= 0)
>>> +             {
>>> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
>>> b/meta/recipes-connectivity/openssl/openssl.inc
>>> index f5b2432..c753a27 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>>> @@ -5,7 +5,7 @@ BUGTRACKER =
>>> "http://www.openssl.org/news/vulnerabilities.html"
>>>   SECTION = "libs/network"
>>>
>>>   # Big Jump for OpenSSL 1.0 support with meta-oe
>>> -INC_PR = "r15"
>>> +INC_PR = "r16"
>>>
> No PR or INC_PR Bump needed

Ok, will drop it.


Thanks,
Xufeng

>
>>>   # "openssl | SSLeay" dual license
>>>   LICENSE = "openssl"
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>>> b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>>> index 61de3a6..afd5576 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
>>> @@ -31,6 +31,8 @@ SRC_URI += "file://configure-targets.patch \
>>>               file://openssl_fix_for_x32.patch \
>>>               file://openssl-fix-doc.patch \
>>>               file://find.pl \
>>> +
>>> file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
>>> +
>>> file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch 
>>>
>>> \
>>>              "
>>>
>>>   SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>


