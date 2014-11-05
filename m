Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A9B7165CED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 16:30:00 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id l6so843596qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 08:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=I61m37pW7eQMIvgcYb3HYNgSu0nPhKsdrA/UtDVPOio=;
	b=NMBySJC24gqLUEXdRtin2prlnac0+WrWTofkEICpXO6vFgY63e9/KSjO9xv97DKM+t
	i/Q4SZYZhALvmltpnpfPsTjVwAR+meCvPaccPoPoVYatBbeQ7MYED8wur0HV7eBn9zfS
	N8ychN/ES2vxjGvgommPQHKjl4bG+FirUppsAWkF88Pp+0dyfXTyNHTapYN3Bs3dpxjh
	IkBypw5yLJX/iSzjzCsRCOcxm+n1c2IUVAvWdpYICxjH6ofrQo2XIRYqBTKfE28ogsLE
	aK1BRJW9ECWCP9G7VCiPcjteOvsl2sU0WSPvmXbng4Vi2kb4578XUUlkXW6qPfXjJYuq
	XCPA==
X-Gm-Message-State: ALoCoQlqxyQntOB7w98/ZbdZOMK7mU/rwRRPZjXP5TLAkDAGbPws0CWtfDe7WcvPQuPRjmqkwKe9
X-Received: by 10.140.109.244 with SMTP id l107mr82481045qgf.80.1415205000992; 
	Wed, 05 Nov 2014 08:30:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 5 Nov 2014 08:29:40 -0800 (PST)
In-Reply-To: <1415088547.4530.142.camel@intel.com>
References: <1415088547.4530.142.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Nov 2014 16:29:40 +0000
Message-ID: <CAJTo0LZAza_cJY+UcoZxT_vP-uXubZR7534=Y4EWejRezjjB_A@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: runqemu + dhcp server
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
X-List-Received-Date: Wed, 05 Nov 2014 16:30:06 -0000
Content-Type: multipart/alternative; boundary=001a113b7e505e8e6805071f17b5

--001a113b7e505e8e6805071f17b5
Content-Type: text/plain; charset=UTF-8

Hi Patrick,

On 4 November 2014 08:09, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Recently I built a custom image which depended on a DHCP server to
> configure Ethernet. runqemu with tap for networking doesn't provide one
> at the moment, so ssh logins did not work.
>
> Instead of customizing images for runqemu, I think it would be better to
> adapt runqemu and uses images as on the target device. Attached two
> patches which work for me. Is that of interest for inclusion upstream?
>

I've long been of the opinion that runqemu needs the ability to setup a
DHCP/DNS server for the guest, as whilst you can special-case qemu machines
and hard-code the relevant network configuration it doesn't help with
testing.  That said, I'm not convinced that dhcpd+bind is the right way
forward, something like dnsmasq (currently in meta-networking) might be
quicker to build and more flexible in this environment.

I suppose more work is needed, in particular around how to enable or
> disable this feature. Patching the .bb files also leads to a (to me)
> strange QA error. See the comments in the patches for details.
>

This is likely due to bind using PACKAGES_prepend instead of PACKAGES =+
(=+ is prepend), which messes up the native.bbclass magic.

Ross

--001a113b7e505e8e6805071f17b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Patrick,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 4 November 2014 08:09, Patri=
ck Ohly <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick.ohly@intel.com" tar=
get=3D"_blank">patrick.ohly@intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div id=3D":we" class=3D"a3s" style=3D"overflow:hidden">=
Recently I built a custom image which depended on a DHCP server to<br>
configure Ethernet. runqemu with tap for networking doesn&#39;t provide one=
<br>
at the moment, so ssh logins did not work.<br>
<br>
Instead of customizing images for runqemu, I think it would be better to<br=
>
adapt runqemu and uses images as on the target device. Attached two<br>
patches which work for me. Is that of interest for inclusion upstream?<br><=
/div></blockquote><div><br></div><div>I&#39;ve long been of the opinion tha=
t runqemu needs the ability to setup a DHCP/DNS server for the guest, as wh=
ilst you can special-case qemu machines and hard-code the relevant network =
configuration it doesn&#39;t help with testing.=C2=A0 That said, I&#39;m no=
t convinced that dhcpd+bind is the right way forward, something like dnsmas=
q (currently in meta-networking) might be quicker to build and more flexibl=
e in this environment.</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":we" class=3D"a3s" style=3D"overflow:hidden">
I suppose more work is needed, in particular around how to enable or<br>
disable this feature. Patching the .bb files also leads to a (to me)<br>
strange QA error. See the comments in the patches for details.</div></block=
quote></div><br>This is likely due to bind using PACKAGES_prepend instead o=
f PACKAGES =3D+ (=3D+ is prepend), which messes up the native.bbclass magic=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a113b7e505e8e6805071f17b5--
