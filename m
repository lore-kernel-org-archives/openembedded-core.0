Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHwK1-0000Ws-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 14:06:49 +0200
Received: by dadz8 with SMTP id z8so1092864dad.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PwaQUaSkiApaBZIRk0UOtSiKhSEpFeOm2kkvyErbh/o=;
	b=Az3pBdoVHNxo6Y9LygSPbvqt47OhbJACr9f8TltCrX3vVtJ6NJXje49EWN96zDPDE/
	v19PjXdTjdSojneOVCUSKTE8m1EK3Z5OA8UfoBNzMYcGUlFMtKO2CpgPeA80J9hi5aa1
	NS7KyBH38Rc12rv+4TfAy3WE+qrcfIUb+SI80VHP+DYJ5DQPACW3tkr9OzJbFnwpxyAd
	DvTM+cWYaJc/bTdSaZnt971Auhp0BUtdgEj5+sKu0x2CGFkIGhBAyQb4Fk6BVvDjyTPo
	NI2C49H2sgTWFEwPCRd453bTKcSFjZqssX4fxZ/BJIfpLCS7VVd/cQYD7QTywffT0pzG
	eNUg==
MIME-Version: 1.0
Received: by 10.68.73.138 with SMTP id l10mr37598749pbv.22.1334145449989; Wed,
	11 Apr 2012 04:57:29 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Wed, 11 Apr 2012 04:57:29 -0700 (PDT)
In-Reply-To: <341D01DC-1752-407E-85E7-5DEB343AA7AB@dominion.thruhere.net>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
	<1334139378.10826.140.camel@ted>
	<341D01DC-1752-407E-85E7-5DEB343AA7AB@dominion.thruhere.net>
Date: Wed, 11 Apr 2012 13:57:29 +0200
Message-ID: <CAAQYJAuc4542jJeisn=iaTo-GtPUpXvRKgrw20WhWVBCpoM4nA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Wed, 11 Apr 2012 12:06:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

As far as I understand that, the rule was originally written for corgi
touchscreen and did indeed work for ads7846 ts.

Then something went wrong and this patch appeared: "udev 124: support
devices with ads7846 touchscreen and wrong modalias"

http://lists.linuxtogo.org/pipermail/openembedded-commits/2009-January/022948.html

Finally, bluelightning reported that on ipaq h1940 the rule did not
match and added a .bbappend in meta-handheld.

I analyzed the output of the touchscreen I have (Zaurus poodle, corgi,
spitz) and the generic rule still matched fine, because sysfs reports
18 (pressure).

Now, looking at the s3c2410_ts.c driver on that ipaq, it seems to me
it only reports:

125                         input_report_abs(ts.input, ABS_X, ts.xp);
126                         input_report_abs(ts.input, ABS_Y, ts.yp);
127
128                         input_report_key(ts.input, BTN_TOUCH, 1);
129                         input_sync(ts.input);


but not pressure.

In fact, ABS_X and ABS_Y are reported, there are no relative axes,
there is no pressure.
That should be enough to classify it as touchscreen imho.

Regards

Andrea


