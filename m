Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 12665771A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 15:58:51 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id f6so12795531ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QJy7kzzevZkCjqmjxHn2MsXp616Aw+v3GNWtZkAoLrA=;
	b=yo6bwNVj2H/mjf3xK/CEr9PgdEUXoKOG6uzSKGHB3U3vXrpjgAhCz9gnzX33EA8lzK
	4VHrHjeX0LN0FZk+cMUdRLCNykyiTsUkBxXaebF6YhjZnuOjqr2MXkQk8Eq+U5h16Tzt
	DYzdC/gPcm3D0PX1BR1LmsEbjoPD5xP90cTSx817AJZgxkIvmo7Za8FL1NYmgWbPuc81
	roz9OZE+2zscfnxNRGmCtskZ7VEpdOyMPJupUtLstXqcIoBbz5SBQHy6XNDgZ0IWC3to
	o3efJ5SymgrmUquHEdBlsq3gudhi/yzbMnD1IucICVhi5rEtBdBcFb/mvJuQU0GV+V6B
	Uuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QJy7kzzevZkCjqmjxHn2MsXp616Aw+v3GNWtZkAoLrA=;
	b=bhUdJX1KYUpsNJ/j3oEkhXoGyofNcB07WLqXHwg/n7X9KUOnk3tZFPu+QvHD+NmyJw
	3ydU/kgYRNG/1uaDHWf/e/5sUGqozuY8aNkc8H6GKDC3NhK+ZflYu8yPB4fUnEzcwbFJ
	YMDAuGg3leTeQxbZoNFvCSv+TEvJXPO5rokn3/V6NRk9hpht8bm+A+SCTeT11tZXCwyn
	PN6caDG7hT9OwHMxdABu6Utx17mtjNJz+UkA7vDMdwR/Z+Ycg0ZIWAaCIVY/hVJtBvHk
	ja9b6e3+dgo+XRKpp916rTE2+o2F917ItbycjZap8/IuI1hxyqiscUKOySpvDbWMRFSy
	en8Q==
X-Gm-Message-State: AEkoous31/+4xSj9RwprdqGQQgZ1WfOh8iA6xTH/+SV0H52eXE3SzSwXbp7ctNoWZeQ+4HZSOdyXG1w/iM781oqk
X-Received: by 10.36.121.204 with SMTP id z195mr19176642itc.22.1470671932320; 
	Mon, 08 Aug 2016 08:58:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 08:58:31 -0700 (PDT)
In-Reply-To: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 16:58:31 +0100
Message-ID: <CAJTo0LZ5FtoL7__MRMTeSJ59E3_AD=9U5C99W8uV1bppDambWg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Mon, 08 Aug 2016 15:58:53 -0000
Content-Type: multipart/alternative; boundary=001a114aa4661b815c0539917ef0

--001a114aa4661b815c0539917ef0
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 15:07, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> -SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
>

Did you test this?

For intel-corei7-64 with hardening enabled it fails like this:

|
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:86: undefined reference
to `__init_array_start'
|
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/6.1.1/ld:
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS):
relocation R_X86_64_PC32 against undefined hidden symbol
`__init_array_start' can not be used when making a shared object
|
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/6.1.1/ld:
final link failed: Bad value
| collect2: error: ld returned 1 exit status
| Makefile:678: recipe for target 'mesa_dri_drivers.la' failed

Ross

--001a114aa4661b815c0539917ef0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 15:07, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D=
":1d2" class=3D"">-SECURITY_CFLAGS_pn-mesa-gl =3D &quot;${SECURITY_NO_PIE_C=
FLAGS}&quot;<br></div></blockquote></div><br>Did you test this?</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For intel-corei7-=
64 with hardening enabled it fails like this:</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| /data/=
poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf=
-init.oS): In function `__libc_csu_init&#39;:</div><div class=3D"gmail_extr=
a">| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:86: undefined referenc=
e to `__init_array_start&#39;</div><div class=3D"gmail_extra">| /data/poky-=
master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x8=
6_64-poky-linux/6.1.1/ld: /data/poky-master/tmp-glibc/sysroots/intel-corei7=
-64/usr/lib/libc_nonshared.a(elf-init.oS): relocation R_X86_64_PC32 against=
 undefined hidden symbol `__init_array_start&#39; can not be used when maki=
ng a shared object</div><div class=3D"gmail_extra">| /data/poky-master/tmp-=
glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-l=
inux/6.1.1/ld: final link failed: Bad value</div><div class=3D"gmail_extra"=
>| collect2: error: ld returned 1 exit status</div><div class=3D"gmail_extr=
a">| Makefile:678: recipe for target &#39;<a href=3D"http://mesa_dri_driver=
s.la">mesa_dri_drivers.la</a>&#39; failed</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a114aa4661b815c0539917ef0--
