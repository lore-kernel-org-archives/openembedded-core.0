Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82F1C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:47:32 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.18857.1737658052114984992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B6rzK8eM;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53c9035003so2175857276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 10:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737658051; x=1738262851; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYpNEEMQX9oVo0N3BWEjpyxZ+a8DRyGljEh9bY1JTH8=;
        b=B6rzK8eM+WfW+WkkH9Tngy6V6VlksZUz0mtgHm9QM6wcccIxzYqOll/xj1O5YAKFbW
         rjAJcwIYE4HPBuusaqvX9vPWhPlGrAMak3tZXGoXys4iqYlblk+brsD2XifqdT95Zo/v
         h1jkCtdD4zd4452LnRc4OXZ1LunbK4b62A2NgJP38GPq8LkwrczyrEZzgV+2rnYYxOs8
         ivhOvMTaLu9pZm2BFF07d2r6gJWaTDg87Kaxdc7Sd68341KYv9EEKmvlCUvfR7oaElXJ
         nAbZpzJWy1IK8AyHtpUWOrxSuFcL3eXVPXuIfPM7X4+2ZQrFlWuTuCgDDLT/f2bwOMKO
         JzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737658051; x=1738262851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYpNEEMQX9oVo0N3BWEjpyxZ+a8DRyGljEh9bY1JTH8=;
        b=VWTlNisskqtx/E9sk17hGtKJfAwsuKgTkNbGJ3O7HPmdpjQ8ILJFKwyPu7qj3AVLhW
         ORAzNxvjNzuZa1sjy6WkII/dFKhJgedMjEn6OlJiUEa8CXtBZcS6oT+TKuyyX/uk5TYF
         5gvyroKw92Tow824r0FJ7/0pgeY92QmSjcGbxpocbh8i9HKwYg3YH+oY2/P56atiR9BM
         BXSFdeyq5K0Njd9McKFNu02vE4cCig3kvTxuyTxWpTNSWhV2OkBiTHZFjMNU3HgyVybX
         BPPmiHNimf9xbm0Lxur0GUZht9JeOT8EKWD37j7n1j5Ci+RC4AIgm8aE52iWQiW++9g0
         IaiA==
X-Gm-Message-State: AOJu0YxyCKAdnkAvBH85ZZ+IfkZYqftLu38r8ZU4zMX9/I7dnFOwy6Qq
	IyoWUmduAZ5NmSXcKuxHLi1LkFgIfi/JJ1iygEc/X7rZrX2eK2wa8NpwGT9A/W3xn6+R+LL5vCm
	GeymOSWWYyIGlVs5vDT+WT3eaWOo=
X-Gm-Gg: ASbGnct3BdBxBUcSMVIDEn9gB4mzqshwVhmpUeOdAQW5lhCtswRG3gfDsyxMERh5i3i
	MCyHSov7mRttw61s9jpuOX9bsRaffGau9+cXuMVUdtSqX3Mt9+PiHz7F/9tfSyWWuZer5IyEXJx
	jXj3xvGBggikTK
X-Google-Smtp-Source: AGHT+IHpFsQTBvzwEDfpEnYTnQE3/LC4C26zcrlxs8NzlRB1G0wN/VvwfZ5qEw/TLdCnp553encRU6Ck48MNsF5IV6M=
X-Received: by 2002:a25:7543:0:b0:e57:8991:be39 with SMTP id
 3f1490d57ef6-e57b1327fa4mr14291136276.32.1737658050999; Thu, 23 Jan 2025
 10:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20250123184440.2431629-1-peter.marko@siemens.com> <20250123184440.2431629-3-peter.marko@siemens.com>
In-Reply-To: <20250123184440.2431629-3-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jan 2025 19:47:14 +0100
X-Gm-Features: AbW1kvapoRqIIpYBnOsJPZwLCma6ZrxPXHi63RVEPnli2zjvGjMbvTPJ6a-epG8
Message-ID: <CANNYZj9gvtf3pyJfWUnaPm=39zDbzpPrsN0g6Frhjb68D9368g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] go: upgrade 1.22.10 -> 1.22.11
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000defeae062c640a32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210208

--000000000000defeae062c640a32
Content-Type: text/plain; charset="UTF-8"

Can you update to 1.23 as well?

Alex

On Thu 23. Jan 2025 at 19.45, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Upgrade to latest 1.22.x release [1]:
>
> $ git --no-pager log --oneline go1.22.10..go1.22.11
> f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11
> b72d56f98d [release-branch.go1.22] net/http: persist header stripping
> across repeated redirects
> 19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6
> hosts in URIs
> ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across
> casgstatus in injectglist
> 223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests
> using expired certificates
>
> Fixes CVE-2024-45336 and CVE-2024-45341
>
> [1] https://github.com/golang/go/compare/go1.22.10...go1.22.11
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} | 2 +-
>  ...binary-native_1.22.10.bb => go-binary-native_1.22.11.bb} | 6 +++---
>  ...oss-canadian_1.22.10.bb => go-cross-canadian_1.22.11.bb} | 0
>  .../go/{go-cross_1.22.10.bb => go-cross_1.22.11.bb}         | 0
>  .../go/{go-crosssdk_1.22.10.bb => go-crosssdk_1.22.11.bb}   | 0
>  .../go/{go-runtime_1.22.10.bb => go-runtime_1.22.11.bb}     | 0
>  meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb}   | 0
>  7 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} (89%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.22.10.bb =>
> go-binary-native_1.22.11.bb} (78%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.22.10.bb =>
> go-cross-canadian_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.22.10.bb =>
> go-cross_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.22.10.bb =>
> go-crosssdk_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.22.10.bb =>
> go-runtime_1.22.11.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb} (100%)
>
> diff --git a/meta/recipes-devtools/go/go-1.22.10.inc
> b/meta/recipes-devtools/go/go-1.22.11.inc
> similarity index 89%
> rename from meta/recipes-devtools/go/go-1.22.10.inc
> rename to meta/recipes-devtools/go/go-1.22.11.inc
> index 2abe7d0f3e3..21222bea4ec 100644
> --- a/meta/recipes-devtools/go/go-1.22.10.inc
> +++ b/meta/recipes-devtools/go/go-1.22.11.inc
> @@ -15,4 +15,4 @@ SRC_URI += "\
>
>  file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
> -SRC_URI[main.sha256sum] =
> "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
> +SRC_URI[main.sha256sum] =
> "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> similarity index 78%
> rename from meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> index 8c8fe5bff9f..a526cc88bc2 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
> @@ -9,9 +9,9 @@ PROVIDES = "go-native"
>
>  # Checksums available at https://go.dev/dl/
>  SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> -SRC_URI[go_linux_amd64.sha256sum] =
> "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
> -SRC_URI[go_linux_arm64.sha256sum] =
> "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
> -SRC_URI[go_linux_ppc64le.sha256sum] =
> "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
> +SRC_URI[go_linux_amd64.sha256sum] =
> "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
> +SRC_URI[go_linux_arm64.sha256sum] =
> "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
> +SRC_URI[go_linux_ppc64le.sha256sum] =
> "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.22.10.bb
> b/meta/recipes-devtools/go/go-cross_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.22.10.bb
> rename to meta/recipes-devtools/go/go-cross_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.22.10.bb
> b/meta/recipes-devtools/go/go-runtime_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.22.10.bb
> rename to meta/recipes-devtools/go/go-runtime_1.22.11.bb
> diff --git a/meta/recipes-devtools/go/go_1.22.10.bb
> b/meta/recipes-devtools/go/go_1.22.11.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.22.10.bb
> rename to meta/recipes-devtools/go/go_1.22.11.bb
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210207):
> https://lists.openembedded.org/g/openembedded-core/message/210207
> Mute This Topic: https://lists.openembedded.org/mt/110777118/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000defeae062c640a32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you update to 1.23 as well?</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 23. Jan 202=
5 at 19.45, Peter Marko via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists=
.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@sie=
mens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Upgrade to latest 1.22.x release [1]:<br>
<br>
$ git --no-pager log --oneline go1.22.10..go1.22.11<br>
f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11<br>
b72d56f98d [release-branch.go1.22] net/http: persist header stripping acros=
s repeated redirects<br>
19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6 hos=
ts in URIs<br>
ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across casgst=
atus in injectglist<br>
223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests usi=
ng expired certificates<br>
<br>
Fixes CVE-2024-45336 and CVE-2024-45341<br>
<br>
[1] <a href=3D"https://github.com/golang/go/compare/go1.22.10...go1.22.11" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/golang/go/compare/g=
o1.22.10...go1.22.11</a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/{go-1.22.10.inc =3D&gt; go-1.22.11.inc} | 2 =
+-<br>
=C2=A0...<a href=3D"http://binary-native_1.22.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">binary-native_1.22.10.bb</a> =3D&gt; <a href=3D"http://go-bi=
nary-native_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nati=
ve_1.22.11.bb</a>} | 6 +++---<br>
=C2=A0...<a href=3D"http://oss-canadian_1.22.10.bb" rel=3D"noreferrer" targ=
et=3D"_blank">oss-canadian_1.22.10.bb</a> =3D&gt; <a href=3D"http://go-cros=
s-canadian_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadi=
an_1.22.11.bb</a>} | 0<br>
=C2=A0.../go/{<a href=3D"http://go-cross_1.22.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-cross_1.22.10.bb</a> =3D&gt; <a href=3D"http://go-cross_1=
.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.11.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-crosssdk_1.22.10.bb" rel=3D"noreferrer" =
target=3D"_blank">go-crosssdk_1.22.10.bb</a> =3D&gt; <a href=3D"http://go-c=
rosssdk_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.1=
1.bb</a>}=C2=A0 =C2=A0| 0<br>
=C2=A0.../go/{<a href=3D"http://go-runtime_1.22.10.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-runtime_1.22.10.bb</a> =3D&gt; <a href=3D"http://go-run=
time_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.11.bb=
</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-devtools/go/{<a href=3D"http://go_1.22.10.bb" rel=3D"nor=
eferrer" target=3D"_blank">go_1.22.10.bb</a> =3D&gt; <a href=3D"http://go_1=
.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.11.bb</a>}=C2=A0 =
=C2=A0| 0<br>
=C2=A07 files changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.22.10.inc =3D&gt; go-1.22.11.in=
c} (89%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.22.10.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.10.bb=
</a> =3D&gt; <a href=3D"http://go-binary-native_1.22.11.bb" rel=3D"noreferr=
er" target=3D"_blank">go-binary-native_1.22.11.bb</a>} (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.10.=
bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.22.11.bb" rel=3D"noref=
errer" target=3D"_blank">go-cross-canadian_1.22.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.22.10.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.10.bb</a> =3D&gt; <a =
href=3D"http://go-cross_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go=
-cross_1.22.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.22.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.10.bb</a> =3D&g=
t; <a href=3D"http://go-crosssdk_1.22.11.bb" rel=3D"noreferrer" target=3D"_=
blank">go-crosssdk_1.22.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.22.10=
.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.10.bb</a> =3D&gt;=
 <a href=3D"http://go-runtime_1.22.11.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-runtime_1.22.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.22.10.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.22.10.bb</a> =3D&gt; <a href=3D"http=
://go_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">go_1.22.11.bb</a>} (=
100%)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.22.10.inc b/meta/recipes-devtool=
s/go/go-1.22.11.inc<br>
similarity index 89%<br>
rename from meta/recipes-devtools/go/go-1.22.10.inc<br>
rename to meta/recipes-devtools/go/go-1.22.11.inc<br>
index 2abe7d0f3e3..21222bea4ec 100644<br>
--- a/meta/recipes-devtools/go/go-1.22.10.inc<br>
+++ b/meta/recipes-devtools/go/go-1.22.11.inc<br>
@@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-hos=
t-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-go-Filter-build-paths-on-staticly-linked-ar=
ches.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d=
339bf2462bc97b64ca4c1037&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;a60c23dec95d10a2576265ce580f57869d5ac247=
1c4f4aca805addc9ea0fc9fe&quot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.=
22.10.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.10.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.11.b=
b" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.11.bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.2=
2.10.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.10.bb</=
a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.=
11.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.11.bb</a>=
<br>
index 8c8fe5bff9f..a526cc88bc2 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.10.b=
b" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.10.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.22.11.b=
b" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.22.11.bb</a><br>
@@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
<br>
=C2=A0# Checksums available at <a href=3D"https://go.dev/dl/" rel=3D"norefe=
rrer" target=3D"_blank">https://go.dev/dl/</a><br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7=
BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%7D" r=
el=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.${BUIL=
D_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br>
-SRC_URI[go_linux_amd64.sha256sum] =3D &quot;736ce492a19d756a92719a61212260=
87ccd91b652ed5caec40ad6dbfb2252092&quot;<br>
-SRC_URI[go_linux_arm64.sha256sum] =3D &quot;5213c5e32fde3bd7da65516467b7ff=
bfe40d2bb5a5f58105e387eef450583eec&quot;<br>
-SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;db05b9838f69d741fb9a5301220b=
1a62014aee025b0baf341aba3d280087b981&quot;<br>
+SRC_URI[go_linux_amd64.sha256sum] =3D &quot;0fc88d966d33896384fbde56e9a8d8=
0a305dc17a9f48f1832e061724b1719991&quot;<br>
+SRC_URI[go_linux_arm64.sha256sum] =3D &quot;9ebfcab26801fa4cf0627c6439db7a=
4da4d3c6766142a3dd83508240e4f21031&quot;<br>
+SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;963a0ec973640b23ee8bb7a462cc=
415276fd8436111a03df8c34eb3b1ae29f12&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&q=
uot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.22.10.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.10.b=
b</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.22.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.11.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
22.10.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.10.bb=
</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.22=
.11.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.22.11.bb</=
a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.10.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.10.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go-cross_1.22.11.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-cross_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.22.11.bb" r=
el=3D"noreferrer" target=3D"_blank">go-cross_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.10=
.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.10.bb</a> b/meta=
/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.11.bb" rel=3D"noref=
errer" target=3D"_blank">go-crosssdk_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.10.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.22.11.bb=
" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.10.=
bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.10.bb</a> b/meta/r=
ecipes-devtools/go/<a href=3D"http://go-runtime_1.22.11.bb" rel=3D"noreferr=
er" target=3D"_blank">go-runtime_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.10.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.22.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-runtime_1.22.11.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.22.10.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.22.10.bb</a> b/meta/recipes-devtools=
/go/<a href=3D"http://go_1.22.11.bb" rel=3D"noreferrer" target=3D"_blank">g=
o_1.22.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.22.10.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.22.10.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.22.11.bb" rel=3D"=
noreferrer" target=3D"_blank">go_1.22.11.bb</a><br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210207): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210207" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210207</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110777118/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110777118/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000defeae062c640a32--

