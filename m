Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5D45D6FF23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:46:59 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id u185so43858909iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AqfrPeGxGuhAAtzwiaQ/Z9ibSZOuckyBjI6IS2ddvak=;
	b=AQTvq4Abnc2ZxkWa7ld9FkUF2oQP+eUY+sIs0PrvV6GIcloXfoCH4Tjuex+tZAXUBt
	GqTcp0eKLxauJcFRvQrCPZm1vuQ0Kl7TD55a5PjUJJijed6gv15dDUkTeF3uU4apTYAu
	iwiGlY8wR/o8wgNAxjjEG626w6INZxJEy+uJ6RS3HGdkazj5MWM3w9sb6Oa9DHeLd+kX
	P8nuoH3ITNFlr4faJK4tqe1aof1JwYlDAMpaE/ZmiycjmHS+EazGNiQ39zlb3l5iqOYF
	g+MXqgAJfBTM/uZp8Mf41Y14NqPrW+Kw9Th91xjLxjv/NjIqaL0XxhshWS5/q8kQaeHn
	l/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AqfrPeGxGuhAAtzwiaQ/Z9ibSZOuckyBjI6IS2ddvak=;
	b=ausEC+TtkRmPSSwhtdJS81GFg147nZNjXlhKQYGef0P0X5ZVr6da6kTH+oPN8tRobH
	rHmSaGD7KZYtBjfkFXqQaQWFzcdTsNQwOqcdw0ZS/j+l0mOYfBpbDhB84oRcG8CbH8ae
	PIe2prx46eFVmCxR5XfjaQNPxy15vvL2hDs/i6+2YocJ1B2l/nBctPuOr42OQYJq3Fub
	VwpH/ue9xfVkt4bfL21tMg2j90PoXWTXAertyDPF4n2l4XuVF+l9tF6PBC0W6AkeVlKB
	h2sq3MD0qHsyPAvq/1EeUGtMNCgX8x63TBuWhH1KQl9dK3V8ME9jg2dIpzn4Kiw2IEYC
	5v+Q==
X-Gm-Message-State: AD7BkJK7Nlqpi+F8Yd2QGwGbmzCMOD1s6zjrNCRdsO9IBkCIzfZsjwzUAi6KA5foA84Fxc5aGovFRqKBfysIG8VM
X-Received: by 10.107.16.104 with SMTP id y101mr21913961ioi.148.1460386020122; 
	Mon, 11 Apr 2016 07:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 11 Apr 2016 07:46:40 -0700 (PDT)
In-Reply-To: <a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
	<a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Apr 2016 15:46:40 +0100
Message-ID: <CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Mon, 11 Apr 2016 14:47:00 -0000
Content-Type: multipart/alternative; boundary=001a113ff020f6f6220530369dbf

--001a113ff020f6f6220530369dbf
Content-Type: text/plain; charset=UTF-8

On 8 April 2016 at 04:13, Robert Yang <liezhi.yang@windriver.com> wrote:

> +do_compile_prepend() {
> +    # Update timestamp to fix rebuild
> +    src_files="pbzip2.cpp BZ2StreamScanner.cpp ErrorContext.cpp"
> +    for f in $src_files; do
> +        if [ -f $f ]; then
> +            touch $f
> +        else
> +            bbwarn "Regular file $f not found"
> +        fi
> +    done
>

Wouldn't "oe_runmake clean" be simpler?

Ross

--001a113ff020f6f6220530369dbf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 April 2016 at 04:13, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":sln" cla=
ss=3D"a3s" style=3D"overflow:hidden">+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 # Update timestamp to fix rebuild<br>
+=C2=A0 =C2=A0 src_files=3D&quot;pbzip2.cpp BZ2StreamScanner.cpp ErrorConte=
xt.cpp&quot;<br>
+=C2=A0 =C2=A0 for f in $src_files; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f $f ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Regular file $f not=
 found&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 done</div></blockquote></div><br>Wouldn&#39;t &quot;oe_runma=
ke clean&quot; be simpler?</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a113ff020f6f6220530369dbf--
