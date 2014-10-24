Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id A2F3365D40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 11:44:18 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id i50so804864qgf.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 04:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K+ZIpW/7YHCnM+/HsWChW9Bxun5L+qP09Hp9rW0tZnw=;
	b=A/nCMU8gObgKugSPSXWthPKuK5TS7+sB6UtdLPMKfFa/2pTTM82vuInC9luoMeHVtY
	eBljneT6GE9ndOp6yngx11+8TP1RFKHFeckuHPXwEOUchdjpIED84z/3WmM1CrUp92YT
	vAmuXRcuObzE18NhpmSeTLyQNBSma18PoYYszskn+Jp61ppjF36i7D1ndCzcjmpLbYHb
	ujb9tONtjo/hyQaJYXKSEiDjlP6+0I7HUN9YtEo6Krx0JZkM/+kX2cF1n3cM1iuLHHxJ
	CdbvKgKlV1YywzsO+PEY5Y3gpvMwp+rDhk8XA6fSfKqkD0IslFIe14t40dOOyDowhUt5
	QFzA==
X-Gm-Message-State: ALoCoQm17FgdUcBPgM/93RO40/Ku+GQUqfa7lxJHP7vzPmvXKkn7UCWQKlceJH5gEvhX2aqxuyTV
X-Received: by 10.170.150.197 with SMTP id r188mr6025166ykc.1.1414151059049;
	Fri, 24 Oct 2014 04:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Fri, 24 Oct 2014 04:43:58 -0700 (PDT)
In-Reply-To: <1414130736-1700-2-git-send-email-shan.hai@windriver.com>
References: <1414130736-1700-1-git-send-email-shan.hai@windriver.com>
	<1414130736-1700-2-git-send-email-shan.hai@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Oct 2014 12:43:58 +0100
Message-ID: <CAJTo0Lb=awdqetYPk+6uGjKusnA=JY_CR5G9iJSsD4SES+ipuA@mail.gmail.com>
To: Shan Hai <shan.hai@windriver.com>
Cc: par.olsson@windriver.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ldconfig-native: fix a endian-ness bug
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
X-List-Received-Date: Fri, 24 Oct 2014 11:44:24 -0000
Content-Type: multipart/alternative; boundary=001a1139bd3e88efaa050629b37a

--001a1139bd3e88efaa050629b37a
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 07:05, Shan Hai <shan.hai@windriver.com> wrote:

> Some header fields of ELF were read with wrong size on 64bit
> big-endian machine, fix it by reading the fields with read64
> instead of read32.
>

For fixes like this which set of all sorts of alarm bells, please include
more justification.

From a quick look at the code my interpretation is that the values in the
segment structure are 64-bit but they were being read using 32-bit
accessors (read32).  On a little-endian 64-bit machine (x86-64, aarch64)
when the values fit into a 32-bit value the right half was read and it
still worked.  Then someone tried a 64-bit big-endian build host (I'm
guessing is a ppc64 or mips64), and the values read are either 0 (if the
size fits in a 32-bit type) or corrupted (if larger).

Am I right?  Either way, the commit log needs to be clear - the message
should *why* it does something, not *what* it does.

Finally, do we really need to patch a fork?  We've got the full source
alongside the recipe, let's just fix it.

This also brings up the point that we really need to do something about
ldconfig-native.  CC'ing Khem, would anyone be able to liaise with upstream
and either update our fork or see if upstream would care about our need for
ldconfig-native?

Ross

--001a1139bd3e88efaa050629b37a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
4 October 2014 07:05, Shan Hai <span dir=3D"ltr">&lt;<a href=3D"mailto:shan=
.hai@windriver.com" target=3D"_blank">shan.hai@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":48k" class=3D"a3s" st=
yle=3D"overflow:hidden">Some header fields of ELF were read with wrong size=
 on 64bit<br>
big-endian machine, fix it by reading the fields with read64<br>
instead of read32.</div></blockquote></div><br>For fixes like this which se=
t of all sorts of alarm bells, please include more justification.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">From a quick lo=
ok at the code my interpretation is that the values in the segment structur=
e are 64-bit but they were being read using 32-bit accessors (read32).=C2=
=A0 On a little-endian 64-bit machine (x86-64, aarch64) when the values fit=
 into a 32-bit value the right half was read and it still worked.=C2=A0 The=
n someone tried a 64-bit big-endian build host (I&#39;m guessing is a ppc64=
 or mips64), and the values read are either 0 (if the size fits in a 32-bit=
 type) or corrupted (if larger).</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Am I right?=C2=A0 Either way, the commit log nee=
ds to be clear - the message should *why* it does something, not *what* it =
does.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Finally, do we really need to patch a fork?=C2=A0 We&#39;ve got the full so=
urce alongside the recipe, let&#39;s just fix it.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">This also brings up the point t=
hat we really need to do something about ldconfig-native.=C2=A0 CC&#39;ing =
Khem, would anyone be able to liaise with upstream and either update our fo=
rk or see if upstream would care about our need for ldconfig-native?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1139bd3e88efaa050629b37a--
