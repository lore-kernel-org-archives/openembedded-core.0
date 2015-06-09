Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8834673E65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:02:33 +0000 (UTC)
Received: by qczw4 with SMTP id w4so9486574qcz.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bqk05rtNfzq8Tzg/ih9EYWdS03BaUUDGPSwvSYFWGXY=;
	b=jFcexYgns8GTQhTtduJC9tWEUt6BVxR1/bqvpzI9PRFZ7MihwfR2S982zYRHYi4osI
	aEMOJFf6VZWWTfnLL7ksVytnVdL0WP14oyBifz4Hih8/aexiNXZ4K9+O/wgrQU1t024r
	f8kmUAHd0FSEzpQTppE3RJbXn9AmLHEF3fEvXlhXGQi48hfTQQLiJi29b+HOsLu2sdir
	W+TgCOYW5nF6XP/kXobMRAff7PQ/rpnDyEeipQJQla/Q9BOKbjUS1OT+cUWxDrUG8yjI
	G91LyDLEM6lLEjofO4s0XWaCFBsdX9EWIwQ8ng77xu3ozGfkRmj88ZwpTqzecVhWxrjE
	UQLA==
X-Gm-Message-State: ALoCoQlY8O557K+4WqVN4acl01pq3xjxe6WZPArm23HEghqkTdkjRFaTBmrEOL11FGPCrx18Slxd
X-Received: by 10.229.96.138 with SMTP id h10mr29145410qcn.5.1433876554380;
	Tue, 09 Jun 2015 12:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 12:02:14 -0700 (PDT)
In-Reply-To: <f1d8a6d07dbe8a5093fb327bccd2b4744b570b1f.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
	<f1d8a6d07dbe8a5093fb327bccd2b4744b570b1f.1433446500.git.akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 20:02:14 +0100
Message-ID: <CAJTo0LYABsnZBRP64=vx0a9prDvUuBmpg_6BYn1FcTGf_rokyw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] neon: build fix
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
X-List-Received-Date: Tue, 09 Jun 2015 19:02:38 -0000
Content-Type: multipart/alternative; boundary=001a1133dd74ad0cef05181a6667

--001a1133dd74ad0cef05181a6667
Content-Type: text/plain; charset=UTF-8

On 4 June 2015 at 20:37, Armin Kuster <akuster808@gmail.com> wrote:

> fixup to allow building with api changes in gnutls.
>

My world builds shows that libmusicbrainz was failing due to neon not
linking, and to demonstrate this I added this to neon.bb:

do_compile_append() {
oe_runmake -C test
}

Et voila:

| ../x86_64-poky-linux-libtool --silent --mode=link x86_64-poky-linux-gcc
 -m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2
--sysroot=/data/poky-master/tmp/sysroots/intel-corei7-64 -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -no-install -o lock lock.lo libtest.la
|
/data/poky-master/tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/build/src/.libs/libneon.so:
undefined reference to `gnutls_certificate_client_set_retrieve_function'
|
/data/poky-master/tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/build/src/.libs/libneon.so:
undefined reference to `gnutls_certificate_client_set_retrieve_function'

Neon still doesn't build with the new gnutls.

Ross

--001a1133dd74ad0cef05181a6667
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 June 2015 at 20:37, Armin Kuster <span dir=3D"ltr">&l=
t;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex">fixup to allow building with api changes in gnut=
ls.<br></blockquote><div><br></div><div>My world builds shows that libmusic=
brainz was failing due to neon not linking, and to demonstrate this I added=
 this to <a href=3D"http://neon.bb">neon.bb</a>:</div><div><br></div><div>d=
o_compile_append() {</div><div><span class=3D"" style=3D"white-space:pre">	=
</span>oe_runmake -C test</div><div>}</div><div><br></div><div>Et voila:</d=
iv><div><br></div><div>| ../x86_64-poky-linux-libtool --silent --mode=3Dlin=
k x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=
=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp/sysroots/intel-corei7-64 =
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -no-install -o lock lock.lo =
<a href=3D"http://libtest.la">libtest.la</a></div><div>| /data/poky-master/=
tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/build/src/.libs/libneon.so: un=
defined reference to `gnutls_certificate_client_set_retrieve_function&#39;<=
/div><div>| /data/poky-master/tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/=
build/src/.libs/libneon.so: undefined reference to `gnutls_certificate_clie=
nt_set_retrieve_function&#39;</div><div><br></div><div>Neon still doesn&#39=
;t build with the new gnutls.</div><div><br></div><div>Ross=C2=A0</div></di=
v></div></div>

--001a1133dd74ad0cef05181a6667--
