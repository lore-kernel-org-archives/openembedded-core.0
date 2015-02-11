Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 62B186B6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 12:25:25 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id q107so2265980qgd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 04:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NTvcmHt7vvFjLjZElax37GHEV0GKcIxSEdfPWVJE+h8=;
	b=jwn4b/Ydu83FNiN8PqcLBHMlJOrn3ReCMvtpAt4Z0p18kpZyZY/iVEBJWulxsSObRG
	kr+lu7Il7DfOhqSysoDBpNv3dO2pMMLc/qqczNG0axiCK0OuvF0p0sjl01vsWBm7Qflo
	uJzEhKvBTQScvGOsx2e4xVvKRg+G3raqL83sNSTDzBKQfnwD3DYv/2E3czZh4fipGjWa
	mgJCRUdCzmXgA9Nb1n/2CvnAMLbJlAS9CyCckKbN/0r/EiebU5YTEYwzIkzkS2zjeNhF
	H7hQ9qwA2vLp+FIBEqW7Kjg2RKWl8PVKF1hlVWodUXjszTK33SAlLx3UiHaUc3cAWMGT
	AVRA==
X-Gm-Message-State: ALoCoQnNTWuLYMdd+gO/cCOIXkFbj6RtLgm/akDs2DIHZR5EKBrLwYEFRdE2RRBfSMwiIDrpF9NF
X-Received: by 10.140.92.161 with SMTP id b30mr8024432qge.59.1423657526478;
	Wed, 11 Feb 2015 04:25:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 11 Feb 2015 04:25:06 -0800 (PST)
In-Reply-To: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
References: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Feb 2015 12:25:06 +0000
Message-ID: <CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: fix do_rootfs failure due to version skew
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
X-List-Received-Date: Wed, 11 Feb 2015 12:25:33 -0000
Content-Type: multipart/alternative; boundary=001a1139baf026315e050ecf190d

--001a1139baf026315e050ecf190d
Content-Type: text/plain; charset=UTF-8

Hi Paul,

On 11 February 2015 at 00:17, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> -RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (=
> ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
> +RDEPENDS_${PN}-dev = "avahi-daemon (>= ${PKGV}-${INC_PR}) libavahi-core
> (>= ${PKGV}-${INC_PR}) libavahi-client (>= ${PKGV}-${INC_PR})"
>

But this then breaks the hard dependencies for the avahi package.

Basically the problem is that you can't just include complex recipes in
other recipes and expect it to work without lots of hackery.  In this case,
the amount of hackery required to fix this and various other problems (I've
an abandoned branch that sorts out other problems) is arguably more
complicated that throwing all of this away and starting again.

Personally, I don't see why we have avahi and avahi-ui.  Enabling the GTK+
tools should be a PACKAGECONFIG option that is controlled by default by
DISTRO_FEATURES, and all the hackery deleted.

I've got a few branches that implement some of this already, I'll dig them
out as this has been bugging me for a while now.

Ross

--001a1139baf026315e050ecf190d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Paul,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 11 February 2015 at 00:17, Paul=
 Gortmaker <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.gortmaker@windriver=
.com" target=3D"_blank">paul.gortmaker@windriver.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">-RDEPENDS_=
${PN}-dev =3D &quot;avahi-daemon (=3D ${EXTENDPKGV}) libavahi-core (=3D ${E=
XTENDPKGV}) libavahi-client (=3D ${EXTENDPKGV})&quot;<br>
+RDEPENDS_${PN}-dev =3D &quot;avahi-daemon (&gt;=3D ${PKGV}-${INC_PR}) liba=
vahi-core (&gt;=3D ${PKGV}-${INC_PR}) libavahi-client (&gt;=3D ${PKGV}-${IN=
C_PR})&quot;</div></blockquote><div><br></div><div>But this then breaks the=
 hard dependencies for the avahi package.</div><div><br></div><div>Basicall=
y the problem is that you can&#39;t just include complex recipes in other r=
ecipes and expect it to work without lots of hackery.=C2=A0 In this case, t=
he amount of hackery required to fix this and various other problems (I&#39=
;ve an abandoned branch that sorts out other problems) is arguably more com=
plicated that throwing all of this away and starting again.</div><div><br><=
/div><div>Personally, I don&#39;t see why we have avahi and avahi-ui.=C2=A0=
 Enabling the GTK+ tools should be a PACKAGECONFIG option that is controlle=
d by default by DISTRO_FEATURES, and all the hackery deleted.</div><div><br=
></div><div>I&#39;ve got a few branches that implement some of this already=
, I&#39;ll dig them out as this has been bugging me for a while now.</div><=
div><br></div><div>Ross</div></div></div></div>

--001a1139baf026315e050ecf190d--
