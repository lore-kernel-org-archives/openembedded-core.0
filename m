Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UaRBb-00032e-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 15:47:08 +0200
Received: by mail-wi0-f169.google.com with SMTP id h11so6491646wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 06:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=64QZKiY/LBlGqnzA9x9/WvWrQqPRVDak77/utqX1v6I=;
	b=DshlpXgd/On5uumE0RBk28MT9XKZvPHtT7nlISTS23Ce5jYmJChlmkpBcbByzakHn7
	eVkK2xbgF+ARZdCRsvV5RzCEegarQNAT0suoqjEI2u85KYu1V9x7ch/Vvsctvx8Z6V+P
	5JCom9xEnfpvn0bLTzKc0R9NVcdK/3LH+G9ov6y8Ky3NvbCJE/rvUEiq1n03Dm+p3rxq
	pa1tZzXDFgHt+Hj4DXKLogKxVDBNzAIrFAsfpenzu+VzYFu4MOAydWlS5DeH/xCGaJmv
	OxpBl0kbRDe2xY9lSYEH2LbGDHA/6o+4hfNdgq7BdP4m2RmmR4nD4Oa00QsVRGp1GXnP
	FwCA==
X-Received: by 10.180.83.199 with SMTP id s7mr17565139wiy.19.1368106143036;
	Thu, 09 May 2013 06:29:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Thu, 9 May 2013 06:28:42 -0700 (PDT)
In-Reply-To: <1368105605.16243.65.camel@pb-ThinkPad-R50e>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1368105605.16243.65.camel@pb-ThinkPad-R50e>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 16:28:42 +0300
Message-ID: <CAMZjud2TzEqknP_0wH=CdAjvrz1MRXgfKRo+ytC1h+mOEXCYJg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmFqf5vEjawU9leuPt4gbjPKQfpVIoStFRZuTlrmrISrcgKjUCE06Coi3QdDbORg2InGk0d
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 13:47:14 -0000
Content-Type: multipart/alternative; boundary=14dae9cc973cabcc9804dc490832

--14dae9cc973cabcc9804dc490832
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 9, 2013 at 4:20 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Thu, 2013-05-09 at 15:55 +0300, Bogdan Marinescu wrote:
> >  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect
> this
> > -#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> > +RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>
> Wow, it seems like this has been broken since 2008 and nobody noticed.
> That line was commented out in oe-classic e96e82cd without any real
> explanation and it's been that way ever since.
>
> That said, forcing libgcc into RDEPENDS_${PN} unconditionally like this
>

It's not exactly unconditional, it is conditioned by 'nptl' in
${GLIBC_ADDONS}. I don't know of a better way to handle this, please let me
know if you have any suggestions.
About why this line was commented out, I don't know. git blame didn't help
with this.

Thanks,
Bogdan


> is suboptimal, because programs that don't link -lpthread (or possibly
> even programs that do, if they don't use cancellation) still don't need
> libgcc.  With this change it will be impossible to avoid getting libgcc
> in an image, which will be a loss for those trying to build small images
> with single threaded programs.
>
> p.
>
>
>

--14dae9cc973cabcc9804dc490832
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, May 9, 2013 at 4:20 PM, Phil Blundell <span dir=3D"ltr">&lt=
;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, 2013-05-09 at 15:5=
5 +0300, Bogdan Marinescu wrote:<br>
</div><div class=3D"im">&gt; =A0# nptl needs libgcc but dlopens it, so our =
shlibs code doesn&#39;t detect this<br>
&gt; -#RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;,&#39;libgcc&#39;][&#39;nptl=
&#39; in &#39;${GLIBC_ADDONS}&#39;]}&quot;<br>
&gt; +RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;,&#39;libgcc&#39;][&#39;nptl&=
#39; in &#39;${GLIBC_ADDONS}&#39;]}&quot;<br>
<br>
</div>Wow, it seems like this has been broken since 2008 and nobody noticed=
.<br>
That line was commented out in oe-classic e96e82cd without any real<br>
explanation and it&#39;s been that way ever since.<br>
<br>
That said, forcing libgcc into RDEPENDS_${PN} unconditionally like this<br>=
</blockquote><div><br></div><div style>It&#39;s not exactly unconditional, =
it is conditioned by &#39;nptl&#39; in ${GLIBC_ADDONS}. I don&#39;t know of=
 a better way to handle this, please let me know if you have any suggestion=
s.</div>

<div style>About why this line was commented out, I don&#39;t know. git bla=
me didn&#39;t help with this.</div><div style><br></div><div style>Thanks,<=
/div><div style>Bogdan</div><div style>=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">


is suboptimal, because programs that don&#39;t link -lpthread (or possibly<=
br>
even programs that do, if they don&#39;t use cancellation) still don&#39;t =
need<br>
libgcc. =A0With this change it will be impossible to avoid getting libgcc<b=
r>
in an image, which will be a loss for those trying to build small images<br=
>
with single threaded programs.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
p.<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--14dae9cc973cabcc9804dc490832--
