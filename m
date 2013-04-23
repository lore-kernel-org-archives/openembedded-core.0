Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UUZEK-0005Is-PD
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:09:44 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so133595eek.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Yn7azlIqG1CmjO0U/6ZcFFiwLeGvJHOLOUqhavYK2MA=;
	b=d5X2UzYDFmg3VtLm1sMGJVh1xEXp7dNgbFOkacrIVmU0ukpnK51gdmnwUotsrGpzk0
	8oZOMgCXKiOTh4ibUnVzWwds6rnW8T+T6+dfK268fCJr9N9wCCniXWo+6wTBsD7clyI4
	WZ0XtUWDbiCWfyVQ/uBF4n8u3vpgWZW60ptRwyzFyUwPP6XJkBg6IWyeIAF/vhiSvotn
	VdqJa6CzZ3CAnApbhKT1XCklAS+q/CG12lJw4/HN4q+ibUZZnZ2SazDTVl+y4Jr9nwCa
	GwTlspF9MMzFlx+AN2P2K/QWvaHOS//drLROrTqJDienSaGszQWZz0pwYMQ9cJBjaWGK
	7MRg==
X-Received: by 10.15.26.6 with SMTP id m6mr14720471eeu.4.1366707120634;
	Tue, 23 Apr 2013 01:52:00 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d47sm45430204eem.9.2013.04.23.01.51.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 01:51:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0La66tzUs7kqPwN7S1RSaUktUYNWzZqQ+jV+yGp1eoz1rw@mail.gmail.com>
Date: Tue, 23 Apr 2013 10:52:00 +0200
Message-Id: <ABB99DAF-4779-4E33-8DFB-C62584592D24@dominion.thruhere.net>
References: <DCC98A73-D384-41BC-BF41-E19F9763ABD3@dominion.thruhere.net>
	<CAJTo0La66tzUs7kqPwN7S1RSaUktUYNWzZqQ+jV+yGp1eoz1rw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQl7FWVAcV2ynW5HcnLq3DlrEd01823xkQulmbWrmB47aqC2bQiDGeHzlPlYpQDjj8MYwVnT
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] disable SysV compat in systemd when there's no 'sysvinit' in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 23 Apr 2013 09:09:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 apr. 2013, om 10:41 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> Hi Koen,
>=20
> On 23 April 2013 09:18, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> A real patch will follow later after I test this (full rebuild going =
on due to the BACKFILL snafu mentioned earlier), but it boils down to:
>>=20
>> [koen@rrMBP systemd]$ diff -Nurd systemd_199.bb systemd_202.bb
>> --- systemd_199.bb      2013-04-22 16:53:18.450910639 +0200
>> +++ systemd_202.bb      2013-04-23 09:48:06.803283711 +0200
>> -                 --with-sysvrcnd-path=3D${sysconfdir} \
>> +                 ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'--with-sysvrcnd-path=3D${sysconfdir}', '--with-sysvrcnd-path=3D', d)} \
>>=20
>> Is anyone fundamentally opposed to this going in early in the 1.5 =
cycle provided my tests work out?
>=20
> I have no problem with making this a PACKAGECONFIG straight away, but
> total disabling of sysvinit compact code would mean mass breakage as
> we've not yet managed 100% systemd coverage of the init scripts in
> oe-core. =20

This way of forcing change seems to be the preferred method in OE-core =
based on previous experiences hence the suggestion of doing this early =
in 1.5.

But yeah, a PACKAGECONFIG option would work for me as well. I'll wait =
for 203 to get released and post a recipe with that.=


