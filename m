Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3B37807A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 12:54:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5RCs9Jn025968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 27 Jun 2017 13:54:10 +0100
Message-ID: <1498568049.3124.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 13:54:09 +0100
In-Reply-To: <1498554326.7464.33.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 27 Jun 2017 13:54:10 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 12:54:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 11:05 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-01 at 22:15 +1000, Jonathan Liu wrote:
> > 
> > If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-
> > config
> > to HOSTTOOLS to allow access to the host sdl-config.
> > 
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 8e4f4bbb56..3ad905c917 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -471,6 +471,9 @@ HOSTTOOLS += " \
> >  # Tools needed to run testimage runtime image testing
> >  HOSTTOOLS += "ip ping ps scp ssh stty"
> >  
> > +# Link to sdl-config if using host SDL
> > +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-
> > native', 'sdl-config', '', d)}"
> > +
> Why are you checking ASSUME_PROVIDES? The variable is called
> ASSUME_PROVIDED.
> 
> Even if you had checked the right variable, is that really necessary?
> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine
> on Debian Jessie, without sdl-config in HOSTTOOLS.
> 
> Sorry for the late reply, going through my backlog... I see that this
> has been merged. Probably needs to be reverted or fixed.

I've reverted this since I can't see how it can actually work or help
anything, unless someone has set "ASSUME_PROVIDES" to test this (which
is a variable that doesn't exist or is used anywhere).

Cheers,

Richard

