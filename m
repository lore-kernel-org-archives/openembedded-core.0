Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204F9C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:46:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93497.1783086400270367183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 06:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UORv5If5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17F494E40C69;
	Fri,  3 Jul 2026 13:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5A260300;
	Fri,  3 Jul 2026 13:46:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606C8104C94BE;
	Fri,  3 Jul 2026 15:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783086397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=daVDYd9AHSosblAI4gtTdfibP1BD3uMPUQq1+RDgUqM=;
	b=UORv5If5bCB/b0AGvnGB4kRUXrts4VfZnvwOmCxYQCqpjpp3zOEtDM/YSZS4qjdS5WNH7r
	5PukoY3qX90oy9ZPMuYrnKPlJOuCbGROfwsxlOBgB2LgixoxNoM0NWxZfmV2gRgStl6dxx
	wHWS64egzQ++HttfWp/l0NmB+FrYLd81B7lBZR+ZG+SSSozBr/rrZD5vrUxwqrDDtO/svb
	uy0UItzSf5hbDSbRdl0PXU68EOzGjod+O0E2GH+5rODrk7Ekmrk0sVyCJwXKQ1PSzt/fBd
	Xot4IV5nv3VMIpvtMPX/RPj4zScvajcccElO3GgRbh5352EHQKNW9pZg6+UA9A==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com,
 pascal.eberhard@se.com, wahid.essid@se.com
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: fix CVE-2026-58016
Date: Fri, 03 Jul 2026 15:46:35 +0200
Message-ID: <wUwD7u-8QNWeO3TEktmZ1Q@bootlin.com>
In-Reply-To: <DJOZ3JVV6E0E.1ZS5B4UVCZBLN@smile.fr>
References: 
 <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
 <DJOZ3JVV6E0E.1ZS5B4UVCZBLN@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 13:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240110

Hello Yoann,

On Friday, July 3, 2026 at 3:33=E2=80=AFPM, Yoann Congal wrote:
> On Fri Jul 3, 2026 at 3:25 PM CEST, Benjamin Robin via lists.openembedded=
=2Eorg wrote:
> > A flaw was found in GLib. A state confusion issue exists in
> > g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> > processing malformed D-Bus introspection XML, specifically with a <node>
> > element nested within other elements like <method>, <signal>, <property>
> > or <arg>. This issue can cause an unsigned integer overflow and lead to=
 an
> > out-of-bounds read, resulting in a denial of service.
> >
> > Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boot=
lin.com>
> > ---
> >  .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch       | 92 ++++++++++++++=
+++++++
> >  .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch       | 96 ++++++++++++++=
++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |  2 +
>=20
> NVD tells this is fixed in 2.88.1 but wrynose is at 2.88.0. Can you send
> a patch for wrynose so I can accept this on scarthgap?

The fun thing, that this is not fixed in version 2.88.1 but in 2.89.0.

I am sending a patch right now.

>=20
> Thanks!
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




