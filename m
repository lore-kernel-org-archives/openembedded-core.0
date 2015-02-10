Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1381D732C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:49:10 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id v10so3479365qac.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 08:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kvTQ20TSu3fNElpuCrCKhj5BRYeqk6a264w3+4YjBiw=;
	b=S8BpbyW/P+KVv/B/kylaiy8hEM45Iv5rZYQpGbmr7pWis9SGs/Qgq/XEIRdndcQwSd
	pvE9Qo/FnR3VKzxMC+T8YJ1MJZKgs0BC3V+nNjxxZIWBKXavYZuRye8MM+nCVnSOT2fk
	rgm8uKuQJ2Z0Aqr1TYqXrd2u8u6aiAE5Ch1g9NYhnWjmYt/WqgL47IJxAZzLMKFDcigt
	hSQeso5RssJCkCEml0+1fR2N3dQ0eDRbXHBDYTt1OKAnqUmZB7ZCwF15E3zA2qixD7Y5
	uiHvxy/3kot9EInpPTAa0gi7knNvzjO7vO4JZSMpZvBXHubqswdLaQs0/DqBP4n054Ct
	e4Uw==
X-Gm-Message-State: ALoCoQlqryY1CqLivGzXKTuSbvSkfAnm8VNULM/dCw6Af5VtbiX+ocDiMoBbG5cpvzMwDCnDJIzv
X-Received: by 10.229.216.130 with SMTP id hi2mr9165828qcb.4.1423586952002;
	Tue, 10 Feb 2015 08:49:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 08:48:51 -0800 (PST)
In-Reply-To: <CAJTo0LbFdzSv3V7vwPj0hQrE70JRu=GGh=6qzJgxrXOwobKHeg@mail.gmail.com>
References: <1423584126-27786-1-git-send-email-denis@denix.org>
	<CAJTo0LZHiTSkhv9YPobmssY_szH4jyzBeUXVyZnnTGYo5oAf4Q@mail.gmail.com>
	<CAP9ODKogEuxRj0QoO-t5S3svVq9gYUjceBg5LfBrXS8k54US_w@mail.gmail.com>
	<20150210162902.GC14949@denix.org>
	<CAJTo0LbFdzSv3V7vwPj0hQrE70JRu=GGh=6qzJgxrXOwobKHeg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 16:48:51 +0000
Message-ID: <CAJTo0LY-Jg4kTPiGZfhHFECy2KFWQ7+5dq8jAMcn+NHZBC=R5Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Tue, 10 Feb 2015 16:49:21 -0000
Content-Type: multipart/alternative; boundary=001a1134c34294d3e5050ebeaa6d

--001a1134c34294d3e5050ebeaa6d
Content-Type: text/plain; charset=UTF-8

On 10 February 2015 at 16:38, Burton, Ross <ross.burton@intel.com> wrote:

> ? Are you saying it's meta-fsl-ppc specific issue?
>
>
> I just replicated with qemuarm and interestingly with zero tasks happening
> at the same time.  I'm wondering if there's a file being written with an
> old sysroot in that isn't being deleted. I'll dig quickly now.


Passing V=1 to EXTRA_OEMAKE (should do this by default as quite logs are
useless for debugging) shows:

|   gcc  -Wp,-MD,tools/.mkimage.o.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer   -DCONFIG_FIT_SIGNATURE -include
./include/libfdt_env.h -idirafterinclude -idirafter./arch/sandbox/include
-I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC
-D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -c -o tools/mkimage.o tools/mkimage.c
| In file included from tools/ublimage.c:17:0:
| include/image.h:877:27: fatal error: openssl/evp.h: No such file or
directory

It's using the host's GCC but there is no pointer to the native sysroot...
Presumably the trigger here is that I don't have openssl-dev installed on
the build host.

Ross

--001a1134c34294d3e5050ebeaa6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2015 at 16:38, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D""><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex">? Are you saying it&#39;s meta-fsl-ppc specific iss=
ue?</blockquote></div><br></span>I just replicated with qemuarm and interes=
tingly with zero tasks happening at the same time.=C2=A0 I&#39;m wondering =
if there&#39;s a file being written with an old sysroot in that isn&#39;t b=
eing deleted. I&#39;ll dig quickly now.</blockquote></div><div class=3D"gma=
il_extra"><br></div>Passing V=3D1 to EXTRA_OEMAKE (should do this by defaul=
t as quite logs are useless for debugging) shows:</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_extra">| =C2=A0 gcc =C2=A0-Wp,-MD,tools/.mki=
mage.o.d -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer =C2=A0 -DCONFIG=
_FIT_SIGNATURE -include ./include/libfdt_env.h -idirafterinclude -idirafter=
./arch/sandbox/include -I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=3D0 =
-DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE =C2=A0-c -o tools/mkimag=
e.o tools/mkimage.c</div><div class=3D"gmail_extra">| In file included from=
 tools/ublimage.c:17:0:</div><div class=3D"gmail_extra">| include/image.h:8=
77:27: fatal error: openssl/evp.h: No such file or directory</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">It&#39;s using the h=
ost&#39;s GCC but there is no pointer to the native sysroot...=C2=A0 Presum=
ably the trigger here is that I don&#39;t have openssl-dev installed on the=
 build host.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div></div>

--001a1134c34294d3e5050ebeaa6d--
