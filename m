Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D2C3860778
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Oct 2018 08:41:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9S8ex4F014518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 28 Oct 2018 08:41:01 GMT
Message-ID: <fe093db784b63df2b6f8f880cfa38cc750aad9cc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Matt Spinler
	<mspinler@linux.vnet.ibm.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 28 Oct 2018 08:40:59 +0000
In-Reply-To: <35db1d5a43494aba81579d2eb2c7c6ff@XBOX04.axis.com>
References: <4d527ec6c1ac5415dcc51bf71ad4d6cf@linux.vnet.ibm.com>
	<35db1d5a43494aba81579d2eb2c7c6ff@XBOX04.axis.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [oe] Using libpam with systemd but without systemd-logind
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
X-List-Received-Date: Sun, 28 Oct 2018 08:41:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-10-27 at 10:36 +0000, Peter Kjellerstedt wrote:
> 
> > Our embedded system uses systemd and libpam, but doesn't use
> > systemd's logind package.
> > 
> > The libpam recipe,
> > 
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-extended/pam/libpam_1.3.0.bb#L149
> > ,
> > will add pam_systemd.so to common-session if it detects systemd is
> > used.
> > 
> > However, systemd will only even build pam_systemd.so if the logind
> > package is enabled, shown here:
> > 
https://github.com/systemd/systemd/blob/15b1180945f2cfa0f7938626ff060c8b52606a1a/meson.build#L1747
> > 
> > So in our case, since we are explicitly disabling logind, pam will
> > complain in the journal about not being able to find
> > pam_systemd.so.
> > 
> > As logind isn't a systemd distro feature, I'm not sure how libpam
> > can
> > really know that it doesn't need to add pam_systemd.so to common-
> > session?
> > 
> > Does anyone have any ideas on ways to handle this?
> 
> I am by no means any PAM expert, but prefixing the line inserted
> into 
> /etc/pam.d/common-session with a '-' should make libpam not output 
> anything to the logs if pam_systemd.so does not exist.

The best way I can think of is if each recipe have their own
PACKAGECONFIG entries as appropriate and then your distro configures
both recipes to do the right thing?

Cheers,

Richard


