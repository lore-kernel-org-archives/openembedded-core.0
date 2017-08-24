Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1C060107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 09:58:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7O9wNaX001964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 10:58:25 +0100
Message-ID: <1503568703.32591.181.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 10:58:23 +0100
In-Reply-To: <1503567333.3674.8.camel@intel.com>
References: <1487758902-11574-1-git-send-email-armccurdy@gmail.com>
	<1503567333.3674.8.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 10:58:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: fix ineffective include conf/target/${TARGET_SYS}.conf
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
X-List-Received-Date: Thu, 24 Aug 2017 09:58:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 11:35 +0200, Patrick Ohly wrote:
> On Wed, 2017-02-22 at 02:21 -0800, Andre McCurdy wrote:
> > 
> > TARGET_SYS is defined in terms of TARGET_ARCH, so it's not valid
> > until after TUNE_ARCH has been set by the machine config. The
> > original order of includes resulted in an attempt to include
> > non-existent files such as:
> > 
> >   conf/target/INVALID-oe-linux.conf
> > 
> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e421650..18d1cfb 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -705,9 +705,9 @@ include conf/auto.conf
> >  include conf/local.conf
> >  require conf/multiconfig/${BB_CURRENT_MC}.conf
> >  include conf/build/${BUILD_SYS}.conf
> > -include conf/target/${TARGET_SYS}.conf
> >  include conf/machine/${MACHINE}.conf
> >  include conf/machine-sdk/${SDKMACHINE}.conf
> > +include conf/target/${TARGET_SYS}.conf
> >  include conf/distro/${DISTRO}.conf
> I think conf/target/${TARGET_SYS}.conf must be included after
> ${DISTRO}.conf, because TARGET_SYS contains
> ${TARGET_ARCH}${TARGET_VENDOR} and TARGET_VENDOR gets changed by a
> ${DISTRO}.conf like poky.conf.
> 
> I also found this issue when writing an automated test that detects
> when include file names change while parsing, and I agree that it
> should be either fixed or removed.
> 
> See the "Yocto Compatible 2.0 support code" mail thread for details.
> At
> that time I had missed that there was already a pending patch for it.

I think I'd prefer just to delete the use of TARGET_SYS.conf and
possibly BUILD_SYS.conf too, I'm not aware of any users in practice as
it can't really work at least in one case...

Cheers,

Richard

