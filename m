Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPINY-00047C-SR
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 21:04:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 May 2012 11:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148159613"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 01 May 2012 11:55:08 -0700
Message-ID: <4FA0318C.3040006@linux.intel.com>
Date: Tue, 01 May 2012 11:55:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
	<4FA0313D.2080605@linux.intel.com>
In-Reply-To: <4FA0313D.2080605@linux.intel.com>
Cc: Ken Werner <ken.werner@linaro.org>
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 19:04:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 11:53 AM, Saul Wold wrote:
> On 04/27/2012 03:59 AM, Ken Werner wrote:
>> This change introduces two new patches to Qt 4.8. One prevents the build
>> system from using the -fuse-ld=gold GCC flag as this isn't upstream and
>> therefore not supported by many toolchains out there. The second patch
>> fixes a compile time error when using toolchains based on GCC 4.7.
>>
>> Signed-off-by: Ken Werner<ken.werner@linaro.org>
>> ---
>> meta/recipes-qt/qt4/qt-4.8.1.inc | 2 +
>> .../qt4/qt-4.8.1/disable-fuse-gold-flag.patch | 26 ++++++++++++++++
>> meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch | 31 ++++++++++++++++++++
>> meta/recipes-qt/qt4/qt4-embedded.inc | 2 +-
>> 4 files changed, 60 insertions(+), 1 deletions(-)
>> create mode 100644
>> meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>> create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
>>
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc
>> b/meta/recipes-qt/qt4/qt-4.8.1.inc
>> index cd78401..b42ca01 100644
>> --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
>> +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
>> @@ -20,6 +20,8 @@ SRC_URI =
>> "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>> file://pulseaudio-config.patch \
>> file://g++.conf \
>> file://linux.conf \
>> + file://gcc47-fix.patch \
>> + file://disable-fuse-gold-flag.patch \
>> "
>>
>> SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>> new file mode 100644
>> index 0000000..d49d7bc
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>> @@ -0,0 +1,26 @@
>> +Disable the -fuse-ld=gold flag. This option is a Debian/Ubuntu specific
>> +extension to the g++ and causes upstream GCC to throw an error.
>> +
>> +Index:
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
>> +===================================================================
>> +---
>> qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/webkit/Source/common.pri
>>
>> ++++
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
>> +@@ -3,12 +3,12 @@
>> + contains(JAVASCRIPTCORE_JIT,yes): DEFINES+=ENABLE_JIT=1
>> + contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
>> +
>> +-linux-g++ {
>> +-isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
>> +- message(Using gold linker)
>> +- QMAKE_LFLAGS+=-fuse-ld=gold
>> +-}
>> +-}
>> ++#linux-g++ {
>> ++#isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
>> ++# message(Using gold linker)
>> ++# QMAKE_LFLAGS+=-fuse-ld=gold
>> ++#}
>> ++#}
>> +
>> + # We use this flag on production branches
>> + # See https://bugs.webkit.org/show_bug.cgi?id=60824
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
>> new file mode 100644
>> index 0000000..8252817
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
>> @@ -0,0 +1,31 @@
>> +Fix compile error when using toolchains based on GCC 4.7.
>> +
>> +Index:
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
>>
>> +===================================================================
>> +---
>> qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
>>
>> ++++
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
>>
>> +@@ -57,9 +57,7 @@ namespace JSC {
>> +
>> + class JSGlobalObject : public JSVariableObject {
>> + protected:
>> +- using JSVariableObject::JSVariableObjectData;
>> +-
>> +- struct JSGlobalObjectData : public JSVariableObjectData {
>> ++ struct JSGlobalObjectData : public
>> JSVariableObject::JSVariableObjectData {
>> + // We use an explicit destructor function pointer instead of a
>> + // virtual destructor because we want to avoid adding a vtable
>> + // pointer to this struct. Adding a vtable pointer would force the
>> +Index:
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
>>
>> +===================================================================
>> +---
>> qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
>>
>> ++++
>> qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
>>
>> +@@ -32,8 +32,7 @@ namespace JSC{
>> +
>> + class JSStaticScopeObject : public JSVariableObject {
>> + protected:
>> +- using JSVariableObject::JSVariableObjectData;
>> +- struct JSStaticScopeObjectData : public JSVariableObjectData {
>> ++ struct JSStaticScopeObjectData : public
>> JSVariableObjectData::JSVariableObjectData {
>> + JSStaticScopeObjectData()
>> + : JSVariableObjectData(&symbolTable,&registerStore + 1)
>> + {
>> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc
>> b/meta/recipes-qt/qt4/qt4-embedded.inc
>> index 8c15352..291e62a 100644
>> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
>> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform
>> application framework -- this is
>> SECTION = "libs"
>> HOMEPAGE = "http://qt.nokia.com"
>> DEPENDS += "directfb tslib"
>> -INC_PR = "r43"
>> +INC_PR = "r44"
>>
>> QT_BASE_LIB ?= "libqt-embedded"
>>
>
> Merged into OE-Core, but still needs updated patch headers please
>
Never mind, I missed RP's fix for the patch headers.

Sau!

> Thanks
> Sau!
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


