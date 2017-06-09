Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E6F7F78195
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 16:15:26 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w1so81048020qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7JN26NJ1IpvLZPadIXztsNDBkPJmZVvFM8XkGu+m8m4=;
	b=Ok/wUIlcySDYBBUzie+kdXA7nktAKrMz5jNexcuGt1nfrU1qSQFElZlvSDJTXd0PGL
	iJTbPzF1XZsJMc9ohnS4qxaBB3iMXtVxIMmLsVvpDoZj8ZimnJCgRKIgJoPU3k56EpC6
	LfbiCkKya5QFWNsmfRIkX/nOGkEWxtYCg0tc+TLHoMJiKsFz7deJeN8vncfsjS1clBEL
	SlCRZMap31HAaRMM5PvitPrBbcX3tf+OS970hphKxjksEicwDEEz3+cJmZQFKrBFzeQ+
	ihpu2chkgpCHz8maoWrSfQaOSfjvaYpO6xeyKGDMxOTXPVWJN87OT0cIMlDj2KqLefAq
	c2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7JN26NJ1IpvLZPadIXztsNDBkPJmZVvFM8XkGu+m8m4=;
	b=YSNuah5wYfNHHDlLIJ9pBd+R9/DUgqlXcL/IOFZ1gPpY+kaLGBU25dxMdExyV4EF4/
	NGsGu23ExnB2JhtpUBNP8g0ofRxO4/vkd5u+jHfuq+OBlMWOzqWTA7YqzBqc9UQyTxr6
	LIhYo9WLc2DInygFQmDoUCSYE8ChpDTt2PDJKNKXOzthSU+JSAYincASg+7nRAlTf36/
	xO5PFTp8EYWKsG1VQTbFEIEa8dsJbW6j9m8udyuhwxBxmOwrSVvqe0EjBDkzUaLHdMaa
	kkXVuDjuOJr0G731z7H/qd5C7ywEMtOJfq0HjRgoQSEEaKo2mQ//QDWvXHX95xYeFx1c
	jVIg==
X-Gm-Message-State: AODbwcB7NCQZ8+OyiQ0xAdSYAvzjOJ7Lunl2sv2gTwj3JJdi+bxI/G4n
	iYtPUHe3Bt5Kk51nfAoepGSyBX7DFiyhKdQ=
X-Received: by 10.237.49.8 with SMTP id 8mr42423707qtg.161.1497024927651; Fri,
	09 Jun 2017 09:15:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 09:15:07 -0700 (PDT)
In-Reply-To: <1496966441-30260-2-git-send-email-trini@konsulko.com>
References: <1496966441-30260-1-git-send-email-trini@konsulko.com>
	<1496966441-30260-2-git-send-email-trini@konsulko.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 17:15:07 +0100
Message-ID: <CAJTo0LbUHNxxQMPz=RH+xxMk2=sN4tcg6MXtNHkz7-R_bY4g1A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] dpkg: Fix perl modules by moving them to the versioned perl directory
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
X-List-Received-Date: Fri, 09 Jun 2017 16:15:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c9b1c086ac805518947f7"

--94eb2c0c9b1c086ac805518947f7
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 01:00, Tom Rini <trini@konsulko.com> wrote:

> In order for the dpkg perl modules to be used the must reside in the
> versioned perl library directory (as to be in the default include path).
> Be explicit about this location in our FILES_${PN}-perl directive, so
> that if this breaks in the future, the recipe will fail).  We can now
> drop the custom do_configure as it wasn't fixing this problem.
>

  * FILES: removed "/usr/lib/perl", added "/usr/lib/perl/None"

Obviously something didn't work right!

Ross

--94eb2c0c9b1c086ac805518947f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 01:00, Tom Rini <span dir=3D"ltr">&lt;<a href=3D"mailto:t=
rini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div id=3D"gmail-:36a" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15c8a27e07392b50">In order for the <span class=3D"gmail-il">dpkg</=
span> perl modules to be used the must reside in the<br>
versioned perl library directory (as to be in the default include path).<br=
>
Be explicit about this location in our FILES_${PN}-perl directive, so<br>
that if this breaks in the future, the recipe will fail).=C2=A0 We can now<=
br>
drop the custom do_configure as it wasn&#39;t fixing this problem.<br></div=
></blockquote></div><br>=C2=A0 * FILES: removed &quot;/usr/lib/perl&quot;, =
added &quot;/usr/lib/perl/None&quot;<br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Obviously something didn&#39;t work righ=
t!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--94eb2c0c9b1c086ac805518947f7--
