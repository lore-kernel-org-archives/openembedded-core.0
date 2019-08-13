Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id BF6567E447
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=sendgrid.me; 
	h=from:to:cc:subject:in-reply-to:references:mime-version:content-type; 
	s=smtpapi; bh=IJgWN6oXrLGTvxwtcuei9Yf0giI=; b=bfh/Ek/Fc5+QMpU4QR
	LfyKp6HJiwfbAUU6Z//CXA6BN+weOy1mQeKpDQpnxOkeNAU8FRPtDbQDOTsVQf9g
	MkUuHTyj8bftJn9lNVaVZExzXDReVAVPrNQt8enliWfuBXQCfRZ4TwJv3z7lS4Fi
	j1TKx2yubmlAFGL8Nf5eeUTQs=
Received: by filter0098p3las1.sendgrid.net with SMTP id
	filter0098p3las1-1557-5D533A0B-41
	2019-08-13 22:30:35.89148463 +0000 UTC m=+1568414.550827792
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0005p1las1.sendgrid.net (SG) with ESMTP id
	ykTcIOu1T0GwZkH0P4-Lng Tue, 13 Aug 2019 22:30:35.838 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:31:36 +0000 (UTC)
Message-Id: <20190813223031.40138-2-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813223031.40138-1-t-keweng@microsoft.com>
References: <20190813223031.40138-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: NueaD3OYy6TFANBcuSZZzWeqNF8z73veS5dGPAsjLWggnA2yQn0uEn6uw+MVASYbUkeOS9t2j32ZHf
	EDxsbySV+aA0xgji2WkbeYHU0Go5IXBVB51g49q9M4NswBdH6VTNogLtoqTfo0xuhvqCX8AjCTGB5q
	eQWxGzVyWCiRI2I2BWVE9BhCEiuHfsJkxAHN1JGo6FQrAOWNeJyaoTz6bnNffq6Cao+ZM6XiCOfcOz
	IbOcVeOUXe9Z++fY0GfHAI
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH 2/4] dbus: fix CVE-2019-12749
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
X-List-Received-Date: Tue, 13 Aug 2019 22:36:40 -0000
Content-type: multipart/alternative; boundary="----------=_1565735436-2948-348"

------------=_1565735436-2948-348
content-transfer-encoding: quoted-printable

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
---=0D
 .../dbus/dbus/CVE-2019-12749.patch            | 127 ++++++++++++++++++=0D
 meta/recipes-core/dbus/dbus_1.12.10.bb        |   1 +=0D
 2 files changed, 128 insertions(+)=0D
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch=0D
=0D
diff --git a/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch b/meta/recipe=
s-core/dbus/dbus/CVE-2019-12749.patch=0D
new file mode 100644=0D
index 0000000000..393c70ca21=0D
--- /dev/null=0D
+++ b/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch=0D
@@ -0,0 +1,127 @@=0D
+From f0120c5d97a4cc1b659e86d38f2b1f646ca20ea3 Mon Sep 17 00:00:00 2001=0D
+From: Simon McVittie <smcv@collabora.com>=0D
+Date: Thu, 30 May 2019 12:53:03 +0100=0D
+Subject: [PATCH] auth: Reject DBUS_COOKIE_SHA1 for users other than the se=
rver=0D
+ owner=0D
+=0D
+The DBUS_COOKIE_SHA1 authentication mechanism aims to prove ownership=0D
+of a shared home directory by having the server write a secret "cookie"=0D
+into a .dbus-keyrings subdirectory of the desired identity's home=0D
+directory with 0700 permissions, and having the client prove that it can=
=0D
+read the cookie. This never actually worked for non-malicious clients in=
=0D
+the case where server uid !=3D client uid (unless the server and client=0D
+both have privileges, such as Linux CAP_DAC_OVERRIDE or traditional=0D
+Unix uid 0) because an unprivileged server would fail to write out the=0D
+cookie, and an unprivileged client would be unable to read the resulting=
=0D
+file owned by the server.=0D
+=0D
+Additionally, since dbus 1.7.10 we have checked that ~/.dbus-keyrings=0D
+is owned by the uid of the server (a side-effect of a check added to=0D
+harden our use of XDG_RUNTIME_DIR), further ruling out successful use=0D
+by a non-malicious client with a uid differing from the server's.=0D
+=0D
+Joe Vennix of Apple Information Security discovered that the=0D
+implementation of DBUS_COOKIE_SHA1 was susceptible to a symbolic link=0D
+attack: a malicious client with write access to its own home directory=0D
+could manipulate a ~/.dbus-keyrings symlink to cause the DBusServer to=0D
+read and write in unintended locations. In the worst case this could=0D
+result in the DBusServer reusing a cookie that is known to the=0D
+malicious client, and treating that cookie as evidence that a subsequent=
=0D
+client connection came from an attacker-chosen uid, allowing=0D
+authentication bypass.=0D
+=0D
+This is mitigated by the fact that by default, the well-known system=0D
+dbus-daemon (since 2003) and the well-known session dbus-daemon (in=0D
+stable releases since dbus 1.10.0 in 2015) only accept the EXTERNAL=0D
+authentication mechanism, and as a result will reject DBUS_COOKIE_SHA1=0D
+at an early stage, before manipulating cookies. As a result, this=0D
+vulnerability only applies to:=0D
+=0D
+* system or session dbus-daemons with non-standard configuration=0D
+* third-party dbus-daemon invocations such as at-spi2-core (although=0D
+  in practice at-spi2-core also only accepts EXTERNAL by default)=0D
+* third-party uses of DBusServer such as the one in Upstart=0D
+=0D
+Avoiding symlink attacks in a portable way is difficult, because APIs=0D
+like openat() and Linux /proc/self/fd are not universally available.=0D
+However, because DBUS_COOKIE_SHA1 already doesn't work in practice for=0D
+a non-matching uid, we can solve this vulnerability in an easier way=0D
+without regressions, by rejecting it early (before looking at=0D
+~/.dbus-keyrings) whenever the requested identity doesn't match the=0D
+identity of the process hosting the DBusServer.=0D
+=0D
+Signed-off-by: Simon McVittie <smcv@collabora.com>=0D
+Closes: https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxa=
QIXsqfojzsKaTLrhYk7-2F4AqW4Z0aTTxYxcMGlkfrpmYKZqw1bpnzzdxCB9YO7xZwpTvnA-3D-=
3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-=
2FJYsjDq1g468dzj84vKE7KK-2FvT22avn5U9YcVt85sTA4tepftll-2Baq3M9eo4YCyUWYrN1r=
6ngO6VCFpjbtSsyTy3M2aZjBjZUByNmRr5P82a2-2B9TnX56cJhPYCtT6FXlXc2dCWfRTWasb0K=
OpLKpCVXhIhDvuQ7nNa0EsxdEJ7kWtcgzCwKwWx1dLY5TNGSQo=0D
+Closes: CVE-2019-12749=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsqfo=
jzsKaTLrhYk7-2F4AqW4Z0aTTxYxcMGlkfrpmYKZqwxlDxIUuV3NsS4-2FTIcFoyAA-3D-3D_TE=
0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FJYs=
jDq1g468dzj84vKE7KK-2FvT22avn5U9YcVt85sTA4DsGTiyJF96mAymOloRHcUgz8RlpJRLz0m=
RCQGIpkyeNJOMSsOukswlyle2Vi3yd3dZE9iQVjiIMBlkfmayQWQGs1L1DZDjBeWLkroc1PR0vf=
ccVbvieS1-2B3sMv13f1D0PVmjGiGx6RjIz2ii7j84B=0D
+/47b1a4c41004bf494b87370987b222c934b19016]=0D
+=0D
+CVE: CVE-2019-12749=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ dbus/dbus-auth.c | 32 ++++++++++++++++++++++++++++++++=0D
+ 1 file changed, 32 insertions(+)=0D
+=0D
+diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c=0D
+index 37d8d4c9..7390a9d5 100644=0D
+--- a/dbus/dbus-auth.c=0D
++++ b/dbus/dbus-auth.c=0D
+@@ -529,6 +529,7 @@ sha1_handle_first_client_response (DBusAuth         *a=
uth,=0D
+   DBusString tmp2;=0D
+   dbus_bool_t retval =3D FALSE;=0D
+   DBusError error =3D DBUS_ERROR_INIT;=0D
++  DBusCredentials *myself =3D NULL;=0D
+ =0D
+   _dbus_string_set_length (&auth->challenge, 0);=0D
+   =0D
+@@ -565,6 +566,34 @@ sha1_handle_first_client_response (DBusAuth         *=
auth,=0D
+       return FALSE;=0D
+     }=0D
+ =0D
++  myself =3D _dbus_credentials_new_from_current_process ();=0D
++=0D
++  if (myself =3D=3D NULL)=0D
++    goto out;=0D
++=0D
++  if (!_dbus_credentials_same_user (myself, auth->desired_identity))=0D
++    {=0D
++      /*=0D
++       * DBUS_COOKIE_SHA1 is not suitable for authenticating that the=0D
++       * client is anyone other than the user owning the process=0D
++       * containing the DBusServer: we probably aren't allowed to write=
=0D
++       * to other users' home directories. Even if we can (for example=0D
++       * uid 0 on traditional Unix or CAP_DAC_OVERRIDE on Linux), we=0D
++       * must not, because the other user controls their home directory,=
=0D
++       * and could carry out symlink attacks to make us read from or=0D
++       * write to unintended locations. It's difficult to avoid symlink=
=0D
++       * attacks in a portable way, so we just don't try. This isn't a=0D
++       * regression, because DBUS_COOKIE_SHA1 never worked for other=0D
++       * users anyway.=0D
++       */=0D
++      _dbus_verbose ("%s: client tried to authenticate as \"%s\", "=0D
++                     "but that doesn't match this process",=0D
++                     DBUS_AUTH_NAME (auth),=0D
++                     _dbus_string_get_const_data (data));=0D
++      retval =3D send_rejected (auth);=0D
++      goto out;=0D
++    }=0D
++=0D
+   /* we cache the keyring for speed, so here we drop it if it's the=0D
+    * wrong one. FIXME caching the keyring here is useless since we use=0D
+    * a different DBusAuth for every connection.=0D
+@@ -679,6 +708,9 @@ sha1_handle_first_client_response (DBusAuth         *a=
uth,=0D
+   _dbus_string_zero (&tmp2);=0D
+   _dbus_string_free (&tmp2);=0D
+ =0D
++  if (myself !=3D NULL)=0D
++    _dbus_credentials_unref (myself);=0D
++=0D
+   return retval;=0D
+ }=0D
+ =0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbu=
s/dbus_1.12.10.bb=0D
index d71f7f7042..d7ad1d8be4 100644=0D
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb=0D
+++ b/meta/recipes-core/dbus/dbus_1.12.10.bb=0D
@@ -16,6 +16,7 @@ SRC_URI =3D "https://u12060237.ct.sendgrid.net/wf/click?u=
pn=3Da3Po4i5toNpKG6uRFNTh8GIk-2Ba9cxqoglrvIf-2BcUiBkNb-2FDZBz6aTAWHeAlspiXN=
2haCfj649DMDC1ACDbTPo2FQphlLq0yu53-2Bm3y8uPak-3D_TE0Kxc-2FihH-2BEaJFZv0piOB=
m40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FJYsjDq1g468dzj84vKE7KK-2FvT=
22avn5U9YcVt85sTA5HV-2FEeF1mbSSICBSz9tC-2Flj-2FqRph56TjPHs6nsWyG-2B2Fqwi0TN=
An2dBQ249oYdq0ncwJcjeowYIa8eRTiYrkgEe1ojTk844nVn0t-2FzFuPBCx0SXSU9MKejCZfbG=
b-2BIFPunpRFwJvaiQAO2VBczDfH-2B \=0D
            file://tmpdir.patch \=0D
            file://dbus-1.init \=0D
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \=
=0D
+		   file://CVE-2019-12749.patch \=0D
 "=0D
 =0D
 SRC_URI[md5sum] =3D "c3e12b4206e2a7da39d7cc42567790ef"=0D
-- =0D
2.22.0=0D


------------=_1565735436-2948-348
Content-Type: text/html
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body>
<h3>Signed-off-by: Kevin Weng &lt;t-keweng@microsoft.com&gt;</h3>
<pre>.../dbus/dbus/CVE-2019-12749.patch            | 127 ++++++++++++++++++
meta/recipes-core/dbus/dbus_1.12.10.bb        |   1 +
2 files changed, 128 insertions(+)
create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch</pre>
<p>diff --git a/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch b/meta/rec=
ipes-core/dbus/dbus/CVE-2019-12749.patch new file mode 100644 index 0000000=
000..393c70ca21 --- /dev/null +++ b/meta/recipes-core/dbus/dbus/CVE-2019-12=
749.patch @@ -0,0 +1,127 @@ +From f0120c5d97a4cc1b659e86d38f2b1f646ca20ea3 =
Mon Sep 17 00:00:00 2001 +From: Simon McVittie &lt;smcv@collabora.com&gt; +=
Date: Thu, 30 May 2019 12:53:03 +0100 +Subject: [PATCH] auth: Reject DBUS_C=
OOKIE_SHA1 for users other than the server + owner + +The DBUS_COOKIE_SHA1 =
authentication mechanism aims to prove ownership +of a shared home director=
y by having the server write a secret &ldquo;cookie&rdquo; +into a .dbus-ke=
yrings subdirectory of the desired identity's home +directory with 0700 per=
missions, and having the client prove that it can +read the cookie. This ne=
ver actually worked for non-malicious clients in +the case where server uid=
 !=3D client uid (unless the server and client +both have privileges, such =
as Linux CAP_DAC_OVERRIDE or traditional +Unix uid 0) because an unprivileg=
ed server would fail to write out the +cookie, and an unprivileged client w=
ould be unable to read the resulting +file owned by the server. + +Addition=
ally, since dbus 1.7.10 we have checked that ~/.dbus-keyrings +is owned by =
the uid of the server (a side-effect of a check added to +harden our use of=
 XDG_RUNTIME_DIR), further ruling out successful use +by a non-malicious cl=
ient with a uid differing from the server's. + +Joe Vennix of Apple Informa=
tion Security discovered that the +implementation of DBUS_COOKIE_SHA1 was s=
usceptible to a symbolic link +attack: a malicious client with write access=
 to its own home directory +could manipulate a ~/.dbus-keyrings symlink to =
cause the DBusServer to +read and write in unintended locations. In the wor=
st case this could +result in the DBusServer reusing a cookie that is known=
 to the +malicious client, and treating that cookie as evidence that a subs=
equent +client connection came from an attacker-chosen uid, allowing +authe=
ntication bypass. + +This is mitigated by the fact that by default, the wel=
l-known system +dbus-daemon (since 2003) and the well-known session dbus-da=
emon (in +stable releases since dbus 1.10.0 in 2015) only accept the EXTERN=
AL +authentication mechanism, and as a result will reject DBUS_COOKIE_SHA1 =
+at an early stage, before manipulating cookies. As a result, this +vulnera=
bility only applies to: + +* system or session dbus-daemons with non-standa=
rd configuration +* third-party dbus-daemon invocations such as at-spi2-cor=
e (although +  in practice at-spi2-core also only accepts EXTERNAL by defau=
lt) +* third-party uses of DBusServer such as the one in Upstart + +Avoidin=
g symlink attacks in a portable way is difficult, because APIs +like openat=
() and Linux /proc/self/fd are not universally available. +However, because=
 DBUS_COOKIE_SHA1 already doesn't work in practice for +a non-matching uid,=
 we can solve this vulnerability in an easier way +without regressions, by =
rejecting it early (before looking at +~/.dbus-keyrings) whenever the reque=
sted identity doesn't match the +identity of the process hosting the DBusSe=
rver. + +Signed-off-by: Simon McVittie &lt;smcv@collabora.com&gt; +Closes: =
<a href=3D"https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlX=
xaQIXsqfojzsKaTLrhYk7-2F4AqW4Z0aTTxYxcMGlkfrpmYKZqw1bpnzzdxCB9YO7xZwpTvnA-3=
D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7ds=
W-2FJYsjDq1g468dzj84vKE7KK-2FvT22avn5U9YcVt85sTA7Ci94id0JRQk8Th4xIK8bD0jhcW=
XOjB3I7xt0ISZ-2BK-2BvU-2FuvYtcbIn15FUxv3WsfjSG94GQV64lcAcb6u5pjvWOzA6ei9JZq=
5P35aDDmFs9ExeWJ2wJjNldwgvdBTDoRJQ15Dxe-2Fbm0ju-2B4Y5eKknE">https://gitlab.=
freedesktop.org/dbus/dbus/issues/269</a> +Closes: CVE-2019-12749 + +Upstrea=
m-Status: Backport +[<a href=3D"https://u12060237.ct.sendgrid.net/wf/click?=
upn=3DZUEdHBk4v9DOmlXxaQIXsqfojzsKaTLrhYk7-2F4AqW4Z0aTTxYxcMGlkfrpmYKZqwxlD=
xIUuV3NsS4-2FTIcFoyAA-3D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsy=
ZzZlOtbMQm4wqVCgNIpo7dsW-2FJYsjDq1g468dzj84vKE7KK-2FvT22avn5U9YcVt85sTA5t2X=
bPlcsWduP-2BADzAzeEW4GgIrSwGSszbXgZK-2BJy-2B1-2FJoXCBuiQcIATkPelhgyGI54NTfY=
Gfa3lmtW28UIhwzibz-2F8-2FPaFs-2B6qW6GcOzoFyoZ4OtwwkywGJ7LuGbMuiLAwpNuuxMJ5G=
y-2Fl-2FBAalHT">https://gitlab.freedesktop.org/dbus/dbus/commit</a> +/47b1a=
4c41004bf494b87370987b222c934b19016] + +CVE: CVE-2019-12749 + +Signed-off-b=
y: Kevin Weng &lt;t-keweng@microsoft.com&gt; +--- + dbus/dbus-auth.c | 32 +=
+++++++++++++++++++++++++++++++ + 1 file changed, 32 insertions(+) + +diff =
--git a/dbus/dbus-auth.c b/dbus/dbus-auth.c +index 37d8d4c9..7390a9d5 10064=
4 +--- a/dbus/dbus-auth.c ++++ b/dbus/dbus-auth.c +@@ -529,6 +529,7 @@ sha1=
_handle_first_client_response (DBusAuth         <strong>auth, +   DBusStrin=
g tmp2; +   dbus_bool_t retval =3D FALSE; +   DBusError error =3D DBUS_ERRO=
R_INIT; ++  DBusCredentials <strong>myself =3D NULL; + +   _dbus_string_set=
_length (&amp;auth-&gt;challenge, 0); + +@@ -565,6 +566,34 @@ sha1_handle_f=
irst_client_response (DBusAuth         *auth, +       return FALSE; +     }=
 + ++  myself =3D _dbus_credentials_new_from_current_process (); ++ ++  if =
(myself =3D=3D NULL) ++    goto out; ++ ++  if (!_dbus_credentials_same_use=
r (myself, auth-&gt;desired_identity)) ++    { ++      /</strong> ++       =
* DBUS_COOKIE_SHA1 is not suitable for authenticating that the ++       * c=
lient is anyone other than the user owning the process ++       * containin=
g the DBusServer: we probably aren't allowed to write ++       * to other u=
sers' home directories. Even if we can (for example ++       * uid 0 on tra=
ditional Unix or CAP_DAC_OVERRIDE on Linux), we ++       * must not, becaus=
e the other user controls their home directory, ++       * and could carry =
out symlink attacks to make us read from or ++       * write to unintended =
locations. It's difficult to avoid symlink ++       * attacks in a portable=
 way, so we just don't try. This isn't a ++       * regression, because DBU=
S_COOKIE_SHA1 never worked for other ++       * users anyway. ++       */ +=
+      _dbus_verbose (&quot;%s: client tried to authenticate as \&quot;%s\&=
quot;, &quot; ++                     &ldquo;but that doesn't match this pro=
cess&rdquo;, ++                     DBUS_AUTH_NAME (auth), ++              =
       _dbus_string_get_const_data (data)); ++      retval =3D send_rejecte=
d (auth); ++      goto out; ++    } ++ +   /</strong> we cache the keyring =
for speed, so here we drop it if it's the +    * wrong one. FIXME caching t=
he keyring here is useless since we use +    * a different DBusAuth for eve=
ry connection. +@@ -679,6 +708,9 @@ sha1_handle_first_client_response (DBus=
Auth         *auth, +   _dbus_string_zero (&amp;tmp2); +   _dbus_string_fre=
e (&amp;tmp2); + ++  if (myself !=3D NULL) ++    _dbus_credentials_unref (m=
yself); ++ +   return retval; + } + +-- +2.22.0 + diff --git a/meta/recipes=
-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.12.10.bb index d=
71f7f7042..d7ad1d8be4 100644 --- a/meta/recipes-core/dbus/dbus_1.12.10.bb +=
++ b/meta/recipes-core/dbus/dbus_1.12.10.bb @@ -16,6 +16,7 @@ SRC_URI =3D &=
quot;<a href=3D"https://u12060237.ct.sendgrid.net/wf/click?upn=3Da3Po4i5toN=
pKG6uRFNTh8GIk-2Ba9cxqoglrvIf-2BcUiBkNb-2FDZBz6aTAWHeAlspiXNEPZ4mipCGTcXzx-=
2FTbdD1JQ-3D-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4w=
qVCgNIpo7dsW-2FJYsjDq1g468dzj84vKE7KK-2FvT22avn5U9YcVt85sTA5fafWiajdjVwoGRj=
v-2BiI-2Bq6Jx9MUsdKQDdyHIffLLIVU9O4TbO9EHnss64xsCl8IyXPwkX9Kspq9F9R6UFX2py0=
E4VL25x9fTmQCrjoGAwlPEh698RAcJQWOnoZ5Xn1fPmHIRwQb-2BENSIp74QXyY-2F2">http:/=
/dbus.freedesktop.org/releases/dbus/dbus-$</a>{PV}.tar.gz \</p>
<pre>file://tmpdir.patch \
file://dbus-1.init \
file://clear-guid_from_server-if-send_negotiate_unix_f.patch \</pre>
<p>+		   <a href=3D"file://CVE-2019-12749.patch">file://CVE-2019-12749.patc=
h</a> \</p>
<pre>"

SRC_URI[md5sum] =3D "c3e12b4206e2a7da39d7cc42567790ef"</pre>
<p>&mdash; 2.22.0</p>

<img src=3D"https://u12060237.ct.sendgrid.net/wf/open?upn=3DTE0Kxc-2FihH-2B=
EaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2FJYsjDq1g468dzj84=
vKE7KK-2FvT22avn5U9YcVt85sTA4NlAFEYciwro36Z-2F-2F4GlYwLKlJCZgczAl3F65-2Bixa=
0S4k0-2BIAh5sPfUmJEgeLl5SZt7bjg-2BpF2XHRRvPg5teHBzn-2BzTkhINNrssX5hs8OxfU1e=
iX4pcqlPP7xOGmO1CUYqVxQmJOc9FOVA9-2F-2BkgmYm" alt=3D"" width=3D"1" height=
=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !important;bor=
der-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;m=
argin-right:0 !important;margin-left:0 !important;padding-top:0 !important;=
padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !impo=
rtant;"/>
</body></html>

------------=_1565735436-2948-348--
