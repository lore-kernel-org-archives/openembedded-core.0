Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5gl7-0008BA-9D for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 19:08:53 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5gVc-0005Is-6F; Wed, 13 Feb 2013 18:52:40 +0100
Message-ID: <1360777925.4246.86.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 13 Feb 2013 17:52:05 +0000
In-Reply-To: <CALbNGRSiit5QwsYsrAbWhGQUzgCYYjScUdZPuoBxCDRDgOKbgQ@mail.gmail.com>
References: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
	<1360704254.30425.67.camel@ted>
	<CALbNGRSiit5QwsYsrAbWhGQUzgCYYjScUdZPuoBxCDRDgOKbgQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
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
X-List-Received-Date: Wed, 13 Feb 2013 18:08:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-02-13 at 00:55 +0100, Andreas M=C3=BCller wrote:
> Copying similar code in in tons of recipes is easier to maintain?

If the code that needs to go in the "tons" of recipes is just:

do_install_append() {
	install -m 644 ${WORKDIR}/my.service ${D}${systemd_unitdir}/system
}

then yes, this is easier to maintain than a mechanism that magically
fishes out files from the workdir and installs them for itself.  As
Richard mentioned, we have previous experience with this in the form of
binconfig (and there have been others in the past) and this sort of
thing has universally turned out to be a maintenance headache after a
while.

There's even a comment in the code you quoted:

>> +     # ensure installing systemd-files only (e.g not avahi *.service)

which suggests that some poor soul has previously found that it was
installing things it oughtn't to have done.

p.




