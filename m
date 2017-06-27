Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB1B77F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:12:04 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id f92so20460895qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mmqs2dKpGzl+eHx//FHaXfu8Q4rjSTO2swSBI8jPtxk=;
	b=VfxobtwVnwOru2RO1Y8YNnOr6f8hw4hjKKJ1+13iUkhV+868Nq996b3jj94ALeCGL9
	WGhXCTZJ+yB4TjN+S1z2D8N4TK8zouXxTs+rCVaEBQWBMIANmg05wUWMSGBfEtGvGgTV
	zNmMLwdSt/gWEhLajfJpqpjnbiVwFAxe9YUX7ylJdCoyE6P6IC3awsuiFOpP8sChuH/B
	6ori/NC+iFSGGtaN9QozByhKGQuMWRFCab1CVYzmjxJqO4Cat0q444mic6vm3adVpRIM
	GiYrd02hWCDpXycc1Czsq3Jr7BrtAPge2asgXsQYrv2joo1JeKxTc0idnL/hCPOkHv8j
	g1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mmqs2dKpGzl+eHx//FHaXfu8Q4rjSTO2swSBI8jPtxk=;
	b=QsD/7+9aT/jYxt3DMQ+auAGcxfRJbqkkZu7uWhXiHokeekaajdL3Tu4NY/PNH4F/Or
	z0i659xPagU/CkkFCbCfkmtLhBTLP5he2ChPWSha0qFhf8mSG0b/QrD5iX7NnezpL3nM
	qV6o79oVxWMD8ALheE065Nl73CSuQf5IyE9QGJ1Bs7upYlIMMvqtfevcF6Jv9y81iIW0
	zbanu2+qWrrGekJMSXPJCgCqGchOSX2Ory0wm5ptM4pbK+x+Zagx3ZBmmpp+E2n/prqN
	xGRYL1PrbNa9ff19fokz9Max0L0h0geP92ufESXGKaKuT2zEJquB2FfaSex4vMxVGY2b
	iYTg==
X-Gm-Message-State: AKS2vOzYSxX01xA2q5laXfj5Q9+BD5QJAWNGEtNoLkG7DN7aC0NiGpE+
	pPKyUipXbemUnjshYGQr87GK3Or1Ox5n
X-Received: by 10.237.41.225 with SMTP id o88mr1398824qtd.27.1498558326323;
	Tue, 27 Jun 2017 03:12:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 27 Jun 2017 03:11:45 -0700 (PDT)
In-Reply-To: <1498534781-5318-1-git-send-email-junzhu@nxp.com>
References: <1498534781-5318-1-git-send-email-junzhu@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jun 2017 11:11:45 +0100
Message-ID: <CAJTo0LYKcb8e+45EBQpknnbuE3vrr7qasb=DE8QQJ20NXrvpfQ@mail.gmail.com>
To: Jun Zhu <junzhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][Patch] bluez: Correct the timer count for bcm43xx firmware download
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
X-List-Received-Date: Tue, 27 Jun 2017 10:12:05 -0000
Content-Type: multipart/alternative; boundary="94eb2c12542ab752d70552ee4c03"

--94eb2c12542ab752d70552ee4c03
Content-Type: text/plain; charset="UTF-8"

On 27 June 2017 at 04:39, Jun Zhu <junzhu@nxp.com> wrote:

> +From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
> +From: Andy Duan <fugang.duan@nxp.com>
> +Date: Wed, 23 Nov 2016 17:12:12 +0800
> +Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware
> download
> +
> +From the log in .bcm43xx_load_firmware():
> +        /* Wait 50ms to let the firmware placed in download mode */
> +        nanosleep(&tm_mode, NULL);
> +
> +But timespec tm_mode is real is 50us. Correct the delayed timer count.
> +
> +Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
>

This needs an upstream-status tag, is the patch a backport?  Has it been
submitted upstream?

Ross

--94eb2c12542ab752d70552ee4c03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 June 2017 at 04:39, Jun Zhu <span dir=3D"ltr">&lt;<a href=3D"mailto:j=
unzhu@nxp.com" target=3D"_blank">junzhu@nxp.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div id=3D":4eb" class=3D"a3s aXjCH m15ce7c960=
dce2f81">+From 3b341fb421ef61db7782bf1314ec69<wbr>3828467de9 Mon Sep 17 00:=
00:00 2001<br>
+From: Andy Duan &lt;<a href=3D"mailto:fugang.duan@nxp.com">fugang.duan@nxp=
.com</a>&gt;<br>
+Date: Wed, 23 Nov 2016 17:12:12 +0800<br>
+Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware down=
load<br>
+<br>
+From the log in .bcm43xx_load_firmware():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Wait 50ms to let the firmware placed in dow=
nload mode */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nanosleep(&amp;tm_mode, NULL);<br>
+<br>
+But timespec tm_mode is real is 50us. Correct the delayed timer count.<br>
+<br>
+Signed-off-by: Fugang Duan &lt;<a href=3D"mailto:fugang.duan@nxp.com">fuga=
ng.duan@nxp.com</a>&gt;</div></blockquote></div><br>This needs an upstream-=
status tag, is the patch a backport?=C2=A0 Has it been submitted upstream?<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--94eb2c12542ab752d70552ee4c03--
