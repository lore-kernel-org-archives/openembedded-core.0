Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E56D49C9E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 10:41:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7641.1769769665826927379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 02:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GzW9OPAn;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43591b55727so1723312f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 02:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769769664; cv=none;
        d=google.com; s=arc-20240605;
        b=LjYsrhWOColVGGnCmhq2kcOTv8BxodpTwSQmso/p/KL80Jbee6DnPM9XH/ohPVS/6d
         okHb0Ng+Gos6dMALvCW5DsBtbqVw2guakqzeWF9+FbYra4CKp935/0fSJ6HIShTcBJG5
         oMBrV7cuGT62bY5bAQVFxqJN/ALmFNwKaBmrYzJM50I6G51Wc2bPF/tqLGtgI1fk6yLA
         8I1IQYRZs2phHTBphcSO5+Y3DrwvJaT+WljjiAk9bOGNT7GiRsyopRFuSs0AVdhIUaL6
         n0su5jzQ4FUPzkyY79utJiMp3yd9pbpaIVlcZFtDngJmLSL3cSsBlwzaYaNG3C7nzWOv
         yTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fHvA8PB0tgSMuTR67A1hSmLqr9H726zG7edX61sJKlg=;
        fh=zpA/4GtAkvobBJyjDg1TcRJfdnto+nhr2WEiIeZxLlU=;
        b=ZW+/FXLwSac3Lu1u6xBIykl0jWrCMNiu/IgoCLcKq9u4QLbFy+tTDFsIMnGAPKbO4e
         uvStJo2H+Ug0w5uGK5YoBJUIf6Edov7CzTgxJ7RqLI/s2YjcLo0y2eGF7MYbR6QXDJEw
         H2xqpkloAW4mfEcjaAZ6p9k+K1CuF6yy+ulI6cIKov+PhZExtRGOGVYDHkaVTqXlYj+P
         kOnEZrMONifGLkaLgcP1zqQhDZ39C9obm6lP/GpC9xCCVkWcYee7fnh6jqcdg1dWvHbW
         c9PpM7NrZueBdp0tIKHqvxeHUN/m2CdTPO5h4dLlRDE7e/+SOTQbiY2xjmGfvmnIznZR
         Tg/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769769664; x=1770374464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fHvA8PB0tgSMuTR67A1hSmLqr9H726zG7edX61sJKlg=;
        b=GzW9OPAncVajAsKEonQVNG8Vx4U4VTU4EjLXwsIaAv0T1Ka7Y76eQkXRxzPIkvyxkr
         EbiWP3LsgF7pyyrErycog5vIgq1AB/w7Y/PQSz/ejc5N+mHU5DqQKiazuNkmXEEEMzMn
         HQ+F4sR/SrWmBDQTxUhM1Z0d9/3eyeaLeQui0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769664; x=1770374464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHvA8PB0tgSMuTR67A1hSmLqr9H726zG7edX61sJKlg=;
        b=qm7hLSGQFLDCgEpBZbZEUcnVUM9vizoHIJ+IPSkXbvxeaFlN3UP8QRNyIE6+GGIrrh
         4rXfrvutlae+Fjbmtd5hScUtloJtkuAwajptaLPB7gGUFoIRPlFni6BfAU9+ucSJ3FJz
         6hR1rkM5qU6C9KSmoUMlezV0LZvMGNipgD0kbV2VVt7EwmvHoRpLKEbeDJZr6i276ktB
         FSpverZFi/TDKmEFHEzhAPkXd7qwyOB6BubonnSQBhu5KjOPWsoau4zO/A4veKZ0qhX5
         p5h/8DAsBWtmKG2C+8OgVAYW/wjupINL90MPcSeh4i3p6oYNq6GOXhojBrWHDHP7y4uB
         do9Q==
X-Gm-Message-State: AOJu0YyAXqCJYGPsSjfXFxAmN+DgsaMvJ0e66bwbg9/Z/Cm4uapCMUzT
	hojfXU1tKnSce070KGL1FAgrw6nvs4hkS/SKUE1MCILN6oAbz/6DGjiP9z3R3zkme2OxrNodkVh
	i267yL1kpuUwH7uq4VSQkRlTy4TEAdDQm/rWMr7gZxA8cKRdT+2Jkbko=
X-Gm-Gg: AZuq6aKdWbnJYNzjZt0JRUZJSRNE9xKJGr28IuyTAkeDXjwk71Yjgu2NNl0uPDfDkOn
	NrAv0yArJ8ncyoNaRdG0M62WMDIMvxc2CK3IUhsw1R6wxLRVkt1ZJi0uFyJJpxpnp583tIPpcvi
	9lbv5OEGgkTH/oLc/qUnEE7YjQgDdrMcNS1hQ57ANsxwrU0i6CYmwIn3+FrhafcjXXLtE1McxG0
	SOkN+FH+blhBabAlgEoAIc3yhgPjcslZbz2PrtE+QBYXR4dd69AZerMBYGZKmxZRaXpZ3sqMw0I
	RSPS6p1wS3Ix33/DTFXYhedoT6FBwDmPEaq5zEE=
X-Received: by 2002:a5d:5f83:0:b0:435:9d3f:92eb with SMTP id
 ffacd0b85a97d-435f3a6a9f1mr3289669f8f.1.1769769664002; Fri, 30 Jan 2026
 02:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20260130101650.19830-1-amaury.couderc@est.tech>
In-Reply-To: <20260130101650.19830-1-amaury.couderc@est.tech>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 30 Jan 2026 11:40:38 +0100
X-Gm-Features: AZwV_QiqfNLRxcM9OdoB-h-DXma0mAKv0oz9krTl92a2RZnQ0wId8j95bbCNaII
Message-ID: <CAMSfU+4SfoT8xMcAx=HesFsLcKAJZPpKPsGkWG6RhTDAJUgwmw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] curl_sasl:_if_redirected,_require_permission_to_use_bearer
To: amaury.couderc@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000286fef0649989cc5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230193

--000000000000286fef0649989cc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 30 janv. 2026 =C3=A0 11:17, Amaury Couderc via lists.openembedded.o=
rg
<amaury.couderc=3Dest.tech@lists.openembedded.org> a =C3=A9crit :

> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>

Hello,

The subject for this patch should be "[scarthgap][PATCH] curl: patch
CVE-2025-14524"
"curl_sasl: if redirected, require permission to use bearer" has very
little meaning outside of the curl source code.

Can you send a v2 with that?

Also, can you ensure the Upstream-Status line is not split?

Thanks!

---
>  .../curl/curl/CVE-2025-14524.patch            | 45 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch
> b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
> new file mode 100644
> index 0000000000..bd0dd86acb
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
> @@ -0,0 +1,45 @@
> +From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Wed, 10 Dec 2025 11:40:47 +0100
> +Subject: [PATCH] curl_sasl: if redirected, require permission to use
> bearer
> +
> +Closes #19933
> +
> +CVE: CVE-2025-14524
> +Upstream-Status: Backport
> +[
> https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48=
640
> ]
> +
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + lib/curl_sasl.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
> +index 66639cbacc..fe646548a8 100644
> +--- a/lib/curl_sasl.c
> ++++ b/lib/curl_sasl.c
> +@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct
> Curl_easy *data,
> +     data->set.str[STRING_SERVICE_NAME] :
> +     sasl->params->service;
> + #endif
> +-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
> ++  const char *oauth_bearer =3D
> ++    (!data->state.this_is_a_follow ||
> data->set.allow_auth_to_other_hosts) ?
> ++    data->set.str[STRING_BEARER] : NULL;
> +   struct bufref nullmsg;
> +
> +   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname,
> &port);
> +@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struc=
t
> Curl_easy *data,
> +     data->set.str[STRING_SERVICE_NAME] :
> +     sasl->params->service;
> + #endif
> +-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
> ++  const char *oauth_bearer =3D
> ++    (!data->state.this_is_a_follow ||
> data->set.allow_auth_to_other_hosts) ?
> ++    data->set.str[STRING_BEARER] : NULL;
> +   struct bufref serverdata;
> +
> +   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname,
> &port);
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb
> b/meta/recipes-support/curl/curl_8.7.1.bb
> index 0af6a41399..33bf6b1163 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D " \
>      file://CVE-2024-11053-0003.patch \
>      file://CVE-2025-0167.patch \
>      file://CVE-2025-9086.patch \
> +    file://CVE-2025-14524.patch \
>  "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230190):
> https://lists.openembedded.org/g/openembedded-core/message/230190
> Mute This Topic: https://lists.openembedded.org/mt/117542226/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000286fef0649989cc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 30=
 janv. 2026 =C3=A0=C2=A011:17, Amaury Couderc via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;amaury.couderc=3D<a href=3D=
"mailto:est.tech@lists.openembedded.org">est.tech@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<br>
Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br></blockquo=
te><div><br></div><div>Hello,</div><div><br></div><div>The subject for this=
 patch should be &quot;[scarthgap][PATCH] curl: patch CVE-2025-14524&quot;=
=C2=A0</div><div>&quot;curl_sasl: if redirected, require permission to use =
bearer&quot; has very little meaning outside of the curl source code.</div>=
<div><br></div><div>Can you send a v2 with that?</div><div><br></div><div>A=
lso, can you ensure the=C2=A0Upstream-Status line is not split?</div><div><=
br></div><div>Thanks!</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0.../curl/curl/CVE-2025-14524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 45 +++++++++++++++++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A02 files changed, 46 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/rec=
ipes-support/curl/curl/CVE-2025-14524.patch<br>
new file mode 100644<br>
index 0000000000..bd0dd86acb<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch<br>
@@ -0,0 +1,45 @@<br>
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D"_bla=
nk">daniel@haxx.se</a>&gt;<br>
+Date: Wed, 10 Dec 2025 11:40:47 +0100<br>
+Subject: [PATCH] curl_sasl: if redirected, require permission to use beare=
r<br>
+<br>
+Closes #19933<br>
+<br>
+CVE: CVE-2025-14524<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/curl/curl/commit/1a822275d333dc6da604349716=
0fd04c8fa48640" rel=3D"noreferrer" target=3D"_blank">https://github.com/cur=
l/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640</a>]<br>
+<br>
+Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
+---<br>
+ lib/curl_sasl.c | 8 ++++++--<br>
+ 1 file changed, 6 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c<br>
+index 66639cbacc..fe646548a8 100644<br>
+--- a/lib/curl_sasl.c<br>
++++ b/lib/curl_sasl.c<br>
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Cur=
l_easy *data,<br>
+=C2=A0 =C2=A0 =C2=A0data-&gt;set.str[STRING_SERVICE_NAME] :<br>
+=C2=A0 =C2=A0 =C2=A0sasl-&gt;params-&gt;service;<br>
+ #endif<br>
+-=C2=A0 const char *oauth_bearer =3D data-&gt;set.str[STRING_BEARER];<br>
++=C2=A0 const char *oauth_bearer =3D<br>
++=C2=A0 =C2=A0 (!data-&gt;state.this_is_a_follow || data-&gt;set.allow_aut=
h_to_other_hosts) ?<br>
++=C2=A0 =C2=A0 data-&gt;set.str[STRING_BEARER] : NULL;<br>
+=C2=A0 =C2=A0struct bufref nullmsg;<br>
+ <br>
+=C2=A0 =C2=A0Curl_conn_get_host(data, FIRSTSOCKET, &amp;hostname, &amp;dis=
p_hostname, &amp;port);<br>
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct =
Curl_easy *data,<br>
+=C2=A0 =C2=A0 =C2=A0data-&gt;set.str[STRING_SERVICE_NAME] :<br>
+=C2=A0 =C2=A0 =C2=A0sasl-&gt;params-&gt;service;<br>
+ #endif<br>
+-=C2=A0 const char *oauth_bearer =3D data-&gt;set.str[STRING_BEARER];<br>
++=C2=A0 const char *oauth_bearer =3D<br>
++=C2=A0 =C2=A0 (!data-&gt;state.this_is_a_follow || data-&gt;set.allow_aut=
h_to_other_hosts) ?<br>
++=C2=A0 =C2=A0 data-&gt;set.str[STRING_BEARER] : NULL;<br>
+=C2=A0 =C2=A0struct bufref serverdata;<br>
+ <br>
+=C2=A0 =C2=A0Curl_conn_get_host(data, FIRSTSOCKET, &amp;hostname, &amp;dis=
p_hostname, &amp;port);<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.7.1.bb</a> b/meta/recipes-support/=
curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"noreferrer" target=3D"_blank">=
curl_8.7.1.bb</a><br>
index 0af6a41399..33bf6b1163 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a><br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2024-11053-0003.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-0167.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2025-9086.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2025-14524.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230190): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230190" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230190</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117542226/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117542226/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000286fef0649989cc5--

