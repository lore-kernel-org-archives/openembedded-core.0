Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F1E05610D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 22:00:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PM0b1b019605; Wed, 25 Sep 2013 23:00:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hoBlJtAnxO7M; Wed, 25 Sep 2013 23:00:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PM0YNx019599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 25 Sep 2013 23:00:35 +0100
Message-ID: <1380146430.18603.348.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2013 23:00:30 +0100
In-Reply-To: <CAMKF1srUDexU3NT-g1s9RMZDwhK9WyBMGaJPciAtS=ChROFOXw@mail.gmail.com>
References: <1380142751.18603.344.camel@ted>
	<CAMKF1srUDexU3NT-g1s9RMZDwhK9WyBMGaJPciAtS=ChROFOXw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Use correct kvm CPU options for qemux86* with kvm
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
X-List-Received-Date: Wed, 25 Sep 2013 22:00:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-25 at 14:34 -0700, Khem Raj wrote:
> On Wed, Sep 25, 2013 at 1:59 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The existing -cpu host option caused kernel panics when people attempted to use
> > the kvm option. After research and discussion, the best options appear to
> > be the kvm32/kvm64 cpu types so lets use these instead. These resolve
> > the kernel issues for me.
> >
> > [YOCTO #3908]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index efab1a2..12c58d9 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -265,7 +265,11 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
> >          exit 1;
> >      fi
> >      if [ -w /dev/kvm -a -r /dev/kvm ]; then
> > -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> > +        if [ "x$MACHINE" = "xqemux86" ]; then
> > +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
> > +        elif [ "x$MACHINE" = "xqemux86-64" ]; then
> > +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
> > +        fi
> 
> may be leave the original in the else clause at the end so it covers
> the non x86 cases too

There is no non x86 case for kvm. Its already guarded against by code
above here which errors if its not one of these two machines...

Cheers,

Richard


