Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9726D750FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 09:44:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8K9iAqv018158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Sep 2018 02:44:10 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Sep 2018 02:44:09 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c08fffc0-87a1-8ef4-3e3c-7f8e9212852b@windriver.com>
Date: Thu, 20 Sep 2018 17:44:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 09:44:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月20日 12:54, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
>> I will fix it as my top priority today.
>>
>> Reproduce steps:
>>
>> - Build core-image-sato-sdk on qemuarm64
>> - Run qemu
>> - Log over ssh (openssh) failed
>>
> I did have a little bit of a look at this. It seems to hang during key
> generation before starting the server during boot.
I am afraid it is the kernel issue

cat /dev/random will hung

On other system, cat /dev/random will have output


Openssl 1.1.x call getentropy, and getentropy call getrandom,

it hung at getrandom, here is a example reproduce steps

[test.c]
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/random.h>

int main(int argc, char *argv[])
{
     char buf[4];
     size_t buflen = sizeof(buf);
     printf("%s %d\n", __FUNCTION__, __LINE__);
     int res = getrandom(buf, buflen, 0);
     printf("%s %d, getentropy %d, %s, 0x%02X 0x%02X 0x%02X 0x%02X\n", 
__FUNCTION__, __LINE__,
       res, strerror(errno), buf[0]&0xFF, buf[1]&0xFF, buf[2]&0xFF, 
buf[3]&0xFF);

     return 0;
}
[test.c]

$CC test.c -o test

On qemuarm64 target, run `test', it hung
root@qemuarm64:~# ./test_rand
main 10


On other system, it generate random number

$ ./test
main 10
main 12, getrandom 4, Success, 0x58 0xCD 0x3A 0x23
jiahongxu@jiahongxu-OptiPlex-990:~$ ./test
main 10
main 12, getrandom 4, Success, 0x8F 0x25 0x7E 0x9D

I am digging into kernel

//Hongxu

> I had a suspicion that the problem could be a lack of entropy. We're
> supposed to have the virtio entropy generation being passed through
> from the host to avoid problems with entropy starvation but I'm not
> sure its running for arm64.
>
> I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but setting that
> to =y didn't help. The virtio rng connects via pci bus iirc and
> CONFIG_PCI isn't set so I'm now looking into that...
>
> To update, adding this config to the kernel:
>
> CONFIG_CRYPTO_DEV_VIRTIO=y
> CONFIG_PCI=y
> CONFIG_PCI_HOST_GENERIC=y
>
> appears to solve the problem and lets my simple tests work. I'll have
> to run some better tests but I think this is the problem, lack pci
> support in the kernel meaning the rng virtio passthrough doesn't work.
>
> Cheers,
>
> Richard
>
>
>
>
>
>


