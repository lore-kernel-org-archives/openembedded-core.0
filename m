Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 95C3765DD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 06:45:22 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so7479901wes.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 23:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=srgBaoygjeB4tdJIa1cpZW2a6uGsC6owDYISq7T1w8E=;
	b=Y1tf7KBXeE+yVeLHOQUWpU/KDREDnhJ7NLmzxqur6PzqjQK/PgpeJlv4bWkfEK/1rF
	hntxut0syOtEhySIU8+UbdFjP0Aj1gz0wUdj++q6wf//UVPhI+vK4u4arT+/ZpzowXJ9
	13pQVMIpYR4+lolA5/EnPO9MLc+jGKqhfbMH4ohPPdFODPoGViaOAqexgwU7hj8BAl+T
	HM8BHTvy/6lt5oBwJkm2cW8xm0VFE8thPV5hiXbGJDAHrEvDI4mtj6ijCWTgiCqb2O0F
	/jQR5s1esLFJSFoQMthDb9QaBtJsqUEVsJBd8LTVXrJHua1T0YIUkD9h5H5tBFMnIOa1
	UvCA==
X-Gm-Message-State: ALoCoQmYPOe5WJsLB/1LKy+QtDJjiNJPjVWudXKFGCeR4hZ42MqYAExBczvq3/fkaoVs3sY5UAd5
X-Received: by 10.180.89.100 with SMTP id bn4mr12713756wib.34.1408517123174;
	Tue, 19 Aug 2014 23:45:23 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9cc1:85c6:9116:a05c?
	([2001:610:612:0:9cc1:85c6:9116:a05c])
	by mx.google.com with ESMTPSA id ay4sm6141537wib.10.2014.08.19.23.45.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Aug 2014 23:45:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <441004b90226e88ca148d267d4474c7d54853819.1406525420.git.Qi.Chen@windriver.com>
Date: Wed, 20 Aug 2014 08:45:20 +0200
Message-Id: <195CEF34-849D-467D-ADA3-0272572D5215@dominion.thruhere.net>
References: <cover.1406525420.git.Qi.Chen@windriver.com>
	<441004b90226e88ca148d267d4474c7d54853819.1406525420.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: add volatile-binds to RDEPENDS
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
X-List-Received-Date: Wed, 20 Aug 2014 06:45:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2014, om 07:34 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:

> ---
> meta/recipes-core/systemd/systemd_213.bb |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_213.bb =
b/meta/recipes-core/systemd/systemd_213.bb
> index 5de7cdc..4fb7ffc 100644
> --- a/meta/recipes-core/systemd/systemd_213.bb
> +++ b/meta/recipes-core/systemd/systemd_213.bb
> @@ -243,6 +243,7 @@ FILES_${PN}-dbg +=3D "${rootlibdir}/.debug =
${systemd_unitdir}/.debug ${systemd_uni
> FILES_${PN}-dev +=3D "${base_libdir}/security/*.la =
${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>=20
> RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D =
${EXTENDPKGV})"
> +RDEPENDS_${PN} +=3D "volatile-binds"

I'm seeing more and more patches using this pattern and I'm wondering =
why. The above is only adding more bitbake overhead, why can't you just =
write it as:

RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPKGV}) =
\
                                       volatile-binds"

?=

