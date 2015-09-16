Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC51860053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 13:56:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8GDuhBu018418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Sep 2015 06:56:43 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 06:56:43 -0700
Message-ID: <55F97519.5000600@windriver.com>
Date: Wed, 16 Sep 2015 21:56:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1442370259.git.liezhi.yang@windriver.com>	
	<6f49ee1c3fac0a39d8976d7c74000ad507031516.1442370259.git.liezhi.yang@windriver.com>
	<1442407090.26666.64.camel@linuxfoundation.org>
In-Reply-To: <1442407090.26666.64.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] insane.bbclass: fix package_qa_check_buildpaths
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
X-List-Received-Date: Wed, 16 Sep 2015 13:56:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2015 08:38 PM, Richard Purdie wrote:
> On Tue, 2015-09-15 at 19:28 -0700, Robert Yang wrote:
>> * Ignore elf files because they usually contain build path:
>>    - The path of the source file such as .c, these are usually happen
>>      when separate B and S since we use absolute path to run configure
>>      script, and then VPATH in Makefile will be an absolute path and
>>      contains build path, we can use relative path in autotools.bbclass
>>      to fix the problem, but we don't have to since they are harmless.
>>    - The configure options such as "configure --with-libtool-sysroot"
>>    - The compile options such as "gcc --sysroot"
>>    These are harmless usually, so ignore elf files.
>
> I'm not sure about this. Yes, elf files have large issues in the debug
> symbols but the main elf files really shouldn't have build paths in
> them. I understand they can creep in through a variety of sources
> including B!=S but we should really be identifying them and fixing them,
> not pretending they don't exist. The whole point of this check
> originally was to get to the bottom of this!

Thanks, the fix will change a lot to the build behaviour, I'd like to fix
them in 2.1.

// Robert

>
>> * Ignore "-dbg" and "-staticdev" package since symbols and .a files
>>    usually contain buildpath.
>
> Ideally, we should be fixing the debug code so its using target paths
> rather than build ones too...
>
> Cheers,
>
> Richard
>
>> * Ignore .a files too since they contain buildpath, this mainly for
>>    ignoring:
>>    glibc-2.21: glibc-dev/usr/lib/libc_nonshared.a
>>    libgcc-4.9.3: libgcc-dev/usr/lib/x86_64-poky-linux/4.9.3/libgcc_eh.a
>>    gcc-runtime-4.9.3: libssp-dev/usr/lib/libssp_nonshared.a
>>
>> * Use full path rather than package_qa_clean_path() when report issue,
>>    this makes it easier to find the file and fix the problem.
>>
>> Then we will verify other warings and fix one be one.
>
>
>
>

