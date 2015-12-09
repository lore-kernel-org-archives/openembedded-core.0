Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFB16FFDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 11:53:04 +0000 (UTC)
Received: by ioc74 with SMTP id 74so55982202ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BjcpxSr++miONZIVdwNHM0iD0oGhtCfmm9bX3UXtu8k=;
	b=LwUJhH8qt7XiY/3a12COQGaR4snfBpY0H8VuaBFKcq22VAYCow4Ae2YySawInIOsig
	3KQLSyU5DXM76T5SyDGVxB54kiLINZnK1hGt84bf2F/3IZu4evPF1mQEQCDP+UPFR7gl
	Duyt6M+YKJT5oszmghQoQtQ+7wibwBR7vZkGBjlwsG1Y17uLc55BAtUfb6kFT9Hs2EFA
	CQGZDgmjBf5B9UtIV+8JIjJ1J9Jq3G8/gVee9sb9LEifaQ+HRGjXIdyq8yZN68VsCHN8
	W/r+v4lZJJhgXM9kgQlXJfatfPoTEW70Rv/swQessWxlLCEhttZWjJJpc9RJYMdfVe7H
	LWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BjcpxSr++miONZIVdwNHM0iD0oGhtCfmm9bX3UXtu8k=;
	b=IldOCKiAGlPfrFXOdoY3vCw3zHuSKjW46WLUY1iRh/A7vKaOh+VNJm5JkKd4hhKYDt
	gZO8Ovb8y0Qmg856e559f5YqUtj5g5Picvs5g9szb4fccG4ZCETVZalqQb/zNhlKea2C
	pkRbEmC4+GoUsu36B1c0dWGg19b1u0clczSiNLr+n3jziTWb7zjHCqemZ1OIAjZMy001
	NW0dBrmRUJRl7hJ38dlcR8mt212jligKvNxJqR0ANcGkNHtfA6GA4wHCTFk6HVlOE+Zo
	57ILrwfH4wsno60WYzGUdzFYRnzp27TZ3Cgz5L0raSGiT4fHKf/AquUR8Qce2JipvVQ2
	CEiw==
X-Gm-Message-State: ALoCoQl5MmwKh6Nk6n7pPOuIFWX4YXBMuCL1t/pOXi9AEYQg6YUtcDaYwPlvgPg5f85I5E+ORms8+DvRpSexpDUmNOv25JT4zH24UtDz0p2Wgmlv2DzM2mE=
X-Received: by 10.107.3.144 with SMTP id e16mr4567062ioi.99.1449661985077;
	Wed, 09 Dec 2015 03:53:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 9 Dec 2015 03:52:45 -0800 (PST)
In-Reply-To: <1449626605-10934-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1449626605-10934-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Dec 2015 11:52:45 +0000
Message-ID: <CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix for CVE-2015-1794
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
X-List-Received-Date: Wed, 09 Dec 2015 11:53:05 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40aa54e6052675bbde

--001a113ecf40aa54e6052675bbde
Content-Type: text/plain; charset=UTF-8

On 9 December 2015 at 02:03, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> +++
> b/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch
> @@ -0,0 +1,101 @@
> +Upstream-Status: Backport
> +
> +From ada57746b6b80beae73111fe1291bf8dd89af91c Mon Sep 17 00:00:00 2001
> +From: Guy Leaver (guleaver) <guleaver@cisco.com>
> +Date: Fri, 7 Aug 2015 15:45:21 +0100
> +Subject: [PATCH] Fix seg fault with 0 p val in SKE
> +
> +If a client receives a ServerKeyExchange for an anon DH ciphersuite with
> the
> +value of p set to 0 then a seg fault can occur. This commits adds a test
> to
> +reject p, g and pub key parameters that have a 0 value (in accordance with
> +RFC 5246)
> +
> +The security vulnerability only affects master and 1.0.2, but the fix is
> +additionally applied to 1.0.1 for additional confidence.
> +
> +CVE-2015-1794
> +
> +Reviewed-by: Richard Levitte <levitte@openssl.org>
> +Reviewed-by: Matt Caswell <matt@openssl.org>
>

This patch needs to have your (or whoever actually did the work)
signed-off-by inside the patch, alongside the Upstream-Status.

Thanks,
Ross

--001a113ecf40aa54e6052675bbde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2015 at 02:03, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":2x2" class=3D"" style=3D"over=
flow:hidden">+++ b/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-=
with-0-p-val-in-SKE.patch<br>
@@ -0,0 +1,101 @@<br>
+Upstream-Status: Backport<br>
+<br>
+From ada57746b6b80beae73111fe1291bf8dd89af91c Mon Sep 17 00:00:00 2001<br>
+From: Guy Leaver (guleaver) &lt;<a href=3D"mailto:guleaver@cisco.com">gule=
aver@cisco.com</a>&gt;<br>
+Date: Fri, 7 Aug 2015 15:45:21 +0100<br>
+Subject: [PATCH] Fix seg fault with 0 p val in SKE<br>
+<br>
+If a client receives a ServerKeyExchange for an anon DH ciphersuite with t=
he<br>
+value of p set to 0 then a seg fault can occur. This commits adds a test t=
o<br>
+reject p, g and pub key parameters that have a 0 value (in accordance with=
<br>
+RFC 5246)<br>
+<br>
+The security vulnerability only affects master and 1.0.2, but the fix is<b=
r>
+additionally applied to 1.0.1 for additional confidence.<br>
+<br>
+CVE-2015-1794<br>
+<br>
+Reviewed-by: Richard Levitte &lt;<a href=3D"mailto:levitte@openssl.org">le=
vitte@openssl.org</a>&gt;<br>
+Reviewed-by: Matt Caswell &lt;<a href=3D"mailto:matt@openssl.org">matt@ope=
nssl.org</a>&gt;</div></blockquote></div><br>This patch needs to have your =
(or whoever actually did the work) signed-off-by inside the patch, alongsid=
e the Upstream-Status.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf40aa54e6052675bbde--
