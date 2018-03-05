Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A42178A6B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 08:06:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2586M8d027745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Mar 2018 00:06:23 -0800 (PST)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 5 Mar 2018 00:05:51 -0800
To: Mike Crowe <mac@mcrowe.com>, <openembedded-core@lists.openembedded.org>
References: <20180303212648.6fnwlntm6je3hw7c@mcrowe.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a17ddf01-8f48-8c49-47be-3a4752ac7e16@windriver.com>
Date: Mon, 5 Mar 2018 16:06:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180303212648.6fnwlntm6je3hw7c@mcrowe.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: coreutils-native and util-linux-native conflicting with meta-micro
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
X-List-Received-Date: Mon, 05 Mar 2018 08:06:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2018 05:26 AM, Mike Crowe wrote:
> I have a recipe which uses both base64 from coreutils-native and hexdump
> from util-linux-native so I've put both in my recipe DEPENDS.
>
> Unfortunately do_prepare_sysroot is failing with:
>
> Exception: FileExistsError: [Errno 17] File exists: '/home/mac/src/oe2/build-bcm7425/tmp-glibc/sysroots-components/x86_64/coreutils-native/bin/kill' -> '/home/mac/src/oe2/build-bcm7425/tmp-glibc/work/impala-oe-linux-gnueabi/verify-rootfs/1.0-r3/recipe-sysroot-native/bin/kill'
>
> since both coreutils and util-linux provide /bin/kill.
>
> This doesn't cause a problem in a standard oe-core build since coreutils
> installs all its binaries in ${bindir} whereas util-linux puts kill in
> ${base_bindir}.
>
> Unfortunately, with meta-micro ${bindir} and ${base_bindir} are the same
> directory. :(
>
> Both coreutils and util-linux already appear to use the alternatives
> mechanism for kill, but that doesn't seem to help for -native.
>
> I can easily locally nobble kill in one of the recipes to solve this
> problem, but that doesn't seem very elegant.
>
> What's the correct way to solve this problem?
>
> Thanks.
>
> Mike.

I'd suggest you remove conflict items in do_install in case of native. 
An example is in coreutils recipe as below.

do_install_class-native() {
     autotools_do_install
     # remove groups to fix conflict with shadow-native
     rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
     # The return is a must since native doesn't need the
     # do_install_append() in the below.
     return
}

You can create a bbappend file in your layer and do similar things.

Best Regards,

Chen Qi


