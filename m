Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 954227F7E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:18:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id i19so672467qki.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=mDPwepapWuCya1NxNSOhghnSTC8+qnXqNTxwH2XPzO0=;
	b=Jd8mB7xp5dZN3DehC087gaDTChZXM9pnKrCdaM0avU5ujpYt2AWk8wOImkA8jVUtoz
	SLHWZs/NTy2knQYVEVUDFUQlHBcCSutH04mruSHbKWYsMRQ9BzKSnwnMJjR5+gectYor
	uwreawkxoN3j+Nxso5QWIDVsxpQhA4elr7ik2RYQY11HYPdUIk4x4wF6iVozzJqZTNEq
	IEWkYxcn0Ra5diORiO7aNWu+1a0ng+78LyNHDVIQnL3+jd2nLeHbZC5Eei8fFyjxi+gH
	+3o+dAj6XGj0xLinzo71tRbQ8UajhKoMM+LgbRRBNf5Wvu7sTLA0HI+PRNwnMvBGMzbi
	tPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mDPwepapWuCya1NxNSOhghnSTC8+qnXqNTxwH2XPzO0=;
	b=R+BDWYBSXUpXQ8c6KIIhUhHYzHEhyeaNvo6J0DvEC5Jm3m7n7O5sppch0eHgcx2SXS
	rMf/R0L+Q3PirISQuYO7yfu9OsT2jLNzeJZAtKJ2gpYS3FH1eByGYQsS3NFt2onkHxjf
	XhH/CBpfOp9bdGrBDM3ItcKQEaRLciEFeKtNZvU2KvdDoOytVp4bCl3vHQRJkYLCRxcG
	jeyyWar9A1RFUYqhoyV2BSj0NZV0baVBHfJ4M3SSR8poKznV+oP2ysqZIfi9OylzJ3N0
	jc0PtxKSSHG3hGx+uBsUQX0zDTkYC0HxU3FsYaHd4urgeGRF1GKFZxYxDi1EJzBpQNC7
	g2fQ==
X-Gm-Message-State: APjAAAXdpOTFkOAHnpSTkQcP1rnKrunrKjiWg+YBqBRLgiAJiKy5c9Id
	DrE+fJLlL5Z5C8KeQUH40EIf3NoF3somN0dVw9Gcwckzrlw=
X-Google-Smtp-Source: APXvYqxJIJisOvOPDck0dP3uIotdtimAl0K0pkj4XxjyE/TlOnwGOVAZ5FYBQwpzhWlT55DlIG/gAmFZ0eDRKqbJVqM=
X-Received: by 2002:a05:620a:1375:: with SMTP id
	d21mr3815506qkl.285.1574273896773; 
	Wed, 20 Nov 2019 10:18:16 -0800 (PST)
MIME-Version: 1.0
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 20 Nov 2019 18:18:05 +0000
Message-ID: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 18:18:16 -0000
Content-Type: multipart/alternative; boundary="00000000000065c0320597cb3439"

--00000000000065c0320597cb3439
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm struggling with backporting OpenSSL to my Sumo build [1], so wondered
if anyone else had done something similar with success.

I copied "meta/recipes-connectivity/openssl" from Poky master branch [2]
into my own layer [3]. It didn't pick up, so I discovered I needed to add
a PREFERRED_VERSION, eg:

+PREFERRED_VERSION_openssl ?= "1.1.%"
+PREFERRED_VERSION_openssl-native ?= "1.1.%"
+PREFERRED_VERSION_nativesdk-openssl ?= "1.1.%"

Now it builds fine. However, I no longer have /usr/bin/openssl in my disk
image.

It doesn't appear in FILES_${PN}, and adding it to the recipes doesn't seem
to make any difference.

What am I missing?

Thanks,
Ryan.

[1] I'm looking for CVE fixes, 1.0.2p has a lot of CVEs.

[2] http://git.yoctoproject.org/git/poky
I'm at SHA a616ffebdc, so I copied openssl_1.1.1d.bb and all the other
files in the directory.

[3] I have a clone of Linaro's meta-backports. I'm trying to generate a
patch to submit for review there.
https://git.linaro.org/openembedded/meta-backports.git

--00000000000065c0320597cb3439
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m struggling with backpor=
ting OpenSSL to my Sumo build [1], so wondered if anyone else had done some=
thing similar with success.</div><div><br></div><div>I copied &quot;meta/re=
cipes-connectivity/openssl&quot; from Poky master branch [2] into my own la=
yer [3]. It didn&#39;t pick up, so I discovered I needed to add a=C2=A0PREF=
ERRED_VERSION, eg:</div><div><br></div><div>+PREFERRED_VERSION_openssl ?=3D=
 &quot;1.1.%&quot;<br>+PREFERRED_VERSION_openssl-native ?=3D &quot;1.1.%&qu=
ot;<br>+PREFERRED_VERSION_nativesdk-openssl ?=3D &quot;1.1.%&quot;<br></div=
><div><br></div><div>Now it builds fine. However, I no longer have /usr/bin=
/openssl in my disk image.</div><div><br></div><div>It doesn&#39;t appear i=
n FILES_${PN}, and adding it to the recipes doesn&#39;t seem to make any di=
fference.</div><div><br></div><div>What am I missing?</div><div><br></div><=
div>Thanks,</div><div>Ryan.</div><div><br></div><div>[1] I&#39;m looking fo=
r CVE fixes, 1.0.2p has a lot of CVEs.</div><div><br></div><div>[2]=C2=A0<a=
 href=3D"http://git.yoctoproject.org/git/poky">http://git.yoctoproject.org/=
git/poky</a></div><div>I&#39;m at SHA a616ffebdc, so I copied=C2=A0<a href=
=3D"http://openssl_1.1.1d.bb">openssl_1.1.1d.bb</a> and all the other files=
 in the directory.</div><div><br></div><div>[3] I have a clone of Linaro&#3=
9;s meta-backports. I&#39;m trying to generate a patch to submit for review=
 there.</div><div><a href=3D"https://git.linaro.org/openembedded/meta-backp=
orts.git">https://git.linaro.org/openembedded/meta-backports.git</a></div><=
/div>

--00000000000065c0320597cb3439--
