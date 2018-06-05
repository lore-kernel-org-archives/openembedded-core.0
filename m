Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCB3D7556A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 02:48:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w552mUQs011684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jun 2018 19:48:30 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 4 Jun 2018 19:48:29 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<CANNYZj_saa2orMaM15wGZuDF8W0=JmAuz2eADMA5zjwknvSByw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B15F927.2020504@windriver.com>
Date: Tue, 5 Jun 2018 10:44:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_saa2orMaM15wGZuDF8W0=JmAuz2eADMA5zjwknvSByw@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Tue, 05 Jun 2018 02:48:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月01日 16:36, Alexander Kanavin wrote:
> 2018-06-01 8:38 GMT+03:00 Yu, Mingli <mingli.yu@windriver.com>:
>
>> I did investigate the path a lot before send out the patch, but didn't
>> figure out why it introduce the path for make_x86_64_sysv_elf_gas.o whose
>> source file is make_x86_64_sysv_elf_gas.S.
>>
>> Anyway, I will try to dig more.
>>
>> If you have any ideas, welcome to help provide some hint.
>
> I'm not an expert in symbol tables and what goes into them, but I
> strongly suspect the full path is introduced by linker because that .S
> file has two assembly labels (trampoline, finish). The other two
> assembly files have no such labels, and so their file paths are not
> added to the .so. I'm also not sure why there needs to be a full path,

Thanks Alex very much for your comments!
I think the full path is introduced by linker and I'm also confused why 
other two assembly files' o file not introduced in the final .so.


> as opposed to just the file name, as is the case for .c files (maybe
> to avoid clashes with labels of the same name in different files?).

I'm also concerned about that maybe it's necessary to have the full path.

Thanks,


>
> We should probably just strip that one specific .o file before it's
> linked into the library. Or if there is a way to prevent the labels
> from being written into the symbol table by the assembler, we can use
> that too. Sadly boost has its own build system, so doing such custom
> tweaks may be tricky.
>
> Alex
>

