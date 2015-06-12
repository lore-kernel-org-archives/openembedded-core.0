Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3E25C73FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:06:24 +0000 (UTC)
Received: by qgfa66 with SMTP id a66so10323055qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ogK1yW0fOxnNE4juAaj9iFP7H1+z91hmx5w4WqJ2QTc=;
	b=Jak9/VuMKoMcCAm3LDUq4ibhuNxdf5hqNi81Ihv+dg/xAPmBoggRf8auTHHlLNFwc8
	R5ZGTrL07yiH7meMVjYLK3T1g8jeebxWQAAUG+EGK1FY/ZhbU/Z172flccuzxCs1Yyb8
	OC57jsdO3OQqtDOjT9zogoQF8PXYdtEPiL8gKi3uRbHiWTO8ouKAGRe4CmKT6U95L9rk
	oc7KCplereuCzcHnbeJ71BOknn8ENU4SyCI2AIFF4zxtzQQDJKjHWmvHT8aDWsRDt+pa
	WFFanK2NENcKOY8/dGBeKjRtDbfPioMgVt2W2TayKM37RklxTgyrKpLYVBa1s2NJZP09
	XYMA==
X-Gm-Message-State: ALoCoQnY5MtkmkXnzz8mM9QXsLs/rfMCNidySx7wy+/xpaRMhtXe1+ZaUM21mA+BDHRAKVGQBPlL
X-Received: by 10.140.43.100 with SMTP id d91mr17682676qga.77.1434107185829;
	Fri, 12 Jun 2015 04:06:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 12 Jun 2015 04:06:05 -0700 (PDT)
In-Reply-To: <2fbbbb9e2098904f488bc585288cb7ca1b88ff2e.1434079315.git.liezhi.yang@windriver.com>
References: <cover.1434079315.git.liezhi.yang@windriver.com>
	<2fbbbb9e2098904f488bc585288cb7ca1b88ff2e.1434079315.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 12:06:05 +0100
Message-ID: <CAJTo0LaAv9NoBrGgW=52aTg0dRUTAvAP4SNw+3B4jVu5a3GM6w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] insane.bbclass: check invalid ac_cv value
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
X-List-Received-Date: Fri, 12 Jun 2015 11:06:25 -0000
Content-Type: multipart/alternative; boundary=001a113a989c61b1fe05185019aa

--001a113a989c61b1fe05185019aa
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 04:23, Robert Yang <liezhi.yang@windriver.com> wrote:

> +        for var in tocheck.split():
> +            if var.startswith('ac_cv_'):
> +                varname = var.split('=')[0]
> +                cfgscript=d.expand("${S}/configure")
> +                if os.path.exists(cfgscript):
> +                    statement = "grep -q -F %s  %s > /dev/null" %
> (varname, cfgscript)
>

So your assumption that ac_cv_* variables are referenced in full in
configure is bad.  This is what strace has for the giant AC_CHECK_HEADERS
block:

for ac_header in asm/cachectl.h asm/sysmips.h bluetooth/bluetooth.h elf.h
inttypes.h ioctls.h linux/bsg.h linux/falloc.h linux/filter.h
linux/hiddev.h linux/mmtimer.h linux/perf_event.h linux/seccomp.h
linux/securebits.h linux/utsname.h mqueue.h netinet/sctp.h poll.h scsi/sg.h
stropts.h sys/conf.h sys/epoll.h sys/fanotify.h sys/filio.h sys/ioctl.h
sys/poll.h sys/reg.h sys/vfs.h sys/xattr.h
do :
  as_ac_Header=`$as_echo "ac_cv_header_$ac_header" | $as_tr_sh`
ac_fn_c_check_header_mongrel "$LINENO" "$ac_header" "$as_ac_Header"
"$ac_includes_default"

The variable name is constructed, so this test can't work.

Ross

--001a113a989c61b1fe05185019aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 04:23, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":2yy" class=3D"" style=
=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in tocheck.split(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if var.startswith(&#39;ac_cv_&#3=
9;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 varname =3D var.sp=
lit(&#39;=3D&#39;)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgscript=3Dd.expa=
nd(&quot;${S}/configure&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(=
cfgscript):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
ement =3D &quot;grep -q -F %s=C2=A0 %s &gt; /dev/null&quot; % (varname, cfg=
script)</div></blockquote></div><br>So your assumption that ac_cv_* variabl=
es are referenced in full in configure is bad.=C2=A0 This is what strace ha=
s for the giant AC_CHECK_HEADERS block:</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">for ac_header =
in asm/cachectl.h asm/sysmips.h bluetooth/bluetooth.h elf.h inttypes.h ioct=
ls.h linux/bsg.h linux/falloc.h linux/filter.h linux/hiddev.h linux/mmtimer=
.h linux/perf_event.h linux/seccomp.h linux/securebits.h linux/utsname.h mq=
ueue.h netinet/sctp.h poll.h scsi/sg.h stropts.h sys/conf.h sys/epoll.h sys=
/fanotify.h sys/filio.h sys/ioctl.h sys/poll.h sys/reg.h sys/vfs.h sys/xatt=
r.h</div><div class=3D"gmail_extra">do :</div><div class=3D"gmail_extra">=
=C2=A0 as_ac_Header=3D`$as_echo &quot;ac_cv_header_$ac_header&quot; | $as_t=
r_sh`</div><div class=3D"gmail_extra">ac_fn_c_check_header_mongrel &quot;$L=
INENO&quot; &quot;$ac_header&quot; &quot;$as_ac_Header&quot; &quot;$ac_incl=
udes_default&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">The variable name is constructed, so this test can&#39;t work.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div></div>

--001a113a989c61b1fe05185019aa--
