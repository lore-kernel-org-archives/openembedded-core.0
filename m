Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FDFD6093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 09:04:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K94KAI021734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Sep 2016 02:04:20 -0700 (PDT)
Received: from [128.224.162.220] (128.224.162.220) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 02:04:20 -0700
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>, Mark Hatle
	<mark.hatle@windriver.com>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <be41323a-32f7-caa6-8422-6456088937c8@windriver.com>
Date: Tue, 20 Sep 2016 17:04:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1474359109.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Tue, 20 Sep 2016 09:04:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

BTW, as Robert suggested, I tested rpm upgrade (rpm -F),
the fix also works well

Preprae two version hello with bad signature

1. Install hello with version 1.0-r1.0

root@localhost:~# rpm -ivh --nodigest --nosignature 
hello-1.0-r1.0.corei7_64.rpm
Preparing... ########################################### [100%]
    1:hello ########################################### [100%]

root@localhost:~# rpm -F --verbose hello-1.0-r2.0.corei7_64.rpm
error: hello-1.0-r2.0.corei7_64.rpm: Header V4 DSA signature: BAD, key 
ID 8a0274fa

2. Upgrade hello with version 1.0-r2.0

root@localhost:~# rpm -F --verbose --nodigest --nosignature 
hello-1.0-r2.0.corei7_64.rpm
Preparing packages for installation...
hello-1.0-r2.0.corei7_64

root@localhost:~# rpm -q hello
hello-1.0-r2.0.corei7_64

//Hongxu

On 09/20/2016 04:15 PM, Hongxu Jia wrote:
> Boot a target environment with rpm:
>
> 1). With option '--nodigest --nosignature', installing package
> with bad signature is successful
> ======
> root@localhost:~# rpm -ivh hello-bogus.rpm
> error: hello-bogus.rpm: Header V4 DSA signature: BAD, key ID 09753bca
>
> ======
>
> 2). Without option '--nodigest --nosignature', installing package
> with bad signature failed
> ======
> root@localhost:~# rpm -ivh --nodigest --nosignature  hello-bogus.rpm
> Preparing...                ########################################### [100%]
>     1:hello                  ########################################### [100%]
> ======
>
> BTW: the package with bad signature hello-bogus.rpm in
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10308
>
> //Hongxu
>
> The following changes since commit 49a7839e602eac2c43415d9c8f17ad8315fd1da5:
>
>    build-appliance-image: Create image in correct location (2016-09-19 08:58:10 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib hongxu/fix-rpm
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-rpm
>
> Hongxu Jia (1):
>    rpm: make install with --nosignature and --nodigest work
>
>   ...0001-system.h-query.c-support-nosignature.patch | 75 ++++++++++++++++++++--
>   1 file changed, 71 insertions(+), 4 deletions(-)
>


