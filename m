Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 23D5C6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 11:23:09 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id l12so6482270wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 04:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=TDa7a436mhVS23JIZVrMzXTOOHP+MeI+CRrGSfKkB8c=;
	b=YF13zrQJYoOwPO0g2jnmxBeH9uDU0x5wcloMT6czJRAD/+u1E2QG+pOBpDKWkHNFrp
	tHc4lKbQNcKsXrRtj/XhUcDxelNUsibZA4bYqmMiqxM881TPOdNXh99Pi5zPM9TLQwec
	MhrY8WGni0OVPm4OrGXghq+fsKUm1sdX/mOslEPH7izaddSvG1JU04rHb8b654uCE2Bc
	MSROuXXUXIe7VBejURvjpZ2Swa5cxGH+MsARj+kP2RHyuq12CoteOyaFmBOyLPg+SgUt
	GYztbqsKpqugdXXPw/wJqMhS99/z3W7Gg/iYWpXlLd0rL5gOsPds2Hu9t3VjVwCTcsSo
	bZZw==
X-Gm-Message-State: ALoCoQkQFtUjC9JHBHELtucYVWZEZJQ4vgjMVvlEpqGCWX2gG8TUJCzSgT2AvTB1IMnEPZnlV+iO
X-Received: by 10.180.73.40 with SMTP id i8mr23801812wiv.37.1381922591288;
	Wed, 16 Oct 2013 04:23:11 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id lr3sm3649827wic.5.2013.10.16.04.23.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 04:23:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1517941.hq8ryEHxA8@helios>
Date: Wed, 16 Oct 2013 13:23:08 +0200
Message-Id: <8BAC7D9C-A794-42B2-B31A-9FDC3AEB9FDC@dominion.thruhere.net>
References: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
	<1517941.hq8ryEHxA8@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-basic: libuser has a hard depenency on libpam
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
X-List-Received-Date: Wed, 16 Oct 2013 11:23:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 okt. 2013, om 12:25 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Tuesday 15 October 2013 15:22:46 Saul Wold wrote:
>> Since libpam is only built when DISTRO_FEATURES pam is enabled we =
should
>> not be trying to build libuser also.
>=20
> Should this packagegroup be bringing in libraries such as this at all, =
given=20
> that libraries are generally pulled in as dependencies of applications =
that=20
> link to them?

If it is a pure library, no. But libuser doesn't seem to be a pure =
library package:

[koen@rrMBP libuser]$ cat libuser/latest
PV =3D 0.58
PR =3D r0
PKGR =3D r0.0
RPROVIDES =3D=20
RDEPENDS =3D eglibc (>=3D 2.17) glib-2.0 (>=3D 2.34.3) libffi (>=3D =
3.0.11) libpam (>=3D 1.1.6) popt (>=3D 1.16)
RRECOMMENDS =3D=20
PKGSIZE =3D 283679
FILES =3D /usr/bin/* /usr/sbin/* /usr/lib/libuser/* /usr/lib/lib*.so.* =
/etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d =
/usr/lib/udev/rules.d /usr/share/libuser /usr/lib/libuser/* =
/usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf =
/usr/share/sounds /usr/lib/bonobo/servers
FILELIST =3D /etc/libuser.conf /usr/bin/lchfn /usr/bin/lchsh =
/usr/lib/libuser.so.1 /usr/lib/libuser.so.1.4.0 =
/usr/lib/libuser/libuser_files.so /usr/lib/libuser/libuser_shadow.so =
/usr/sbin/lchage /usr/sbin/lgroupadd /usr/sbin/lgroupdel =
/usr/sbin/lgroupmod /usr/sbin/lid /usr/sbin/lnewusers /usr/sbin/lpasswd =
/usr/sbin/luseradd /usr/sbin/luserdel /usr/sbin/lusermod

regards,

Koen=

