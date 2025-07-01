Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C363C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 12:29:43 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.9242.1751372973060312213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 05:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id 337BAE75F
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 14:29:31 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.229]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWa76-273SAC0; Tue, 1 Jul 2025 14:29:28 +0200
Date: Tue, 01 Jul 2025 14:29:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] tcl: fix tclConfig.sh after UNPACKDIR change
To: openembedded-core@lists.openembedded.org
Message-Id: <Z00QYS.ZUYPSA3HVF4P3@t-online.de>
In-Reply-To: <184E1D11132770D1.6792@lists.openembedded.org>
References: <184E1CE45E458024.6792@lists.openembedded.org>
	<184E1D11132770D1.6792@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/E8QVycsu5f/bNSGnGq9"
X-TOI-EXPURGATEID: 150726::1751372968-797F8597-93E8A8E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 37cb0e3f-e43a-4738-b165-26b97db368c5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 12:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219567

--=-/E8QVycsu5f/bNSGnGq9
Content-Type: text/plain; charset=us-ascii; format=flowed

oops. That doesn't work either. Sorry for the confusion

The problem I'm having:

After applying v1 of this patch, the following command is successful

bitbake -c cleansstate tcl tk && bitbake tk

So I thought the problem was fixed. But after I created an image with 
this change, it showed the following
, which can be fixed by v2 of this patch, but v2 breaks the tk build 
again
ERROR: tcl-9.0. 1-r0 do_package_qa: QA problem: file 
/usr/lib/tclConfig.sh in package tcl-dev contains reference to TMPDIR 
[buildpaths]
ERROR: tcl-9.0.1-r0 do_package_qa: Fatal QA errors found, task fails.
ERROR: Log file of error saved in: 
/home/flk/poky/build-raspi/tmp/work/cortexa72-poky-linux/tcl/9.0.1/temp/log.do_package_qa.415042
ERROR: Task 
(/home/flk/poky/meta/recipes-devtools/tcltk/tcl_9.0.1.bb:do_package_qa) 
failed with exit code '1'

My conclusion is that we can't get things working properly with 
tclConfig.sh (without adding a buildpath error)
I wonder if it would be better to omit the version in tcl includedir so 
that it would no longer change dynamically. e.g:


 From c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
Date: Mon, 30 Jun 2025 22:03:17 +0200
Subject: [PATCH] tcl: dont use version in includedir

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tcltk/tcl/0004-tcl-update-the-header-location.patch | 8 ++++----
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git 
a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch 
b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
index 50a4a27256..1bcdfb3c22 100644
--- 
a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
+++ 
b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
@@ -34,7 +34,7 @@ index b5f9ab7..fbc87a2 100644

  # Directory in which to install the include file tcl.h:
 -INCLUDE_INSTALL_DIR = $(INSTALL_ROOT)$(includedir)
-+INCLUDE_INSTALL_DIR = $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
++INCLUDE_INSTALL_DIR = $(INSTALL_ROOT)$(includedir)/tcl

  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR = @PRIVATE_INCLUDE_DIR@
@@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644

  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
 -PRIVATE_INCLUDE_DIR='$(includedir)'
-+PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
++PRIVATE_INCLUDE_DIR='$(includedir)/tcl'
  HTML_DIR='$(DISTDIR)/html'

  # Note: in the following variable, it's important to use the absolute
@@ -56,7 +56,7 @@ index 43ec7e4..19524d1 100644

  # Install time header dir can be set via --includedir
 -eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
-+eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""
++eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl\""

  
#------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
@@ -69,7 +69,7 @@ index 9c6da82..8aa5ae8 100644
  exec_prefix=@exec_prefix@
  libdir=@libdir@
 -includedir=@includedir@
-+includedir=@includedir@/tcl@PACKAGE_VERSION@
++includedir=@includedir@/tcl
  libfile=@TCL_LIB_FILE@

  Name: Tool Command Language
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb 
b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..bafea067ed 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -51,13 +51,13 @@ do_install() {
  ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
  ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
  sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
- sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+ sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclConfig.sh
  install -d ${D}${bindir_crossscripts}
  install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
  install -m 0755 tclConfig.sh ${D}${libdir}
  for dir in compat generic unix; do
- install -d ${D}${includedir}/${BPN}${VER}/$dir
- install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
+ install -d ${D}${includedir}/${BPN}/$dir
+ install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/
  done
 }

-- 
2.49.0


I have seen that debian also installs headers in /usr/include/tcl and 
we could then set includedir in tk.bb
like this without having to deal with dynamically changing directory:

EXTRA_OEMAKE += "TCLDIR=${STAGING_INCDIR}/tcl"

As this is invasive, I wanted to ask whether there are any objections 
and whether this would be a possible solution at all?



On Tue, Jul 1 2025 at 13:27:34 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> add the sed command as a new line. Editing ${WORKDIR} is still 
> required
> 
> On Tue, Jul 1 2025 at 13:24:15 +02:00:00, Markus Volk via 
> lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> 
> wrote:
>> Add a sed command that edits tclConfig.sh. This is needed so that
>> tk in meta-oe is capable of reading the required header file
>> 
>> Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>> ---
>>  meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb 
>> b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
>> index 70aa9b606c..15f03b6c9e 100644
>> --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
>> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
>> @@ -52,6 +52,7 @@ do_install() {
>>  	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
>>  	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
>>  	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
>> +	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
>>  	install -d ${D}${bindir_crossscripts}
>>  	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>>  	install -m 0755 tclConfig.sh ${D}${libdir}
>> --
>> 2.49.0
>> 
>> 
>> 
>> 


--=-/E8QVycsu5f/bNSGnGq9
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>oops. That doesn't work eithe=
r. Sorry for the confusion</div><div><br></div><div>The problem I'm having:=
</div><div><br></div><div>After applying v1 of this patch, the following co=
mmand is successful</div><div><br></div><div>bitbake -c cleansstate tcl tk =
&amp;&amp; bitbake tk</div><div><br></div><div>So I thought the problem was=
 fixed. But after I created an image with this change, it showed the follow=
ing</div><div>, which can be fixed by v2 of this patch, but v2 breaks the t=
k build again</div><div>ERROR: tcl-9.0. 1-r0 do_package_qa: QA problem: fil=
e /usr/lib/tclConfig.sh in package tcl-dev contains reference to TMPDIR [bu=
ildpaths]</div><div>ERROR: tcl-9.0.1-r0 do_package_qa: Fatal QA errors foun=
d, task fails.</div><div>ERROR: Log file of error saved in: /home/flk/poky/=
build-raspi/tmp/work/cortexa72-poky-linux/tcl/9.0.1/temp/log.do_package_qa.=
415042</div><div>ERROR: Task (/home/flk/poky/meta/recipes-devtools/tcltk/tc=
l_9.0.1.bb:do_package_qa) failed with exit code '1'</div><div><br></div><di=
v>My conclusion is that we can't get things working properly with tclConfig=
.sh (without adding a buildpath error)&nbsp;</div><div>I wonder if it would=
 be better to omit the version in tcl includedir so that it would no longer=
 change dynamically. e.g:</div><div><br></div></div><div><br></div><div>Fro=
m c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001</div><d=
iv>From: Markus Volk &lt;f_l_k@t-online.de&gt;</div><div>Date: Mon, 30 Jun =
2025 22:03:17 +0200</div><div>Subject: [PATCH] tcl: dont use version in inc=
ludedir</div><div><br></div><div>Signed-off-by: Markus Volk &lt;f_l_k@t-onl=
ine.de&gt;</div><div>---</div><div>&nbsp;.../tcltk/tcl/0004-tcl-update-the-=
header-location.patch   | 8 ++++----</div><div>&nbsp;meta/recipes-devtools/=
tcltk/tcl_9.0.1.bb                  | 6 +++---</div><div>&nbsp;2 files chan=
ged, 7 insertions(+), 7 deletions(-)</div><div><br></div><div>diff --git a/=
meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch b=
/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch<=
/div><div>index 50a4a27256..1bcdfb3c22 100644</div><div>--- a/meta/recipes-=
devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch</div><div>+++ =
b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch=
</div><div>@@ -34,7 +34,7 @@ index b5f9ab7..fbc87a2 100644</div><div>&nbsp;=
&nbsp;</div><div>&nbsp; # Directory in which to install the include file tc=
l.h:</div><div>&nbsp;-INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)<=
/div><div>-+INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)/tcl$(VERSI=
ON)</div><div>++INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)/tcl</d=
iv><div>&nbsp;&nbsp;</div><div>&nbsp; # Path to the private tcl header dir:=
</div><div>&nbsp; PRIVATE_INCLUDE_DIR	=3D @PRIVATE_INCLUDE_DIR@</div><div>@=
@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644</div><div>&nbsp;&nbsp;</div>=
<div>&nbsp; test -z "$TCL_LIBRARY" &amp;&amp; TCL_LIBRARY=3D'$(libdir)/tcl$=
(VERSION)'</div><div>&nbsp;-PRIVATE_INCLUDE_DIR=3D'$(includedir)'</div><div=
>-+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'</div><div>++PRIVATE_=
INCLUDE_DIR=3D'$(includedir)/tcl'</div><div>&nbsp; HTML_DIR=3D'$(DISTDIR)/h=
tml'</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Note:  in the following vari=
able, it's important to use the absolute</div><div>@@ -56,7 +56,7 @@ index =
43ec7e4..19524d1 100644</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Install t=
ime header dir can be set via --includedir</div><div>&nbsp;-eval "TCL_INCLU=
DE_SPEC=3D\"-I${includedir}\""</div><div>-+eval "TCL_INCLUDE_SPEC=3D\"-I${i=
ncludedir}/tcl${VERSION}\""</div><div>++eval "TCL_INCLUDE_SPEC=3D\"-I${incl=
udedir}/tcl\""</div><div>&nbsp;&nbsp;</div><div>&nbsp; #-------------------=
-----------------------------------------------------</div><div>&nbsp; # tc=
lConfig.sh refers to this by a different name</div><div>@@ -69,7 +69,7 @@ i=
ndex 9c6da82..8aa5ae8 100644</div><div>&nbsp; exec_prefix=3D@exec_prefix@</=
div><div>&nbsp; libdir=3D@libdir@</div><div>&nbsp;-includedir=3D@includedir=
@</div><div>-+includedir=3D@includedir@/tcl@PACKAGE_VERSION@</div><div>++in=
cludedir=3D@includedir@/tcl</div><div>&nbsp; libfile=3D@TCL_LIB_FILE@</div>=
<div>&nbsp;&nbsp;</div><div>&nbsp; Name: Tool Command Language</div><div>di=
ff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools=
/tcltk/tcl_9.0.1.bb</div><div>index 70aa9b606c..bafea067ed 100644</div><div=
>--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div><div>+++ b/meta/recipe=
s-devtools/tcltk/tcl_9.0.1.bb</div><div>@@ -51,13 +51,13 @@ do_install() {<=
/div><div>&nbsp; ln -sf ./tclsh${VER} ${D}${bindir}/tclsh</div><div>&nbsp; =
ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}</div><div>&nbsp; sed -i "s;-L${B}=
;-L${STAGING_LIBDIR};g" tclConfig.sh</div><div>-	sed -i "s;'${WORKDIR};'${S=
TAGING_INCDIR};g" tclConfig.sh</div><div>+	sed -i "s;'${WORKDIR};'${STAGING=
_INCDIR}/tcl;g" tclConfig.sh</div><div>&nbsp; install -d ${D}${bindir_cross=
scripts}</div><div>&nbsp; install -m 0755 tclConfig.sh ${D}${bindir_crosssc=
ripts}</div><div>&nbsp; install -m 0755 tclConfig.sh ${D}${libdir}</div><di=
v>&nbsp; for dir in compat generic unix; do</div><div>-		install -d ${D}${i=
ncludedir}/${BPN}${VER}/$dir</div><div>-		install -m 0644 ${S}/$dir/*.h ${D=
}${includedir}/${BPN}${VER}/$dir/</div><div>+		install -d ${D}${includedir}=
/${BPN}/$dir</div><div>+		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/$=
{BPN}/$dir/</div><div>&nbsp; done</div><div>&nbsp;}</div><div>&nbsp;</div><=
div>--&nbsp;</div><div>2.49.0</div><div><br></div><div><br></div><div>I hav=
e seen that debian also installs headers in /usr/include/tcl and we could t=
hen set includedir in tk.bb</div><div>like this without having to deal with=
 dynamically changing directory:</div><div><br></div><div>EXTRA_OEMAKE +=3D=
 "TCLDIR=3D${STAGING_INCDIR}/tcl"</div><div><br></div><div>As this is invas=
ive, I wanted to ask whether there are any objections and whether this woul=
d be a possible solution at all?</div><div><br></div><div><br></div></div><=
div id=3D"geary-quote" dir=3D"auto"><br>On Tue, Jul 1 2025 at 13:27:34 +02:=
00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=3Dt-online.de@lists=
.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div id=3D"geary-=
body" dir=3D"auto"><div>add the sed command as a new line. Editing&nbsp;<sp=
an style=3D"white-space: break-spaces;">${WORKDIR} is still required</span>=
</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Tue, Jul 1 2025 at =
13:24:15 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=3Dt-on=
line.de@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div=
 class=3D"plaintext" style=3D"white-space: break-spaces;">Add a sed command=
 that edits tclConfig.sh. This is needed so that
tk in meta-oe is capable of reading the required header file

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtoo=
ls/tcltk/tcl_9.0.1.bb
index 70aa9b606c..15f03b6c9e 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -52,6 +52,7 @@ do_install() {
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
 	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
<div>--=20
</div>2.49.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">


</div></blockquote></div>
</blockquote></div>
--=-/E8QVycsu5f/bNSGnGq9--


