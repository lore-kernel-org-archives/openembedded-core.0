Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 93C6C783E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 13:48:34 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id h199so7517955ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qQTza2GmoPNj29Innl6vSz2MKzys3G8982d0RydHB04=;
	b=rI1qhOxtBeEDjiMMxqYK6OdqzFgiglXyfXEirj+0anFI/kw35uIvezpnV5bXaSjF0/
	NixHCBvYUREQV8j+WvsTw50lLM9jz91rSroK9ajGnPd0jKE/o0LRDwviogrGhsVy1yAE
	ENnAKCAF6VmasY+DQrWHhej6piPkCb4lUnMe9dzlezAEcGqO1g5huNwjisErSXAXnyts
	zh1W4El0mQMABGxmQUfWnNVB70Nv8XALnlpOKusj3geg438XMdF56IL9+U91jfoWCH7b
	eu8viW4G+DOQHNMWaTJY/vFI+uQX1fIUFuuWKzSjlABjWiWDBsvLQ70wVvC7GsFC95H5
	u1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qQTza2GmoPNj29Innl6vSz2MKzys3G8982d0RydHB04=;
	b=aZT8uTgorqzecktVCGk2x9ub48u5XQ3/A7bJPi7RMrL49LzUGyy8GLvbGYxfaJwTsa
	GvWNuxRe3fL6PTg2QcJEIlUXxph4QT5rlO9kAcvXIBopNpnWUBd7QLALjbv+DCp1LClx
	EstmsjlTeS/z62NECFbT9wVuBL19s4FNesAgRbDpzRWQTwrkGSGE8dT+VggF3kMSzl67
	iN6Lr7WkBLBACmbpJVveDnSitdjzKw02IaP0Yl4E0OY1HAI0a9VNDgWrsdD5gh1Vl2sS
	5kldvG3YBE5ZfuXXNspWVoTQ8o2BOAcSuWTT7vhcjA+DQ57w+7A/mE+/Eypb1qkFyvbw
	q1mA==
X-Gm-Message-State: AIVw112ZwWZVSSMJ9xmK7S6Np1TFCJ1pRFV8/gm1IPztPm0P71IHgONx
	2eWorEl/qp1u1WNwapucaZYHg3aFhUQz
X-Received: by 10.36.201.198 with SMTP id h189mr6918876itg.113.1500644915805; 
	Fri, 21 Jul 2017 06:48:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 21 Jul 2017 06:48:15 -0700 (PDT)
In-Reply-To: <1500544345-7341-1-git-send-email-liu.ming50@gmail.com>
References: <1500544345-7341-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jul 2017 14:48:15 +0100
Message-ID: <CAJTo0LY2NXzZf0T8sHYiE1UFCidgRVvA22qW9YfiPBdK35KE9w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Fri, 21 Jul 2017 13:48:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c0893602424b50554d41fe7"

--94eb2c0893602424b50554d41fe7
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 10:52, <liu.ming50@gmail.com> wrote:

> +++ b/meta/classes/bfd-binding-now.bbclass
> @@ -0,0 +1,4 @@
> +# Workaround for some ARCHs do not support bfd lazy binding well
> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
> +
> +TARGET_LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', ' -Wl,-z,relro,-z,now -fuse-ld=bfd ', '', d)}"
>

This is pretty ugly.

Does this tell us that maybe gold should be considered opt-in on a
per-recipe basis instead of used by default?

Can you instead have a .inc file which fiddles the flag for all the recipes
from outside the recipes? See eg security_flags.inc.

Ross

--94eb2c0893602424b50554d41fe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 10:52,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming=
50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":8o" class=3D"a3s aXjCH m15d5f=
6a8764308b2">+++ b/meta/classes/bfd-binding-<wbr>now.bbclass<br>
@@ -0,0 +1,4 @@<br>
+# Workaround for some ARCHs do not support bfd lazy binding well<br>
+# Refer to: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D11679" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoprojec=
t.<wbr>org/show_bug.cgi?id=3D11679</a><br>
+<br>
+TARGET_LDFLAGS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEAT=
URES&#39;, &#39;ld-is-gold&#39;, &#39; -Wl,-z,relro,-z,now -fuse-ld=3Dbfd &=
#39;, &#39;&#39;, d)}&quot;<br></div></blockquote></div><br>This is pretty =
ugly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Does this tell us that maybe gold should be considered opt-in on a per-reci=
pe basis instead of used by default?</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Can you instead have a .inc file which fiddl=
es the flag for all the recipes from outside the recipes? See eg security_f=
lags.inc.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--94eb2c0893602424b50554d41fe7--
