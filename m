Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1173660124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 15:30:23 +0000 (UTC)
Received: by igvg19 with SMTP id g19so80942102igv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mIpfHkaQbpUJuQHmucsqecPV88NtYkt28TEMMUs7wlk=;
	b=fK4IYOlb+rWQU9z9qUJGUzx4X10UUaNmSrZOpPcIpn8XnKgYhVYgJXVrpLuYr5HRFf
	JmvU3UAQgZqiDvA0k3HTN+Gf4zpUz/H3K6oL6oOWo0wXlzZLyI8Tmgzr0n7us0fyrBvR
	tboDMQatwRqrJKZD7fsBRTwjx0xMD65rs8W08IxzfvIVjpOPGi9N2UJPa8PRks9FLdmd
	N0Rsflxg1zjfubcjBeQW3KA6R1LI7XOVwE+sAiAGxOBctD/X0Y7MQOg1K58i+E25zYUG
	jT5WNxQgiZDiuPQcOB9xyPGi0NdIMXbq7iBuLWTX0YQDUwN4Nc+ZHmkgHL301pfY14Ah
	9pmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mIpfHkaQbpUJuQHmucsqecPV88NtYkt28TEMMUs7wlk=;
	b=JTEX6GrsA3AS4EdGRSqdRs1lzJ8NQyW4a6qp7VsyAvsX26g/9pC013aOaFlHYgSxI3
	UedzTHChWD12FD/3bukBQDb+nXQAyIY8VKwWvrswp6vO8RDyzhultSzWqV41NrhlFfoQ
	tcuk497XiixKBzcE2gMbGQa7THlDx/K0+PQE/DmUC1megS+Kqihj0vtoeZd9tbeYD1qp
	P0KWC9yjw6jtwDkU2pC4HoGuRzwZnPq690bPxCFLpPtEB+irujOMRatCdW5E2cd/tYLm
	SvMZNzNGcT9Oh4xZo/0JdWZ29VLZr1e5cVZm/ZVd7S+1R8hTplnAqcwNGKXpZlDDaTIG
	YwRQ==
X-Received: by 10.50.13.72 with SMTP id f8mr17215137igc.38.1449502224412; Mon,
	07 Dec 2015 07:30:24 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Mon, 7 Dec 2015 07:30:04 -0800 (PST)
In-Reply-To: <1449484744-7362-1-git-send-email-fabrice.coulon@axis.com>
References: <1449484744-7362-1-git-send-email-fabrice.coulon@axis.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 7 Dec 2015 08:30:04 -0700
X-Google-Sender-Auth: GFLqtf6ba-nHzmtpeeLfyQWM6J4
Message-ID: <CABcZANmnKsvaQBykUSZP2_Qsy4oW7v5WwRzF_4vpUbMxkezKPQ@mail.gmail.com>
To: Fabrice Coulon <fabrice.coulon@axis.com>
Cc: Fabrice Coulon <fabrice@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd_base: Make perform_groupmems work with native
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
X-List-Received-Date: Mon, 07 Dec 2015 15:30:24 -0000
Content-Type: multipart/alternative; boundary=089e013c65de2ff9d9052650898d

--089e013c65de2ff9d9052650898d
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 3:39 AM, Fabrice Coulon <fabrice.coulon@axis.com>
wrote:

> I have a problem when using useradd_base.bbclass together with native.
> ${sysconfdir} is BUILDDIR/tmp/sysroots/x86_64-linux/etc for native,
> and ${sysconfdir} is "/etc" for target.
>
> rootdir is BUILDDIR/tmp/sysroots/x86_64-linux for native, so,
> $rootdir${sysconfdir} is not correct for native.
>
> The solution for me was to replace instances of $rootdir${sysconfdir}
> with $rootdir/etc under perform_groupmems.
>
> Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
>

Hardcoding a path is *not* an appropriate fix.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c65de2ff9d9052650898d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Dec 7, 2015 at 3:39 AM, Fabrice Coulon <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:fabrice.coulon@axis.com" target=3D"_blank">fabrice.coulon@axis.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2a9=
" class=3D"a3s" style=3D"overflow:hidden">I have a problem when using usera=
dd_base.<span class=3D"il">bbclass</span> together with native.<br>
${sysconfdir} is BUILDDIR/tmp/sysroots/x86_64-linux/etc for native,<br>
and ${sysconfdir} is &quot;/etc&quot; for target.<br>
<br>
rootdir is BUILDDIR/tmp/sysroots/x86_64-linux for native, so,<br>
$rootdir${sysconfdir} is not correct for native.<br>
<br>
The solution for me was to replace instances of $rootdir${sysconfdir}<br>
with $rootdir/etc under perform_groupmems.<br>
<br>
Signed-off-by: Fabrice Coulon &lt;<a href=3D"mailto:fabrice.coulon@axis.com=
">fabrice.coulon@axis.com</a>&gt;</div></blockquote></div><br>Hardcoding a =
path is *not* an appropriate fix.<br>-- <br><div class=3D"gmail_signature">=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics</div>
</div></div>

--089e013c65de2ff9d9052650898d--
