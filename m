Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id DA70975C8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 11:28:22 +0000 (UTC)
Received: by qgii30 with SMTP id i30so2193899qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FDrO3KfbKMrXlviscucX4ZsXw4Ph+cNQjYP/Pl4adCs=;
	b=YipHJLxlYXR/yhRjoOome6vICOZiBvM7kiuND0I8j2KydQIYV68Rvi5O+0+iU0x07u
	DEb/hxzVta8Jsu2XN6O0ZGQwLIeU7CFntARQ4FtNHU4Jvc0AE2CggA3fojyR1tL4IAwx
	yFv+JVTmO3f+gaMLLafQLDCmM89ZflMIHLRPqzimdLp7M/IluP0e1eHf6jAdt6OPRNOu
	dfqIge434ipRL5gSZQ2cNohFYqGSi9mSbCmY08J4+Z9aJajo0Kq7rbSVBBrgfHihEluW
	qVpNkI20UJBb9J654LUovKH3sQrAH7kMASkb9jhxsp6L/wCIVo8P/9YAy3g5Gi2E1RLE
	JRPw==
X-Gm-Message-State: ALoCoQm+SzI2/xmaeMpqchTjwAJBcJyeaXo5UtV9U3L0Oyar7MTYwzw1TTKt5r4k832RXeaHV2+R
X-Received: by 10.140.43.199 with SMTP id e65mr25054336qga.80.1435663703454;
	Tue, 30 Jun 2015 04:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 04:28:04 -0700 (PDT)
In-Reply-To: <f3ca504d666948a1f8fcdd990b2e829a576a36e0.1435562155.git.mariano.lopez@linux.intel.com>
References: <cover.1435562155.git.mariano.lopez@linux.intel.com>
	<f3ca504d666948a1f8fcdd990b2e829a576a36e0.1435562155.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 12:28:04 +0100
Message-ID: <CAJTo0Lagc1WxOA40u4j5Gfu7vLbG-onEpLZ7-u4RPnpv06dTrw@mail.gmail.com>
To: mariano.lopez@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: Check if /tmp is writable
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
X-List-Received-Date: Tue, 30 Jun 2015 11:28:23 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa0fc8cd0519ba8112

--001a113a9baa0fc8cd0519ba8112
Content-Type: text/plain; charset=UTF-8

On 29 June 2015 at 08:20, <mariano.lopez@linux.intel.com> wrote:

> +    # Check if /tmp is writable
> +    from string import ascii_letters
> +    from random import choice
> +    filename = "bb_writetest.%s" % os.getpid()
> +    testfile = os.path.join("/tmp", filename)
>

Use tempfile.mkstemp() here, we'll get proper unique names and it will use
the same temporary directory as gcc etc.


> +    try:
> +        f = open(testfile, "w")
> +        f.write("".join(choice(ascii_letters) for x in range(1024)))
> +        f.close()
> +        os.remove(testfile)
> +    except:
> +        status.addresult("Failed to write into /tmp. Please verify your
> filesystem.")
>

The error should include the message from the exception to help root-cause
the problem.

Ross

--001a113a9baa0fc8cd0519ba8112
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 08:20,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.=
lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1oj" class=
=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 # Check if /tmp is writab=
le<br>
+=C2=A0 =C2=A0 from string import ascii_letters<br>
+=C2=A0 =C2=A0 from random import choice<br>
+=C2=A0 =C2=A0 filename =3D &quot;bb_writetest.%s&quot; % os.getpid()<br>
+=C2=A0 =C2=A0 testfile =3D os.path.join(&quot;/tmp&quot;, filename)<br></d=
iv></blockquote><div><br></div><div>Use tempfile.mkstemp() here, we&#39;ll =
get proper unique names and it will use the same temporary directory as gcc=
 etc.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1oj" class=3D"a3s" style=3D"overflow:hidden">
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D open(testfile, &quot;w&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;&quot;.join(choice(ascii_letters=
) for x in range(1024)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(testfile)<br>
+=C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;Failed to write into /t=
mp. Please verify your filesystem.&quot;)</div></blockquote><div><br></div>=
<div>The error should include the message from the exception to help root-c=
ause the problem.</div><div><br></div><div>Ross</div></div></div></div>

--001a113a9baa0fc8cd0519ba8112--
