Return-Path: <petter@technux.se>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Oct 2015 08:17:57 UTC
Received: from bin-vsp-out-04.atm.binero.net (bin-mail-out-05.binero.net
	[195.74.38.228])
	by mail.openembedded.org (Postfix) with ESMTP id 08DAB767EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 08:17:57 +0000 (UTC)
X-Halon-ID: e2bc2652-6c01-11e5-bfe4-005056917c0c
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPA;
	Tue,  6 Oct 2015 10:11:45 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 06 Oct 2015 10:11:47 +0200
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: <kai.kang@windriver.com>
Organization: Technux
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
Message-ID: <b64576e3c49076498b7cfb0cbf9f3963@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: petter@technux.se
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 08:17:59 -0000
Content-Type: multipart/alternative;
	boundary="=_ea950a620757640da9e0f1490324fb5a"

--=_ea950a620757640da9e0f1490324fb5a
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

Hi Kai, 

I played around with the new meta-security-isafw layer and
the cve-check-tool. In readline the cve CVE-2014-2524 is marked as
'missing' by the framework and I was confused to start with, since I saw
that this commit was included. But after looking at the actual patch I
realized that it only contains a report and not the patch itself. My
question is if that is with purpose and due to some decision that the
CVE isn't really causing any harm or if it's by mistake? 

BR Petter


Petter Mabäcker

Technux
<petter@technux.se>
www.technux.se

2014-10-16 11:48 skrev Kai Kang: 

>
The _rl_tropen function in util.c in GNU readline before 6.3 patch 3
>
allows local users to create or overwrite arbitrary files via a
symlink
> attack on a /var/tmp/rltrace.[PID] file.
> 
>
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2524 [1]
> 
>
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> Signed-off-by: Kai Kang
<kai.kang@windriver.com>
> ---
>
.../readline/readline-6.3/readline63-003 | 43 ++++++++++++++++++++++
>
meta/recipes-core/readline/readline_6.3.bb | 2 +
> 2 files changed, 45
insertions(+)
> create mode 100644
meta/recipes-core/readline/readline-6.3/readline63-003
> 
> diff --git
a/meta/recipes-core/readline/readline-6.3/readline63-003
b/meta/recipes-core/readline/readline-6.3/readline63-003
> new file mode
100644
> index 0000000..98a9d81
> --- /dev/null
> +++
b/meta/recipes-core/readline/readline-6.3/readline63-003
> @@ -0,0 +1,43
@@
> +readline: Security Advisory - readline - CVE-2014-2524
> +
>
+Upstream-Status: Backport
> +
> +Signed-off-by: Yue Tao
<yue.tao@windriver.com>
> +
> + READLINE PATCH REPORT
> +
=====================
> +
> +Readline-Release: 6.3
> +Patch-ID:
readline63-003
> +
> +Bug-Reported-by:
> +Bug-Reference-ID:
>
+Bug-Reference-URL:
> +
> +Bug-Description:
> +
> +There are debugging
functions in the readline release that are theoretically
> +exploitable
as security problems. They are not public functions, but have
> +global
linkage.
> +
> +Patch (apply with `patch -p0'):
> +
> +***
../readline-6.3/util.c 2013-09-02 13:36:12.000000000 -0400
> +--- util.c
2014-03-20 10:25:53.000000000 -0400
> +***************
> +*** 477,480
****
> +--- 479,483 ----
> + }
> + 
> ++ #if defined (DEBUG)
> + #if
defined (USE_VARARGS)
> + static FILE *_rl_tracefp;
> +***************
>
+*** 539,542 ****
> +--- 542,546 ----
> + }
> + #endif
> ++ #endif /*
DEBUG */
> + 
> + 
> +
> diff --git
a/meta/recipes-core/readline/readline_6.3.bb
b/meta/recipes-core/readline/readline_6.3.bb
> index aa30f66..2ae73ea
100644
> --- a/meta/recipes-core/readline/readline_6.3.bb
> +++
b/meta/recipes-core/readline/readline_6.3.bb
> @@ -1,5 +1,7 @@
> require
readline.inc
> 
> +SRC_URI_append = " file://readline63-003"
> +
>
SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
>
SRC_URI[archive.sha256sum] =
"56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
> 
>
-- 
> 1.9.1
 

Links:
------
[1]
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2524

--=_ea950a620757640da9e0f1490324fb5a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>Hi Kai,</p>
<p><br />I played around with the new meta-security-isafw layer and the cve=
-check-tool. In readline the cve CVE-2014-2524 is marked as 'missing' by th=
e framework and I was confused to start with, since I saw that this commit =
was included. But after looking at the actual patch I realized that it only=
 contains a report and not the patch itself. My question is if that is with=
 purpose and due to some decision that the CVE isn't really causing any har=
m or if it's by mistake?</p>
<p>BR Petter</p>
<p>&nbsp;</p>
<div>
<pre>Petter Mab&auml;cker

Technux &lt;petter@technux.se&gt;
www.technux.se</pre>
</div>
<p>2014-10-16 11:48 skrev Kai Kang:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>The _rl_tropen function in util.c in GNU readline before 6.3 patch 3
allows local users to create or overwrite arbitrary files via a symlink
attack on a /var/tmp/rltrace.[PID] file.

<a href=3D"http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-2524"=
>http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-2524</a>

Signed-off-by: Yue Tao &lt;<a href=3D"mailto:Yue.Tao@windriver.com">Yue.Tao=
@windriver.com</a>&gt;
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai=
=2Ekang@windriver.com</a>&gt;
---
 .../readline/readline-6.3/readline63-003           | 43 ++++++++++++++++++=
++++
 meta/recipes-core/readline/readline_6.3.bb         |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline63-003

diff --git a/meta/recipes-core/readline/readline-6.3/readline63-003 b/meta/=
recipes-core/readline/readline-6.3/readline63-003
new file mode 100644
index 0000000..98a9d81
--- /dev/null
+++ b/meta/recipes-core/readline/readline-6.3/readline63-003
@@ -0,0 +1,43 @@
+readline: Security Advisory - readline - CVE-2014-2524
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao &lt;<a href=3D"mailto:yue.tao@windriver.com">yue.ta=
o@windriver.com</a>&gt;
+
+			   READLINE PATCH REPORT
+			   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Readline-Release: 6.3
+Patch-ID: readline63-003
+
+Bug-Reported-by:
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+There are debugging functions in the readline release that are theoretical=
ly
+exploitable as security problems.  They are not public functions, but have
+global linkage.
+
+Patch (apply with `patch -p0'):
+
+*** ../readline-6.3/util.c	2013-09-02 13:36:12.000000000 -0400
+--- util.c	2014-03-20 10:25:53.000000000 -0400
+***************
+*** 477,480 ****
+--- 479,483 ----
+  }
+ =20
++ #if defined (DEBUG)
+  #if defined (USE_VARARGS)
+  static FILE *_rl_tracefp;
+***************
+*** 539,542 ****
+--- 542,546 ----
+  }
+  #endif
++ #endif /* DEBUG */
+ =20
+ =20
+
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core=
/readline/readline_6.3.bb
index aa30f66..2ae73ea 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,5 +1,7 @@
 require readline.inc
=20
+SRC_URI_append =3D " file://readline63-003"
+
 SRC_URI[archive.md5sum] =3D "33c8fb279e981274f485fd91da77e94a"
 SRC_URI[archive.sha256sum] =3D "56ba6071b9462f980c5a72ab0023893b65ba6debb4=
eeb475d7a563dc65cafd43"
=20
<span class=3D"sig">--=20
1.9.1
</span></pre>
</blockquote>
</body></html>

--=_ea950a620757640da9e0f1490324fb5a--
