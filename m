Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B874C6F937
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 02:08:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2L28LRN014609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Mar 2014 19:08:22 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 20 Mar 2014 19:08:21 -0700
Message-ID: <532B9F1B.7080504@windriver.com>
Date: Fri, 21 Mar 2014 10:08:27 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1394610315.git.kai.kang@windriver.com>
	<eaf248b590ed38e4ad4135ff58e99e23336c9f75.1394610315.git.kai.kang@windriver.com>
	<532A8BB7.3010306@windriver.com> <1395314868.3808.169.camel@ted>
In-Reply-To: <1395314868.3808.169.camel@ted>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] libnewt: update to 0.52.17
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
X-List-Received-Date: Fri, 21 Mar 2014 02:08:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年03月20日 19:27, Richard Purdie wrote:
> On Thu, 2014-03-20 at 14:33 +0800, Kang Kai wrote:
>> On 2014年03月12日 15:47, Kai Kang wrote:
>>> Update libnewt and libnewt-python to 0.52.17.
>>>
>>> * remove PR
>>> * update cross_ar.patch and fix_SHAREDDIR.patch that context changed
>>> * remove fix_python_fpic.patch which is merged
>>> * update so file name in libnewt-python recipe
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>    meta/recipes-extended/newt/files/cross_ar.patch      | 16 ++++------------
>>>    meta/recipes-extended/newt/files/fix_SHAREDDIR.patch |  4 ++--
>>>    meta/recipes-extended/newt/libnewt-python_0.52.14.bb |  5 ++---
>>>    meta/recipes-extended/newt/libnewt_0.52.14.bb        | 10 ++++------
>>>    4 files changed, 12 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/newt/files/cross_ar.patch b/meta/recipes-extended/newt/files/cross_ar.patch
>>> index f67239a..2035cc4 100644
>>> --- a/meta/recipes-extended/newt/files/cross_ar.patch
>>> +++ b/meta/recipes-extended/newt/files/cross_ar.patch
>>> @@ -19,16 +19,8 @@ Upstream-Status: Pending
>>>    
>>>    --- a/Makefile.in
>>>    +++ b/Makefile.in
>>> -@@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
>>> - LDFLAGS = @LDFLAGS@
>>> - CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
>>> - GNU_LD = @GNU_LD@
>>> -+AR = @AR@
>>> -
>>> - VERSION = @VERSION@
>>> - TAG = r$(subst .,-,$(VERSION))
>>> -@@ -95,7 +96,7 @@ whiptcl.so: $(WHIPTCLOBJS) $(LIBNEWTSH)
>>> - 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.so $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
>>> +@@ -109,7 +109,7 @@
>>> + 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
>>>     
>>>     $(LIBNEWT): $(LIBOBJS)
>>>    -	ar rv $@ $^
>>> @@ -38,10 +30,10 @@ Upstream-Status: Pending
>>>     
>>>    --- a/configure.ac
>>>    +++ b/configure.ac
>>> -@@ -14,6 +14,10 @@ AC_PROG_CC
>>> - AC_PROG_INSTALL
>>> +@@ -15,6 +15,10 @@
>>>     AC_PROG_LN_S
>>>     AC_PROG_GREP
>>> + AC_SYS_LARGEFILE
>>>    +AN_MAKEVAR([AR], [AC_PROG_AR])
>>>    +AN_PROGRAM([ar], [AC_PROG_AR])
>>>    +AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
>>> diff --git a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
>>> index 7795260..1907aef 100644
>>> --- a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
>>> +++ b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
>>> @@ -12,14 +12,14 @@ Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>>    
>>>    --- a/Makefile.in
>>>    +++ b/Makefile.in
>>> -@@ -114,12 +114,12 @@
>>> +@@ -128,12 +128,12 @@
>>>     
>>>     sharedlib: $(LIBNEWTSH)
>>>     
>>>    -$(LIBNEWTSH): $(SHAREDDIR) $(SHAREDOBJS)
>>>    +$(LIBNEWTSH): $(SHAREDOBJS)
>>>     	$(CC) -shared -o $(LIBNEWTSH) $(SHLIBFLAGS) $(SHAREDOBJS) $(LDFLAGS) $(LIBS)
>>> - 	ln -fs $(LIBNEWTSONAME) libnewt.so
>>> + 	ln -fs $(LIBNEWTSONAME) libnewt.$(SOEXT)
>>>     	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
>>>     
>>>    -$(SHAREDDIR)/%.o : %.c
>>> diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
>>> index 871b195..70ab202 100644
>>> --- a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
>>> +++ b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
>>> @@ -9,15 +9,14 @@ inherit pythonnative python-dir
>>>    EXTRA_OECONF += "--with-python"
>>>    EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
>>>    
>>> -
>>>    do_compile () {
>>>    	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
>>> -	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snackmodule.so
>>> +	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snack.so
>>>    }
>>>    
>>>    do_install () {
>>>    	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>>> -	install -m 0755 ${PYTHON_DIR}/_snackmodule.so ${D}${PYTHON_SITEPACKAGES_DIR}/
>>> +	install -m 0755 ${PYTHON_DIR}/_snack.so ${D}${PYTHON_SITEPACKAGES_DIR}/
>>>    	install -m 0644 snack.py ${D}${PYTHON_SITEPACKAGES_DIR}/
>>>    }
>>>    
>>> diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
>>> index 65bcf40..46598e6 100644
>>> --- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
>>> +++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
>>> @@ -12,21 +12,19 @@ HOMEPAGE = "https://fedorahosted.org/newt/"
>>>    SECTION = "libs"
>>>    
>>>    LICENSE = "LGPLv2"
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>>>    
>>>    # slang needs to be >= 2.2
>>>    DEPENDS = "slang popt"
>>>    
>>> -PR = "r2"
>>> -
>>>    SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
>>>               file://remove_slang_include.patch \
>>>               file://fix_SHAREDDIR.patch \
>>>               file://cross_ar.patch \
>>> -           file://fix_python_fpic.patch"
>>> +          "
>>>    
>>> -SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
>>> -SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
>>> +SRC_URI[md5sum] = "f36d4d908965a0c89fd6fd8b61a6118b"
>>> +SRC_URI[sha256sum] = "69837973ef2ee2fa644426f1c3e48d2b18785ebcd382ef7fd01eb2e67d2d632b"
>>>    
>>>    S = "${WORKDIR}/newt-${PV}"
>> Any comment on libnewt commit? I notice other patches in this serial are
>> merged except libnewt.
> It broke builds:
>
> http://autobuilder.yoctoproject.org/main/builders/minnow-lsb/builds/89/steps/BuildImages/logs/stdio
>
> Your patch header talks about .17 but the patch only modifies .14...

Silly error. I built them for 3 different machines and I'll check it.
Sorry.

--Kai

>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Neil | Kai Kang


