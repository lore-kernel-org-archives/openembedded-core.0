Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 25963728E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 06:42:27 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id A20A73F630
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 07:42:26 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 07:42:26 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 07:42:24 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Fri, 19 Dec 2014 07:42:38 +0100
Message-ID: <5493C8D0.1040907@topic.nl>
Date: Fri, 19 Dec 2014 07:42:24 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1418969925.git.Qi.Chen@windriver.com>
	<084ad3c5c70057e5f8f06bf85b4543a590a17a54.1418969925.git.Qi.Chen@windriver.com>
In-Reply-To: <084ad3c5c70057e5f8f06bf85b4543a590a17a54.1418969925.git.Qi.Chen@windriver.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH 1/4] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Fri, 19 Dec 2014 06:42:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 12/19/2014 07:21 AM, Chen Qi wrote:
 > ...
> As almost all files under /etc are basically configuration files, we
> provide a default value for CONFFILES.
>
>      CONNFFILES =3D "${sysconfdir}"

This is going to hurt a lot of recipes. Please do not set this.

The default has always been that CONFFILES is empty. I see no reason=20
whatsoever to suddenly change this.

> In this way, we don't need to modify every recipe to set the CONFFILES
> variable. Of course, setting CONFFILES in recipes take precedence over
> the CONFFILES. For example, if the recipe author decides that package A
> should only treat files under ${sysconfdir}/default/ as config files,
> he/she can write like this.
>
>      CONFFILES_A =3D "${sysconfdir}/default"
>
> The above situation should not be common. As according to FHS, the /etc
> directory is a place for all system related configuration files.

FHS may have written that somewhere, but if you just take a quick look at w=
hat=20
is in /etc/, you'll find that actual configuration files are quite rare, bu=
t=20
there are tons of scripts and distro related files there. Whether or not a=
=20
file there is supposed to be edited by the end-user is something of a distr=
o=20
decision.

Also, "configuration file" does not necessarily mean that the USER is in=20
control. A configuration file may also simply distinguish machine capabilit=
ies=20
or software features.

We'll end up having to patch hundreds of recipes with a CONFFILES=3D"" or=20
similar line.


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


