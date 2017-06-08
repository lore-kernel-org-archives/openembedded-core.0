Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F18C971B69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 06:37:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v586b82R006032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Jun 2017 07:37:09 +0100
Message-ID: <1496903828.6630.215.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Patrick Ohly
	<patrick.ohly@intel.com>
Date: Thu, 08 Jun 2017 07:37:08 +0100
In-Reply-To: <2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1496836331.6630.213.camel@linuxfoundation.org>
	<1496845904.30163.102.camel@intel.com>
	<2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 08 Jun 2017 07:37:10 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Thu, 08 Jun 2017 06:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-07 at 17:04 +0000, Peter Kjellerstedt wrote:
> > 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Patrick Ohly
> > Sent: den 7 juni 2017 16:32
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Joshua Lock <joshua.g.lock@intel.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v2 01/25] bitbake.conf: support for
> > merged usr with DISTRO_FEATURE usrmerge
> > 
> > On Wed, 2017-06-07 at 12:52 +0100, Richard Purdie wrote:
> > > 
> > > On Wed, 2017-02-22 at 10:26 +0200, Amarnath Valluri wrote:
> > > > 
> > > > From: Joshua Lock <joshua.g.lock@intel.com>
> > > > 
> > > > Modify bindir, libdir and sbindir to be exec_prefix/$d, rather
> > > > than
> > > > base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.
> > > > 
> > > > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > > > ---
> > > >  meta/conf/bitbake.conf | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > I was asked to clarify the status of this series. We've taken
> > > many of
> > > the changes but the core changes to bitbake.conf haven't been
> > > merged.
> > > 
> > > Ross/I discussed it and we both feel that the bitbake.conf make
> > > the
> > > file pretty unreadable. We'd therefore like to see this
> > > implemented
> > > as a .inc file which gets included when the relevant
> > > DISTRO_FEATURE 
> > > is set (or could just be included by the appropriate distro
> > > configs). 
> > > This .inc file would then simply override the paths. I believe
> > > this 
> > > would be a lot more readable than the current approach which is
> > > a 
> > > key concern in the core config.
> I actually suggested an alternative change to bitbake.conf in the
> GitHub 
> review that changes bitbake.conf to take usrmerge into account:
> 
> https://github.com/avalluri/openembedded-core/commit/1655a93238902a88
> 3052a55d88ae14dd02243530
> 
> I will include my suggested solution here since I will refer to it 
> below:
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0f27e92e96..305eaff583 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -17,11 +17,13 @@ export base_prefix = ""
>  export prefix = "/usr"
>  export exec_prefix = "${prefix}"
>  
> +root_prefix = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> '${exec_prefix}', '${base_prefix}', d)}"
> +
>  # Base paths
> -export base_bindir = "${base_prefix}/bin"
> -export base_sbindir = "${base_prefix}/sbin"
> -export base_libdir = "${base_prefix}/${baselib}"
> -export nonarch_base_libdir = "${base_prefix}/lib"
> +export base_bindir = "${root_prefix}/bin"
> +export base_sbindir = "${root_prefix}/sbin"
> +export base_libdir = "${root_prefix}/${baselib}"
> +export nonarch_base_libdir = "${root_prefix}/lib"
>  
>  # Architecture independent paths
>  export sysconfdir = "${base_prefix}/etc"
> 
> I think that better maintains the readability of the bitbake.conf
> file, 
> while making the $root_prefix variable available as it can be useful
> in 
> its own (e.g., in the systemd recipe).

Agreed, I'm happier with this and can probably accept a single
DISTO_FEATURES line without the .inc stuff...

Cheers,

Richard

