Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SVMET-0000I7-1x
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 14:24:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4ICESvT020167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 05:14:28 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 18 May 2012 05:14:27 -0700
Message-ID: <4FB63D21.7060603@windriver.com>
Date: Fri, 18 May 2012 20:14:25 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337162056.git.xiaofeng.yan@windriver.com>
	<a918712a769df875f9e59f7a5aa233b7316705c2.1337162056.git.xiaofeng.yan@windriver.com>
	<4FB38961.2000702@linux.intel.com> <4FB45BEF.6070204@windriver.com>
	<4FB4E8D7.2020808@windriver.com> <4FB5FB63.1030801@windriver.com>
In-Reply-To: <4FB5FB63.1030801@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q4ICESvT020167
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] ncurses: Disable parallel make
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
X-List-Received-Date: Fri, 18 May 2012 12:24:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable


I've looked into the code, this is a race issue which is caused by
install.libs and install.data:

1) install.data needs run tic
2) tic needs libtinfo.so
3) install.libs would regenerate libtinfo.so
4) but install.data doesn't depend on install.libs, and they can run
    parallelly

So there would be errors in a very critical condition: tic is begining
to run at the same time when install.libs is generating libtinfo.so, and
this libtinfo.so is not integrity, then there would be the error:

tic: error while loading shared libraries: /path/to/lib/libtinfo.so.5: fi=
le too=20
short

Here are the related code:
1) The do_install in meta/recipes-core/ncurses/ncurses.inc:

make install.libs ... install.data

2) The install.libs and install.data in ncurses-5.9/narrowc/Makefile, not=
e that
    it uses the double-colon which means that the all the targets in diff=
erent
    rules will be run, and if there are no prerequisites for that rule, i=
ts
    recipe is always executed (even if the target already exists). The
    install.libs is in 9 rules (just paste 2 here):

install.libs uninstall.libs \
install.data uninstall.data ::
         cd misc && ${MAKE} ${CF_MFLAGS} $@
...
install.libs \
uninstall.libs \
install.ncurses \
uninstall.ncurses ::
         cd ncurses && ${MAKE} ${CF_MFLAGS} $@
...


3) The install.libs in ncurses-5.9/narrowc/ncurses/Makefile:

../lib/libtinfo.so.$(REL_VERSION) : \
                 ../lib \
                 $(SHARED_T_OBJS)
         @echo linking $@
         $(MK_SHARED_LIB) $(SHARED_T_OBJS) $(TINFO_LIST) $(LDFLAGS)
         cd ../lib && ($(LN_S) libtinfo.so.$(REL_VERSION)=20
libtinfo.so.$(ABI_VERSION); $(LN_S) libtinfo.so.$(ABI_VERSION) libtinfo.s=
o; )


The ../lib/libtinfo.so has been generated in the compile stage, but it wo=
uld be
regenerated since its prerequisites (../lib) has changed.

The easiest way to fix this is first run install.libs, then install.data,=
 here
is the patch:
diff --git a/meta/recipes-core/ncurses/ncurses.inc=20
b/meta/recipes-core/ncurses/ncurses.inc
index ae99e2c..6309b69 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -122,8 +122,17 @@ shell_do_install() {
          # Order of installation is important; widec installs a 'curses.=
h'
          # header with more definitions and must be installed last hence.
          # Compatibility of these headers will be checked in 'do_test()'.
+
+        # The install.data should run after install.libs, otherwise
+        # there would be a race issue in a very critical conditon, since
+        # tic will be run by install.data, and tic needs libtinfo.so
+        # which would be regenerated by install.libs.
          oe_runmake -C narrowc ${_install_opts} \
-                install.data install.progs
+                install.progs
+
+        oe_runmake -C narrowc DESTDIR=3D'${D}'  \
+                PKG_CONFIG_LIBDIR=3D'${libdir}/pkgconfig' \
+                install.data

          ! ${ENABLE_WIDEC} || \
              oe_runmake -C widec ${_install_opts}


Another solution is modify the Makefiles, but that is not as simple as mo=
dify
the ncurses.inc.

Xiaofeng will send the V2 after enough testing.

// Robert

On 05/18/2012 03:33 PM, Xiaofeng Yan wrote:
> On 2012=E5=B9=B405=E6=9C=8817=E6=97=A5 20:02, Jason Wessel wrote:
>> On 05/16/2012 09:01 PM, Xiaofeng Yan wrote:
>>> On 2012=E5=B9=B405=E6=9C=8816=E6=97=A5 19:02, Saul Wold wrote:
>>>> On 05/16/2012 01:10 PM, xiaofeng.yan@windriver.com wrote:
>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>
>>>>> Ncurses failure non-gplv3 build by race issue. So disable parallel =
\
>>>>> make when building this package.
>>>>>
>>>> This is not the best approach as you disable PARALLEL_MAKE for both
>>>> non-gplv3 and gplv3 versions. Further, we want to get rid of [M1]
>>>> setting as much as possible, so this patch is not helping that.
>>>>
>>>> Did you try running on a large many core machine? It might help if y=
ou
>>>> have some other builds going also to stress the machine.
>>>>
>>>> Sau!
>>> Thanks for your reply. The most cores I have are eight. I also set
>>> PARALLEL_MAKE=3Dj1000 and 10000. I think I need try to find new way f=
or
>>> fixing bugs.
>>>
>> Do you have an error file from a failed build (and ideally the failed =
build
>> directory)? Having diagnosed many problems like this in the past, it i=
s
>> easiest to look for the failure case and add some sleep statement in t=
he
>> Makefile to get it to trigger every time in the same way.
> Hi jason,
> The failed build information is in *Bug 2298*
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2298>. The error a=
ppear in
> the stage of install, not configure and compiling.
> Do you any ideas after reading bug information?
>
> Thanks
> Yan
>
>
>
>> The two most common problems are:
>> 1) autoconf re-runs due to time stamps or partially patched files
>> 2) a generated file is reported as missing
>>
>> In the first case it, it will often be some error with a .h missing or=
 some
>> other strange error about a header in the compilation and it is a resu=
lt of
>> only having a partial file because it is getting regenerated at the ti=
me.
>>
>> In the second case you just find the file's rule in the Makefile and a=
dd an if
>> statement in the Make target goal if it is a multi-object rule to look=
 for the
>> problem object and sleep a bit. I have yet to see a case I couldn't re=
produce
>> the results by following the strategy of some forcing some extra delay=
. You
>> probably won't have to go to this length, but there was one time I eve=
n wrote
>> a C wrapper around a command to add some sleep controlled by an enviro=
nment
>> variable to prove config.h was getting removed and regenerated. Exampl=
e:
>>
>> #include<stdio.h>
>> #include<stdlib.h>
>> #include<string.h>
>> #include<unistd.h>
>>
>> int main(int argc, char *const argv[]) {
>> char *lookfor;
>> if (argc>=3D 2) {
>> lookfor =3D getenv("LOOKFORSLEEP");
>> if (lookfor&& strcmp(argv[1], lookfor) =3D=3D 0) {
>> if (argc>=3D 3&& strcmp(argv[2], "config.h") =3D=3D 0) {
>> unlink("config.h");
>> printf("Special sleep on command %s\n", lookfor);
>> sleep(2);
>> }
>> }
>> }
>> execv("/bin/sh", argv);
>> return 0;
>> }
>>
>>
>> Best of luck,
>> Jason.
>>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


