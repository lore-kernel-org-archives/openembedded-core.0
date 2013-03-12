Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFK71-0007wD-Vz
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:59:08 +0100
Received: by mail-ea0-f182.google.com with SMTP id q15so1595481ead.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=45Nld9kFdYrLVdGrylipO5RYxI4Kke3h8yGntRR09yA=;
	b=X4Nqivc39pYRuYFf9QMxN4I3yQLyNcCz3McHif+a/n7kLvgrz47tQ70f1sD3MiYReh
	dvEKakOYO861rVD8QYFYCgfV2givteiUraDSixYBogo0cLWBVJI/NcfPZMm6vwyimJ1E
	kaJULYwas3kHQ2ZicMPix3/bQJTN3YonnjGPdC/3r2rJnaClxyapVKpVCVQsThDLwQmF
	1MwueKveIPkwcs4Oh+qLdklphkj69lVJ1ro0OMM2ay2F+umBQYVZJIHIRzk6WWmxPmER
	lc5nNCnFZ0rTaaD8F/gvDW2O4rNs8HzKTbLDE86PvQ0XRDfda9cc+Q8l0JwkHhaNPqGQ
	KtXw==
X-Received: by 10.14.220.135 with SMTP id o7mr45549750eep.3.1363074149042;
	Tue, 12 Mar 2013 00:42:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::4504:873f:60a5:8047?
	([2001:610:612:0:4504:873f:60a5:8047])
	by mx.google.com with ESMTPS id q5sm27957764eep.11.2013.03.12.00.42.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 00:42:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
Date: Tue, 12 Mar 2013 08:42:26 +0100
Message-Id: <980599F4-DEED-41CF-B871-750758BD6D45@dominion.thruhere.net>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnXxdZb8zAr3plRVmCtYixW29ONKPB68w4md+/8TJZhfduRbbK0Y0Zd6iVjo7Mo0AaHJFe3
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Tue, 12 Mar 2013 07:59:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mrt. 2013, om 23:49 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

>=20
> On Mar 11, 2013, at 2:47 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
>> On Mon, Mar 11, 2013 at 6:37 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>> On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
>>>> This series allows you to have both sysvinit and systemd in =
DISTRO_FEATURES.
>>>> Packages will be built with both init scripts, and some daemons =
will be linking
>>>> to libsystemd-daemon so that will be pulled in to sysvinit images.
>>>=20
>>> Regarding the upgrade path, Richard/Paul/myself discussed this over
>>> lunch and proposed that oe-core could gain an include file for =
distro
>>> configuration that basically injects the backward compatibility
>>> dependencies.  So for meta-systemd, it would inject
>>> replaces/provides/conflicts for each of the packages in =
meta-systemd.
>>> This would isolate the dependencies into a single location, and be
>>> opt-in for distros that previously shipped meta-systemd.  Hopefully
>>> the implementation of this is obvious, and patches to implement this
>>> are welcome.
>>=20
>> I personally prefer to still use meta-oe systemd class and keep the
>> possibility to product images with choosen init system. I think =
Martin
>> will also prefer it.
>=20
> using different init manager is a separate problem than what Ross =
tried to address here isn't it ?
> I personally don't have a use case where I would upgrade live from 1.3 =
to 1.4 so
> for me I could easily accept a different solution for 1.4

Upgrading between 1.3 and 1.4 is already impossible for non-systemd =
related reasons. But that shouldn't be a reason to break upgrade paths =
for other things, so I'd very much like to see some attention to this =
for 1.5.=


