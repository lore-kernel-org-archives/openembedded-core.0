Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6E3C76BA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:30:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OMUsxT006204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:30:54 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 15:30:53 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1440126018.git.wenzong.fan@windriver.com>
	<c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
	<CAMKF1srnPDL=yzcu7_niSfwuxa8a-93bBQLN0ba-Roru4DRHhw@mail.gmail.com>
	<55D7C86A.1080700@windriver.com>
	<CAJ86T=U8Gw5RcJz8RNzH=8MNbxHVHGJgdZd3N+pvdLCVdH+yXw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DB9B1C.9070809@windriver.com>
Date: Mon, 24 Aug 2015 17:30:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U8Gw5RcJz8RNzH=8MNbxHVHGJgdZd3N+pvdLCVdH+yXw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Mon, 24 Aug 2015 22:31:00 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/21/15 8:14 PM, Andre McCurdy wrote:
> On Fri, Aug 21, 2015 at 5:55 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 2015-08-21 03:25 AM, Khem Raj wrote:
>>>
>>> On Thu, Aug 20, 2015 at 10:38 PM,  <wenzong.fan@windriver.com> wrote:
>>>>
>>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>>
>>>> Pull package from meta-oe to oe-core:
>>>> meta-oe commit: bce4dba5546480c8e43c6442959ac7d0a4ef32f6
>>>>
>>>> The libcap-ng library is intended to make programming with posix
>>>> capabilities much easier than the traditional libcap library.
>>>>
>>>> It's not a replacement to libcap, it provides different library
>>>> (libcap-ng.so) while packages explicitly look for libcap.so. It
>>>> could be used by qemu, util-linux, libvirt, audit ...
>>>>
>>>> With adding it to oe-core, the copies from following layers could
>>>> be removed:
>>>>
>>>> * meta-oe, meta-selinux, meta-security-framework ...
>>>
>>>
>>> I am afraid that we  are setting a pretext for moving all recipes that
>>> are in multiple layers to be eligible for OE-core now.
>>> meta-oe is common layer for extended recipes, so may be other layers
>>> should have been a bit more vigilant and made sure
>>> there requirements were met with whats in meta-oe.
>>
>>
>> Meta-oe has far to many recipes for some people to want
>> to include the entire layer:
>>    meta-oe.git $ find meta-oe/ -name "*bb" | wc -l
>>    618
> 
> I typically include most of the meta-oe layers, but I've never really
> given much thought to how many recipes there are.
> 
> Is the concern that parsing too many recipes makes bitbake slow? Or is
> there another reason why I wouldn't want to include them all?

Slow has nothing to do with it.  It's purely from a support perspective.  If we
claim to our customers to support a layer, and don't make it explicit that
certain pieces of it are 'unsupported', then we're on the hook for everything.

(I'm not singling out meta-oe BTW...)  What we want is an easy way for our
customers to use meta-oe, but also understand where our product support ends and
custom or community support begins.

This whitelisting, subsetting, masking, blacklisting, etc are all ways we can
accomplish this goal.  I don't believe this is unique to my environment, but
it's likely more common for OSVs then end device makers.

--Mark

>> We can certainly use the new whitelist layer filtering to
>> get to a smaller collection of recipes but I'd like to suggest we
>> need to document and maybe design the layer structure
>> a bit more. There are lots of different opinions about
>> how to split collections of packages in to different layers so
>> unless someone has a dependency-based analysis of all
>> pacakges in all layers, I don't see much point in a long
>> discussion on this topic.
>>
>> Has the idea of creating a new meta-openembedded layer
>> for widely-used, OS interface libraries been proposed?
>> These 80 recipes could be considered for inclusion:
>>    $ find  meta-oe -name "lib*bb" | wc -l
>>    80
>> but more consideration is probably needed.
>>
>> In the short term (oe-core-1.9 (now 2.0), I guess we leave
>> things as they are. Sigh...
>>
>> ../Randy
>>
>>
>> While I'm at it, for reference of layer size:
>>
>> $ for i in `ls -d meta-*`; do echo -n $i": "; find $i -name "*bb" | wc -l;
>> done
>> meta-efl: 57
>> meta-filesystems: 16
>> meta-gnome: 82
>> meta-gpe: 5
>> meta-initramfs: 14
>> meta-multimedia: 51
>> meta-networking: 115
>> meta-oe: 618
>> meta-perl: 30
>> meta-python: 74
>> meta-ruby: 4
>> meta-systemd: 1
>> meta-webserver: 13
>> meta-xfce: 67
>>
>> -----------------------------------------
>>
>>
>>
>>> we should ask what core feature does it enable for reference images
>>> and machines.
>>>
>>>>
>>>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>>>> ---
>>>>   .../libcap-ng/libcap-ng/python.patch               | 58
>>>> ++++++++++++++++++++++
>>>>   meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  | 39 +++++++++++++++
>>>>   2 files changed, 97 insertions(+)
>>>>   create mode 100644
>>>> meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>>>   create mode 100644 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>>>
>>>> diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>>> b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>>> new file mode 100644
>>>> index 0000000..59591eb
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
>>>> @@ -0,0 +1,58 @@
>>>> +From b01bb2694f66cd981e6d61523433dc3eb5ed32f2 Mon Sep 17 00:00:00 2001
>>>> +From: Li xin <lixin.fnst@cn.fujitsu.com>
>>>> +Date: Sat, 18 Jul 2015 23:03:30 +0900
>>>> +Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
>>>> + Makefile.am - avoid hard coded host include paths.
>>>> +
>>>> +Upstream-Status: pending
>>>> +
>>>> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>>> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>>>> +---
>>>> + bindings/python/Makefile.am |  3 ++-
>>>> + configure.ac                | 15 ++-------------
>>>> + 2 files changed, 4 insertions(+), 14 deletions(-)
>>>> +
>>>> +diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
>>>> +index 82b9bb8..f9fe7a8 100644
>>>> +--- a/bindings/python/Makefile.am
>>>> ++++ b/bindings/python/Makefile.am
>>>> +@@ -23,7 +23,8 @@ SUBDIRS = test
>>>> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
>>>> + AM_CFLAGS = -fPIC -DPIC
>>>> + PYLIBVER ?= python$(PYTHON_VERSION)
>>>> +-AM_CPPFLAGS = -I. -I$(top_builddir) -I@PYINCLUDEDIR@
>>>> ++PYINC ?= /usr/include/$(PYLIBVER)
>>>> ++AM_CPPFLAGS = -I. -I$(top_builddir) -I$(PYINC)
>>>> + LIBS = $(top_builddir)/src/libcap-ng.la
>>>> + SWIG_FLAGS = -python
>>>> + SWIG_INCLUDES = ${AM_CPPFLAGS}
>>>> +diff --git a/configure.ac b/configure.ac
>>>> +index 1d777d5..9d90f64 100644
>>>> +--- a/configure.ac
>>>> ++++ b/configure.ac
>>>> +@@ -123,19 +123,8 @@ if test x$use_python = xno ; then
>>>> + else
>>>> + AC_MSG_RESULT(testing)
>>>> + AM_PATH_PYTHON
>>>> +-PYINCLUDEDIR=`python${am_cv_python_version} -c "from distutils import
>>>> sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
>>>> +-if test -f ${PYINCLUDEDIR}/Python.h ; then
>>>> +-      python_found="yes"
>>>> +-      AC_SUBST(PYINCLUDEDIR)
>>>> +-      AC_MSG_NOTICE(Python bindings will be built)
>>>> +-else
>>>> +-      python_found="no"
>>>> +-      if test x$use_python = xyes ; then
>>>> +-              AC_MSG_ERROR([Python explicitly required and python
>>>> headers found])
>>>> +-      else
>>>> +-              AC_MSG_WARN("Python headers not found - python bindings
>>>> will not be made")
>>>> +-      fi
>>>> +-fi
>>>> ++python_found="yes"
>>>> ++AC_MSG_NOTICE(Python bindings will be built)
>>>> + fi
>>>> + AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
>>>> +
>>>> +--
>>>> +1.8.4.2
>>>> +
>>>> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>>> b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>>> new file mode 100644
>>>> index 0000000..a31d5dc
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>>>> @@ -0,0 +1,39 @@
>>>> +SUMMARY = "An alternate posix capabilities library"
>>>> +DESCRIPTION = "The libcap-ng library is intended to make programming \
>>>> +with POSIX capabilities much easier than the traditional libcap
>>>> library."
>>>> +HOMEPAGE = "http://freecode.com/projects/libcap-ng"
>>>> +SECTION = "base"
>>>> +LICENSE = "GPLv2+ & LGPLv2.1+"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
>>>> \
>>>> +
>>>> file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>>>> +
>>>> +SRC_URI =
>>>> "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
>>>> +           file://python.patch"
>>>> +
>>>> +inherit lib_package autotools pythonnative
>>>> +
>>>> +SRC_URI[md5sum] = "3d7d126b29e2869a0257c17c8b0d9b2e"
>>>> +SRC_URI[sha256sum] =
>>>> "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
>>>> +
>>>> +DEPENDS += "swig-native python"
>>>> +
>>>> +EXTRA_OECONF += "--without-python3"
>>>> +
>>>> +EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}'
>>>> PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
>>>> +
>>>> +PACKAGES += "${PN}-python"
>>>> +
>>>> +FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
>>>> +FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
>>>> +
>>>> +BBCLASSEXTEND = "native"
>>>> +
>>>> +do_install_append() {
>>>> +       # Moving libcap-ng to base_libdir
>>>> +       if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>>>> +               mkdir -p ${D}/${base_libdir}/
>>>> +               mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
>>>> +               relpath=${@os.path.relpath("${base_libdir}",
>>>> "${libdir}")}
>>>> +               ln -sf ${relpath}/libcap-ng.so.0.0.0
>>>> ${D}${libdir}/libcap-ng.so
>>>> +       fi
>>>> +}
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
>> K2K 2W5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


