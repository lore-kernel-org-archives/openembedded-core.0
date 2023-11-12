Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75912C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 21:28:14 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.23790.1699824485908509598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 13:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id 95CBA24563;
	Sun, 12 Nov 2023 22:28:03 +0100 (CET)
Received: from [192.168.178.62] ([84.163.32.92]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2Hzr-0QyiVE0; Sun, 12 Nov 2023 22:28:00 +0100
Date: Sun, 12 Nov 2023 22:28:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] cups: Upgrade 2.4.6 -> 2.4.7
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <HZ414S.HW8NR3EMT6LP@t-online.de>
In-Reply-To: <1796FBC977914057.28092@lists.openembedded.org>
References: <20231112013617.24303-1-f_l_k@t-online.de>
	<202311121921352d929cc9@mail.local>
	<1796FBC977914057.28092@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Huil25WkxuMneos90Unp"
X-TOI-EXPURGATEID: 150726::1699824480-477FD979-0E89A78A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9e8805bf-21c1-4360-91b0-9a97280b3780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 21:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190456

--=-Huil25WkxuMneos90Unp
Content-Type: text/plain; charset=us-ascii; format=flowed

I've sent a v2 that would fix the issue by adding openssl tls support 
by default. tls can be switched to gnutls by using PACKAGECONFIG

On Sun, Nov 12 2023 at 09:59:39 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Hi,
> 
> | hash.c:16:12: fatal error: gnutls/crypto.h: No such file or 
> directory
> |    16 | #  include <gnutls/crypto.h>
> 
> it fails because there is no tls implementation activated by default. 
> I do my builds with gnutls enabled and removing the bbappend that 
> contains the packageconfig makes this problem reproducible for me. My 
> question is, is it a reasonable standard to build without encryption? 
> As I understand it, the correct solution would be to add tls support 
> by default  (adding --with-tls=openssl also fixes the issue). Maybe 
> we could do something like this?
> PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=openssl,gnutls"
> 
> Which tls implementation should be used by default? I know oe-core 
> prefers openssl, but there have been known issues with it recently:
> <https://github.com/void-linux/void-packages/pull/41193>
> 
> On Sun, Nov 12 2023 at 08:21:35 PM +01:00:00, Alexandre Belloni 
> <alexandre.belloni@bootlin.com> wrote:
>> Hello,
>> 
>> This fails:
>> 
>> reproducible:
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3912/steps/12/logs/errors>
>> 
>> lib32:
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7998/steps/11/logs/stdio>
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5334/steps/11/logs/stdio>
>> 
>> 
>> musl:
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/8115/steps/12/logs/stdio>
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8143/steps/11/logs/stdio>
>> 
>> 
>> no-x11:
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8123/steps/12/logs/stdio>
>> <https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8123/steps/15/logs/stdio>
>> 
>> On 12/11/2023 02:36:17+0100, Markus Volk wrote:
>>>  Changes in CUPS v2.4.7 (2023-09-20)
>>>  -----------------------------------
>>> 
>>>  - CVE-2023-4504 - Fixed Heap-based buffer overflow when reading 
>>> Postscript
>>>    in PPD files
>>>  - Added OpenSSL support for cupsHashData (Issue #762)
>>>  - Fixed delays in lpd backend (Issue #741)
>>>  - Fixed extensive logging in scheduler (Issue #604)
>>>  - Fixed hanging of `lpstat` on IBM AIX (Issue #773)
>>>  - Fixed hanging of `lpstat` on Solaris (Issue #156)
>>>  - Fixed printing to stderr if we can't open cups-files.conf (Issue 
>>> #777)
>>>  - Fixed purging job files via `cancel -x` (Issue #742)
>>>  - Fixed RFC 1179 port reserving behavior in LPD backend (Issue 
>>> #743)
>>>  - Fixed a bug in the PPD command interpretation code (Issue #768)
>>> 
>>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>>> <mailto:f_l_k@t-online.de>>
>>>  ---
>>>   meta/recipes-extended/cups/cups.inc           |  1 -
>>>   .../cups/cups/CVE-2023-4504.patch             | 42 
>>> -------------------
>>>   .../cups/{cups_2.4.6.bb => cups_2.4.7.bb}     |  2 +-
>>>   3 files changed, 1 insertion(+), 44 deletions(-)
>>>   delete mode 100644 
>>> meta/recipes-extended/cups/cups/CVE-2023-4504.patch
>>>   rename meta/recipes-extended/cups/{cups_2.4.6.bb => 
>>> cups_2.4.7.bb} (51%)
>>> 
>>>  diff --git a/meta/recipes-extended/cups/cups.inc 
>>> b/meta/recipes-extended/cups/cups.inc
>>>  index fa32c38549..36feaddcf8 100644
>>>  --- a/meta/recipes-extended/cups/cups.inc
>>>  +++ b/meta/recipes-extended/cups/cups.inc
>>>  @@ -15,7 +15,6 @@ SRC_URI = 
>>> "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
>>>              
>>> file://0004-cups-fix-multilib-install-file-conflicts.patch 
>>> <file://0004-cups-fix-multilib-install-file-conflicts.patch/> \
>>>              file://volatiles.99_cups <file://volatiles.99_cups/> \
>>>              file://cups-volatiles.conf 
>>> <file://cups-volatiles.conf/> \
>>>  -           file://CVE-2023-4504.patch 
>>> <file://cve-2023-4504.patch/> \
>>>              "
>>> 
>>>   GITHUB_BASE_URI = 
>>> "<https://github.com/OpenPrinting/cups/releases>"
>>>  diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch 
>>> b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
>>>  deleted file mode 100644
>>>  index e52e43a209..0000000000
>>>  --- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
>>>  +++ /dev/null
>>>  @@ -1,42 +0,0 @@
>>>  -CVE: CVE-2023-4504
>>>  -Upstream-Status: Backport 
>>> [<https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31> 
>>> ]
>>>  -Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com 
>>> <mailto:chee.yang.lee@intel.com>>
>>>  -
>>>  -From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 
>>> 2001
>>>  -From: Zdenek Dohnal <zdohnal@redhat.com 
>>> <mailto:zdohnal@redhat.com>>
>>>  -Date: Wed, 20 Sep 2023 14:45:17 +0200
>>>  -Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
>>>  -
>>>  -We didn't check for end of buffer if it looks there is an escaped
>>>  -character - check for NULL terminator there and if found, return 
>>> NULL
>>>  -as return value and in `ptr`, because a lone backslash is not
>>>  -a valid PostScript character.
>>>  ----
>>>  - cups/raster-interpret.c | 14 +++++++++++++-
>>>  - 1 files changed, 13 insertions(+), 1 deletion(-)
>>>  -
>>>  -diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
>>>  -index 6fcf731b5..b8655c8c6 100644
>>>  ---- a/cups/raster-interpret.c
>>>  -+++ b/cups/raster-interpret.c
>>>  -@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - 
>>> Stack */
>>>  -
>>>  - 	    cur ++;
>>>  -
>>>  --            if (*cur == 'b')
>>>  -+	   /*
>>>  -+	    * Return NULL if we reached NULL terminator, a lone 
>>> backslash
>>>  -+	    * is not a valid character in PostScript.
>>>  -+	    */
>>>  -+
>>>  -+	    if (!*cur)
>>>  -+	    {
>>>  -+	      *ptr = NULL;
>>>  -+
>>>  -+	      return (NULL);
>>>  -+	    }
>>>  -+
>>>  -+	    if (*cur == 'b')
>>>  - 	      *valptr++ = '\b';
>>>  - 	    else if (*cur == 'f')
>>>  - 	      *valptr++ = '\f';
>>>  diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb 
>>> b/meta/recipes-extended/cups/cups_2.4.7.bb
>>>  similarity index 51%
>>>  rename from meta/recipes-extended/cups/cups_2.4.6.bb
>>>  rename to meta/recipes-extended/cups/cups_2.4.7.bb
>>>  index 58029fdbd4..f4b0282e4c 100644
>>>  --- a/meta/recipes-extended/cups/cups_2.4.6.bb
>>>  +++ b/meta/recipes-extended/cups/cups_2.4.7.bb
>>>  @@ -2,4 +2,4 @@ require cups.inc
>>> 
>>>   LIC_FILES_CHKSUM = 
>>> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57" 
>>> <file://license;md5=3b83ef96387f14655fc854ddc3c6bd57/>
>>> 
>>>  -SRC_URI[sha256sum] = 
>>> "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262"
>>>  +SRC_URI[sha256sum] = 
>>> "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
>>>  --
>>>  2.42.0
>>> 
>> 
>>> 
>>> 
>>> 
>> 
>> 
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com <https://bootlin.com/>


--=-Huil25WkxuMneos90Unp
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I've sent a v2 that would fix the =
issue by adding openssl tls support by default. tls can be switched to gnut=
ls by using PACKAGECONFIG&nbsp;</div></div><div id=3D"geary-quote" dir=3D"a=
uto"><br>On Sun, Nov 12 2023 at 09:59:39 PM +01:00:00, Markus Volk &lt;f_l_=
k@t-online.de&gt; wrote:<br><blockquote type=3D"cite"><div id=3D"geary-body=
" dir=3D"auto"><div>Hi,</div><div><br></div><div><div style=3D"box-sizing: =
border-box; height: 18px; color: rgb(199, 199, 199); font-family: Menlo, Mo=
naco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-v=
ariant-ligatures: normal; orphans: 2; widows: 2; white-space: pre; backgrou=
nd-color: rgb(0, 0, 0); text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;"><span class=3D"no-wrap lo=
g_o ng-binding" data-linenumber-content=3D"47617" style=3D"box-sizing: bord=
er-box; overflow-wrap: normal;">| hash.c:16:12: fatal error: gnutls/crypto.=
h: No such file or directory</span></div><div style=3D"box-sizing: border-b=
ox; height: 18px; color: rgb(199, 199, 199); font-family: Menlo, Monaco, Co=
nsolas, &quot;Courier New&quot;, monospace; font-size: 13px; font-variant-l=
igatures: normal; orphans: 2; widows: 2; white-space: pre; background-color=
: rgb(0, 0, 0); text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;"><span class=3D"no-wrap log_o ng-b=
inding" data-linenumber-content=3D"47618" style=3D"box-sizing: border-box; =
overflow-wrap: normal;">|    16 | #  include &lt;gnutls/crypto.h&gt;</span>=
</div></div><div><br></div><div><div>it fails because there is no tls imple=
mentation activated by default. I do my builds with gnutls enabled and remo=
ving the bbappend that contains the packageconfig makes this problem reprod=
ucible for me. My question is, is it a reasonable standard to build without=
 encryption? As I understand it, the correct solution would be to add tls s=
upport by default &nbsp;(adding --with-tls=3Dopenssl also fixes the issue).=
 Maybe we could do something like this?</div><div>PACKAGECONFIG[gnutls] =3D=
 "--with-tls=3Dgnutls,--with-tls=3Dopenssl,gnutls"</div><div><br></div><div=
>Which tls implementation should be used by default? I know oe-core prefers=
 openssl, but there have been known issues with it recently:</div><div><a h=
ref=3D"https://github.com/void-linux/void-packages/pull/41193">https://gith=
ub.com/void-linux/void-packages/pull/41193</a></div></div></div><div id=3D"=
geary-quote" dir=3D"auto"><br>On Sun, Nov 12 2023 at 08:21:35 PM +01:00:00,=
 Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockqu=
ote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spac=
es;">Hello,

This fails:

reproducible:
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3912/steps/12/logs/errors">https://autobuilder.yoctoproject.org/typhoon/=
#/builders/117/builds/3912/steps/12/logs/errors</a>

lib32:
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/7998/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/52/builds/7998/steps/11/logs/stdio</a>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/5334/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#=
/builders/108/builds/5334/steps/11/logs/stdio</a>


musl:
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/8115/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/64/builds/8115/steps/12/logs/stdio</a>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/8143/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/45/builds/8143/steps/11/logs/stdio</a>


no-x11:
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/8123/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/40/builds/8123/steps/12/logs/stdio</a>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/8123/steps/15/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/40/builds/8123/steps/15/logs/stdio</a>

On 12/11/2023 02:36:17+0100, Markus Volk wrote:
<blockquote> Changes in CUPS v2.4.7 (2023-09-20)
 -----------------------------------
=20
 - CVE-2023-4504 - Fixed Heap-based buffer overflow when reading Postscript
   in PPD files
 - Added OpenSSL support for cupsHashData (Issue #762)
 - Fixed delays in lpd backend (Issue #741)
 - Fixed extensive logging in scheduler (Issue #604)
 - Fixed hanging of `lpstat` on IBM AIX (Issue #773)
 - Fixed hanging of `lpstat` on Solaris (Issue #156)
 - Fixed printing to stderr if we can't open cups-files.conf (Issue #777)
 - Fixed purging job files via `cancel -x` (Issue #742)
 - Fixed RFC 1179 port reserving behavior in LPD backend (Issue #743)
 - Fixed a bug in the PPD command interpretation code (Issue #768)
=20
 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  meta/recipes-extended/cups/cups.inc           |  1 -
  .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
  .../cups/{cups_2.4.6.bb =3D&gt; cups_2.4.7.bb}     |  2 +-
  3 files changed, 1 insertion(+), 44 deletions(-)
  delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
  rename meta/recipes-extended/cups/{cups_2.4.6.bb =3D&gt; cups_2.4.7.bb} (=
51%)
=20
 diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/c=
ups/cups.inc
 index fa32c38549..36feaddcf8 100644
 --- a/meta/recipes-extended/cups/cups.inc
 +++ b/meta/recipes-extended/cups/cups.inc
 @@ -15,7 +15,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${P=
V}-source.tar.gz \
             <a href=3D"file://0004-cups-fix-multilib-install-file-conflict=
s.patch">file://0004-cups-fix-multilib-install-file-conflicts.patch</a> \
             <a href=3D"file://volatiles.99_cups">file://volatiles.99_cups<=
/a> \
             <a href=3D"file://cups-volatiles.conf">file://cups-volatiles.c=
onf</a> \
 -           <a href=3D"file://CVE-2023-4504.patch">file://CVE-2023-4504.pa=
tch</a> \
             "
 =20
  GITHUB_BASE_URI =3D "<a href=3D"https://github.com/OpenPrinting/cups/rele=
ases">https://github.com/OpenPrinting/cups/releases</a>"
 diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/re=
cipes-extended/cups/cups/CVE-2023-4504.patch
 deleted file mode 100644
 index e52e43a209..0000000000
 --- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 +++ /dev/null
 @@ -1,42 +0,0 @@
 -CVE: CVE-2023-4504
 -Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting/cup=
s/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31">https://github.com/OpenP=
rinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31</a> ]
 -Signed-off-by: Lee Chee Yang &lt;<a href=3D"mailto:chee.yang.lee@intel.co=
m">chee.yang.lee@intel.com</a>&gt;
 -
 -From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
 -From: Zdenek Dohnal &lt;<a href=3D"mailto:zdohnal@redhat.com">zdohnal@red=
hat.com</a>&gt;
 -Date: Wed, 20 Sep 2023 14:45:17 +0200
 -Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
 -
 -We didn't check for end of buffer if it looks there is an escaped
 -character - check for NULL terminator there and if found, return NULL
 -as return value and in `ptr`, because a lone backslash is not
 -a valid PostScript character.
 ----
 - cups/raster-interpret.c | 14 +++++++++++++-
 - 1 files changed, 13 insertions(+), 1 deletion(-)
 -
 -diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
 -index 6fcf731b5..b8655c8c6 100644
 ---- a/cups/raster-interpret.c
 -+++ b/cups/raster-interpret.c
 -@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
 -=20
 - 	    cur ++;
 -=20
 --            if (*cur =3D=3D 'b')
 -+	   /*
 -+	    * Return NULL if we reached NULL terminator, a lone backslash
 -+	    * is not a valid character in PostScript.
 -+	    */
 -+
 -+	    if (!*cur)
 -+	    {
 -+	      *ptr =3D NULL;
 -+
 -+	      return (NULL);
 -+	    }
 -+
 -+	    if (*cur =3D=3D 'b')
 - 	      *valptr++ =3D '\b';
 - 	    else if (*cur =3D=3D 'f')
 - 	      *valptr++ =3D '\f';
 diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb b/meta/recipes-exten=
ded/cups/cups_2.4.7.bb
 similarity index 51%
 rename from meta/recipes-extended/cups/cups_2.4.6.bb
 rename to meta/recipes-extended/cups/cups_2.4.7.bb
 index 58029fdbd4..f4b0282e4c 100644
 --- a/meta/recipes-extended/cups/cups_2.4.6.bb
 +++ b/meta/recipes-extended/cups/cups_2.4.7.bb
 @@ -2,4 +2,4 @@ require cups.inc
 =20
  LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57" "=3D"">file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
"</a>
 =20
 -SRC_URI[sha256sum] =3D "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882=
b283138ba0e7262"
 +SRC_URI[sha256sum] =3D "dd54228dd903526428ce7e37961afaed230ad310788141da7=
5cebaa08362cf6c"
 --=20
 2.42.0
=20
</blockquote>
<blockquote>=20
=20
=20
</blockquote>

<div>--=20
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href=3D"https://bootlin.com">https://bootlin.com</a>
</div></blockquote></div>
</blockquote></div>
--=-Huil25WkxuMneos90Unp--


