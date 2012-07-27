Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sulxf-0007Ye-3Z
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 16:56:15 +0200
Received: by lags15 with SMTP id s15so1907186lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=VVUz0+f/EZn+hzZONRBiPTWUnGWYZdgTWyeTfrJJ9Kw=;
	b=JbEmuEX2qp+Ksv56WXoik4SrOfT5zCrDhN2C8lfyPyjdhC9Cwz5odqd8kcXfdZKwli
	apKKvERfz7MXVa0Kgj9K05fbpggdFDbPSsBM5ysPY8ORVj0CW/GqjWNHRfBv3bPyPt2I
	dqKRSDuNA043Rt+38gw80egSo6HfZw9t1evu1X1PIojM9IkGOKTltUsXhpU7+sukFcLH
	XqjTAgvm3/kAkJg3Sc4NNPuQQE7jJIIArmbqVo6laChymhcE58+8geWz7TeRLAY0EikQ
	OT3g5jRWl/0vjTmeQ0aKc3CS+RfgSi+L3Gi6ne0qWLqmZAvaCPxYcsdE6lHoEGUK6L6i
	tDZg==
Received: by 10.112.23.7 with SMTP id i7mr1505807lbf.85.1343400282947; Fri, 27
	Jul 2012 07:44:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Fri, 27 Jul 2012 07:44:22 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B8699945BD9B9B0@EU-MBX-03.mgc.mentorg.com>
References: <365E1805BC95084CBE82381A0B8699945BD9B9B0@EU-MBX-03.mgc.mentorg.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 27 Jul 2012 07:44:22 -0700
X-Google-Sender-Auth: iCBULqLISPkT1NR8Orp9xJkjf4w
Message-ID: <CABcZANk5df9=C=fznO+N2Xs5+XrUgvtO0E6DqrpwxPArysFokA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Subject: Re: [PATCH] dbus-glib: Conditionaly adds dbus-x11 to RDEPENDS_${PN}-tests
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
X-List-Received-Date: Fri, 27 Jul 2012 14:56:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 27, 2012 at 6:10 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> *  Build was hitting an error "Nothing RPROVIDES 'dbus-x11'". dbus-glib
> RDEPENDS on it and
>
> dbus was providing dbus-x11 when x11 was present in DISTRO FEATURES. So
> conditionally
>
> added dbus-x11 to RDEPENDS_${PN}-tests in dbus-glib recipe.
>
> * Verified on qemuppc.
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

I think this is a better fix:

-PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
+PACKAGES += "${PN}-bash-completion ${@base_contains('PACKAGECONFIG',
'tests', '${PN}-tests-dbg ${PN}-tests', '', d}"

Due to this:

PACKAGECONFIG ??= ""
PACKAGECONFIG[tests] = "--enable-tests,,,"
-- 
Christopher Larson


