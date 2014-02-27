Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1E22F6F3A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:18:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1RMHO35001477; Thu, 27 Feb 2014 22:18:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m7_RHqzGsQt6; Thu, 27 Feb 2014 22:18:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1RMI0PY001518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 27 Feb 2014 22:18:02 GMT
Message-ID: <1393539473.31769.192.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Feb 2014 22:17:53 +0000
In-Reply-To: <20140227221501.GE26981@jama>
References: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
	<20140227221501.GE26981@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: Fix postinst
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
X-List-Received-Date: Thu, 27 Feb 2014 22:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-27 at 23:15 +0100, Martin Jansa wrote:
> On Thu, Feb 27, 2014 at 09:20:38PM +0100, Martin Jansa wrote:
> > * do_split_packages was appending call to
> >   ${bindir}/${MLPREFIX}pango-querymodules
> >   without $D prefix or test if $D is empty, so it was always
> >   failing on buildhostis without pango-querymodules and such
> >   failure is fatal when rootfs is read-only (do_rootfs fails
> >   because some packages weren't configured)
> 
> Something is wrong, in theory the
> if [ "x$D" != "x" ]; then
> case should always exit with 0 or 1 before it reaches the call added by
> do_split_packages so it has to be qemu_run_binary call failing and
> causing exit 1

Saul's error shows the shell parser in bitbake exiting. The function in
question isn't getting run, its never getting past the parsing stage. As
Saul mentions, it appears the if/fi balance isn't correct which would
upset the shell parser...

Cheers,

Richard


