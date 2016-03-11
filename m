Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8F151602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:36:25 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id av4so6814577igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SdUzxWPiFfrTddSCEXRoUbF+GBeHml5pEZ/g7oFNLp4=;
	b=J1aXPKTRGqTuyT+4vDMFPxf7++KifPIbH2sOwBBfQULCg9NjJbyxfqa87Ztv5/EwDB
	WqBhk4Vp/3UyXY+u/ELwX5WwTOYX947Xq7hCkUWmkQs97e6DAAbLRTwoCHfhdSs4eCWo
	Y7mlTxJRnzqfu9d80bzTW/Mj7JCh2uqUlsTaSDSwwPGIiO9R4yv/XmDVpC+ge9P/6VWt
	16J6VeujjP69SNfBxdDlDocn1spV0rx/qzLljKevuQvn/jkaBF8FTU0esZi+17lL9k1L
	0I4LN5Ko0jPe4IDU3V9Y4F9brxqZH09pWikh53WHF/yNUzW1aZ/uXIIKoyULAocUIvpf
	EMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SdUzxWPiFfrTddSCEXRoUbF+GBeHml5pEZ/g7oFNLp4=;
	b=eUJB1tSU+D6wtCN3eFdeFBV0+MYQ8SQI0IbaKty09Q8sHjCNMOdJEqwMykz/OzNXwZ
	INKjxXTehuH5HJrqSTE7oWAYpvKTYw2sRIc4yS+A7vnhMmirKJrus5NhOu92WfluIOr6
	5Ba6bh4hySNetjlhfYezd/XjYMH8ccClahoNJzCTOnikuCFFyyTEDebVCTOG7AbNwaqL
	hJecydcJusJClj1X07rihTUHJZhbcueIl9w5cgkXtPusTuks8CaW9pmgwgQxTVm/RNoH
	02DRO/lmn4vziPzhqyTgZt9vHmn8jNIeBLTN9D9VtvPjEpJOHoAUAfxOvVeOHvHcsN0r
	p1fw==
X-Gm-Message-State: AD7BkJIZz5xUMdCRvYD3uejFWNPZIHi9jHdRe07DtKjwd3YHvie7SVok9x22rFvZDvtQoYXiOgPsdJQLmiHStfhg
X-Received: by 10.50.118.67 with SMTP id kk3mr1707317igb.64.1457688986502;
	Fri, 11 Mar 2016 01:36:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 01:36:07 -0800 (PST)
In-Reply-To: <1457662056-18208-2-git-send-email-juro.bystricky@intel.com>
References: <1457662056-18208-1-git-send-email-juro.bystricky@intel.com>
	<1457662056-18208-2-git-send-email-juro.bystricky@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 09:36:07 +0000
Message-ID: <CAJTo0LZ6w0t-5mHM6zSXFeT3Q7eAfEjFb-KBUhty_APaM6vh2A@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses_6: Fix an install race condition
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
X-List-Received-Date: Fri, 11 Mar 2016 09:36:26 -0000
Content-Type: multipart/alternative; boundary=089e0122a0d43be2f9052dc2aac4

--089e0122a0d43be2f9052dc2aac4
Content-Type: text/plain; charset=UTF-8

Hi Juro,

On 11 March 2016 at 02:07, Juro Bystricky <juro.bystricky@intel.com> wrote:

> +As both targets install identical files. The remedy is to either prevent
> +parallel make of install.libs and install.includes, or ensure only one
> +target installs the files.
> +The second approch will only work if we always install both libs and
> +includes (which we do).
>

Wouldn't an upstreamable fix be to make install.includes the target that
actually does something, and then have install depend on that?  Considering
install.libs and install.includes are separate rules, surely install.libs
in the header makefile should do nothing?  (ncurses is weird...)

Have you checked the other makefiles for the same problem?

Ross

--089e0122a0d43be2f9052dc2aac4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Juro,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 11 March 2016 at 02:07, Juro By=
stricky <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" t=
arget=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div id=3D":h3" class=3D"a3s" style=3D"overflow:hidd=
en">+As both targets install identical files. The remedy is to either preve=
nt<br>
+parallel make of install.libs and install.includes, or ensure only one<br>
+target installs the files.<br>
+The second approch will only work if we always install both libs and<br>
+includes (which we do).</div></blockquote></div><br>Wouldn&#39;t an upstre=
amable fix be to make install.includes the target that actually does someth=
ing, and then have install depend on that?=C2=A0 Considering install.libs a=
nd install.includes are separate rules, surely install.libs in the header m=
akefile should do nothing? =C2=A0(ncurses is weird...)</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Have you checked the other=
 makefiles for the same problem?</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--089e0122a0d43be2f9052dc2aac4--
