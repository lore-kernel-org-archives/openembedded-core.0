Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A69EB7BF53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 02:35:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI2Z0Ps017265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 18:35:01 -0800 (PST)
Received: from [128.224.163.157] (128.224.163.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 17 Dec 2018 18:35:00 -0800
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20181217084739.115773-1-mingli.yu@windriver.com>
	<7043db17733d9237d5b3e706dd66471b34e4f54e.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5C185C1E.5030009@windriver.com>
Date: Tue, 18 Dec 2018 10:31:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <7043db17733d9237d5b3e706dd66471b34e4f54e.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.157]
Subject: Re: [PATCH] nfs-utils: fix build error under tests folder
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
X-List-Received-Date: Tue, 18 Dec 2018 02:35:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年12月18日 01:16, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2018-12-17 at 00:47 -0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Redefine the reference path of libnfs.a to
>>    ../support/nfs/.libs/libnfs.a to fix below
>>    error when run "make -C tests statdb_dump".
>>    | make: *** No rule to make target '../support/nfs/libnfs.a',
>> needed by 'statdb_dump'.  Stop.
>>    | make: *** No rule to make target '../../support/nfs/libnfs.a',
>> needed by 'nsm_client'.  Stop.
>>
>> * The function generic_make_pathname is introduced in
>>    nfs-utils 2.3.1.
>>    Add the source file which defines function generic_make_pathname to
>>    libnsm_a_SOURCES of libnsm.a to fix the undefined reference
>>    when run "make -C tests statdb_dump"
>>    | ../support/nsm/libnsm.a(file.o): In function `nsm_make_pathname':
>>    | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
>> 2.3.1/support/nsm/file.c:175: undefined reference to
>> `generic_make_pathname'
>>    | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
>> 2.3.1/support/nsm/file.c:175: undefined reference to
>> `generic_make_pathname'
>>    | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
>> 2.3.1/support/nsm/file.c:175: undefined reference to
>> `generic_make_pathname'
>>    | ../support/nsm/libnsm.a(file.o): In function
>> `nsm_setup_pathnames':
>>    | /usr/src/debug/nfs-utils/2.3.1-r0/nfs-utils-
>> 2.3.1/support/nsm/file.c:280: undefined reference to
>> `generic_setup_basedir'
>>    | collect2: error: ld returned 1 exit status
>>
>> * After the logic of commit[dbb643e Removed missing-prototypes
>> warnings.]
>>    introduced, there comes below error when run
>>    "make -C tests/nsm_client nsm_client"
>>    | nlm_sm_inter_svc.c:20:1: error: no previous prototype for
>> 'nlm_sm_prog_3' [-Werror=missing-prototypes]
>>
>>    It is because rpcgen doesn't generate -Wmissing-prototypes
>>    free code for nlm_sm_inter_svc.c with below logic
>>    in tests/nsm_client/Makefile.am
>>    [snip]
>>    GENFILES_SVC    = nlm_sm_inter_svc.c
>>    [snip]
>>    $(GENFILES_SVC): %_svc.c: %.x $(RPCGEN)
>>          test -f $@ && rm -rf $@ || true
>>          $(RPCGEN) -m -o $@ $<
>>   So add the patch to not fatalize -Wmissing-prototypes.
>
> Fails on musl:

Will send out V2 to fix it.

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/104
>
> Cheers,
>
> Richard
>
>

