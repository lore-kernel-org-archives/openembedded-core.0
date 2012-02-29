Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2tW3-0007bK-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 01:05:03 +0100
Received: by lagw12 with SMTP id w12so13333lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 15:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.23.100 as permitted sender) client-ip=10.112.23.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.23.100 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.23.100])
	by 10.112.23.100 with SMTP id l4mr1230503lbf.24.1330559794409 (num_hops
	= 1); Wed, 29 Feb 2012 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=AjxliPyw7l+eWNz4xDvr6moRExH+M17SuCFvZgHMU5M=;
	b=V6/4nrficfvrY+4soFpH4EcTMwcC9zZ7258h9bku0f3l02Co5LO9x4MacoBDpU+i7t
	UAJbxEe9CagnsHQc2usiEuIJ2DWRSssgbny5Pu2IygoDVXldJGW19osbKkB2wk14xD/A
	q1/4TnD38f4fb4BhTYksveAqFyYhiCmOOspiI=
Received: by 10.112.23.100 with SMTP id l4mr1013351lbf.24.1330559794254; Wed,
	29 Feb 2012 15:56:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Wed, 29 Feb 2012 15:56:04 -0800 (PST)
In-Reply-To: <CAGDS+nk7a=X-zrjsv9RtuH-YzSLX=gAsqbtpVkF+tQ=saJQP1w@mail.gmail.com>
References: <CAGDS+nk7a=X-zrjsv9RtuH-YzSLX=gAsqbtpVkF+tQ=saJQP1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Feb 2012 15:56:04 -0800
Message-ID: <CAMKF1spZxmWem68=G3COfc1ukBwbtemMPRrpznTEjrK5=DvU+g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: wpa-supplicant strangeness after pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 00:05:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 2:05 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> I'm continuing to see failing builds or defective packages on package
> rebuilds triggered by the recent change to sstate hash.
>
> The wpa-supplicant package is a good example of the latter -- the
> rebuild completes successfully but the resulting package is defective.
> =C2=A0There were no recent changes to the recipe, so this was clearly a
> "just to be safe" rebuild based on sstate hash (correct me if I am
> wrong!)
>
> In particular /usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.ser=
vice
> now contains:
>
> Exec=3D/usr/usr/sbin/wpa_supplicant -u
>
> rather than:
>
> Exec=3D/usr/sbin/wpa_supplicant -u
>
> Rebuilding the package after a -c cleansstate restores the expected resul=
t.
>
> Is it "just me" or are others seeing this kind of breakage?
>

you are just ahead of others :)
and this is yet another case where basichash exposes an underlying problem

see the sed command in below snippet

install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf
${D}/${sysconfdir}/dbus-1/system.d
install -d ${D}/${datadir}/dbus-1/system-services
sed -i -e s:${base_sbindir}:${sbindir}:g ${S}/dbus/*.service
install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services

that command can only be run correctly once unless you delete ${S}
since its sedding something in ${S}
and we know base_sbindir (/sbin) and sbindir(/usr/sbin) are close
enough expressionwise


> I'm beginning to suspect I ought to just do a clean build after every
> pull in order to remain productive!

That will hide these kind of issues you bring forward :)

>
> Steve
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


