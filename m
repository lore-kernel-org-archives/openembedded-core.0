Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC05CC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:56:16 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.24621.1752677773776778998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cd4RecKy;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8bd2eae9e0so252031276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677773; x=1753282573; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKEtmZosLUBgsl1nYpMLQ7vSH5CnUOwjAKpvEJfoL10=;
        b=Cd4RecKyz4LahSNawXXI9y6OdpmcJjGTD9TH4OhSi3IPAT8nxvrJ3E/xL8Xj/wdfPD
         kOPTh46J9g6+ZxHNt4R2AkoCXbHTx91tCIX2vkBppUD1g14qdZmM14kDH7l8NnaxpJ/Z
         VY6/3wIpczpTmsBbk6qoIqjinNgL3sTxpP7apTj3YNQMYMjfnTjuB/kmVzNBzJONr9EH
         7GgT5YrspyxzFQvE44Bw91J9cV2vBo5Ae7nZCTbrKglwavBoOA10iBVZF8L9tzj8qlzm
         yfVZ1J2m1PyuWfXwR/yx+TJ2+TCOXbrA9SqRJVswEf3e985sWLPyR/f++q7DuGzJ02zV
         By4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677773; x=1753282573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKEtmZosLUBgsl1nYpMLQ7vSH5CnUOwjAKpvEJfoL10=;
        b=U2ZzV6CKY87ORo5rhe7u2+oiNXOMyoU6afZ2w7GhrLboGTz3t6EqZnlFDwEhT+owck
         Rx4NUDKpauEf0urQnzwNhW3aWGbrgt0jsvtBTwp1FHgFPzGMkSslhhtSBcjIaQdymvzP
         uXHChXdvQfkuYcJQKfMfuhJ6TGkE1ZyWhdMzPB7Yx1vBXN1AWG6dAouuSSV3cr7DPQZL
         WegN8t0EW2PnZGRJPnpVO9Xk20KnYh/yWVA6nwxH2V9lWuF/mdBMUHN5lmzwjyJL8Gzi
         TP97/LdkIp9co3W39YAFe8itUzjOQyFqQ4Dv6COHoedJSZLi0L94VUWwYZk6WXHdo6MG
         CWqQ==
X-Gm-Message-State: AOJu0YziCtlpWLsPC398VCqfhF512rKTOtxTd2hn15guFaV+MfaXOdwB
	GD2W0hgRuhqrE9crPrG0qHMUV1nywZfsUCMLBIBcQ9++CTvn6+TLoHDjc0KGVPq9JrKDk6Fn8yQ
	JiMVz0huUcVJLkzkq6oILIBBL+mDomtQ=
X-Gm-Gg: ASbGnctsm2OzUkLc4NbFt+Y5XRFy1H2z8+0E5vV1YWYwbCjKfxq0Uo1qaB7dFRbm7w5
	psP+d14zMw93R5xHY5hlKIISCgcdtBULaXSFzWtYllU8eyNeSqj6e1AycKgqqX603JcidJLw9Ms
	FsJod9m1FLb/FcxtDq0k1Zib+uuGFNjxpdmhA6Nw8uJGJYE900MzA2AHPqdGBiXnMFN2Gj63ZLg
	URL0HAvydGY0smFG/jhsdyIZ7WsPewDAyjGUxc=
X-Google-Smtp-Source: AGHT+IErwa+uvelhNb1g+Zz+B1ePDVkHSwiuG0Z0oHeE5fAbGRDwoGVIhARy+nuY50Ca5lJSw9V64OwfL9ZlEt+416I=
X-Received: by 2002:a05:690c:f92:b0:70d:fe74:1800 with SMTP id
 00721157ae682-718370b28a7mr42250477b3.15.1752677772555; Wed, 16 Jul 2025
 07:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 07:56:00 -0700
X-Gm-Features: Ac12FXzI0nBgQd5SuAMpOG-VRQ3XC-P__aGHLh_SiS940t8M46tQpkAeV_XdKoI
Message-ID: <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the SRC_URI
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009fa84063a0d18ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220466

--00000000000009fa84063a0d18ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.openembe=
dded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> It seems under some circumstances the tag in SRC_URI can prevent the
> recipe from being unpacked correctly. Drop it in order to let bitbake
> handle the recipe correctly.


I think we should look more into underlying problem. I have seen projects
create release tags that do not belong to any branches and can create
fetching issues using nobranch=3D1 helped in such cases

>
>
> 2025-07-16T02:15:12.1679756Z 2025-07-16 02:15:12 - ERROR    - ERROR:
> spirv-llvm-translator-native-20.1.4-r0 do_unpack: Bitbake Fetcher Error:
> FetchError('Fetch command export PSEUDO_DISABLED=3D1; export
> GIT_PROXY_COMMAND=3D"oe-git-proxy"; export NO_PROXY=3D"*"; export
> PATH=3D"/work/oe-core/scripts/native-intercept:/work/build/tmp/sysroots-u=
ninative/x86_64-linux/usr/bin:/work/build/tmp/work/x86_64-linux/spirv-llvm-=
translator-native/20.1.4/recipe-sysroot-native/usr/bin/python3-native:/work=
/oe-core/scripts:/work/build/tmp/work/x86_64-linux/spirv-llvm-translator-na=
tive/20.1.4/recipe-sysroot-native/usr/bin/x86_64-linux:/work/build/tmp/work=
/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/usr=
/bin:/work/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/=
recipe-sysroot-native/usr/sbin:/work/build/tmp/work/x86_64-linux/spirv-llvm=
-translator-native/20.1.4/recipe-sysroot-native/usr/bin:/work/build/tmp/wor=
k/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-native/sb=
in:/work/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/re=
cipe-sysroot-native/bin:/work/bitbake/bin:/work/build/tmp/hosttools";
> export HOME=3D"/tmp/tmppvfb2ln5"; git -c gc.autoDetach=3Dfalse -c
> core.pager=3Dcat -c safe.bareRepository=3Dall -c clone.defaultRemoteName=
=3Dorigin
> rev-list -n 1 v20.1.4 failed with exit code 128, output:\nfatal: ambiguou=
s
> argument \'v20.1.4\': unknown revision or path not in the working
> tree.\nUse \'--\' to separate paths from revisions, like this:\n\'git
> <command> [<revision>...] -- [<file>...]\'\n', None)
> 2025-07-16T02:15:12.1686736Z 2025-07-16 02:15:12 - ERROR    - ERROR:
> Logfile of failure stored in:
> /work/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/tem=
p/log.do_unpack.75654
> 2025-07-16T02:15:12.1687492Z 2025-07-16 02:15:12 - INFO     - NOTE: recip=
e
> spirv-llvm-translator-native-20.1.4-r0: task do_unpack: Failed
> 2025-07-16T02:15:12.1748425Z 2025-07-16 02:15:12 - ERROR    - ERROR: Task
> (virtual:native:/work/build/../oe-core/meta/recipes-graphics/spir/spirv-l=
lvm-translator_20.1.4.bb:do_unpack)
> failed
>
> Fixes: e3890983dbf4 ("spirv-llvm-translator: upgrade 20.1.2 -> 20.1.4")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> index 14e4bb74ace4..e6c6cbd69d27 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.TXT;md5=3D47e311aa9caedd1b3abf098bd7814d1d"
>  SPIRV_BRANCH =3D "llvm_release_${@oe.utils.trim_version('${PV}',
> 1).replace('.', '')}0"
>  SRCREV =3D "74843f2186bb63b6802758222084da17fcbe603c"
>  SRC_URI =3D " \
> -    git://
> github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;tag=3Dv${P=
V};branch=3D${SPIRV_BRANCH}
> <http://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;ta=
g=3Dv$%7BPV%7D;branch=3D$%7BSPIRV_BRANCH%7D>
> \
> +    git://
> github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;branch=3D$=
{SPIRV_BRANCH}
> <http://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=3Dhttps;br=
anch=3D$%7BSPIRV_BRANCH%7D>
> \
>  "
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220464):
> https://lists.openembedded.org/g/openembedded-core/message/220464
> Mute This Topic: https://lists.openembedded.org/mt/114186099/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009fa84063a0d18ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM=
 Dmitry Baryshkov via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"mailto:oss.qualcomm.com@l=
ists.openembedded.org">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">It seems under some circumstance=
s the tag in SRC_URI can prevent the<br>
recipe from being unpacked correctly. Drop it in order to let bitbake<br>
handle the recipe correctly.</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I think we should look more into underlying problem. I have see=
n projects create release tags that do not belong to any branches and can c=
reate fetching issues using nobranch=3D1 helped in such cases=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
2025-07-16T02:15:12.1679756Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0 - ERR=
OR: spirv-llvm-translator-native-20.1.4-r0 do_unpack: Bitbake Fetcher Error=
: FetchError(&#39;Fetch command export PSEUDO_DISABLED=3D1; export GIT_PROX=
Y_COMMAND=3D&quot;oe-git-proxy&quot;; export NO_PROXY=3D&quot;*&quot;; expo=
rt PATH=3D&quot;/work/oe-core/scripts/native-intercept:/work/build/tmp/sysr=
oots-uninative/x86_64-linux/usr/bin:/work/build/tmp/work/x86_64-linux/spirv=
-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/bin/python3-native=
:/work/oe-core/scripts:/work/build/tmp/work/x86_64-linux/spirv-llvm-transla=
tor-native/20.1.4/recipe-sysroot-native/usr/bin/x86_64-linux:/work/build/tm=
p/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-nati=
ve/usr/bin:/work/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/2=
0.1.4/recipe-sysroot-native/usr/sbin:/work/build/tmp/work/x86_64-linux/spir=
v-llvm-translator-native/20.1.4/recipe-sysroot-native/usr/bin:/work/build/t=
mp/work/x86_64-linux/spirv-llvm-translator-native/20.1.4/recipe-sysroot-nat=
ive/sbin:/work/build/tmp/work/x86_64-linux/spirv-llvm-translator-native/20.=
1.4/recipe-sysroot-native/bin:/work/bitbake/bin:/work/build/tmp/hosttools&q=
uot;; export HOME=3D&quot;/tmp/tmppvfb2ln5&quot;; git -c gc.autoDetach=3Dfa=
lse -c core.pager=3Dcat -c safe.bareRepository=3Dall -c clone.defaultRemote=
Name=3Dorigin rev-list -n 1 v20.1.4 failed with exit code 128, output:\nfat=
al: ambiguous argument \&#39;v20.1.4\&#39;: unknown revision or path not in=
 the working tree.\nUse \&#39;--\&#39; to separate paths from revisions, li=
ke this:\n\&#39;git &lt;command&gt; [&lt;revision&gt;...] -- [&lt;file&gt;.=
..]\&#39;\n&#39;, None)<br>
2025-07-16T02:15:12.1686736Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0 - ERR=
OR: Logfile of failure stored in: /work/build/tmp/work/x86_64-linux/spirv-l=
lvm-translator-native/20.1.4/temp/log.do_unpack.75654<br>
2025-07-16T02:15:12.1687492Z 2025-07-16 02:15:12 - INFO=C2=A0 =C2=A0 =C2=A0=
- NOTE: recipe spirv-llvm-translator-native-20.1.4-r0: task do_unpack: Fail=
ed<br>
2025-07-16T02:15:12.1748425Z 2025-07-16 02:15:12 - ERROR=C2=A0 =C2=A0 - ERR=
OR: Task (virtual:native:/work/build/../oe-core/meta/recipes-graphics/spir/=
spirv-llvm-translator_20.1.4.bb:do_unpack) failed<br>
<br>
Fixes: e3890983dbf4 (&quot;spirv-llvm-translator: upgrade 20.1.2 -&gt; 20.1=
.4&quot;)<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translator_20=
.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_20.1.4.=
bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-transl=
ator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_=
20.1.4.bb</a> b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tra=
nslator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translat=
or_20.1.4.bb</a><br>
index 14e4bb74ace4..e6c6cbd69d27 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translator_20=
.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_20.1.4.=
bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-translator_20=
.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translator_20.1.4.=
bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D47e311a=
a9caedd1b3abf098bd7814d1d&quot;<br>
=C2=A0SPIRV_BRANCH =3D &quot;llvm_release_${@oe.utils.trim_version(&#39;${P=
V}&#39;, 1).replace(&#39;.&#39;, &#39;&#39;)}0&quot;<br>
=C2=A0SRCREV =3D &quot;74843f2186bb63b6802758222084da17fcbe603c&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/KhronosGroup/SPIRV-LLVM-T=
ranslator;protocol=3Dhttps;tag=3Dv$%7BPV%7D;branch=3D$%7BSPIRV_BRANCH%7D" r=
el=3D"noreferrer" target=3D"_blank">github.com/KhronosGroup/SPIRV-LLVM-Tran=
slator;protocol=3Dhttps;tag=3Dv${PV};branch=3D${SPIRV_BRANCH}</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/KhronosGroup/SPIRV-LLVM-T=
ranslator;protocol=3Dhttps;branch=3D$%7BSPIRV_BRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=
=3Dhttps;branch=3D${SPIRV_BRANCH}</a> \<br>
=C2=A0&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220464): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220464" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220464</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114186099/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114186099/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000009fa84063a0d18ed--

