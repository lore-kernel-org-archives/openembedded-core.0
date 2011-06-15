Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QWpZv-0006dj-Sk
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 14:52:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5FCmjRe027556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 05:48:46 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Jun 2011 05:48:45 -0700
Message-ID: <4DF8AA2B.5010107@windriver.com>
Date: Wed, 15 Jun 2011 20:48:43 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308108460.git.liezhi.yang@windriver.com>	<3cb6265fcaa2fb18ced5c2ccddfcc4de7852d63b.1308108460.git.liezhi.yang@windriver.com>
	<1308129704.15712.368.camel@rex>
In-Reply-To: <1308129704.15712.368.camel@rex>
Subject: Re: [PATCH 2/4 V2] Share gcc work directories
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
X-List-Received-Date: Wed, 15 Jun 2011 12:52:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/15/2011 05:21 PM, Richard Purdie wrote:
> Hi Robert,
>
> This is looking good, just one further problem:
>
> On Wed, 2011-06-15 at 14:33 +0800, Robert Yang wrote:
>>     * The configure option --with-build-sysroot=${STAGING_DIR_TARGET} can
>>       replace the sed command.
>
> Sadly I'm not sure it can.
>
>>
>>   EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
>>                   --with-gnu-ld \
>> +                --with-build-sysroot=${STAGING_DIR_TARGET} \
>>                   --enable-shared \
>>                   --enable-languages=${LANGUAGES} \
>>                   --enable-threads=posix \
>> @@ -88,25 +89,20 @@ do_configure () {
>>   	(cd ${S}&&  gnu-configize) || die "failure running gnu-configize"
>>   	
>>   	# teach gcc to find correct target includedir when checking libc ssp support
>> -	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure.ac
>> -	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure
>
> Here, a hardcoded "/usr/include" in the gcc makefiles is being replaced
> by ${SYSTEMHEADERS} which could be /some/other/path/include. These two
> are therefore not equivalent. Did you try a "bitbake meta-toolchain"
> with this patch series?
>

I'm sorry, because the "bitbake meta-toolchain" didn't work recently(without
these patches), I forgot to build it(just built gcc-cross and gcc-crosssdk),
I will go on working on it and send the V3 later.

Thanks

// Robert

> I suspect configure needs to use ${includedir} to build this path
> instead of hardcoding it.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


