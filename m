Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6525774EB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 13:13:38 +0000 (UTC)
Received: from ted ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4VDDOj3015604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 31 May 2018 14:13:36 +0100
Message-ID: <1527772404.16911.155.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, alexander.kanavin@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 14:13:24 +0100
In-Reply-To: <20180531062031.40334-1-mingli.yu@windriver.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Thu, 31 May 2018 13:13:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-05-30 at 23:20 -0700, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> boost_context includes some assembly source
> files and will export the assembly object file
> make_x86_64_sysv_elf_gas.o which contains host
> path as below:
> $ readelf --wide --symbols /my-build/boost/1.67.0-
> r0/boost_1_67_0/x86_64-poky-
> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> d/libboost_context.so.1.67
> 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-
> r0/boost_1_67_0/x86_64-poky-
> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> d/asm/make_x86_64_sysv_elf_gas.o
> 
> Enable stirp for boost_context to hidden the
> symbols
> 
> [YOCTO #12708]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

This looks very unlikely to ever make it upstream. Rather than carrying
a patch to boost forever would we want to just strip the file in
question with a custom command?

Alternatively, can we stop this path being injected into the binary in
the first place?

Cheers,

Richard

