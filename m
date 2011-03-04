Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1PvTiC-0001yJ-MI
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 13:02:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p249JtAn001804
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Mar 2011 01:19:56 -0800 (PST)
Received: from [128.224.163.157] (128.224.163.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 4 Mar 2011 01:19:55 -0800
Message-ID: <4D70AEB2.3070608@windriver.com>
Date: Fri, 4 Mar 2011 17:19:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1299182375.git.sgw@linux.intel.com>	<1bd92439689523c3249a91688688c2b83245fa5c.1299182375.git.sgw@linux.intel.com>
	<AANLkTi=kduRmC5Vsj3Lr-6ccRiQ-+AHSnUoYxkoPOmBT@mail.gmail.com>
In-Reply-To: <AANLkTi=kduRmC5Vsj3Lr-6ccRiQ-+AHSnUoYxkoPOmBT@mail.gmail.com>
X-Originating-IP: [128.224.163.157]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p249JtAn001804
X-Mailman-Approved-At: Fri, 04 Mar 2011 14:03:29 +0100
Cc: openembedded-core@lists.openembedded.org, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 08/10] recipe: add newt from OE
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
X-List-Received-Date: Fri, 04 Mar 2011 12:02:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B403=E6=9C=8804=E6=97=A5 04:27, Khem Raj wrote:
> On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> From: Kang Kai<kai.kang@windriver.com>
>>
>> newt is a library for text mode user interfaces, and required by
>> chkconfig because of LSB command test.
> may be mentioned the commit SHA of this file from OE repo would be nice=
 to have
>
Thank you. I will add the original informations next time.

>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   .../newt/files/include-without-python.patch        |   71 ++++++++++=
++++++++++
>>   meta/recipes-extended/newt/libnewt_0.52.12.bb      |   37 ++++++++++
>>   2 files changed, 108 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-extended/newt/files/include-without-=
python.patch
>>   create mode 100644 meta/recipes-extended/newt/libnewt_0.52.12.bb
>>
>> diff --git a/meta/recipes-extended/newt/files/include-without-python.p=
atch b/meta/recipes-extended/newt/files/include-without-python.patch
>> new file mode 100644
>> index 0000000..277ee33
>> --- /dev/null
>> +++ b/meta/recipes-extended/newt/files/include-without-python.patch
>> @@ -0,0 +1,71 @@
>> +From 3d13bbbb769050fac4cc6c904c174edc27e4f03d Mon Sep 17 00:00:00 200=
1
>> +From: Otavio Salvador<otavio@ossystems.com.br>
>> +Date: Thu, 20 Jan 2011 14:14:51 -0200
>> +Subject: [PATCH] build: add -without-python
>> +
>> +Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>> +---
>> + Makefile.in  |    8 ++++----
>> + configure.ac |   10 ++++++++--
>> + 2 files changed, 12 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/Makefile.in b/Makefile.in
>> +index e764e61..74e9097 100644
>> +--- a/Makefile.in
>> ++++ b/Makefile.in
>> +@@ -77,7 +77,7 @@ showkey:     showkey.o $(LIBNEWT)
>> +       $(CC) -g -o showkey showkey.o $(LIBNEWT) $(LDFLAGS) $(LIBS)
>> +
>> + _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
>> +-      for ver in $(PYTHONVERS) ; do \
>> ++      [ -n "$(PYTHONVERS)" ]&&  for ver in $(PYTHONVERS) ; do \
>> +               mkdir -p $$ver ;\
>> +                       PCFLAGS=3D`$$ver-config --cflags`; \
>> +                       PIFLAGS=3D`$$ver-config --includes`; \
>> +@@ -85,7 +85,7 @@ _snackmodule.so:   snackmodule.c $(LIBNEWTSH)
>> +                       PLFLAGS=3D`$$ver-config --libs`; \
>> +               $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snac=
kmodule.o snackmodule.c ;\
>> +               $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ve=
r/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
>> +-      done
>> ++      done || :
>> +       touch $@
>> +
>> + whiptail: $(NDIALOGOBJS) $(LIBNEWTSH)
>> +@@ -141,11 +141,11 @@ install-sh: sharedlib $(WHIPTCLSO) _snackmodule=
.so
>> +       ln -sf $(LIBNEWTSONAME) $(instroot)/$(libdir)/libnewt.so
>> +       ln -sf $(LIBNEWTSH) $(instroot)/$(libdir)/$(LIBNEWTSONAME)
>> +       [ -n "$(WHIPTCLSO)" ]&&  install -m 755 whiptcl.so $(instroot)=
/$(libdir) || :
>> +-      for ver in $(PYTHONVERS) ; do \
>> ++      [ -n "$(PYTHONVERS)" ]&&  for ver in $(PYTHONVERS) ; do \
>> +          [ -d $(instroot)/$(libdir)/$$ver/site-packages ] || install=
 -m 755 -d $(instroot)/$(libdir)/$$ver/site-packages ;\
>> +          install -m 755 $$ver/_snackmodule.so $(instroot)/$(libdir)/=
$$ver/site-packages ;\
>> +          install -m 644 snack.py $(instroot)/$(libdir)/$$ver/site-pa=
ckages ;\
>> +-      done
>> ++      done || :
>> +
>> + Makefile: newt.spec
>> +       echo "You need to rerun ./configure before continuing"
>> +diff --git a/configure.ac b/configure.ac
>> +index 7bc381a..dc04352 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -54,8 +54,14 @@ fi
>> + AC_CHECK_HEADERS([popt.h libintl.h])
>> +
>> + AC_MSG_CHECKING([for python versions])
>> +-PYTHONVERS=3D$(echo /usr/include/python*/Python.h | sed "s|/usr/incl=
ude/||g"| sed "s|/Python.h||g" 2>  /dev/null)
>> +-AC_MSG_RESULT([$PYTHONVERS])
>> ++AC_ARG_WITH([python], [  --without-python        do not compile pyth=
on support])
>> ++if test "x$with_python" =3D "xno"; then
>> ++  AC_MSG_RESULT([skipped])
>> ++  PYTHONVERS=3D
>> ++else
>> ++  PYTHONVERS=3D$(ls /usr/include/python*/Python.h 2>  /dev/null | se=
d "s|/usr/include/||g"| sed "s|/Python.h||g" 2>  /dev/null)
>> ++  AC_MSG_RESULT([$PYTHONVERS])
>> ++fi
>> + AC_SUBST([PYTHONVERS])
>> +
>> + AC_ARG_WITH([tcl], [  --without-tcl           do not compile whiptcl=
.so])
>> +--
>> +1.7.2.3
>> +
>> diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/reci=
pes-extended/newt/libnewt_0.52.12.bb
>> new file mode 100644
>> index 0000000..eefd6bd
>> --- /dev/null
>> +++ b/meta/recipes-extended/newt/libnewt_0.52.12.bb
>> @@ -0,0 +1,37 @@
>> +SUMMARY =3D "A library for text mode user interfaces"
>> +
>> +DESCRIPTION =3D "Newt is a programming library for color text mode, w=
idget based user \
>> +interfaces.  Newt can be used to add stacked windows, entry widgets, =
\
>> +checkboxes, radio buttons, labels, plain text fields, scrollbars, \
>> +etc., to text mode user interfaces.  This package also contains the \
>> +shared library needed by programs built with newt, as well as a \
>> +/usr/bin/dialog replacement called whiptail.  Newt is based on the \
>> +slang library."
>> +
>> +HOMEPAGE =3D "https://fedorahosted.org/newt/"
>> +SECTION =3D "libs"
>> +
>> +LICENSE =3D "LGPL"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9=
abc605"
>> +
>> +# slang needs to be>=3D 2.2
>> +DEPENDS =3D "slang popt"
>> +
>> +PR =3D "r0"
>> +
>> +SRCREV =3D "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
>> +SRC_URI =3D "git://git.fedorahosted.org/git/newt;protocol=3Dgit \
>> +           file://include-without-python.patch"
>> +S =3D "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF =3D "--without-python --without-tcl"
>> +
>> +inherit autotools
>> +
>> +PACKAGES_prepend =3D "whiptail "
>> +
>> +do_configure_prepend() {
>> +    sh autogen.sh
>> +}
>> +
>> +FILES_whiptail =3D "${bindir}/whiptail"
>> --
>> 1.7.1.1
>>
>> _______________________________________________
>> poky mailing list
>> poky@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/poky
>>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



