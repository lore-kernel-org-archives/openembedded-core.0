Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1A38745BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:36:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9G3ZZBV015953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 20:35:45 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 15 Oct 2018 20:35:24 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1539581457-120937-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LZ+U1t=rnLcrZMDD+AoS-SbJ23Hc1fd9twa4qRFh=N1sQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <4b65d79c-906c-63dd-53c8-bb9c297f72e3@windriver.com>
Date: Tue, 16 Oct 2018 11:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ+U1t=rnLcrZMDD+AoS-SbJ23Hc1fd9twa4qRFh=N1sQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: remove compile of windows resource files
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
X-List-Received-Date: Tue, 16 Oct 2018 03:36:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/15/2018 08:58 PM, Burton, Ross wrote:
> Is this breaking the build of Freetype for mingw32?  Seems like it
> would be easier change meta-mingw to just export RC in the SDK
> environment using overrides.
>
> Ross

Fixes below problem:
1. include meta-mingw
2. MACHINE ??= "intel-x86-64"
     SDKMACHINE = "i686-mingw32"
3. bitbake freetype

do_compile failed with below error:
x86_64-wrs-linux-libtool: compile:  x86_64-wrs-linux-windres 
--include-dir=work/corei7-64-wrs-linux/freetype/2.9.1-r0/recipe-sysroot/usr/include 
/work/corei7-64-wrs-linux/freetype/2.9.1-r0/freetype-2.9.1/src/base/ftver.rc 
-o work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/.libs/ftver.o
work/corei7-64-wrs-linux/freetype/2.9.1-r0/build//x86_64-wrs-linux-libtool: 
line 1752: x86_64-wrs-linux-windres: command not found
work/corei7-64-wrs-linux/freetype/2.9.1-r0/freetype-2.9.1/builds/freetype.mk:263: 
recipe for target 
'work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/ftver.lo' failed
make: *** [work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/ftver.lo] 
Error 1
ERROR: oe_runmake failed


> On Mon, 15 Oct 2018 at 06:32, <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> remove compile of windows resource file to fix compile
>> fail problem of freetype when build windows sdk.
>>
>> when build windows sdk, include meta-mingw layer, and
>> SDKMACHINE set to i686-mingw32, meta-mingw have
>> export variable RC, and from freetype 3.29, it add better
>> support to  build FreeType  as  a DLL  on Windows  using
>> Visual C, but we don't need this. so remove it.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...-remove-compile-of-windows-resource-files.patch | 71 ++++++++++++++++++++++
>>   meta/recipes-graphics/freetype/freetype_2.9.1.bb   |  1 +
>>   2 files changed, 72 insertions(+)
>>   create mode 100644 meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
>>
>> diff --git a/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
>> new file mode 100644
>> index 0000000..2daba28
>> --- /dev/null
>> +++ b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
>> @@ -0,0 +1,71 @@
>> +From b6c1c1c96006452873132db1b15e2d0b9576a7fb Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Mon, 15 Oct 2018 11:25:23 +0800
>> +Subject: [PATCH] freetype: remove compile of windows resource files
>> +
>> +remove compile of windows resource file to fix compile
>> +fail problem of freetype when build windows sdk.
>> +
>> +when build windows sdk, include meta-mingw, and
>> +SDKMACHINE set to i686-mingw32, meta-mingw have
>> +export variable RC, and from freetype 3.29, it add better
>> +support to  build FreeType  as  a DLL  on Windows  using
>> +Visual C, but we don't need this. so remove it.
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + builds/freetype.mk     | 17 -----------------
>> + builds/unix/unix-cc.in |  7 -------
>> + 2 files changed, 24 deletions(-)
>> +
>> +diff --git a/builds/freetype.mk b/builds/freetype.mk
>> +index 6f68a0f..4287869 100644
>> +--- a/builds/freetype.mk
>> ++++ b/builds/freetype.mk
>> +@@ -247,23 +247,6 @@ OBJECTS_LIST += $(FTINIT_OBJ)
>> + $(FTINIT_OBJ): $(FTINIT_SRC) $(FREETYPE_H)
>> +       $(FT_COMPILE) $T$(subst /,$(COMPILER_SEP),$@ $<)
>> +
>> +-
>> +-# ftver component
>> +-#
>> +-#  The VERSIONINFO resource `ftver.rc' contains version and copyright
>> +-#  to be compiled by windres and tagged into DLL usually.
>> +-#
>> +-ifneq ($(RC),)
>> +-  FTVER_SRC := $(BASE_DIR)/ftver.rc
>> +-  FTVER_OBJ := $(OBJ_DIR)/ftver.$O
>> +-
>> +-  OBJECTS_LIST += $(FTVER_OBJ)
>> +-
>> +-  $(FTVER_OBJ): $(FTVER_SRC)
>> +-      $(RC) -o $@ $<
>> +-endif
>> +-
>> +-
>> + # All FreeType library objects.
>> + #
>> + OBJ_M := $(BASE_OBJ_M) $(BASE_EXT_OBJ) $(DRV_OBJS_M)
>> +diff --git a/builds/unix/unix-cc.in b/builds/unix/unix-cc.in
>> +index b24c408..603897c 100644
>> +--- a/builds/unix/unix-cc.in
>> ++++ b/builds/unix/unix-cc.in
>> +@@ -90,13 +90,6 @@ ANSIFLAGS := @XX_ANSIFLAGS@
>> + CCraw := $(CC)
>> + CC    := $(LIBTOOL) --mode=compile $(CCraw)
>> +
>> +-# Resource compiler to use on Cygwin/MinGW, usually windres.
>> +-#
>> +-RCraw := @RC@
>> +-ifneq ($(RCraw),)
>> +-  RC := $(LIBTOOL) --tag=RC --mode=compile $(RCraw)
>> +-endif
>> +-
>> + # Linker flags.
>> + #
>> + LDFLAGS           := @LDFLAGS@
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-graphics/freetype/freetype_2.9.1.bb b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
>> index 1e6f66e..b7d090d 100644
>> --- a/meta/recipes-graphics/freetype/freetype_2.9.1.bb
>> +++ b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
>> @@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>>              file://use-right-libtool.patch \
>> +           file://0001-freetype-remove-compile-of-windows-resource-files.patch \
>>             "
>>
>>   UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


