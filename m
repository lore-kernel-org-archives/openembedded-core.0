Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UX78d-0007B0-5S
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:46:20 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3U9SNNf016151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 11:28:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1UX6rH-00027p-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:28:23 +0200
Resent-To: openembedded-core@lists.openembedded.org
Resent-From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Resent-Date: Tue, 30 Apr 2013 11:28:23 +0200
Resent-Message-ID: <lya9ogs6yw.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Saul Wold <sgw@linux.intel.com>
References: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0Laf-d0hz5kkRZZAr7W4yGs+aYaTu51XU2k2q-s0p57q5A@mail.gmail.com>
	<lyip35jpw8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYGf=QtQ_dEbaUiFWOGjpAjfNXqCPY_XYrt+G-rUhcsOg@mail.gmail.com>
	<lyehdtjmkw.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<517EF523.2060405@linux.intel.com>
Date: Tue, 30 Apr 2013 01:15:23 +0200
In-Reply-To: <517EF523.2060405@linux.intel.com> (Saul Wold's message of "Mon, 
	29 Apr 2013 15:33:07 -0700")
Message-ID: <ly61z5c4j8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Resent-Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.5
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 30 Apr 2013 09:46:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Saul Wold <sgw@linux.intel.com> writes:

>>>> Things *are* expected to move around.  E.g. /usr/lib/openssh/sftp-serv=
er
>>>> becomes /usr/lib/sftp-server now.
>>>
>>> Right, so don't use Debian as a rationale for this approach.
>>
>> Debian defines libexecdir to be /usr/lib (+multiarch).  It might set
>> sometimes per-package '--libexecdir=3D${libexecdir}/<package>' configure
>> options, but libexecdir is always /usr/lib there.
>
> As I read though this, a couple things I noted from some of the
> available information, the GNU Directory section you quoted earlier
> actually suggests a package-name directory should be included.

Yes; automake calls this

  pkglibexecdir =3D $(libexecdir)/@PACKAGE@

and lot of packages are using it already to install their files.


>   The definition of =91libexecdir=92 is the same for all packages, so you
>   should install your data in a subdirectory thereof. Most packages
>   install their data under $(libexecdir)/package-name/, possibly within
>   additional subdirectories thereof, such as $(libexecdir)/package-
>   name/machine/version.
>
> And as you pointed out below, the FHS also touches on having a
> sub-directory for applications to use for non-user object and
> internal binaries (like plugins).

Yes; but this is thing of the package, not of the distribution.  When a
distribution thinks, a package pollutes $(libexecdir), the distribution
can fix *this* package.  But $(libexecdir) provided by the distribution
must never contain the package name.


>> When we really do not want executables under ${libdir}, we can set
>>
>>    libexecdir =3D ${prefix}/lib/libexec
>>
>> (which might be a good setting for world-builds to detect some kind of
>> libexecdir related problems).
>>
> I prefer what Ross suggested, fixing libexecdir to be
> ${exec_prefix}/lib/${BPN}

$(libexecdir) has the same meaning like $(bindir); so why do we not have

  bindir =3D $(prefix)/bin/${BPN}

?

Again: $(libexecdir) must be the same for every package.  All major
linux distributions follow this; why should oe differ from this rule?


>>> If we want to be like the half of the world that does the same as
>>> Fedora then we can revert back to /usr/libexec.  Or we can be like
>>> the half of the world that does the same as Debian and use something
>>> similar to ${prefix}/lib/$(DEB_SOURCE_PACKAGE) (as used in CDBS and
>>> Debhelper):
>>
>> Debian does *not* include the package name since mid 2011
>>
>>          http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D541458
>>
> I just looked at a Debian build and /usr/lib is abound with package
> directories.

Nobody forbids this and it is completely fine and suggested that
packages install their files below $(pkglibexecdir).  But Debian
defines libexecdir as /usr/lib (plus an optional multiarch tag from
DEB_HOST_MULTIARCH (whatever this is)).


> Since I did the last libexecdir change, I will start to investigate
> changing libexecdir to be ${exec_prefix}/lib/${BPN}.

This is a no-go because it breaks the GNU standard like the recent
value.  fwiw, my preferences for libexecdir are (in this order):

1. ${prefix}/libexec

   --> clean separation, commonly used, but not FHS compliant (unless
   somebody interprets "/usr/lib<qual> : Alternate format libraries
   (optional)" with '<qual>=3Dexec')

2. ${prefix}/lib

   --> follows the Debian way and is 100% FHS compliant, but might
   pollute ${libdir} and might introduce regressions in oe packaging

3. ${prefix}/lib/libexec

   --> clean separation, probably FHS compliant, but smells hacky


> The concern I have with this will be plugins and other executable
> binaries created in a multilib environment.

Plugins (aka "libraries to be loaded") are not interesting (they do not
belong into ${libexecdir}).  Executables within ${libexecdir} are to be
handled like these in ${bindir}, so that a proper libexecdir won't cause
any new multilib issue.



Enrico


