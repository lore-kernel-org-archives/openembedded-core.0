Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 255B660125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:16:39 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 9020321B95
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:16:39 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <563B56B6.6070307@pseudoterminal.org>
Date: Thu, 5 Nov 2015 14:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 13:16:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

So, this is because of the TOOLCHAIN_OPTIONS ?
Also, what about the ${CC} ? Right now it won't work properly with clang 
for example.

On 11/05/2015 02:14 PM, Otavio Salvador wrote:
> Hello Radek,
>
> On Wed, Nov 4, 2015 at 2:06 PM, Radek Dostal
> <radek.dostal@streamunlimited.com> wrote:
>> ${TOOLCHAIN_OPTIONS} does not contain some important flags such as
>> "-march=armv7-a -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8". It only
>> specifies sysroot as mentioned in commit 923eb657 "u-boot.inc: update
>> linker arguments to pass --sysroot arg"
>>
>> Fixes bug: u-boot 2014.04 build breaks with error:
>> "fatal error: gnu/stubs-soft.h: No such file or directory"
>> when building with hard float compiler as compiler does not receive
>> flag "-mfloat-abi=hard"
>>
>> Before this patch only gcc compiler could be used due to CC explicitly
>> being set to gcc.
>>
>> Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
>> Acked-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> Nack!
>
> The U-Boot is close to the Linux kernel regarding the use of the
> compiler and does a huge set of handling internally to properly pass
> options depending on the SoC, arch and others.
>
> This build error has been fixed in new U-Boot releases and if the
> board required an old version (and cannot be updated) the fix should
> be done on the recipe and not on the common file as it can change,
> behind the scenes, what is in use for several recipes without notice.
>


