Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9A062771BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:29:41 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id g6so115249413igt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bFqmkADPKcabSKEPZNEn1VrZvhUjPJsuSM6nzMU6Si8=;
	b=b0yiFtawJVejD9SVZ7/gsb2bOtDDoEpQNcFJvXvQ8eJJ8qosMolq6JQJSQRqFSGr9O
	zkSok1Kx9wn2FFvqT+dh37/QNG2YSYHsFlKRQTJVLzsfCdXc0u535M1IZoMzZ71G9SWa
	FwbaUbVqu4qEoxCE3H5Vx/qCnh17IuAx9Z9OPvuxmICcsGr6uHZJYuZnoFY96cXrZIec
	kXzCxJU9hSL/Hrzn4P+9XjXIcpRzYGso7Ek1viQflohlljvcEQcWS1VHu4SfLVbkoG1W
	7u3jK8gmCHKvcHL1uJMzDUIgHPz8Jf7OnVyIVmy4xDAcoyOQ0X35YDmGa2xFcJ6rEqjI
	aJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bFqmkADPKcabSKEPZNEn1VrZvhUjPJsuSM6nzMU6Si8=;
	b=WkpTzoyJ8k7k5cn8HLh/okZa+1+UQc8Z+HC7sqBmPVS3Rzs51hJ0J9w4U51BfMRWwJ
	hh26PL6HRfjr1bjhzeBcJ91WWRoSNgvG2wvWMKSmH3a2fgIEpOUkxjfuW0+1TYHzeR2Z
	L65VQ0OnlUfsCSQnbyB2Yw9rUbwIgonI5TWvHdApdaFGz/g34p6JrWyytvNsUXqsEtn8
	3D9rJfVuz8ZJShAyl8Rlm01p3j43N/Jp7BjrIZ7hSin22SH06QUOvpDY94APTRdYm0+/
	73hxJmboPImeQTV+/4my8rrXFrvz/aPDF/UCj2fvbi++ZasJx6erSy63nQVR+De8WEmG
	mQMQ==
X-Gm-Message-State: AG10YOQ48jJioayg2TcLSXl7EBHcwp0pwq3eESEhTSVm+oLewE3dmrWr7sPkNhpcJMDs9jIGupX3KBAO9hmKkQ7m
X-Received: by 10.50.160.7 with SMTP id xg7mr16814692igb.64.1456244981677;
	Tue, 23 Feb 2016 08:29:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 08:29:22 -0800 (PST)
In-Reply-To: <72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 16:29:22 +0000
Message-ID: <CAJTo0LZStmCCA_ibNnxWO66CR+G3k51+bYVX2PrujJ2XD6mk2w@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 16:29:44 -0000
Content-Type: multipart/alternative; boundary=001a11339de8d6dc21052c72749c

--001a11339de8d6dc21052c72749c
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 02:45, <kai.kang@windriver.com> wrote:

> When perform useradd during populate sysroot, it locks files passwd.lock
> and group.lock at same time. And then it meets a dead lock issue
> randomly.
>
> Use flock to reslove it by using an universal lock file for all the
> user and group related operations.
>

I got an error when openssh's do_install was running useradds to the
sysroot:

| DEBUG: Executing shell function useradd_sysroot
| Running useradd commands...
|
/data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/run.useradd_sysroot.13825:
264: local: /data/poky-master/tmp-glibc/sysroots/intel-core2-32: bad
variable name
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: useradd_sysroot (log file is located at
/data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/log.do_install.13825)
ERROR: Task 2939 (/home/ross/Yocto/poky/meta/recipes-connectivity/openssh/
openssh_7.1p2.bb, do_install) failed with exit code '1'

    262 perform_useradd() {
    263         local rootdir="$1"
    264         local opts=`echo $2 | sed s/\'/\"/g`
    265         bbnote "openssh: Performing useradd with [$opts]"

Ross

--001a11339de8d6dc21052c72749c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 02:45,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":2zg" class=3D"" style=3D"overflow:h=
idden">When perform useradd during populate sysroot, it locks files passwd.=
lock<br>
and group.lock at same time. And then it meets a dead lock issue<br>
randomly.<br>
<br>
Use flock to reslove it by using an universal lock file for all the<br>
user and group related operations.</div></blockquote></div><div class=3D"gm=
ail_extra"><br></div>I got an error when openssh&#39;s do_install was runni=
ng useradds to the sysroot:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><div class=3D"gmail_extra">| DEBUG: Executing shell f=
unction useradd_sysroot</div><div class=3D"gmail_extra">| Running useradd c=
ommands...</div><div class=3D"gmail_extra">| /data/poky-master/tmp-glibc/wo=
rk/core2-32-poky-linux/openssh/7.1p2-r0/temp/run.useradd_sysroot.13825: 264=
: local: /data/poky-master/tmp-glibc/sysroots/intel-core2-32: bad variable =
name</div><div class=3D"gmail_extra">| WARNING: exit code 2 from a shell co=
mmand.</div><div class=3D"gmail_extra">| ERROR: Function failed: useradd_sy=
sroot (log file is located at /data/poky-master/tmp-glibc/work/core2-32-pok=
y-linux/openssh/7.1p2-r0/temp/log.do_install.13825)</div><div class=3D"gmai=
l_extra">ERROR: Task 2939 (/home/ross/Yocto/poky/meta/recipes-connectivity/=
openssh/<a href=3D"http://openssh_7.1p2.bb">openssh_7.1p2.bb</a>, do_instal=
l) failed with exit code &#39;1&#39;</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 262=
 perform_useradd() {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 263 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 local rootdir=3D&quot;$1&quot;</div><div class=3D"=
gmail_extra">=C2=A0 =C2=A0 264 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local opts=3D`ec=
ho $2 | sed s/\&#39;/\&quot;/g`</div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 265 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;openssh: Performing userad=
d with [$opts]&quot;</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div></div>

--001a11339de8d6dc21052c72749c--
