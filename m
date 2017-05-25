Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id ECF9B77E31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:50:09 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id t26so177787518qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U0MwXxLlRaCkCjAsxNUMSaXJ15VbeRP7BXnvAE9vP+s=;
	b=00oFuuaaHbkyNNTRttXj+imfCPdXTmk2CNGUaq/GuFe+aZtEYtyai1mAKTT+434rKr
	QuPGpEHiOp3fSWkw+ocNGRQfpohqImaMjtBOz8wv9R+AnE046WyCByE5RZ3veOo2MRTT
	pr4hYuztwZdOpcvZ6KqWDwTs0SGi5L0kdKuXaFWEQ96RXV3rF5hx1pjapK6z/u3pFo7s
	KDcEjx1vVB4P0NmeM+BO5RDKar4asoIkBQ8QVXH0ziwbDDTLqoJaKnsQ6EFkj15rlXM8
	WL2jJvtVHTnijCymilCBknHwr37zDf44iQCA6mSFZcv9Id3o1IctqrFH0x+XCVOiyULh
	8sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U0MwXxLlRaCkCjAsxNUMSaXJ15VbeRP7BXnvAE9vP+s=;
	b=YGOJFP8eYj4ErXPDZS1diEUoRpVDTMsStVzcP5XKReIQpCbYzrcoGx7TCxwrOGVEXk
	nMPZaBY4csptTGfPsJRtOJkJ0kQ6H7XgkSu5QQsuf7m3otw42OwGWUcigE+30BlGC3rj
	DoYd9yQ/+Dtbyb3+rKQFiYmNtxh3GHx6sGotU0n2uH654/l5yr5i/Mp87AkZvJZ4UNLt
	oy5C3ELNmnq85BxQGK4INsWtzhn3AXdKHd5Rcq3ZpVMuBXkam82hIjFgAh0SGc3mzn8o
	OT94ck5lTR+egGNRl+JfTWRM4mFu28cD3E5Jh1hpx6W1hChrX0ql8avsvr+eLKRxQw+e
	JdXQ==
X-Gm-Message-State: AODbwcBplwi3iozfnKmlkO/IdVlBb53xYJpc5uQamDgApEeRAFm1S8bS
	1pPsIv94Ii4ZjhrspB/60ZE9ahq0lrsb
X-Received: by 10.200.47.210 with SMTP id m18mr40912933qta.44.1495713010645;
	Thu, 25 May 2017 04:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 04:49:50 -0700 (PDT)
In-Reply-To: <1495678712-44204-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495678712-44204-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 12:49:50 +0100
Message-ID: <CAJTo0Lao3m_MEjgiVyvOCWamdi488Ya75eyTS=vvHvwHfpnqyA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: fix libssl error for ARMv8
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
X-List-Received-Date: Thu, 25 May 2017 11:50:10 -0000
Content-Type: multipart/alternative; boundary="001a1142adbaafadda055057d270"

--001a1142adbaafadda055057d270
Content-Type: text/plain; charset="UTF-8"

On 25 May 2017 at 03:18, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> +PACKAGECONFIG_aarch64 ??= "${@bb.utils.contains("DISTRO_FEATURES",
> "ipv6", "ipv6", "", d)} ssl proxy zlib"
>

So this is a gnutls bug?  Have you filed it upstream or attempted to
root-cause it?

As you cant do ??= with overrides, a neater way would be:

PACKAGECONFG_append_aarch64 = " ssl"
PACKAGECONFG_remove_aarch64 = "gnutls"

(with a comment in the recipe)

Ross

--001a1142adbaafadda055057d270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2017 at 03:18, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:2ql" class=3D"=
gmail-a3s gmail-aXjCH gmail-m15c3d6849bf7e7aa">+PACKAGECONFIG_aarch64 ??=3D=
 &quot;${@bb.utils.contains(&quot;DISTRO_<wbr>FEATURES&quot;, &quot;ipv6&qu=
ot;, &quot;ipv6&quot;, &quot;&quot;, d)} ssl proxy zlib&quot;<br></div></bl=
ockquote></div><br>So this is a gnutls bug?=C2=A0 Have you filed it upstrea=
m or attempted to root-cause it?</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra"><div class=3D"gmail_extra">As you cant do ??=3D =
with overrides, a neater way would be:</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">PACKAGECONFG_append_aarch64 =3D &quot; ssl=
&quot;</div><div><div class=3D"gmail_extra">PACKAGECONFG_remove_aarch64 =3D=
 &quot;gnutls&quot;</div></div><div><br></div><div>(with a comment in the r=
ecipe)</div><div><br></div><div>Ross</div></div></div>

--001a1142adbaafadda055057d270--
