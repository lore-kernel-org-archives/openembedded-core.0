Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.52768.1600050283451972887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 19:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08E2OBLO028391
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 19:24:32 -0700
Received: from [128.224.162.237] (128.224.162.237) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 13 Sep 2020
 19:24:19 -0700
Subject: Re: [OE-core][zeus][PATCH] procps: fix the top command crash issue
To: <openembedded-core@lists.openembedded.org>
References: <1633A8718261FDB3.22811@lists.openembedded.org>
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
Message-ID: <caa88809-bbee-d1d8-4eda-c851a57c8bdc@windriver.com>
Date: Mon, 14 Sep 2020 10:25:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1633A8718261FDB3.22811@lists.openembedded.org>
Content-Type: multipart/alternative;
	boundary="------------A2B97D4A6B715231FECEB287"
Content-Language: en-US

--------------A2B97D4A6B715231FECEB287
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08E2OBLO028391

Hi,

Please ignore this rr, I will resend the V2.

Thanks.

On 2020/9/11 =E4=B8=8B=E5=8D=882:58, Zhixiong Chi wrote:
> Avoid a potential SEGV during program termination.
> Backported the patch form:
> https://gitlab.com/procps-ng/procps/-/commit/d37f85c269fbb6e905802ffdbce=
0ba4173ba21a9
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...ntial-SEGV-during-program-terminatio.patch | 61 +++++++++++++++++++
>  meta/recipes-extended/procps/procps_3.3.15.bb |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-extended/procps/procps/0001-top-avoid-a=
-potential-SEGV-during-program-terminatio.patch
>
> diff --git a/meta/recipes-extended/procps/procps/0001-top-avoid-a-potent=
ial-SEGV-during-program-terminatio.patch b/meta/recipes-extended/procps/pro=
cps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch
> new file mode 100644
> index 0000000000..4f7a01e41b
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEG=
V-during-program-terminatio.patch
> @@ -0,0 +1,61 @@
> +From d37f85c269fbb6e905802ffdbce0ba4173ba21a9 Mon Sep 17 00:00:00 2001
> +From: Jim Warner <james.warner@comcast.net>
> +Date: Tue, 6 Aug 2019 00:00:00 -0500
> +Subject: [PATCH] top: avoid a potential SEGV during program termination
> +
> +The backtrace shown in the bug report referenced below
> +illustrates a 'normal' program termination interrupted
> +with some signal, ultimately then causing a top crash.
> +
> +So this commit just rearranges a little code such that
> +all signals will be blocked during that rather lengthy
> +end of program processing regardless of how initiated.
> +
> +[ in that report, ignore the assertion regarding the ]
> +[ '-n' option. it obviously was not '1' since do_key ]
> +[ had been called, which otherwise wouldn't be true. ]
> +
> +[ and when it is '1' the -d option would be ignored. ]
> +
> +Reference(s):
> +https://bugzilla.redhat.com/show_bug.cgi?id=3D1737552
> +
> +Signed-off-by: Jim Warner <james.warner@comcast.net>
> +Upstream-Status: Backport[https://gitlab.com/procps-ng/procps.git]
> +Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + top/top.c | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/top/top.c b/top/top.c
> +index b01907a..73598e2 100644
> +--- a/top/top.c
> ++++ b/top/top.c
> +@@ -404,6 +404,11 @@ static void at_eoj (void) {
> +          * The real program end */
> + static void bye_bye (const char *str) NORETURN;
> + static void bye_bye (const char *str) {
> ++   sigset_t ss;
> ++
> ++// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
> ++   sigfillset(&ss);
> ++   sigprocmask(SIG_BLOCK, &ss, NULL);
> +    at_eoj();                 // restore tty in preparation for exit
> + #ifdef ATEOJ_RPTSTD
> + {  proc_t *p;
> +@@ -595,12 +600,6 @@ static void sig_abexit (int sig) {
> +          *    SIGUSR1 and SIGUSR2 */
> + static void sig_endpgm (int dont_care_sig) NORETURN;
> + static void sig_endpgm (int dont_care_sig) {
> +-   sigset_t ss;
> +-
> +-// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
> +-   sigfillset(&ss);
> +-   sigprocmask(SIG_BLOCK, &ss, NULL);
> +-   Frames_signal =3D BREAK_sig;
> +    bye_bye(NULL);
> +    (void)dont_care_sig;
> + } // end: sig_endpgm
> +--=20
> +GitLab
> diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipe=
s-extended/procps/procps_3.3.15.bb
> index f240e54fd8..b299779253 100644
> --- a/meta/recipes-extended/procps/procps_3.3.15.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.15.bb
> @@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternative=
s
>  SRC_URI =3D "http://downloads.sourceforge.net/project/procps-ng/Product=
ion/procps-ng-${PV}.tar.xz \
>             file://sysctl.conf \
>             file://0001-Fix-out-of-tree-builds.patch \
> +           file://0001-top-avoid-a-potential-SEGV-during-program-termin=
atio.patch \
>             "
>  
>  SRC_URI[md5sum] =3D "2b0717a7cb474b3d6dfdeedfbad2eccc"
>
>=20

--=20
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


--------------A2B97D4A6B715231FECEB287
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 08E2OBLO028391

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hi,</p>
    <p>Please ignore this rr, I will resend the V2.</p>
    <p>Thanks.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2020/9/11 =E4=B8=8B=E5=8D=882:58, Zh=
ixiong Chi
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:1633A8718261FDB3.22811@lists.openembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Avoid a potential SEGV during=
 program termination.
Backported the patch form:
<a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.com/procps-ng/pr=
ocps/-/commit/d37f85c269fbb6e905802ffdbce0ba4173ba21a9">https://gitlab.com/=
procps-ng/procps/-/commit/d37f85c269fbb6e905802ffdbce0ba4173ba21a9</a>

Signed-off-by: Zhixiong Chi <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
---
 ...ntial-SEGV-during-program-terminatio.patch | 61 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.15.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-avoid-a-p=
otential-SEGV-during-program-terminatio.patch

diff --git a/meta/recipes-extended/procps/procps/0001-top-avoid-a-potentia=
l-SEGV-during-program-terminatio.patch b/meta/recipes-extended/procps/procp=
s/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch
new file mode 100644
index 0000000000..4f7a01e41b
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-=
during-program-terminatio.patch
@@ -0,0 +1,61 @@
+From d37f85c269fbb6e905802ffdbce0ba4173ba21a9 Mon Sep 17 00:00:00 2001
+From: Jim Warner <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:james.=
warner@comcast.net">&lt;james.warner@comcast.net&gt;</a>
+Date: Tue, 6 Aug 2019 00:00:00 -0500
+Subject: [PATCH] top: avoid a potential SEGV during program termination
+
+The backtrace shown in the bug report referenced below
+illustrates a 'normal' program termination interrupted
+with some signal, ultimately then causing a top crash.
+
+So this commit just rearranges a little code such that
+all signals will be blocked during that rather lengthy
+end of program processing regardless of how initiated.
+
+[ in that report, ignore the assertion regarding the ]
+[ '-n' option. it obviously was not '1' since do_key ]
+[ had been called, which otherwise wouldn't be true. ]
+
+[ and when it is '1' the -d option would be ignored. ]
+
+Reference(s):
+https://bugzilla.redhat.com/show_bug.cgi?id=3D1737552
+
+Signed-off-by: Jim Warner <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:james.warner@comcast.net">&lt;james.warner@comcast.net&gt;</a>
+Upstream-Status: Backport[<a class=3D"moz-txt-link-freetext" href=3D"http=
s://gitlab.com/procps-ng/procps.git">https://gitlab.com/procps-ng/procps.gi=
t</a>]
+Signed-off-by: Shaohua Zhan <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:shaohua.zhan@windriver.com">&lt;shaohua.zhan@windriver.com&gt;</a>
+Signed-off-by: Zhixiong Chi <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
+---
+ top/top.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/top/top.c b/top/top.c
+index b01907a..73598e2 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -404,6 +404,11 @@ static void at_eoj (void) {
+          * The real program end */
+ static void bye_bye (const char *str) NORETURN;
+ static void bye_bye (const char *str) {
++   sigset_t ss;
++
++// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
++   sigfillset(&amp;ss);
++   sigprocmask(SIG_BLOCK, &amp;ss, NULL);
+    at_eoj();                 // restore tty in preparation for exit
+ #ifdef ATEOJ_RPTSTD
+ {  proc_t *p;
+@@ -595,12 +600,6 @@ static void sig_abexit (int sig) {
+          *    SIGUSR1 and SIGUSR2 */
+ static void sig_endpgm (int dont_care_sig) NORETURN;
+ static void sig_endpgm (int dont_care_sig) {
+-   sigset_t ss;
+-
+-// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
+-   sigfillset(&amp;ss);
+-   sigprocmask(SIG_BLOCK, &amp;ss, NULL);
+-   Frames_signal =3D BREAK_sig;
+    bye_bye(NULL);
+    (void)dont_care_sig;
+ } // end: sig_endpgm
+--=20
+GitLab
diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-=
extended/procps/procps_3.3.15.bb
index f240e54fd8..b299779253 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://downloads.s=
ourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz\file://s=
ysctl.conf\file://0001-Fix-out-of-tree-builds.patch\+file://0001-top-avoid-=
a-potential-SEGV-during-program-terminatio.patch\">"http://downloads.source=
forge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
            file://0001-Fix-out-of-tree-builds.patch \
+           file://0001-top-avoid-a-potential-SEGV-during-program-terminat=
io.patch \
            "</a>
=20
 SRC_URI[md5sum] =3D "2b0717a7cb474b3d6dfdeedfbad2eccc"
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036
</pre>
  </body>
</html>

--------------A2B97D4A6B715231FECEB287--
