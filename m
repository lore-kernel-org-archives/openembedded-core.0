Return-Path: <lee.nipper@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 230C973243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 20:25:31 +0000 (UTC)
Received: by qgez77 with SMTP id z77so3905130qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QmBpkXMWBWYAK0xQuFi+1I/YalNEOi3zSX5sC0sBLjg=;
	b=QnU69L4Ctpsd7VvTqpYYSL2NtbC26cE4BpReRvZqok6Brs5gw5x/mK/1m9DERam/D2
	88K5lyrMsbvf86LMRYUOaJcaEF3Jgxx8VTdkm/a/MeiMW1gq745E5A8SaTEId0tRGQqJ
	LUgmSuMGjQHyreOPaRkiw+AueQG15Ve3NX7cYtBSzEGn2DBuZJKkIAshMDed6vyVjLzQ
	geRnQpOVNSAUja4QBEwAcK2oluI8LsztO0dKX6gZaBgZXO68wqF/j4xOOok1Ng89D0pr
	sdnyRGUAsdo7geCsWhyuXIulo+tngHJUH0KPqUaadRu3S1VET0W9axeJn2kccmJQB6EZ
	luiQ==
X-Received: by 10.140.233.137 with SMTP id e131mr33854544qhc.37.1442953531556; 
	Tue, 22 Sep 2015 13:25:31 -0700 (PDT)
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com.
	[209.85.220.179])
	by smtp.gmail.com with ESMTPSA id 103sm1268140qkx.7.2015.09.22.13.25.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 13:25:31 -0700 (PDT)
Received: by qkdw123 with SMTP id w123so9370074qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:25:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.55.19.31 with SMTP id d31mr31591548qkh.37.1442953530944;
	Tue, 22 Sep 2015 13:25:30 -0700 (PDT)
Received: by 10.55.20.148 with HTTP; Tue, 22 Sep 2015 13:25:30 -0700 (PDT)
In-Reply-To: <5601A1C6.5050205@ettus.com>
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
	<CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
	<5601A1C6.5050205@ettus.com>
Date: Tue, 22 Sep 2015 15:25:30 -0500
Message-ID: <CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
From: Lee Nipper <lee.nipper@linux.com>
To: =?UTF-8?Q?Marcus_M=C3=BCller?= <marcus.mueller@ettus.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Tue, 22 Sep 2015 20:25:33 -0000
Content-Type: multipart/alternative; boundary=001a114016b0a3e57e05205bccf7

--001a114016b0a3e57e05205bccf7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 1:45 PM, Marcus M=C3=BCller <marcus.mueller@ettus.c=
om>
wrote:

> Hello,
> > If I understand correctly it allows a user prepared $TEMPLATECONF
> > directory
> > to be used by oe-setup-builddir.
> Indeed; the point is that oe-setup-builddir was definitely meant to be
> used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF
> local variable is automatically passed on from oe-init-build-env to
> oe-setup-builddir=C2=B9, but in zsh, this doesn't work without explicitel=
y
> declaring that should happen (which is the only thing my patch does).
>
> Best regards,
> Marcus
>
> =C2=B9 not quite sure how; it's a local to the calling script and shouldn=
't
> be a local or env variable to the callee, IMHO.
>


Hello Marcus,

FWIW, I did some test cases to understand the differences.

With bash 4.3.11, and the examples below,
cases A and B will pass along TEMPLATECONF, but case C does not.
Your patch makes case C work as well.

# A:

TEMPLATECONF=3D$HOME/my-template-dir source
~/openembedded-core/oe-init-build-env $HOME/my-build-dir

# B:
export TEMPLATECONF=3D$HOME/my-template-dir; source
~/openembedded-core/oe-init-build-env $HOME/my-build-dir

# C:
TEMPLATECONF=3D$HOME/my-template-dir; source
~/openembedded-core/oe-init-build-env $HOME/my-build-dir


And with zsh 5.0.2, case B will pass along TEMPLATECONF, but cases A and C
do not.
Your patch makes cases A and C work as well with zsh.

I did not expect case A to be different than case C for bash, but it
apparently works differently than I thought.

Best regards,
Lee

--001a114016b0a3e57e05205bccf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Sep 22, 2015 at 1:45 PM, Marcus M=C3=BCller <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:marcus.mueller@ettus.com" target=3D"_blank">marcus.mueller@ett=
us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex">Hello,<br>
<span class=3D"">&gt; If I understand correctly it allows a user prepared $=
TEMPLATECONF<br>
&gt; directory<br>
&gt; to be used by oe-setup-builddir.<br>
</span>Indeed; the point is that oe-setup-builddir was definitely meant to =
be<br>
used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF<br>
local variable is automatically passed on from oe-init-build-env to<br>
oe-setup-builddir=C2=B9, but in zsh, this doesn&#39;t work without explicit=
ely<br>
declaring that should happen (which is the only thing my patch does).<br>
<br>
Best regards,<br>
Marcus<br>
<br>
=C2=B9 not quite sure how; it&#39;s a local to the calling script and shoul=
dn&#39;t<br>
be a local or env variable to the callee, IMHO.<br></blockquote><div><br></=
div><div><br></div><div>Hello Marcus,</div><div><br></div><div>FWIW, I did =
some test cases to understand the differences.</div><div><br></div><div>Wit=
h bash 4.3.11, and the examples below,</div><div>cases A and B will pass al=
ong TEMPLATECONF, but case C does not.</div><div>Your patch makes case C wo=
rk as well.</div><div><br></div><div># A:</div><div><br></div><div>TEMPLATE=
CONF=3D$HOME/my-template-dir source ~/openembedded-core/oe-init-build-env $=
HOME/my-build-dir</div><div><br></div><div># B:</div><div>export TEMPLATECO=
NF=3D$HOME/my-template-dir; source ~/openembedded-core/oe-init-build-env $H=
OME/my-build-dir</div><div><br></div><div># C:</div><div>TEMPLATECONF=3D$HO=
ME/my-template-dir; source ~/openembedded-core/oe-init-build-env $HOME/my-b=
uild-dir</div><div><br></div><div><br></div><div>And with zsh 5.0.2, case B=
 will pass along TEMPLATECONF, but cases A and C do not.</div><div>Your pat=
ch makes cases A and C work as well with zsh.</div><div><br></div><div>I di=
d not expect case A to be different than case C for bash, but it apparently=
 works differently than I thought.</div><div><br></div><div>Best regards,</=
div><div>Lee</div></div><br></div></div>

--001a114016b0a3e57e05205bccf7--
