Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA13B71A6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 05:52:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9H5qbPA007594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 16 Oct 2016 22:52:38 -0700
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 16 Oct 2016 22:52:37 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
	<57FF9CD8.9040305@windriver.com>
	<CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
	<58009F43.6070904@windriver.com>
	<CAMKF1srF3ow22DWfsj78MyaR14N5+nCxvdanXwsKqroLG_9DRg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <97106aec-ccb5-ae4c-1b4d-8519e6b59156@windriver.com>
Date: Mon, 17 Oct 2016 13:52:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srF3ow22DWfsj78MyaR14N5+nCxvdanXwsKqroLG_9DRg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Mon, 17 Oct 2016 05:52:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年10月14日 17:32, Khem Raj wrote:
> On Fri, Oct 14, 2016 at 11:02 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2016年10月13日 22:59, Burton, Ross wrote:
>>
>>
>> On 13 October 2016 at 15:40, Kang Kai <Kai.Kang@windriver.com> wrote:
>>> gcc checks tsan and lsan support in source file
>>> gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then tsan and
>>> lsan related packages will be empty for other target.
>>> For qemuarm project, add in local.conf:
>>>
>>> IMAGE_INSTALL_append = " libtsan"
>>
>> If libtsan is x86-64 only, why not only add it for x86-64 images?  The
>> package not existing on machines it can't be built for is more obvious than
>> existing but being empty.
>>
>>
>> The real scenario is for x86-64 kernel with x86 rootfs. We created a
>> template to enable gcc sanitize support. It just simple adds sanitize
>> related packages to image:
>>
>> LIBX_DEV ?= ""
>> LIBX_DEV_x86-64 = "liblsan-dev libtsan-dev"
>>
>> IMAGE_INSTALL += " \
>>      gcc-sanitizers \
>>      libasan-dev \
>>      libubsan-dev \
>>      ${LIBX_DEV} \
>> "
>>
>> When multilib is enabled, it fails for x86-64 kernel with x86 rootfs such as
>> lib32-xxx-image on qemux86-64. Var IMAGE_INSTALL will be expand with prefix
>> lib32 but lib32-lsan* and lib32-tsan* are empty then cause the failures.
> perhaps we should build sanitizers for multilib too ?

The problem is that thread and leak sanitizers are not supported for x86 
by checking in gcc/libsanitizer/configure.tgt:


# Filter out unsupported systems.
TSAN_TARGET_DEPENDENT_OBJECTS=
case "${target}" in
   x86_64-*-linux* | i?86-*-linux*)
         if test x$ac_cv_sizeof_void_p = x8; then
                 TSAN_SUPPORTED=yes
                 LSAN_SUPPORTED=yes
                 TSAN_TARGET_DEPENDENT_OBJECTS=tsan_rtl_amd64.lo
         fi
         ;;
...

that causes packages lib32-lsan* and lib32-tsan* are empty.


--Kai

>
>> Regards,
>> Kai
>>
>>
>> Ross
>>
>>
>>
>> --
>> Regards,
>> Neil | Kai Kang


-- 
Regards,
Neil | Kai Kang


