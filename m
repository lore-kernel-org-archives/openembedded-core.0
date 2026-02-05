Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590E8EC1E8E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:00:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17253.1770285624020125681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P4VSSt/C;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a316d89so619165f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 02:00:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770285622; cv=none;
        d=google.com; s=arc-20240605;
        b=jk+nJo+l2RuQ8OPw6gTwVK80yYdBYlJMyrP7LUdrQOI6i08tqrC9zQmNT28d5OvcjM
         mLln7AvoCnZfbeJHL4v5Gr6dXVXUHg8SApO0yBdQWtI4eyPbvg2k6ylQDRDEwErIjGGV
         +apSp6Z64d4PdWK0WNf52l44XgJnHHOJwqBGwNfebRnl5f5EVQz3nR1XBOrKhytUbCfY
         a2aCJ3UAtet8rzVkhU+UnV3Sn3JaEfdWRVIXqc8b4EnV16xcdcpVW07u5JRbr/nETbdU
         wiKSkTcIHQMkMoiE51YaN9SsDRx+ZDcB4oMiOj7XFaNXMfShxBsh6DnELUyQY/2Xi5Dl
         bf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YFce7NU8PpMidmhTWBpRactz0eKep8F+qWVMydtBJl0=;
        fh=Eip4Jn1XwWJma9SY+p290X7lO535Eq/j3krUlYr6gVY=;
        b=QJ7Pdmjam8pK7ffVOnWyMY/6BoF0nKAXHilSohKVmwUbjk3L3WBVu9llhizgrzPBLO
         4Dsi+1Fnx41czc1dgKowjdh0aS5SiNAo4TGQE8D0+K1rULUsH57Adwv9u6FEPkKW7l9W
         PWbsQd1m/WCmZFp39PGrhxqdbeDxXlQYbBYD7qtdApatnbH2iefxEvn0etc3g+3b6Sgw
         sxn4Zg4V0wEoRfUpsIliJl7G96fbIJGd7rBNJORHZrSnFfSiRbRs1YmvPtVXSCioR+yB
         V0JMBk44U0K3WlPw3OCWeRqnNM9Y3qDoeckt8ekC26VYBrCyQQQwceFBG5NrOAfLz5Xd
         aCjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770285622; x=1770890422; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YFce7NU8PpMidmhTWBpRactz0eKep8F+qWVMydtBJl0=;
        b=P4VSSt/CyGmdyFHw+LmpqhdofkctQAJXuA+ECoScoSSCyND8y6YSC0NmcFoZlVpgeW
         PiFUBy0BoAmp5d/J+iIaUO6ixX2y7P0vKpC0prVkinS4Joh6TG3ppAeAU74p8UC2UzSl
         YhyRT4yXChheBP8aqz2ULAOAikL3SlkEB/qpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285622; x=1770890422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFce7NU8PpMidmhTWBpRactz0eKep8F+qWVMydtBJl0=;
        b=qO4kpvogv9fpGggN5vP7rES0ROZaL4F4eiItdqd9ZSmM7mobEJn2bnQvCZh2m6hvyN
         d1cNGeww0cVIWyC0ZHpdPYrgQCMr+XJaEHo2Xcmd6TpObc0KdtfHq3Q0QVD+UYTZAQ7t
         zi6SF76fEDFI/FEnMkgyqyoGIWt3DCBOmxgM2WGJlZ5U+z+XTHWwhk/PvgF6sv6eFuyi
         CT01zX+HtwcVMsWuD4sbdc33obO4ylKWyTNI2pZxMXhvx6gqkAlhFoHGN/hxTA1NWJNB
         m2SQxM6tw3/+hEgF3ZSK9tUiee6dtB8F2c01jDw4dstg0iyckei2dwhCjYOPIRUlyuDB
         j3BA==
X-Gm-Message-State: AOJu0YxNR/jV2vjDq1JcYu8wS4/icLnle34n86Nq3jD1Hsh/uAb6jzr9
	LTrzdb4FUqI+xmc8/DfTSw4JVCbYVZL2AAdfqnZl+zPBveh+xCItZHtsy0vnYYZrRpGY+h7Wb8y
	7fcMcE4UB3WD59ejU9D5TPgNa45Dsz6F9Nes8VW+sow==
X-Gm-Gg: AZuq6aKNRJxWzomL16e52TdLFIDpg0S4MgCErQNh714eTleffktUX64Q4+rfoT9I608
	oyCP9xzlCFRtxGpzuousvz4PUYhKOYwd1JVe/v7yvTuclWg0jwuZE+yKcZk57zHmqIoqds+gbHf
	H1+tRm82h1RX1Dju+xcoQdzeXu0L9YCT2torFvweN23cRSen3Z1kZmfZjA/KsSR+InMTbMpiOWZ
	vp0o+M2qNIGDCfVGFv970Ts8+H07f+Re5xVNmYrLxltjY12LyJ6UoVvEKSk0yy8U4+4sRzXKwH9
	ZJQcPGqBJdsKO3ZA3nzsf30hJE3d
X-Received: by 2002:a05:6000:61e:b0:435:a48a:123f with SMTP id
 ffacd0b85a97d-4361805ba71mr9558804f8f.42.1770285620903; Thu, 05 Feb 2026
 02:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20260202040805.596021-1-ankur.tyagi85@gmail.com> <20260202040805.596021-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20260202040805.596021-3-ankur.tyagi85@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 5 Feb 2026 10:59:54 +0100
X-Gm-Features: AZwV_Qh5Rp2DRHGL4BoMAf589osczeJlWVmIWxm1HxTY50M1er-eXEUaWDBxx5M
Message-ID: <CAMSfU+6Bmh+wDLNK-tbJo1OdY2faqh4o+x4pEdAY7yQ0H7K9jg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 3/3] vim: ignore CVE-2025-66476
To: ankur.tyagi85@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095eebb064a10bd3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 10:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230571

--00000000000095eebb064a10bd3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 2 f=C3=A9vr. 2026 =C3=A0 05:08, Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-support/vim/vim_9.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>

As far as I can tell, this patch is also needed on whinlatter.
Can you send it there please?

Thanks!

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim=
/
> vim_9.1.bb
> index fee9f055e9..c492342ffb 100644
> --- a/meta/recipes-support/vim/vim_9.1.bb
> +++ b/meta/recipes-support/vim/vim_9.1.bb
> @@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>  # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part of=
 CC.
>  #
>  lcl_maybe_fortify =3D
> "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=3D1',d)}=
"
> +
> +CVE_STATUS[CVE-2025-66476] =3D "not-applicable-platform: Issue only appl=
ies
> on Windows"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230344):
> https://lists.openembedded.org/g/openembedded-core/message/230344
> Mute This Topic: https://lists.openembedded.org/mt/117591467/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000095eebb064a10bd3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 2 f=C3=A9vr. 2026 =C3=A0=C2=
=A005:08, Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a href=3D"mailto:a=
nkur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<b=
r>
<br>
Details <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2025-66476" rel=3D"=
noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2025-664=
76</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim_9.1.bb" rel=3D"norefer=
rer" target=3D"_blank">vim_9.1.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br></blockquote><div><br></div><div>A=
s far as I can tell, this patch is also needed on whinlatter.</div><div>Can=
 you send it there please?</div><div><br></div><div>Thanks!</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_9.1.bb" rel=3D"=
noreferrer" target=3D"_blank">vim_9.1.bb</a> b/meta/recipes-support/vim/<a =
href=3D"http://vim_9.1.bb" rel=3D"noreferrer" target=3D"_blank">vim_9.1.bb<=
/a><br>
index fee9f055e9..c492342ffb 100644<br>
--- a/meta/recipes-support/vim/<a href=3D"http://vim_9.1.bb" rel=3D"norefer=
rer" target=3D"_blank">vim_9.1.bb</a><br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim_9.1.bb" rel=3D"norefer=
rer" target=3D"_blank">vim_9.1.bb</a><br>
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<=
br>
=C2=A0# in many places for _FORTIFY_SOURCE=3D2.=C2=A0 Security flags become=
 part of CC.<br>
=C2=A0#<br>
=C2=A0lcl_maybe_fortify =3D &quot;${@oe.utils.conditional(&#39;DEBUG_BUILD&=
#39;,&#39;1&#39;,&#39;&#39;,&#39;-D_FORTIFY_SOURCE=3D1&#39;,d)}&quot;<br>
+<br>
+CVE_STATUS[CVE-2025-66476] =3D &quot;not-applicable-platform: Issue only a=
pplies on Windows&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230344): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230344" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230344</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117591467/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117591467/4316185</a><br>
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

--00000000000095eebb064a10bd3d--

