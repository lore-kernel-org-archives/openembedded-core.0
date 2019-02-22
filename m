Return-Path: <i.efimov@inango-systems.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Feb 2019 18:05:48 UTC
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB687C118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 18:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id DE5807A24DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:19 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gGrW8ZXT98yM
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:17 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id AC5A17A24DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:17 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com AC5A17A24DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1550858177;
	bh=UAeUA7nUFldioNmEnDpenlwW9vgNn8e6es9vgWITd0k=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=WrfBg9Lds5IqMyrL5RXK+qFjQY1n1ZHfWVtxG4Z+EM1HaJLwJ/kNLdP/RAw6nVGkw
	ILJHqdrWPsCn0blVStpK2G1xXztCAChjAW8ctVzdCnHs7V3CbqESgf5V6leS7+2rir
	98Ceo/BDceNLxlV6mkx/d4d53VYjRM9EyJvfIpnnRXVdiMM6vAT15ikgS1FC0YUYHD
	rNbN343qzs//iPj25rtw3Bw0nb93NIe1mUIAKJWWYBZ0BG0HnhqbMkLhincMYb6A0S
	WyowPDN391UbzQtITDzR0BdJ/5Czef+/sE/RdZtEzXoz2/yiipBkgiaOE/+CP2iOwq
	QcfnxQe3gXzKQ==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id o9X9jZ6UyK4u
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:17 +0200 (IST)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 7A40B7A24DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 19:56:17 +0200 (IST)
Date: Fri, 22 Feb 2019 19:56:17 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <526617699.1124155.1550858177441.JavaMail.zimbra@inango-systems.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - FF65 (Linux)/8.8.9_GA_3006)
Thread-Index: YBGyDIVI5Yh03JwlElaFLc1scX8cSw==
Thread-Topic: perl, do_install_ptest_base: add "--" into "tar" command line
Subject: [PATCH][morty] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Fri, 22 Feb 2019 18:05:49 -0000
Content-Type: multipart/alternative; 
	boundary="=_cf60d091-7dcb-43dc-aa7a-84ca41876310"

--=_cf60d091-7dcb-43dc-aa7a-84ca41876310
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add explicit separator "--" between options and arguments in "tar" 
command to avoid mistakenly detection file which name starts with "-" as 
an unknown option 

Steps for reproduce issue: 

* Add next variables into "conf/local.conf": 

CC_append_pn-perl = " -MD -Ml,M" 
CXX_append_pn-perl = " -MD -Ml,M" 

* Then "bitbake perl" 
* Task "do_install_ptest_base" will fail with error: 

tar: invalid option -- '.' 

because of presence next file 

tmp/work/i586-poky-linux/perl/5.22.1-r0/perl-5.22.1/-.d 

which starts from minus (-) sign and Yocto tries to run: 

tar <options> -.d <other files> 

and "tar" parse "-.d" as a option instead of file 

Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com> 
--- 
meta/recipes-devtools/perl/perl-ptest.inc | 2 +- 
1 file changed, 1 insertion(+), 1 deletion(-) 

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc 
index d136c5c0e4..51367b5ed9 100644 
--- a/meta/recipes-devtools/perl/perl-ptest.inc 
+++ b/meta/recipes-devtools/perl/perl-ptest.inc 
@@ -9,7 +9,7 @@ do_install_ptest () { 
sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl 
sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh 
tar -c --exclude=\*.o --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \ 
- --exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x ) 
+ --exclude=miniperl --exclude=generate_uudmap --exclude=patches -- * | ( cd ${D}${PTEST_PATH} && tar -x ) 

sed -i -e "s,${D},,g" \ 
-e "s,--sysroot=${STAGING_DIR_HOST},,g" \ 
-- 
2.14.1 


--=_cf60d091-7dcb-43dc-aa7a-84ca41876310
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div>Add explicit separator "--" between options=
 and arguments in "tar" </div><div>command to avoid mistakenly detection fi=
le which name starts with "-" as<br>an unknown option<br><br>Steps for repr=
oduce issue:<br><br>* Add next variables into "conf/local.conf":<br><br>&nb=
sp; CC_append_pn-perl =3D " -MD -Ml,M"<br>&nbsp; CXX_append_pn-perl =3D " -=
MD -Ml,M"<br><br>* Then "bitbake perl"<br>* Task "do_install_ptest_base" wi=
ll fail with error:<br><br>&nbsp;&nbsp;&nbsp; tar: invalid option -- '.'<br=
><br>&nbsp; because of presence next file<br><br>&nbsp;&nbsp;&nbsp; tmp/wor=
k/i586-poky-linux/perl/5.22.1-r0/perl-5.22.1/-.d<br><br>&nbsp; which starts=
 from minus (-) sign and Yocto tries to run:<br><br>&nbsp;&nbsp;&nbsp; tar =
&lt;options&gt; -.d &lt;other files&gt;<br><br>&nbsp; and "tar" parse "-.d"=
 as a option instead of file<br><br>Signed-off-by: Ivan Efimov &lt;i.efimov=
@inango-systems.com&gt;<br>---<br>&nbsp;meta/recipes-devtools/perl/perl-pte=
st.inc | 2 +-<br>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br><br=
>diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devt=
ools/perl/perl-ptest.inc<br>index d136c5c0e4..51367b5ed9 100644<br>--- a/me=
ta/recipes-devtools/perl/perl-ptest.inc<br>+++ b/meta/recipes-devtools/perl=
/perl-ptest.inc<br>@@ -9,7 +9,7 @@ do_install_ptest () {<br>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; sed -e "s:\/opt:\/usr:" -i Porting/add-package.=
pl<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -e "s:\/local\/gnu\/:\=
/:" -i hints/cxux.sh<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar -c -=
-exclude=3D\*.o --exclude=3Dlibperl.so --exclude=3DMakefile --exclude=3Dmak=
efile --exclude=3Dhostperl \<br>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --exclude=3Dminiperl --exclude=
=3Dgenerate_uudmap --exclude=3Dpatches * | ( cd ${D}${PTEST_PATH} &amp;&amp=
; tar -x )<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; --exclude=3Dminiperl --exclude=3Dgenerate_uudmap -=
-exclude=3Dpatches -- * | ( cd ${D}${PTEST_PATH} &amp;&amp; tar -x )<br>&nb=
sp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i -e "s,${D},,g" \<b=
r>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \<br>-- <br>2.14.1<br=
><br data-mce-bogus=3D"1"></div></div></body></html>

--=_cf60d091-7dcb-43dc-aa7a-84ca41876310--
