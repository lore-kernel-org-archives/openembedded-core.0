Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A80CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 11:49:42 +0000 (UTC)
Subject: Re: [walnascar 3/3] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 04:49:40 -0700
References: <CAMKF1sqtEcW-wzC3uP7mmiTqAJCVCqzg_Fy5H3anpVUnkg-QDw@mail.gmail.com>
In-Reply-To: <CAMKF1sqtEcW-wzC3uP7mmiTqAJCVCqzg_Fy5H3anpVUnkg-QDw@mail.gmail.com>
Message-ID: <4495.1756900180442086216@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="U7sT3ZBUYN3kJqWEn6Ew"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 11:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222856

--U7sT3ZBUYN3kJqWEn6Ew
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

We backported this patch due to a specific use case on our end. We set the =
TMPDIR
path length to 399 characters (just under the 400-character limit) and atte=
mpted
to build lib32-gcc. While this works fine on the master branch, we encounte=
red the
following error on the walnascar branch:

make: /bin/bash: Argument list too long
make: *** [Makefile:4701: all-gcc] Error 127
ERROR: oe_runmake failed

Upon comparing the logs between the master and walnascar branches, we notic=
ed that
in walnascar, the following flags were passed multiple times:

-fmacro-prefix-map
-fdebug-prefix-map
-fcanon-prefix-map

Since our TMPDIR path is quite long, passing it repeatedly via these flags =
seems
to be the root cause of the issue.

In the master branch, these were replaced with the more concise "-ffile-pre=
fix-map"
flag, significantly reducing the number of times the long TMPDIR path is pa=
ssed to
the compiler. This change resolved the error, which is why we backported th=
e patch
to walnascar.

So, can we backport this for walnascar branch in future or do you suggest u=
s to wait for
october release.

Regards,
Deepesh

--U7sT3ZBUYN3kJqWEn6Ew
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi Khem,<br /><br />We backported this patch due to a specific use cas=
e on our end. We set the TMPDIR<br />path length to 399 characters (just un=
der the 400-character limit) and attempted<br />to build lib32-gcc. While t=
his works fine on the master branch, we encountered the<br />following erro=
r on the walnascar branch:<br /><br /></div>
<div>make: /bin/bash: Argument list too long<br />make: *** [Makefile:4701:=
 all-gcc] Error 127<br />ERROR: oe_runmake failed<br /><br /></div>
<div>Upon comparing the logs between the master and walnascar branches, we =
noticed that<br />in walnascar, the following flags were passed multiple ti=
mes:<br /><br /></div>
<div>-fmacro-prefix-map<br />-fdebug-prefix-map<br />-fcanon-prefix-map<br =
/><br /></div>
<div>Since our TMPDIR path is quite long, passing it repeatedly via these f=
lags seems<br />to be the root cause of the issue.<br /><br /></div>
<div>In the master branch, these were replaced with the more concise "-ffil=
e-prefix-map"<br />flag, significantly reducing the number of times the lon=
g TMPDIR path is passed to<br />the compiler. This change resolved the erro=
r, which is why we backported the patch<br />to walnascar.&nbsp;<br /><br /=
>So, can we backport this for walnascar branch in future or do you suggest =
us to wait for&nbsp;<br />october release.<br /><br />Regards,<br />Deepesh=
<br /><br /></div>
</div>

--U7sT3ZBUYN3kJqWEn6Ew--

