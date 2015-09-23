Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 959C27404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:15:58 +0000 (UTC)
Received: by qgez77 with SMTP id z77so17325912qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 05:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DSDENFOKyfIS4SDMmHZeQ2HHcKLgNHDw+tFx0UBboO0=;
	b=QfAAgETF9daYQuJHdKXot1R2POTkslzsJ7Zzxz2MKKatYyBh055Lh5LSbtwy6Z0TPH
	xBIVywwerIQCg12i36IH/3IBzHaxjUH+Vcdy7fwfAy87FeeNL4BG5bv7usDPWmaBtIPl
	qAxeYiYJSoqEulTonh9FdItccGX71R1JgewKo3YBFocTp2Gu7Jy2SjOtFYx+x5xv+lkJ
	z82KFx/ZTTcS9fY/3EEHp3prIS8yIjhxzmWcIvYKvweITFm09SO7J0sNUywtIxiEy5RO
	+ENHfqVOyoZDyD5hQdVD2QTLZcjcWP88kfkuRABMWS3aGDEgMPq89qk2A7EsaBMWm63+
	jiwQ==
X-Gm-Message-State: ALoCoQkwZQuhS4okxPIEXJ+yT+sXyyRjbywdVL6S1kriPybgyjF66nG1y/OD/g+rZeplZ3Y4SCtG
X-Received: by 10.140.232.150 with SMTP id d144mr37807350qhc.17.1443010558699; 
	Wed, 23 Sep 2015 05:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 23 Sep 2015 05:15:39 -0700 (PDT)
In-Reply-To: <560173B5.1000408@mlbassoc.com>
References: <560173B5.1000408@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Sep 2015 13:15:39 +0100
Message-ID: <CAJTo0Lam+s3YjVaxXZQZBbYY9y+_oMtJ46_dWMHcDRmMAqdu=w@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Wed, 23 Sep 2015 12:15:59 -0000
Content-Type: multipart/alternative; boundary=001a11354852c25d3605206913e6

--001a11354852c25d3605206913e6
Content-Type: text/plain; charset=UTF-8

On 22 September 2015 at 16:28, Gary Thomas <gary@mlbassoc.com> wrote:

> | g_module_open() failed for
> /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-svg.so:
> libharfbuzz.so.0: cannot open shared object file: No such file or directory
>

Here's my guess at what happened.  Starting state was a complete sysroot
with at least gdk-pixbuf, harfbuzz, librsvg installed.  Yhen you did a new
build.  At least harfbuzz and gdk-pixbuf were being rebuilt, so purged from
the sysroot.  gdk-pixbuf rebuilt, installed into sysroot, ran the
update-cache script which then found the rsvg loader from the previous
sysroot that was not (yet?) removed that links to harfbuzz.  Harfbuzz still
isn't reinstall yet, linkage fails.

Is this with master or a release? There are changes in master compared to
fido to improve situations like this.

Ross

--001a11354852c25d3605206913e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2015 at 16:28, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D=
"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":397" class=3D"a3s" =
style=3D"overflow:hidden">| g_module_open() failed for /home/local/rpi2_201=
5-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpi=
xbufloader-svg.so: libharfbuzz.so.0: cannot open shared object file: No suc=
h file or directory</div></blockquote><div><br></div><div>Here&#39;s my gue=
ss at what happened.=C2=A0 Starting state was a complete sysroot with at le=
ast gdk-pixbuf, harfbuzz, librsvg installed.=C2=A0 Yhen you did a new build=
.=C2=A0 At least harfbuzz and gdk-pixbuf were being rebuilt, so purged from=
 the sysroot. =C2=A0gdk-pixbuf rebuilt, installed into sysroot, ran the upd=
ate-cache script which then found the rsvg loader from the previous sysroot=
 that was not (yet?) removed that links to harfbuzz.=C2=A0 Harfbuzz still i=
sn&#39;t reinstall yet, linkage fails.</div><div><br></div><div>Is this wit=
h master or a release? There are changes in master compared to fido to impr=
ove situations like this.</div><div><br></div><div>Ross</div></div></div></=
div>

--001a11354852c25d3605206913e6--
