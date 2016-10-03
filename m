Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id E93F46074F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 15:31:19 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r192so118607636ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MZgSHWm/p4/Abq2BSKylY1LeWjq2be2MdCWdObgFOq0=;
	b=LuGM9U5iV0dhDN/mcBB3304g0XFwcG7kb4I5Rc+ZBiw799n2r8BokW+Ao10SfLbMdC
	XCtkbvmO17k4ilnZhUc6CdivrQkqef2TvPnvz30Ksyhc0pIT/L7sTpt00G949zDjiA7n
	c+2l9QkhCjQRLRpk5MVjxvCQPKY9n8NxNVuqbfuYV+frXVbhNQ4/dBsB9sU5le38VwGO
	aCa3E21NqFX4e6nyQzDEdDB2LubRl3xgUNObSKrmOrg+L0Kb3J+qXAgtCXIkvpggyyz7
	Y93blI5tNmcw8NqysZ0dQjoyyk0593TFETu9ZLqowjnD00elqW85t+deEFqHFFmeATdp
	9/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MZgSHWm/p4/Abq2BSKylY1LeWjq2be2MdCWdObgFOq0=;
	b=ETZkOjEFPrO+E8NaANE81UR8L2DB+7JWEB3WOmARlsEurD1VsHl/ZJisg9esaxzIwW
	254RADwiI/9feyuZsht3089sjDSsLEaNQuVBWZUrFKP5Rb9jnF3NsYTCNO/ejQWw+uW5
	SdFtAhtGr7zP6OyGc5PE+GyWRA7OTy85YvucYczEPhJ/RD5Xri9eNVsK43OYTLDW2LaX
	MMYkfXbrX0fSKVJKPOMNKyg7NfdrEK1IoGTFzYJ5PDNnU+bnLbTq9woD5Ga0+EtueHFL
	KuTY64hoL7i4V9m8Ge6Q369Sb9l9M9fW+BwwpaHYCp62YjLlAbPDYP3MTMa+t2zoNCwa
	HmPg==
X-Gm-Message-State: AA6/9RmSn7IzCsBg/GjIjjoSR3+QwIPBgDWZQu1chQ8VoXR5CJpGeVMYgTPoqDQZcZrv6pQgXQ5euPhUzh5alZ+X
X-Received: by 10.36.153.194 with SMTP id a185mr14189062ite.70.1475508681022; 
	Mon, 03 Oct 2016 08:31:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 3 Oct 2016 08:31:00 -0700 (PDT)
In-Reply-To: <20161003004307.824-2-stephano.cetola@linux.intel.com>
References: <20161003004307.824-1-stephano.cetola@linux.intel.com>
	<20161003004307.824-2-stephano.cetola@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Oct 2016 16:31:00 +0100
Message-ID: <CAJTo0LZ51i2rAE=poK94vjYqWDJ3MBA6_Fxfw0fk+=WjgjxY7w@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] sanity: add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 15:31:20 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e518cbb226053df7a22f

--94eb2c08e518cbb226053df7a22f
Content-Type: text/plain; charset=UTF-8

On 3 October 2016 at 01:43, Stephano Cetola <stephano.cetola@linux.intel.com
> wrote:

> +# If the user hasn't set up their name/email, set some defaults
> +check_git_config() {
> +       if [ -z "$1" ]; then
> +               name="OE"
> +       else
> +               name="$1"
> +       fi
> +       if ! git config user.email > /dev/null ; then
> +               git config --local user.email "${name}@${DISTRO}"
> +       fi
> +       if ! git config user.name > /dev/null ; then
> +               git config --local user.name "${name}"
> +       fi
> +}
>

Instead of embedding this into sanity.bbclass, could it just go into
meta/lib/oe/ somewhere?

Ross

--94eb2c08e518cbb226053df7a22f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2016 at 01:43, Stephano Cetola <span dir=3D"ltr">&lt;<a href=
=3D"mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.ceto=
la@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":sm" class=3D"a3s aXjCH m1578800bbac166c7">+# If the user hasn&#=
39;t set up their name/email, set some defaults<br>
+check_git_config() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$1&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D&quot;OE&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D&quot;$1&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! git config user.email &gt; /dev/null ; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git config --local =
user.email &quot;${name}@${DISTRO}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ! git config <a href=3D"http://user.name" re=
l=3D"noreferrer" target=3D"_blank">user.name</a> &gt; /dev/null ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git config --local =
<a href=3D"http://user.name" rel=3D"noreferrer" target=3D"_blank">user.name=
</a> &quot;${name}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}</div></blockquote></div><br>Instead of embedding this into sanity.bbclas=
s, could it just go into meta/lib/oe/ somewhere?</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08e518cbb226053df7a22f--
