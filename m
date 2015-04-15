Return-Path: <yocto_user@gmx.com>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3811B605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 16:45:02 +0000 (UTC)
Received: from [192.168.3.73] ([64.211.30.29]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0LswqM-1ZNeIG3S6U-012UaV for
	<openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 18:45:03 +0200
Message-ID: <552E958A.3080204@gmx.com>
Date: Wed, 15 Apr 2015 12:44:58 -0400
From: Yocto User <yocto_user@gmx.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <552E7098.9040304@gmx.com>	<1429109475.6976.124.camel@linuxfoundation.org>
	<552E7D8C.9070704@mlbassoc.com>
In-Reply-To: <552E7D8C.9070704@mlbassoc.com>
X-Provags-ID: V03:K0:ysypgQb8jqzjVCSWiUgizxNCkLF/InVcREJDduPnoarUd8wSJNB
	9k9v4Pq8D2GjXFmZez3GDZYvy6XzNNmGbbvggzoDw4SwMFtMS7MMfbqQ3EIjUFh824g/NAm
	mNB8Bi1dHzq/aOpI7MA2aDoUmGEhAMpyK5M12amyLx82iIDgojYVdNm2bylemIWoDTzgdMs
	1mqG3BFSzt+C+Dwfvtosg==
X-UI-Out-Filterresults: notjunk:1;
Subject: Re: [PATCH] expect: install header files in usual location
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
X-List-Received-Date: Wed, 15 Apr 2015 16:45:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2015 11:02 AM, Gary Thomas wrote:
> On 2015-04-15 08:51, Richard Purdie wrote:
>> On Wed, 2015-04-15 at 10:07 -0400, Yocto User wrote:
>>> This patch resolves [Bug 7552] where the headers for the expect library
>>> were installed into the wrong location.
>>
>> Few minor comments/tweaks needed:
>>
>> The correct form for bug numbers is:
>>
>> [YOCTO #7552]
>>
>>>
>
> Also, needs a Signed-off-by line (with a real name)
>
>>> ---
>>>    meta/recipes-devtools/expect/expect_5.45.bb |   12 ++++--------
>>>    1 file changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb
>>> b/meta/recipes-devtools/expect/expect_5.45.bb
>>> index 264f007..4129ab1 100644
>>> --- a/meta/recipes-devtools/expect/expect_5.45.bb
>>> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
>>> @@ -18,7 +18,7 @@ RDEPENDS_${PN} = "tcl"
>>>
>>>    inherit autotools
>>>
>>> -PR = "r1"
>>> +PR = "r2"
>>
>> No need to bump PR now.
>>
>>>    SRC_URI = 
>>> "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>>>               file://0001-configure.in.patch \
>>> @@ -40,8 +40,7 @@ do_install_append() {
>>>            sed -e 's|$dir|${libdir}|' -i
>>> ${D}${libdir}/expect${PV}/pkgIndex.tcl
>>>    }
>>>
>>> -EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
>>> -                 --with-tcl=${STAGING_LIBDIR} \
>>> +EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
>>>                     --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
>>>                     --enable-shared \
>>>                     --enable-threads \
>>> @@ -52,12 +51,9 @@ EXTRA_OEMAKE_install = " 'SCRIPTS=' "
>>>    FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
>>>                        ${libdir}/.debug \
>>>                       "
>>> +
>>>    FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
>>> -                   ${STAGING_INCDIR}/expect.h \
>>> -                   ${STAGING_INCDIR}/expect_tcl.h \
>>> -                   ${STAGING_INCDIR}/expect_comm.h \
>>> -                   ${STAGING_INCDIR}/tcldbg.h \
>>> -                   ${includedir}/*.h \
>>> +                   ${includedir} \
>>>                      "
>>
>> Isn't this included in FILES_${PN}-dev by default?
>>
>> Cheers,
>>
>> Richard
>>
>

Thank you for the feedback.  When I started addressing your comments, I 
realized expect wasn't being packaged quite right. There are various 
script files from the example directory that aren't strictly part of the 
base package.  I used the debian distribution for reference and found 
that they place the extra scripts into the -dev package.  This new 
version simplifies the recipe and fixes these packaging issues.

This patch resolves [YOCTO #7552] where the headers for the expect 
library were installed into the wrong location.


Signed-off-by: Mitchell White <mitchell.white@thalesdsi.com>
---
  meta/recipes-devtools/expect/expect_5.45.bb |   36 
+++++++++++----------------
  1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb 
b/meta/recipes-devtools/expect/expect_5.45.bb
index 264f007..87babd4 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -26,40 +26,32 @@ SRC_URI = 
"${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
             file://01-example-shebang.patch \
file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
            "
+
  SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
  SRC_URI[sha256sum] = 
"b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"

  S = "${WORKDIR}/${BPN}${PV}"

  do_install_append() {
-    install -d ${D}${libdir}
-        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so 
${D}${libdir}/
-        install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
-        install -m 0755 ${S}/example/* ${D}${libdir}/expect${PV}/
-        rm ${D}${libdir}/expect${PV}/libexpect*.so
-        sed -e 's|$dir|${libdir}|' -i 
${D}${libdir}/expect${PV}/pkgIndex.tcl
+    sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
  }

-EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
-                 --with-tcl=${STAGING_LIBDIR} \
+EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                   --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
                   --enable-shared \
                   --enable-threads \
                   --disable-rpath \
                  "
-EXTRA_OEMAKE_install = " 'SCRIPTS=' "

-FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
-                    ${libdir}/.debug \
-                   "
-FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
-                   ${STAGING_INCDIR}/expect.h \
-                   ${STAGING_INCDIR}/expect_tcl.h \
-                   ${STAGING_INCDIR}/expect_comm.h \
-                   ${STAGING_INCDIR}/tcldbg.h \
-                   ${includedir}/*.h \
-                  "
+FILES_${PN}-dbg += "\
+    ${libdir}/expect${PV}/.debug \
+    "
+
+FILES_${PN}-dev += "\
+    ${bindir} \
+    "

-FILES_${PN} += "${libdir}/libexpect${PV}.so \
-                ${libdir}/expect${PV}/* \
-               "
+FILES_${PN} = "\
+    ${bindir}/expect \
+    ${libdir}/expect${PV} \
+    "
-- 
1.7.9.5


