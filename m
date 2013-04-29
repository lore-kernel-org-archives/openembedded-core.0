Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWr6P-00076B-CD
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 18:38:59 +0200
Received: by mail-vc0-f172.google.com with SMTP id hx10so5605205vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 09:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=PD3/hvyM3M6hY+GtMasIrf61ZhnQiJ1TSMA4IB+UtNE=;
	b=Z1O6gu+Wp9NlJpHQSmqo++lQFEy6g0IVbm7hwN/KUYmLcP64rRzfXVhZwR5Sz7E5L5
	VNBmiV+iOC8kphEkVB32IMMsG1Vziwxud9wBKH2z1Q0qDAXYT5AV9a9cXGu3Z4ZRbRHr
	LkMM93mVeJUnmq8TcRu8iqfOKVvqhV8+nWv0QorlXnyF4jbMTozgsKTz4JF3l26+tBrK
	RVHz26Fwilx/lu8G1j9vi96AWmjs8mkJ6T3HG4KfP3CAaHovyn18OSv7/7zdEB+iC1DJ
	riPY40CroVvLN01VaKp74GIqCE8sR1nJwllUGhTaL53YPSHvpbxuWyF6chhTAV/d1Mke
	78Yg==
X-Received: by 10.52.158.163 with SMTP id wv3mr28553432vdb.82.1367252467667;
	Mon, 29 Apr 2013 09:21:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 29 Apr 2013 09:20:46 -0700 (PDT)
In-Reply-To: <lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
	<lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2013 17:20:46 +0100
Message-ID: <CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQkTDHUEUBRm3MwHXBe+gQvnSBbSWtzZWm3QN8j3W/IDVnUFfXD1RHjDikGo6UxfclaqIzoh
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Mon, 29 Apr 2013 16:39:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,.

On 29 April 2013 16:52, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
>> with buildhistory to verify that nothing else moved around?
>
> Things *are* expected to move around.  E.g. /usr/lib/openssh/sftp-server
> becomes /usr/lib/sftp-server now.

Right, so don't use Debian as a rationale for this approach.  On Debian:

$ ls /usr/lib/openssh/
sftp-server  ssh-keysign  ssh-pkcs11-helper

For reference, on Fedora this binary is
/usr/libexec/openssh/sftp-server, with the split between dropping
binaries directly into /usr/libexec or using a subdirectory apparently
arbitrary.

Every package that I looked at on Debian is using
/usr/lib/[packagenameish]/[binary].  /usr/lib/upower/upowerd.
/usr/lib/telepathy/telepathy-gabble.   I say packagenameish as it's
often changed to be a more general name - i.e. all of the Telepathy
backends use /usr/lib/telepathy.

There are no *executables*, only libraries, in /usr/lib on Debian or Fedora.

I'm really not liking dropping the executables into a directory that
on non-multilib is the same as libdir.  If we want to be like the half
of the world that does the same as Fedora then we can revert back to
/usr/libexec.  Or we can be like the half of the world that does the
same as Debian and use something similar to
${prefix}/lib/$(DEB_SOURCE_PACKAGE) (as used in CDBS and Debhelper):

+export libexecdir = "${exec_prefix}/lib/${BPN}"

Ross


