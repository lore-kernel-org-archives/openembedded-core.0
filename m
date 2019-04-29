Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 836F960557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 03:05:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3T34pj9003550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Apr 2019 20:05:07 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 28 Apr 2019 20:04:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
References: <1556434683-140874-1-git-send-email-mingli.yu@windriver.com>
	<1556434971-251075-1-git-send-email-mingli.yu@windriver.com>
	<E278AA1B-9805-4539-9572-1D55212BC2D3@gmail.com>
	<6f32834d1eee3495ce11c15195fb30d75892df79.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CC66B96.8030600@windriver.com>
Date: Mon, 29 Apr 2019 11:12:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <6f32834d1eee3495ce11c15195fb30d75892df79.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bjam-native: do not search all PATHs variable
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
X-List-Received-Date: Mon, 29 Apr 2019 03:05:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月28日 18:55, Richard Purdie wrote:
> On Sun, 2019-04-28 at 11:38 +0200, Alexander Kanavin wrote:
>> Wait, why is this a problem for specifically bjam, but not the other
>> tools that also look into PATH? Shouldn’t you fix the nfs instead?
>
> I have to agree that you really don't want invalids NFS paths in PATH.
> We're not carrying a patch for that.


Thanks RP and Alex's comments!

It makes sense, the patch is inappropriate.

Thanks,

>
> Cheers,
>
> Richard
>
>> Alex
>>
>>> On 28 Apr 2019, at 9.02, <mingli.yu@windriver.com> <
>>> mingli.yu@windriver.com> wrote:
>>>
>>> From: Li Wang <li.wang@windriver.com>
>>>
>>> By default, it searches all paths specified by $PATH.
>>>
>>> But if the directory of the $PATH variable on
>>> build host includes nfs(build host as nfs client),
>>> it causes the build hung when the nfs server is
>>> unavailable.
>>>
>>> Signed-off-by: Li Wang <li.wang@windriver.com>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>> meta/recipes-support/boost/bjam-native_1.69.0.bb   |  1 +
>>> .../bjam-do-not-search-all-PATHs-varibale.patch    | 53
>>> ++++++++++++++++++++++
>>> 2 files changed, 54 insertions(+)
>>> create mode 100644 meta/recipes-support/boost/files/bjam-do-not-
>>> search-all-PATHs-varibale.patch
>>>
>>> diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb
>>> b/meta/recipes-support/boost/bjam-native_1.69.0.bb
>>> index 94f96e6..395ad34 100644
>>> --- a/meta/recipes-support/boost/bjam-native_1.69.0.bb
>>> +++ b/meta/recipes-support/boost/bjam-native_1.69.0.bb
>>> @@ -6,6 +6,7 @@ SECTION = "devel"
>>> inherit native
>>>
>>> SRC_URI += "file://bjam-native-build-bjam.debug.patch \
>>> +            file://bjam-do-not-search-all-PATHs-varibale.patch \
>>> "
>>>
>>> do_compile() {
>>> diff --git a/meta/recipes-support/boost/files/bjam-do-not-search-
>>> all-PATHs-varibale.patch b/meta/recipes-support/boost/files/bjam-
>>> do-not-search-all-PATHs-varibale.patch
>>> new file mode 100644
>>> index 0000000..742603a
>>> --- /dev/null
>>> +++ b/meta/recipes-support/boost/files/bjam-do-not-search-all-
>>> PATHs-varibale.patch
>>> @@ -0,0 +1,53 @@
>>> +bjam: do not search all PATHs varibale
>>> +
>>> +By default, it searches all paths specified by $PATH.
>>> +But if the directory of the $PATH variable on
>>> +build host includes nfs, it causes system hung
>>> +when nfs server is unavailable.
>>> +
>>> +Upstream-Status: Inappropriate [oe specific]
>>> +
>>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> +---
>>> + tools/build/src/engine/build.jam | 10 +++++-----
>>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/tools/build/src/engine/build.jam
>>> b/tools/build/src/engine/build.jam
>>> +index a92b70f..f866619 100644
>>> +--- a/tools/build/src/engine/build.jam
>>> ++++ b/tools/build/src/engine/build.jam
>>> +@@ -781,8 +781,8 @@ if $(OS) = NT
>>> + }
>>> + SUFEXE ?= "" ;
>>> +
>>> +-yacc ?= [ GLOB $(PATH) : yacc$(SUFEXE) ] ;
>>> +-yacc ?= [ GLOB $(PATH) : bison$(SUFEXE) ] ;
>>> ++yacc ?= [ GLOB "" : yacc$(SUFEXE) ] ;
>>> ++yacc ?= [ GLOB "" : bison$(SUFEXE) ] ;
>>> + yacc ?= [ GLOB "$(ProgramFiles:J= )\\GnuWin32\\bin"
>>> +     "C:\\Program Files\\GnuWin32\\bin" : bison$(SUFEXE) ] ;
>>> + yacc = $(yacc[1]) ;
>>> +@@ -966,7 +966,7 @@ if $(OS) = NT
>>> + }
>>> + if $(UNIX) = true
>>> + {
>>> +-    tar ?= [ GLOB $(PATH) : star bsdtar tar ] ;
>>> ++    tar ?= [ GLOB "" : star bsdtar tar ] ;
>>> +     tar = $(tar[1]) ;
>>> +     switch $(tar:D=:S=)
>>> +     {
>>> +@@ -1047,8 +1047,8 @@ rule .package ( dst-dir : src-files + )
>>> + }
>>> +
>>> + # RPM distro file.
>>> +-rpm-tool = [ GLOB $(PATH) : "rpmbuild" ] ;
>>> +-rpm-tool ?= [ GLOB $(PATH) : "rpm" ] ;
>>> ++rpm-tool = [ GLOB "" : "rpmbuild" ] ;
>>> ++rpm-tool ?= [ GLOB "" : "rpm" ] ;
>>> + rpm-tool = $(rpm-tool[1]) ;
>>> + rule .rpm ( name : source )
>>> + {
>>> +--
>>> +2.18.1
>>> +
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

