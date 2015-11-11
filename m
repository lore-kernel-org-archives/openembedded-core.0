Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 940BE77193
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:22:44 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so38943182pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=gR1NHRBsHFD3FX02VYdsvT7MkUvKLF2MuIUp/mWPr7U=;
	b=WkTjVU/28MZNSrCgQyP72KfYiEF8ZU4zkLY1Hz8PmBVWOYVU+dOwb7fTLlTf+94o7Q
	oHeHpzK3nHdCCdrJiVqTobfYxOjsg57oAaUm0maVFLlA7vRw7W1VcAzBYHYVHHYvB16+
	zRjJnlIdKVs1FZIa3778yRVPPyu9rwmJfU9iG9dAjSJY2h3MNM3t4/N3vvvtfOgBa8Wz
	6CuKYe/iECZDm6mq6H5DvLVYseD8qE4FNOZ/M1ZN975M1q1kDijluq2m43Fou+KassjB
	AMoPDXgUWys8uAVQfqt4l5t6SHNewMKszYHPKiLOfgZiEAHgI74+f8G1ZfEqGuflRMlO
	zcyQ==
X-Received: by 10.66.219.228 with SMTP id pr4mr16532067pac.99.1447269764773;
	Wed, 11 Nov 2015 11:22:44 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b99e:8fcb:e922:8a29?
	([2601:202:4000:1239:b99e:8fcb:e922:8a29])
	by smtp.googlemail.com with ESMTPSA id
	in6sm10696766pbd.86.2015.11.11.11.22.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 11:22:43 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-3-git-send-email-akuster808@gmail.com>
	<CAMKF1srWCBeKpNEEDS2s3MxTYGvoH1iJdiQGj0L5rg6Y49LedQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56439581.60906@gmail.com>
Date: Wed, 11 Nov 2015 11:22:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srWCBeKpNEEDS2s3MxTYGvoH1iJdiQGj0L5rg6Y49LedQ@mail.gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ldsoconf: allow extension via local.conf
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
X-List-Received-Date: Wed, 11 Nov 2015 19:22:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/11/2015 10:39 AM, Khem Raj wrote:
> On Wed, Nov 11, 2015 at 9:41 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> this allows extending ldconfig search path from local.conf
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  meta/classes/image-ldconfig.bbclass | 6 ++++++
>>  meta/conf/bitbake.conf              | 3 +++
>>  2 files changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/image-ldconfig.bbclass b/meta/classes/image-ldconfig.bbclass
>> index e9946da..ce10673 100644
>> --- a/meta/classes/image-ldconfig.bbclass
>> +++ b/meta/classes/image-ldconfig.bbclass
>> @@ -11,6 +11,12 @@ ld_so_conf() {
>>
>>      rm -f ${STAGING_DIR_NATIVE}${sysconfdir_native}/ld.so.conf
>>
>> +    # dump addition lib possible defined in local.conf
>> +    for file in ${LDSOCONF};
>> +    do
>> +        echo ${file} >> ${STAGING_LDSO_CONF_DIR}/ld.so.conf
>> +    done
>> +
>>      # save lib dirs as defined in recipes
>>      for file in `find ${STAGING_LDSO_CONF_DIR}/*/* -name "ld.so.conf"`;
>>      do
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index f0471f4..1f78c49 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -815,4 +815,7 @@ MULTILIB_VARIANTS ??= ""
>>  #
>>  # ldconfig stuff
>>  #
>> +EXTRA_LDSOCONF ??= ""
>> +LDSOCONF = "/lib /lib64 /usr/lib /usr/lib64"
> 
> is this going to exist always even when multilib is disbled ?

A sane default make more sense.

These libs are currently hardcoded in ldconfig-native.
#define LIBDIR "/usr/lib"
#define LIBDIR32 "/usr/lib32"
#define LIBDIR64 "/usr/lib64"
#define SLIBDIR "/lib"
#define SLIBDIR32 "/lib32"
#define SLIBDIR64 "/lib64"

looks like I missed lib32 versions.

> how about mips n32/o32/n64 all being in same rootfs

not checked today either. Maybe we can use this scheme to dynamically
append ldconfig search patches for the mips example?


ldconfig just gives a warning if the lib dirs don't not exist.

sounds like this needs to be extended to handle multi lib better or in a
saner method.


thanks,
- armin


> 
>> +LSSOCONF += "${EXTRA_LDSOCONF}"
>>  STAGING_LDSO_CONF_DIR = "${TMPDIR}/work-shared/ldconfig"
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

