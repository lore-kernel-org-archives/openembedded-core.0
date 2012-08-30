Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T71Yn-0007tB-1p
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 12:01:13 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 02:48:56 -0700
Received: by obblz20 with SMTP id lz20so2891952obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=XSXdz6mWL1MceeiQwoF4aT71svgV52OJ3hoerHGTGzI=;
	b=WLE7/MKrjEEP88aT6zI7NwnIqd7QQ+uDU4L0p1j/E5YRiyE6XGgUuQRUqskWOKqDQF
	D2RxcdlHjdYzeH1b6jLnP3vNmYRbb4h+8EGBHojxX2cpPMPKi0bs3U8eHp9iRxjNV1xU
	kfO29PsObTaMiSVMfQGlVJjoQBNL6J0G9dusT1hEcMrqpSlq0J5/XZSKor67XklJkjuX
	y8TUugXjaBJswmjDEr+i2R3MTTk1au4wJTC7SdBAQkR9xjgx43X8WVb2VtiAVi7mCT6T
	M72/S6/2Vdrl11z6wkOKWZzzVpj9S4V68Ar+NZgEns+VhBFUkYUx3XkFkfcrmLcawEKc
	m4Nw==
Received: by 10.182.50.68 with SMTP id a4mr3645655obo.59.1346320134643; Thu,
	30 Aug 2012 02:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 02:48:34 -0700 (PDT)
In-Reply-To: <FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
	<1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
	<CAJTo0LatnKpmV5P53dsdO-J4_kMT_mqJu8SW5vX_b8KhbOJDXA@mail.gmail.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 10:48:34 +0100
Message-ID: <CAJTo0La61B9iceYx-xktn9DQ-wOGsM5Odu22GN_NpnX1294DBg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkmSKDrMYRb96YL4VC+UnMoZwNTwnI0GUwt3YjVgwlCJjd5p4kP4nuBPP89IjMnvjyIVx3z
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Thu, 30 Aug 2012 10:01:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 August 2012 17:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Ehm, I *really* want it to be a symlink, that way you easily check what t=
he timezone is without needing to boot the device or compare md5sums. The l=
ast thing the TSC said on the split /usr was something along the lines of "=
would be nice, but only if it doesn't make things worse". A cp instead of l=
n would make things worse IMO.

Branch updated with a symlink, and the following commit message:

    tzdata: install /etc/localtime alongside /etc/timezone

    Lots of code (such a GLib) expects this to exist and link to the curren=
t
    timezone definition.

    /etc/localtime is a symlink instead of a copy of hard link to make
it obvious
    what timezone data it's pointing at. For systems with /etc on a separat=
e
    filesystem to /usr this will result in a dangling symlink until
/usr is mounted,
    but as this is early boot the assumption is that anything checking it w=
ill
    handle that case and fallback to UTC.

Ross


