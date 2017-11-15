Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04FF16011C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 02:24:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAF2OLJa001139
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Nov 2017 18:24:21 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 14 Nov 2017 18:24:21 -0800
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
	<CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
	<CAJTo0LbnJtZG2LTe_NsOgH5-q1y7JectDHDM0h9nJMbi5txb9w@mail.gmail.com>
	<1510668148.4049.71.camel@andred.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4a8c2156-35df-8786-31c8-b35b8a6588d3@windriver.com>
Date: Wed, 15 Nov 2017 10:23:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510668148.4049.71.camel@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Wed, 15 Nov 2017 02:24:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/14/2017 10:02 PM, André Draszik wrote:
> On Tue, 2017-11-14 at 11:41 +0000, Burton, Ross wrote:
>> On 14 November 2017 at 11:34, Burton, Ross <ross.burton@intel.com> wrote:
>>
>>> But don't we remove the old version from the feeds, or does that only
>>> happen if the arch matches?
>>>
>>
>> Well the feed pruning is working correctly:
> 
> Not for me. I created a dummy package foo_0.1.bb, with PACKAGE_ARCH =
> "${MACHINE_ARCH}"
> 
> after bitbake foo:
> $ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk
> 
> Removing the PACKAGE_ARCH line from that recipe and rebuilding foo gives me:
> 
> $ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dbg_0.1-r0_mips32r2el-24kec-
> nf.ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dev_0.1-r0_mips32r2el-24kec-
> nf.ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo_0.1-r0_mips32r2el-24kec-nf.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk
> 
> 
> If I bump the version, I am still left with the MACHINE_ARCH packages
> (doesn't matter if I bump the version before or after the change to
> PACKAGE_ARCH):
> $ build.pyro > find tmp/deploy/ipk/ -name foo*ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dbg_0.2-r0_mips32r2el-24kec-
> nf.ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo-dev_0.2-r0_mips32r2el-24kec-
> nf.ipk
> tmp/deploy/ipk/mips32r2el-24kec-nf/f/foo/foo_0.2-r0_mips32r2el-24kec-nf.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dbg_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo-dev_0.1-r0_tgm_r3.ipk
> tmp/deploy/ipk/tgm_r3/f/foo/foo_0.1-r0_tgm_r3.ipk
> 
> So of course do_rootfs will pick the outdated version.
> 
> Is that an ipk / OPKG issue? Should something be removing the old packages
> from deploy?

I tried PACKAGE_CLASSES = "package_ipk", I got the same result as ross:

* Before Qi's patch applied:
$ find tmp/deploy/ipk/ | grep autoconf-a
tmp/deploy/ipk/i586/autoconf-archive-dev_2017.09.28-r0_i586.ipk
tmp/deploy/ipk/i586/autoconf-archive_2017.09.28-r0_i586.ipk
tmp/deploy/ipk/i586/autoconf-archive-dbg_2017.09.28-r0_i586.ipk
tmp/deploy/ipk/i586/autoconf-archive-doc_2017.09.28-r0_i586.ipk

* After Qi's patch applied:
$ find tmp/deploy/ipk/ | grep autoconf-a
tmp/deploy/ipk/all/autoconf-archive_2017.09.28-r0_all.ipk
tmp/deploy/ipk/all/autoconf-archive-doc_2017.09.28-r0_all.ipk

I guess something is wrong with your build.

// Robert

> 
> 
> Cheers,
> Andre'
> 
> 

